# N-gram Tactic Search System Design Document

## 1. 项目概述 (Project Overview)

### 1.1 目标 (Objective)
将现有的unigram tactic测试系统扩展到支持n-gram搜索，初期实现2gram（最多两个tactics的序列）。系统需要：

- 构建tactic序列的搜索树结构
- 支持父子节点关系追踪
- 处理三种状态：success/error/incomplete
- 实现ProofStep缓存机制避免重复计算
- 提供内存管理和服务器重启机制
- 支持断点续传和完善的记录机制

### 1.2 核心挑战 (Core Challenges)
- **状态爆炸**：2gram搜索空间比unigram大一个数量级
- **内存管理**：长时间运行导致Lean server内存耗尽
- **缓存复杂性**：ProofStep对象的生命周期管理
- **断点续传**：在系统重启后恢复搜索状态

## 2. 现有Unigram系统分析 (Current Unigram System Analysis)

### 2.1 关键组件
```python
# 核心数据结构
@dataclass
class ProofState:
    sorry_index: int
    goals: List[str]
    context: str  # "ProofState_N" format
    position_info: str

@dataclass 
class TacticResult:
    success: bool
    tactic: str
    sorry_index: int
    error_message: Optional[str] = None
    new_goals: Optional[List[str]] = None
```

### 2.2 现有判断逻辑
- **Success**: `response.proof_status == 'Completed' and len(response.goals) == 0`
- **Error**: `isinstance(response, LeanError)`
- **Incomplete**: 其他情况（tactic执行但未完全解决goal）

### 2.3 现有限制
- 只支持单个tactic测试
- 找到成功tactic后立即停止搜索
- 无状态缓存机制
- 无法处理tactic序列

## 3. N-gram搜索树架构设计 (N-gram Search Tree Architecture)

### 3.1 核心数据结构

```python
from enum import Enum
from typing import Dict, List, Optional, Set, Any
from dataclasses import dataclass, field
from datetime import datetime

class TacticNodeStatus(Enum):
    """Tactic node execution status"""
    PENDING = "pending"           # Not yet executed
    SUCCESS = "success"           # Fully solved the goal
    ERROR = "error"              # Failed with LeanError
    INCOMPLETE = "incomplete"     # Executed but goals remain
    DIRTY = "dirty"              # Needs re-execution due to server restart

class TerminalTacticType(Enum):
    """Types of tactics that terminate search"""
    SOLVER = "solver"            # linarith, nlinarith, omega
    NORMAL = "normal"            # Can have children

@dataclass
class TacticNode:
    """Node in the tactic search tree"""
    node_id: str                          # Unique identifier
    hole_id: str                          # Which hole this belongs to
    tactic_sequence: List[str]            # Sequence of tactics from root
    parent_id: Optional[str]              # Parent node ID
    children_ids: Set[str] = field(default_factory=set)  # Child node IDs
    status: TacticNodeStatus = TacticNodeStatus.PENDING
    
    # Execution results
    proof_state_id: Optional[int] = None  # ProofStep proof_state ID
    error_message: Optional[str] = None
    remaining_goals: Optional[int] = None
    execution_time: Optional[datetime] = None
    
    # Metadata
    depth: int = 0                        # Depth in search tree
    terminal_type: TerminalTacticType = TerminalTacticType.NORMAL
    can_expand: bool = True               # Whether this node can have children
    
    def is_terminal(self) -> bool:
        """Check if this is a terminal node (success/error or terminal tactic)"""
        return (self.status in [TacticNodeStatus.SUCCESS, TacticNodeStatus.ERROR] or 
                not self.can_expand)
    
    def get_last_tactic(self) -> Optional[str]:
        """Get the last tactic in the sequence"""
        return self.tactic_sequence[-1] if self.tactic_sequence else None

@dataclass
class HoleSearchTree:
    """Search tree for a single hole"""
    hole_id: str
    initial_proof_state_id: int
    nodes: Dict[str, TacticNode] = field(default_factory=dict)  # node_id -> TacticNode
    root_id: Optional[str] = None
    successful_paths: List[str] = field(default_factory=list)   # List of successful node_ids
    max_depth: int = 2                    # Maximum search depth (2 for 2gram)
    
    def add_node(self, node: TacticNode) -> None:
        """Add a node to the tree"""
        self.nodes[node.node_id] = node
        if node.parent_id:
            parent = self.nodes.get(node.parent_id)
            if parent:
                parent.children_ids.add(node.node_id)
    
    def get_expandable_nodes(self) -> List[TacticNode]:
        """Get nodes that can be expanded"""
        return [node for node in self.nodes.values() 
                if node.status == TacticNodeStatus.INCOMPLETE and 
                   node.can_expand and 
                   node.depth < self.max_depth]
    
    def get_path_to_root(self, node_id: str) -> List[str]:
        """Get the path from node to root"""
        path = []
        current_id = node_id
        while current_id:
            path.append(current_id)
            node = self.nodes.get(current_id)
            current_id = node.parent_id if node else None
        return list(reversed(path))
```

### 3.2 N-gram搜索器主类

```python
class NgramTacticSearcher:
    """N-gram tactic sequence searcher with caching and memory management"""
    
    def __init__(self, max_depth: int = 2):
        self.max_depth = max_depth
        self.hole_trees: Dict[str, HoleSearchTree] = {}
        self.lean_integrator: Optional[MinimalLeanProofStepIntegrator] = None
        self.proof_state_cache: Dict[int, Any] = {}  # Cache ProofStep objects
        self.server_restart_count = 0
        self.dirty_nodes: Set[str] = set()  # Nodes that need re-execution
        
        # Terminal tactic sets
        self.terminal_tactics = {"linarith", "nlinarith", "omega"}
        self.available_tactics = [
            "norm_num", "linarith", "nlinarith", "omega", 
            "ring", "ring_nf", "simp", "simpa", "field_simp", 
            "positivity", "norm_cast"
        ]
    
    def initialize_search_for_hole(self, hole_id: str, initial_proof_state_id: int) -> HoleSearchTree:
        """Initialize search tree for a specific hole"""
        tree = HoleSearchTree(
            hole_id=hole_id,
            initial_proof_state_id=initial_proof_state_id,
            max_depth=self.max_depth
        )
        
        # Create root node (empty tactic sequence)
        root_node = TacticNode(
            node_id=f"{hole_id}_root",
            hole_id=hole_id,
            tactic_sequence=[],
            parent_id=None,
            depth=0,
            proof_state_id=initial_proof_state_id,
            status=TacticNodeStatus.INCOMPLETE  # Ready for expansion
        )
        
        tree.add_node(root_node)
        tree.root_id = root_node.node_id
        self.hole_trees[hole_id] = tree
        
        return tree
    
    def expand_node(self, node: TacticNode) -> List[TacticNode]:
        """Expand a node by trying all possible next tactics"""
        if not node.can_expand or node.depth >= self.max_depth:
            return []
        
        children = []
        for tactic in self.available_tactics:
            # Create child node
            child_sequence = node.tactic_sequence + [tactic]
            child_id = f"{node.hole_id}_{'_'.join(child_sequence)}"
            
            # Determine if this tactic is terminal
            is_terminal_tactic = tactic in self.terminal_tactics
            
            child_node = TacticNode(
                node_id=child_id,
                hole_id=node.hole_id,
                tactic_sequence=child_sequence,
                parent_id=node.node_id,
                depth=node.depth + 1,
                terminal_type=TerminalTacticType.SOLVER if is_terminal_tactic else TerminalTacticType.NORMAL,
                can_expand=not is_terminal_tactic  # Terminal tactics cannot be expanded
            )
            
            children.append(child_node)
        
        return children
    
    def execute_tactic_sequence(self, node: TacticNode, base_proof_state_id: int) -> TacticNodeStatus:
        """Execute a tactic sequence and return the final status"""
        if not self.lean_integrator:
            raise RuntimeError("Lean integrator not initialized")
        
        try:
            current_proof_state_id = base_proof_state_id
            
            # Execute each tactic in sequence
            for i, tactic in enumerate(node.tactic_sequence):
                # Check if we have cached result for this intermediate step
                cache_key = f"{base_proof_state_id}_{'_'.join(node.tactic_sequence[:i+1])}"
                
                if cache_key in self.proof_state_cache and not node.node_id in self.dirty_nodes:
                    # Use cached result
                    cached_result = self.proof_state_cache[cache_key]
                    current_proof_state_id = cached_result.get('next_proof_state_id')
                    if cached_result.get('status') == TacticNodeStatus.ERROR:
                        node.error_message = cached_result.get('error_message')
                        return TacticNodeStatus.ERROR
                    elif cached_result.get('status') == TacticNodeStatus.SUCCESS:
                        return TacticNodeStatus.SUCCESS
                else:
                    # Execute tactic via ProofStep
                    from lean_interact import ProofStep
                    response = self.lean_integrator.lean_server.run(
                        ProofStep(proof_state=current_proof_state_id, tactic=tactic)
                    )
                    
                    # Analyze response
                    from lean_interact.interface import LeanError
                    
                    if isinstance(response, LeanError):
                        # Cache error result
                        self.proof_state_cache[cache_key] = {
                            'status': TacticNodeStatus.ERROR,
                            'error_message': str(response.message),
                            'next_proof_state_id': None
                        }
                        node.error_message = str(response.message)
                        return TacticNodeStatus.ERROR
                    
                    elif hasattr(response, 'proof_status'):
                        if response.proof_status == 'Completed' and len(response.goals) == 0:
                            # Success - cache result
                            self.proof_state_cache[cache_key] = {
                                'status': TacticNodeStatus.SUCCESS,
                                'error_message': None,
                                'next_proof_state_id': None  # No next state needed
                            }
                            return TacticNodeStatus.SUCCESS
                        else:
                            # Incomplete - cache intermediate state
                            # Note: response.proof_state should give us the new proof state ID
                            next_proof_state_id = getattr(response, 'proof_state', current_proof_state_id + 1)
                            self.proof_state_cache[cache_key] = {
                                'status': TacticNodeStatus.INCOMPLETE,
                                'error_message': None,
                                'next_proof_state_id': next_proof_state_id
                            }
                            current_proof_state_id = next_proof_state_id
                            node.remaining_goals = len(response.goals)
                    else:
                        # Unexpected response type
                        self.proof_state_cache[cache_key] = {
                            'status': TacticNodeStatus.ERROR,
                            'error_message': f"Unexpected response type: {type(response)}",
                            'next_proof_state_id': None
                        }
                        node.error_message = f"Unexpected response type: {type(response)}"
                        return TacticNodeStatus.ERROR
            
            # If we get here, all tactics executed but didn't complete the proof
            return TacticNodeStatus.INCOMPLETE
            
        except Exception as e:
            node.error_message = str(e)
            return TacticNodeStatus.ERROR
        finally:
            node.execution_time = datetime.now()
```

## 4. 输出格式设计 (Output Format Design)

### 4.1 新的输出数据结构

```python
@dataclass
class NgramSearchResult:
    """Results from n-gram tactic search"""
    hole_id: str
    search_tree: HoleSearchTree
    successful_paths: List[List[str]]  # List of successful tactic sequences
    total_nodes_explored: int
    total_execution_time: float
    server_restarts: int
    
    def to_json_format(self) -> Dict:
        """Convert to JSON format compatible with existing pipeline"""
        # Convert to format that replaces current tactic_attempts
        node_attempts = []
        
        for node in self.search_tree.nodes.values():
            if not node.tactic_sequence:  # Skip root node
                continue
                
            attempt = {
                'tactic_sequence': node.tactic_sequence,
                'node_id': node.node_id,
                'parent_id': node.parent_id,
                'status': node.status.value,
                'depth': node.depth,
                'error_message': node.error_message,
                'execution_time': node.execution_time.isoformat() if node.execution_time else None,
                'can_expand': node.can_expand,
                'is_terminal': node.is_terminal()
            }
            node_attempts.append(attempt)
        
        return {
            'hole_id': self.hole_id,
            'node_attempts': node_attempts,
            'successful_paths': self.successful_paths,
            'search_statistics': {
                'total_nodes_explored': self.total_nodes_explored,
                'total_execution_time': self.total_execution_time,
                'server_restarts': self.server_restarts,
                'max_depth_reached': max(node.depth for node in self.search_tree.nodes.values())
            }
        }
```

## 5. 内存管理和重启机制 (Memory Management and Restart Mechanism)

### 5.1 内存监控

```python
class MemoryManager:
    """Manage Lean server memory and restart when necessary"""
    
    def __init__(self, max_nodes_before_restart: int = 1000):
        self.max_nodes_before_restart = max_nodes_before_restart
        self.nodes_executed_since_restart = 0
        
    def should_restart_server(self) -> bool:
        """Determine if server should be restarted"""
        return self.nodes_executed_since_restart >= self.max_nodes_before_restart
    
    def restart_server(self, searcher: 'NgramTacticSearcher') -> None:
        """Restart Lean server and mark affected nodes as dirty"""
        print(f"🔄 Restarting Lean server after {self.nodes_executed_since_restart} node executions")
        
        # Shutdown current server
        if searcher.lean_integrator:
            searcher.lean_integrator.shutdown_lean_server()
        
        # Reinitialize
        searcher.lean_integrator = MinimalLeanProofStepIntegrator()
        searcher.lean_integrator.initialize_lean_server()
        
        # Mark all cached ProofStep results as dirty
        searcher.proof_state_cache.clear()
        
        # Mark all incomplete nodes as dirty (need re-execution)
        for tree in searcher.hole_trees.values():
            for node in tree.nodes.values():
                if node.status == TacticNodeStatus.INCOMPLETE:
                    node.status = TacticNodeStatus.DIRTY
                    searcher.dirty_nodes.add(node.node_id)
        
        searcher.server_restart_count += 1
        self.nodes_executed_since_restart = 0
```

## 6. 断点续传机制 (Checkpoint and Resume Mechanism)

### 6.1 状态持久化

```python
class NgramCheckpointManager:
    """Manage checkpoints for resuming interrupted searches"""
    
    def __init__(self, checkpoint_dir: str = "ngram_checkpoints"):
        self.checkpoint_dir = checkpoint_dir
        os.makedirs(checkpoint_dir, exist_ok=True)
    
    def save_checkpoint(self, problem_id: str, searcher: 'NgramTacticSearcher') -> str:
        """Save current search state to disk"""
        checkpoint_data = {
            'problem_id': problem_id,
            'timestamp': datetime.now().isoformat(),
            'server_restart_count': searcher.server_restart_count,
            'max_depth': searcher.max_depth,
            'hole_trees': {},
            'dirty_nodes': list(searcher.dirty_nodes),
            'available_tactics': searcher.available_tactics,
            'terminal_tactics': list(searcher.terminal_tactics)
        }
        
        # Serialize each hole tree
        for hole_id, tree in searcher.hole_trees.items():
            tree_data = {
                'hole_id': tree.hole_id,
                'initial_proof_state_id': tree.initial_proof_state_id,
                'root_id': tree.root_id,
                'successful_paths': tree.successful_paths,
                'max_depth': tree.max_depth,
                'nodes': {}
            }
            
            # Serialize each node
            for node_id, node in tree.nodes.items():
                node_data = {
                    'node_id': node.node_id,
                    'hole_id': node.hole_id,
                    'tactic_sequence': node.tactic_sequence,
                    'parent_id': node.parent_id,
                    'children_ids': list(node.children_ids),
                    'status': node.status.value,
                    'proof_state_id': node.proof_state_id,
                    'error_message': node.error_message,
                    'remaining_goals': node.remaining_goals,
                    'execution_time': node.execution_time.isoformat() if node.execution_time else None,
                    'depth': node.depth,
                    'terminal_type': node.terminal_type.value,
                    'can_expand': node.can_expand
                }
                tree_data['nodes'][node_id] = node_data
            
            checkpoint_data['hole_trees'][hole_id] = tree_data
        
        # Save to file
        checkpoint_file = os.path.join(self.checkpoint_dir, f"{problem_id}_ngram_checkpoint.json")
        with open(checkpoint_file, 'w') as f:
            json.dump(checkpoint_data, f, indent=2)
        
        print(f"💾 Checkpoint saved: {checkpoint_file}")
        return checkpoint_file
    
    def load_checkpoint(self, problem_id: str) -> Optional[Dict]:
        """Load checkpoint from disk"""
        checkpoint_file = os.path.join(self.checkpoint_dir, f"{problem_id}_ngram_checkpoint.json")
        
        if not os.path.exists(checkpoint_file):
            return None
        
        try:
            with open(checkpoint_file, 'r') as f:
                checkpoint_data = json.load(f)
            
            print(f"📂 Checkpoint loaded: {checkpoint_file}")
            return checkpoint_data
        
        except Exception as e:
            print(f"❌ Failed to load checkpoint: {e}")
            return None
    
    def restore_searcher_from_checkpoint(self, checkpoint_data: Dict) -> 'NgramTacticSearcher':
        """Restore searcher state from checkpoint data"""
        searcher = NgramTacticSearcher(max_depth=checkpoint_data['max_depth'])
        searcher.server_restart_count = checkpoint_data['server_restart_count']
        searcher.available_tactics = checkpoint_data['available_tactics']
        searcher.terminal_tactics = set(checkpoint_data['terminal_tactics'])
        searcher.dirty_nodes = set(checkpoint_data['dirty_nodes'])
        
        # Restore hole trees
        for hole_id, tree_data in checkpoint_data['hole_trees'].items():
            tree = HoleSearchTree(
                hole_id=tree_data['hole_id'],
                initial_proof_state_id=tree_data['initial_proof_state_id'],
                max_depth=tree_data['max_depth']
            )
            tree.root_id = tree_data['root_id']
            tree.successful_paths = tree_data['successful_paths']
            
            # Restore nodes
            for node_id, node_data in tree_data['nodes'].items():
                node = TacticNode(
                    node_id=node_data['node_id'],
                    hole_id=node_data['hole_id'],
                    tactic_sequence=node_data['tactic_sequence'],
                    parent_id=node_data['parent_id'],
                    depth=node_data['depth'],
                    proof_state_id=node_data['proof_state_id'],
                    error_message=node_data['error_message'],
                    remaining_goals=node_data['remaining_goals'],
                    can_expand=node_data['can_expand']
                )
                
                # Restore enums
                node.status = TacticNodeStatus(node_data['status'])
                node.terminal_type = TerminalTacticType(node_data['terminal_type'])
                node.children_ids = set(node_data['children_ids'])
                
                if node_data['execution_time']:
                    node.execution_time = datetime.fromisoformat(node_data['execution_time'])
                
                tree.nodes[node_id] = node
            
            searcher.hole_trees[hole_id] = tree
        
        return searcher
```

## 7. 主要API接口 (Main API Interface)

### 7.1 统一接口

```python
class NgramTacticPipeline:
    """Main pipeline interface for n-gram tactic search"""
    
    def __init__(self, max_depth: int = 2, enable_checkpoints: bool = True):
        self.max_depth = max_depth
        self.enable_checkpoints = enable_checkpoints
        self.checkpoint_manager = NgramCheckpointManager() if enable_checkpoints else None
        self.memory_manager = MemoryManager()
    
    def search_tactics_for_hole(self, 
                               hole_id: str, 
                               initial_proof_state_id: int,
                               header_content: str,
                               problem_id: str = None) -> NgramSearchResult:
        """
        Perform n-gram tactic search for a single hole
        
        Args:
            hole_id: ID of the hole to search
            initial_proof_state_id: Initial ProofStep proof state ID
            header_content: Lean header content
            problem_id: Problem ID for checkpoint management
            
        Returns:
            NgramSearchResult with complete search results
        """
        
        # Try to resume from checkpoint
        searcher = None
        if self.enable_checkpoints and problem_id:
            checkpoint_data = self.checkpoint_manager.load_checkpoint(problem_id)
            if checkpoint_data and hole_id in checkpoint_data.get('hole_trees', {}):
                print(f"📂 Resuming from checkpoint for {hole_id}")
                searcher = self.checkpoint_manager.restore_searcher_from_checkpoint(checkpoint_data)
        
        # Initialize new searcher if not resumed
        if not searcher:
            searcher = NgramTacticSearcher(max_depth=self.max_depth)
            searcher.lean_integrator = MinimalLeanProofStepIntegrator()
            searcher.lean_integrator.initialize_lean_server()
            searcher.initialize_search_for_hole(hole_id, initial_proof_state_id)
        
        try:
            return self._execute_search(searcher, hole_id, problem_id)
        finally:
            if searcher.lean_integrator:
                searcher.lean_integrator.shutdown_lean_server()
    
    def _execute_search(self, searcher: NgramTacticSearcher, hole_id: str, problem_id: str) -> NgramSearchResult:
        """Execute the main search loop"""
        start_time = time.time()
        tree = searcher.hole_trees[hole_id]
        
        # Main search loop
        while True:
            # Check if server restart is needed
            if self.memory_manager.should_restart_server():
                self.memory_manager.restart_server(searcher)
                
                # Save checkpoint after restart
                if self.enable_checkpoints and problem_id:
                    self.checkpoint_manager.save_checkpoint(problem_id, searcher)
            
            # Get expandable nodes
            expandable_nodes = tree.get_expandable_nodes()
            
            if not expandable_nodes:
                print(f"🏁 Search completed for {hole_id} - no more expandable nodes")
                break
            
            # Process each expandable node
            for node in expandable_nodes:
                if node.status == TacticNodeStatus.DIRTY:
                    # Re-execute dirty node
                    print(f"🔄 Re-executing dirty node: {node.node_id}")
                    node.status = searcher.execute_tactic_sequence(node, tree.initial_proof_state_id)
                    searcher.dirty_nodes.discard(node.node_id)
                
                if node.status == TacticNodeStatus.INCOMPLETE and node.can_expand:
                    # Expand this node
                    children = searcher.expand_node(node)
                    
                    for child in children:
                        # Execute child tactic sequence
                        child.status = searcher.execute_tactic_sequence(child, tree.initial_proof_state_id)
                        tree.add_node(child)
                        
                        # Track successful paths
                        if child.status == TacticNodeStatus.SUCCESS:
                            tree.successful_paths.append(child.tactic_sequence)
                            print(f"✅ Found successful path: {' -> '.join(child.tactic_sequence)}")
                        
                        self.memory_manager.nodes_executed_since_restart += 1
                        
                        # Periodic checkpoint
                        if (self.enable_checkpoints and problem_id and 
                            self.memory_manager.nodes_executed_since_restart % 100 == 0):
                            self.checkpoint_manager.save_checkpoint(problem_id, searcher)
        
        # Final checkpoint
        if self.enable_checkpoints and problem_id:
            self.checkpoint_manager.save_checkpoint(problem_id, searcher)
        
        # Create result
        total_time = time.time() - start_time
        result = NgramSearchResult(
            hole_id=hole_id,
            search_tree=tree,
            successful_paths=tree.successful_paths,
            total_nodes_explored=len(tree.nodes),
            total_execution_time=total_time,
            server_restarts=searcher.server_restart_count
        )
        
        return result
```

## 8. 集成现有系统 (Integration with Existing System)

### 8.1 兼容性包装器

```python
def create_ngram_wrapper_for_existing_pipeline():
    """
    Create wrapper that integrates n-gram search into existing pipeline
    without breaking current functionality
    """
    
    # Add new method to MinimalLeanProofStepIntegrator
    def enumerate_ngram_tactics_with_proof_states(self, 
                                                header_content: str, 
                                                clear_version: str,
                                                enumerable_indices: List[int],
                                                sorry_map: Dict[int, 'SorryInfo'],
                                                max_depth: int = 2) -> Dict:
        """
        N-gram version of enumerate_tactics_with_proof_states
        Maintains API compatibility while providing enhanced search
        """
        
        print(f"🚀 Starting N-gram enumeration with max_depth={max_depth}")
        
        # Extract proof states (reuse existing logic)
        server_sorries = self.extract_proof_states_from_sorries(header_content, clear_version)
        if not server_sorries:
            return {'successful_tactics': {}, 'ngram_attempts': {}, 'proof_states_extracted': 0}
        
        # Match parser sorries with server sorries (reuse existing logic)
        # ... [existing matching logic] ...
        
        # Initialize n-gram pipeline
        ngram_pipeline = NgramTacticPipeline(max_depth=max_depth)
        
        results = {
            'successful_tactics': {},      # hole_id -> first successful tactic (backward compatibility)
            'ngram_attempts': {},          # hole_id -> complete n-gram search results
            'proof_states_extracted': len(server_sorries)
        }
        
        # Run n-gram search for each enumerable hole
        for sorry_idx in enumerable_indices:
            sorry_info = sorry_map.get(sorry_idx)
            if not sorry_info or not sorry_info.hole_id:
                continue
            
            hole_id = sorry_info.hole_id
            initial_proof_state_id = proof_states[sorry_idx].context.split('_')[1]
            
            # Perform n-gram search
            ngram_result = ngram_pipeline.search_tactics_for_hole(
                hole_id=hole_id,
                initial_proof_state_id=int(initial_proof_state_id),
                header_content=header_content,
                problem_id=f"temp_{hole_id}"
            )
            
            # Store complete n-gram results
            results['ngram_attempts'][hole_id] = ngram_result.to_json_format()
            
            # Extract first successful tactic for backward compatibility
            if ngram_result.successful_paths:
                first_successful_path = ngram_result.successful_paths[0]
                if first_successful_path:
                    # For backward compatibility, just use the first tactic of the first successful path
                    results['successful_tactics'][hole_id] = first_successful_path[0]
        
        return results
    
    # Monkey patch the new method
    MinimalLeanProofStepIntegrator.enumerate_ngram_tactics_with_proof_states = enumerate_ngram_tactics_with_proof_states
```

## 9. 实施计划 (Implementation Plan)

### 9.1 阶段1：核心架构 (Phase 1: Core Architecture)
1. 实现基础数据结构（TacticNode, HoleSearchTree, NgramTacticSearcher）
2. 实现基本的2gram搜索逻辑
3. 集成现有ProofStep API
4. 基本单元测试

### 9.2 阶段2：缓存和优化 (Phase 2: Caching and Optimization)
1. 实现ProofStep结果缓存
2. 添加内存管理机制
3. 优化搜索算法效率
4. 性能测试和调优

### 9.3 阶段3：持久化和恢复 (Phase 3: Persistence and Recovery)
1. 实现断点续传机制
2. 添加检查点管理
3. 服务器重启处理
4. 错误恢复机制

### 9.4 阶段4：集成和测试 (Phase 4: Integration and Testing)
1. 与现有pipeline集成
2. 在demo数据集上测试
3. 文档和使用指南
4. 性能基准测试

## 10. 预期挑战和解决方案 (Expected Challenges and Solutions)

### 10.1 搜索空间爆炸
**问题**：2gram搜索空间比unigram大一个数量级
**解决方案**：
- 实现智能剪枝（terminal tactics）
- 早期终止（找到成功路径后）
- 并行搜索（未来扩展）

### 10.2 内存管理
**问题**：长时间运行导致Lean server内存耗尽
**解决方案**：
- 定期重启Lean server
- 智能缓存管理
- 增量垃圾回收

### 10.3 状态一致性
**问题**：服务器重启后ProofStep状态丢失
**解决方案**：
- 完善的dirty节点追踪
- 检查点机制
- 状态验证和恢复

这个设计文档提供了将现有unigram系统扩展到n-gram搜索的完整技术路线图，包含了所有必要的组件和实施细节。