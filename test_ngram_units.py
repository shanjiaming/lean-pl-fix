#!/usr/bin/env python3
"""
N-gram System Unit Tests

Comprehensive unit test suite that breaks down the n-gram system into
testable components and verifies each piece independently.

Test Categories:
1. Data Structure Tests
2. Search Algorithm Tests  
3. Cache Mechanism Tests
4. Memory Management Tests
5. Checkpoint System Tests
6. Integration Layer Tests
"""

import unittest
import os
import sys
import tempfile
import json
import time
from datetime import datetime, timedelta
from unittest.mock import Mock, patch, MagicMock

# Add current directory to path for imports
sys.path.append(os.path.dirname(__file__))

from ngram_tactic_searcher import (
    NgramTacticSearcher, TacticNode, HoleSearchTree, 
    TacticNodeStatus, TerminalTacticType, ProofStepCacheEntry
)
from ngram_memory_manager import MemoryManager, CheckpointManager, MemoryStats
from ngram_pipeline_integration import NgramPipelineIntegrator


class TestTacticNode(unittest.TestCase):
    """Unit tests for TacticNode class"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.basic_node = TacticNode(
            node_id="test_node_1",
            hole_id="hole_1",
            tactic_sequence=["norm_num"],
            parent_id="root",
            depth=1
        )
    
    def test_node_creation(self):
        """Test basic node creation"""
        self.assertEqual(self.basic_node.node_id, "test_node_1")
        self.assertEqual(self.basic_node.hole_id, "hole_1")
        self.assertEqual(self.basic_node.tactic_sequence, ["norm_num"])
        self.assertEqual(self.basic_node.parent_id, "root")
        self.assertEqual(self.basic_node.depth, 1)
        self.assertEqual(self.basic_node.status, TacticNodeStatus.PENDING)
    
    def test_get_last_tactic(self):
        """Test get_last_tactic method"""
        # Node with tactics
        self.assertEqual(self.basic_node.get_last_tactic(), "norm_num")
        
        # Empty sequence
        empty_node = TacticNode(
            node_id="empty", hole_id="hole_1", tactic_sequence=[], parent_id=None
        )
        self.assertIsNone(empty_node.get_last_tactic())
        
        # Multiple tactics
        multi_node = TacticNode(
            node_id="multi", hole_id="hole_1", 
            tactic_sequence=["norm_num", "linarith"], parent_id=None
        )
        self.assertEqual(multi_node.get_last_tactic(), "linarith")
    
    def test_is_terminal(self):
        """Test is_terminal method"""
        # Default node - not terminal
        self.assertFalse(self.basic_node.is_terminal())
        
        # Success status - terminal
        success_node = TacticNode(
            node_id="success", hole_id="hole_1", tactic_sequence=["norm_num"],
            parent_id=None, status=TacticNodeStatus.SUCCESS
        )
        self.assertTrue(success_node.is_terminal())
        
        # Error status - terminal
        error_node = TacticNode(
            node_id="error", hole_id="hole_1", tactic_sequence=["invalid"],
            parent_id=None, status=TacticNodeStatus.ERROR
        )
        self.assertTrue(error_node.is_terminal())
        
        # Cannot expand - terminal
        no_expand_node = TacticNode(
            node_id="no_expand", hole_id="hole_1", tactic_sequence=["linarith"],
            parent_id=None, can_expand=False
        )
        self.assertTrue(no_expand_node.is_terminal())
    
    def test_terminal_tactic_types(self):
        """Test terminal tactic type classification"""
        # Normal tactic
        normal_node = TacticNode(
            node_id="normal", hole_id="hole_1", tactic_sequence=["norm_num"],
            parent_id=None, terminal_type=TerminalTacticType.NORMAL
        )
        self.assertEqual(normal_node.terminal_type, TerminalTacticType.NORMAL)
        
        # Solver tactic
        solver_node = TacticNode(
            node_id="solver", hole_id="hole_1", tactic_sequence=["linarith"],
            parent_id=None, terminal_type=TerminalTacticType.SOLVER, can_expand=False
        )
        self.assertEqual(solver_node.terminal_type, TerminalTacticType.SOLVER)
        self.assertFalse(solver_node.can_expand)


class TestHoleSearchTree(unittest.TestCase):
    """Unit tests for HoleSearchTree class"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.tree = HoleSearchTree(
            hole_id="test_hole",
            initial_proof_state_id=42,
            max_depth=2
        )
        
        # Create test nodes
        self.root_node = TacticNode(
            node_id="root", hole_id="test_hole", tactic_sequence=[],
            parent_id=None, depth=0, status=TacticNodeStatus.INCOMPLETE
        )
        
        self.child1 = TacticNode(
            node_id="child1", hole_id="test_hole", tactic_sequence=["norm_num"],
            parent_id="root", depth=1, status=TacticNodeStatus.INCOMPLETE
        )
        
        self.child2 = TacticNode(
            node_id="child2", hole_id="test_hole", tactic_sequence=["linarith"],
            parent_id="root", depth=1, status=TacticNodeStatus.SUCCESS
        )
        
        self.grandchild = TacticNode(
            node_id="grandchild", hole_id="test_hole", tactic_sequence=["norm_num", "omega"],
            parent_id="child1", depth=2, status=TacticNodeStatus.PENDING
        )
    
    def test_tree_creation(self):
        """Test basic tree creation"""
        self.assertEqual(self.tree.hole_id, "test_hole")
        self.assertEqual(self.tree.initial_proof_state_id, 42)
        self.assertEqual(self.tree.max_depth, 2)
        self.assertEqual(len(self.tree.nodes), 0)
        self.assertEqual(len(self.tree.successful_paths), 0)
    
    def test_add_node(self):
        """Test adding nodes to tree"""
        # Add root node
        self.tree.add_node(self.root_node)
        self.assertEqual(len(self.tree.nodes), 1)
        self.assertIn("root", self.tree.nodes)
        
        # Add child node
        self.tree.add_node(self.child1)
        self.assertEqual(len(self.tree.nodes), 2)
        
        # Check parent-child relationship
        self.assertIn("child1", self.root_node.children_ids)
    
    def test_get_expandable_nodes(self):
        """Test getting expandable nodes"""
        # Set up tree
        self.tree.add_node(self.root_node)
        self.tree.add_node(self.child1)
        self.tree.add_node(self.child2)
        self.tree.add_node(self.grandchild)
        
        expandable = self.tree.get_expandable_nodes()
        
        # Should include incomplete nodes that can expand and are under max depth
        # Both root (depth 0) and child1 (depth 1) are incomplete and under max_depth (2)
        self.assertEqual(len(expandable), 2)
        expandable_ids = {node.node_id for node in expandable}
        self.assertIn("root", expandable_ids)
        self.assertIn("child1", expandable_ids)
    
    def test_get_pending_nodes(self):
        """Test getting pending nodes"""
        self.tree.add_node(self.root_node)
        self.tree.add_node(self.child1)
        self.tree.add_node(self.child2)
        self.tree.add_node(self.grandchild)
        
        pending = self.tree.get_pending_nodes()
        
        # Only grandchild is pending
        self.assertEqual(len(pending), 1)
        self.assertEqual(pending[0].node_id, "grandchild")
    
    def test_get_dirty_nodes(self):
        """Test getting dirty nodes"""
        # Create dirty node
        dirty_node = TacticNode(
            node_id="dirty", hole_id="test_hole", tactic_sequence=["simp"],
            parent_id="root", depth=1, status=TacticNodeStatus.DIRTY
        )
        
        self.tree.add_node(self.root_node)
        self.tree.add_node(dirty_node)
        
        dirty_nodes = self.tree.get_dirty_nodes()
        
        self.assertEqual(len(dirty_nodes), 1)
        self.assertEqual(dirty_nodes[0].node_id, "dirty")
    
    def test_get_path_to_root(self):
        """Test getting path from node to root"""
        # Set up tree with parent-child relationships
        self.tree.add_node(self.root_node)
        self.tree.add_node(self.child1)
        self.tree.add_node(self.grandchild)
        
        path = self.tree.get_path_to_root("grandchild")
        
        expected_path = ["root", "child1", "grandchild"]
        self.assertEqual(path, expected_path)
        
        # Test root path
        root_path = self.tree.get_path_to_root("root")
        self.assertEqual(root_path, ["root"])


class TestProofStepCacheEntry(unittest.TestCase):
    """Unit tests for ProofStepCacheEntry"""
    
    def test_cache_entry_creation(self):
        """Test cache entry creation"""
        entry = ProofStepCacheEntry(
            tactic_sequence=["norm_num", "linarith"],
            base_proof_state_id=5,
            status=TacticNodeStatus.SUCCESS,
            next_proof_state_id=None,
            remaining_goals=0
        )
        
        self.assertEqual(entry.tactic_sequence, ["norm_num", "linarith"])
        self.assertEqual(entry.base_proof_state_id, 5)
        self.assertEqual(entry.status, TacticNodeStatus.SUCCESS)
        self.assertIsNone(entry.next_proof_state_id)
        self.assertEqual(entry.remaining_goals, 0)
    
    def test_get_cache_key(self):
        """Test cache key generation"""
        entry = ProofStepCacheEntry(
            tactic_sequence=["norm_num", "linarith"],
            base_proof_state_id=5,
            status=TacticNodeStatus.SUCCESS
        )
        
        expected_key = "5_norm_num_linarith"
        self.assertEqual(entry.get_cache_key(), expected_key)
        
        # Test empty sequence
        empty_entry = ProofStepCacheEntry(
            tactic_sequence=[],
            base_proof_state_id=0,
            status=TacticNodeStatus.INCOMPLETE
        )
        
        self.assertEqual(empty_entry.get_cache_key(), "0_")


class TestNgramTacticSearcher(unittest.TestCase):
    """Unit tests for NgramTacticSearcher"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.searcher = NgramTacticSearcher(max_depth=2)
    
    def test_searcher_initialization(self):
        """Test searcher initialization"""
        self.assertEqual(self.searcher.max_depth, 2)
        self.assertIsNone(self.searcher.lean_integrator)
        self.assertEqual(len(self.searcher.hole_trees), 0)
        self.assertEqual(len(self.searcher.proof_state_cache), 0)
        
        # Check tactic lists
        self.assertIn("norm_num", self.searcher.available_tactics)
        self.assertIn("linarith", self.searcher.terminal_tactics)
        self.assertIn("nlinarith", self.searcher.terminal_tactics)
        self.assertIn("omega", self.searcher.terminal_tactics)
    
    def test_initialize_search_for_hole(self):
        """Test hole search initialization"""
        tree = self.searcher.initialize_search_for_hole("test_hole", 10)
        
        self.assertEqual(tree.hole_id, "test_hole")
        self.assertEqual(tree.initial_proof_state_id, 10)
        self.assertEqual(tree.max_depth, 2)
        self.assertIsNotNone(tree.root_id)
        self.assertEqual(len(tree.nodes), 1)
        
        # Check root node
        root_node = tree.nodes[tree.root_id]
        self.assertEqual(root_node.tactic_sequence, [])
        self.assertEqual(root_node.depth, 0)
        self.assertEqual(root_node.status, TacticNodeStatus.INCOMPLETE)
    
    def test_expand_node(self):
        """Test node expansion"""
        tree = self.searcher.initialize_search_for_hole("test_hole", 0)
        root_node = tree.nodes[tree.root_id]
        
        children = self.searcher.expand_node(root_node)
        
        # Should create one child for each available tactic
        self.assertEqual(len(children), len(self.searcher.available_tactics))
        
        # Check child properties
        for child in children:
            self.assertEqual(child.hole_id, "test_hole")
            self.assertEqual(child.parent_id, root_node.node_id)
            self.assertEqual(child.depth, 1)
            self.assertEqual(len(child.tactic_sequence), 1)
            
            # Check terminal tactic handling
            last_tactic = child.get_last_tactic()
            if last_tactic in self.searcher.terminal_tactics:
                self.assertFalse(child.can_expand)
                self.assertEqual(child.terminal_type, TerminalTacticType.SOLVER)
            else:
                self.assertTrue(child.can_expand)
                self.assertEqual(child.terminal_type, TerminalTacticType.NORMAL)
    
    def test_expand_node_depth_limit(self):
        """Test that nodes at max depth cannot be expanded"""
        tree = self.searcher.initialize_search_for_hole("test_hole", 0)
        
        # Create node at max depth
        max_depth_node = TacticNode(
            node_id="max_depth", hole_id="test_hole",
            tactic_sequence=["norm_num", "simp"], parent_id="root",
            depth=self.searcher.max_depth
        )
        
        children = self.searcher.expand_node(max_depth_node)
        self.assertEqual(len(children), 0)
    
    def test_get_statistics(self):
        """Test statistics collection"""
        stats = self.searcher.get_statistics()
        
        expected_keys = [
            'total_executions', 'cache_hits', 'cache_misses', 
            'cache_size', 'server_restarts', 'dirty_nodes', 'active_trees'
        ]
        
        for key in expected_keys:
            self.assertIn(key, stats)
        
        # Check initial values
        self.assertEqual(stats['total_executions'], 0)
        self.assertEqual(stats['cache_hits'], 0)
        self.assertEqual(stats['cache_misses'], 0)
        self.assertEqual(stats['cache_size'], 0)


class TestMemoryManager(unittest.TestCase):
    """Unit tests for MemoryManager"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.memory_manager = MemoryManager(
            max_nodes_before_restart=100,
            max_memory_mb=1024,
            max_runtime_hours=1.0
        )
        self.mock_searcher = Mock()
        self.mock_searcher.hole_trees = {}
        self.mock_searcher.proof_state_cache = {}
        self.mock_searcher.lean_integrator = None
    
    def test_memory_manager_initialization(self):
        """Test memory manager initialization"""
        self.assertEqual(self.memory_manager.max_nodes_before_restart, 100)
        self.assertEqual(self.memory_manager.max_memory_mb, 1024)
        self.assertEqual(self.memory_manager.max_runtime_hours, 1.0)
        self.assertEqual(self.memory_manager.nodes_executed_since_restart, 0)
    
    def test_record_memory_stats(self):
        """Test memory statistics recording"""
        stats = self.memory_manager.record_memory_stats(self.mock_searcher)
        
        self.assertIsInstance(stats, MemoryStats)
        self.assertEqual(stats.total_nodes, 0)
        self.assertEqual(stats.cache_size, 0)
        self.assertGreaterEqual(stats.memory_mb, 0)
        self.assertFalse(stats.lean_server_active)
    
    def test_should_restart_server_node_limit(self):
        """Test restart trigger for node limit"""
        # Set nodes above limit
        self.memory_manager.nodes_executed_since_restart = 150
        
        should_restart, reason = self.memory_manager.should_restart_server(self.mock_searcher)
        
        self.assertTrue(should_restart)
        self.assertIn("Node limit", reason)
        self.assertTrue(self.memory_manager.restart_reasons['nodes_limit'])
    
    def test_should_restart_server_time_limit(self):
        """Test restart trigger for time limit"""
        # Set last restart time to past
        self.memory_manager.last_restart_time = datetime.now() - timedelta(hours=2)
        
        should_restart, reason = self.memory_manager.should_restart_server(self.mock_searcher)
        
        self.assertTrue(should_restart)
        self.assertIn("Runtime limit", reason)
        self.assertTrue(self.memory_manager.restart_reasons['time_limit'])
    
    @patch('ngram_memory_manager.psutil.Process')
    def test_should_restart_server_memory_limit(self, mock_process):
        """Test restart trigger for memory limit"""
        # Mock high memory usage
        mock_memory_info = Mock()
        mock_memory_info.rss = 2048 * 1024 * 1024  # 2048 MB in bytes
        mock_process.return_value.memory_info.return_value = mock_memory_info
        
        should_restart, reason = self.memory_manager.should_restart_server(self.mock_searcher)
        
        self.assertTrue(should_restart)
        self.assertIn("Memory limit", reason)
        self.assertTrue(self.memory_manager.restart_reasons['memory_limit'])
    
    def test_no_restart_needed(self):
        """Test when no restart is needed"""
        should_restart, reason = self.memory_manager.should_restart_server(self.mock_searcher)
        
        self.assertFalse(should_restart)
        self.assertEqual(reason, "No restart needed")
        
        # Check that no restart reasons are triggered
        for triggered in self.memory_manager.restart_reasons.values():
            self.assertFalse(triggered)


class TestCheckpointManager(unittest.TestCase):
    """Unit tests for CheckpointManager"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.temp_dir = tempfile.mkdtemp()
        self.checkpoint_manager = CheckpointManager(checkpoint_dir=self.temp_dir)
        
        # Create mock searcher
        self.mock_searcher = NgramTacticSearcher(max_depth=2)
        self.mock_searcher.initialize_search_for_hole("test_hole", 0)
    
    def test_checkpoint_manager_initialization(self):
        """Test checkpoint manager initialization"""
        self.assertEqual(self.checkpoint_manager.checkpoint_dir, self.temp_dir)
        self.assertTrue(os.path.exists(self.temp_dir))
    
    def test_save_checkpoint(self):
        """Test checkpoint saving"""
        checkpoint_file = self.checkpoint_manager.save_checkpoint("test_problem", self.mock_searcher)
        
        self.assertTrue(os.path.exists(checkpoint_file))
        self.assertIn("test_problem", checkpoint_file)
        
        # Verify file contents
        with open(checkpoint_file, 'r') as f:
            data = json.load(f)
        
        self.assertEqual(data['problem_id'], "test_problem")
        self.assertIn('searcher_config', data)
        self.assertIn('hole_trees', data)
        self.assertIn('cache_entries', data)
    
    def test_load_checkpoint(self):
        """Test checkpoint loading"""
        # First save a checkpoint
        self.checkpoint_manager.save_checkpoint("test_problem", self.mock_searcher)
        
        # Then load it
        checkpoint_data = self.checkpoint_manager.load_checkpoint("test_problem")
        
        self.assertIsNotNone(checkpoint_data)
        self.assertEqual(checkpoint_data['problem_id'], "test_problem")
    
    def test_load_nonexistent_checkpoint(self):
        """Test loading non-existent checkpoint"""
        checkpoint_data = self.checkpoint_manager.load_checkpoint("nonexistent")
        self.assertIsNone(checkpoint_data)
    
    def test_restore_searcher_from_checkpoint(self):
        """Test searcher restoration from checkpoint"""
        # Save checkpoint
        checkpoint_file = self.checkpoint_manager.save_checkpoint("test_problem", self.mock_searcher)
        
        # Load checkpoint data
        checkpoint_data = self.checkpoint_manager.load_checkpoint("test_problem")
        
        # Restore searcher
        restored_searcher = self.checkpoint_manager.restore_searcher_from_checkpoint(checkpoint_data)
        
        # Verify restoration
        self.assertEqual(restored_searcher.max_depth, self.mock_searcher.max_depth)
        self.assertEqual(len(restored_searcher.hole_trees), len(self.mock_searcher.hole_trees))
        self.assertEqual(restored_searcher.available_tactics, self.mock_searcher.available_tactics)
    
    def test_list_checkpoints(self):
        """Test checkpoint listing"""
        # Save some checkpoints
        self.checkpoint_manager.save_checkpoint("problem1", self.mock_searcher)
        self.checkpoint_manager.save_checkpoint("problem2", self.mock_searcher)
        
        checkpoints = self.checkpoint_manager.list_checkpoints()
        
        self.assertEqual(len(checkpoints), 2)
        
        problem_ids = [cp['problem_id'] for cp in checkpoints]
        self.assertIn("problem1", problem_ids)
        self.assertIn("problem2", problem_ids)


class TestNgramPipelineIntegrator(unittest.TestCase):
    """Unit tests for NgramPipelineIntegrator"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.integrator = NgramPipelineIntegrator(
            max_depth=2,
            enable_checkpoints=False,
            enable_memory_management=False,
            fallback_to_unigram=True
        )
    
    def test_integrator_initialization(self):
        """Test integrator initialization"""
        self.assertEqual(self.integrator.max_depth, 2)
        self.assertFalse(self.integrator.enable_checkpoints)
        self.assertFalse(self.integrator.enable_memory_management)
        self.assertTrue(self.integrator.fallback_to_unigram)
        
        # Check initial statistics
        stats = self.integrator.integration_stats
        self.assertEqual(stats['holes_processed'], 0)
        self.assertEqual(stats['ngram_successes'], 0)
        self.assertEqual(stats['unigram_fallbacks'], 0)
        self.assertEqual(stats['errors'], 0)
    
    def test_initialize_components(self):
        """Test component initialization"""
        self.integrator.initialize_components()
        
        self.assertIsNotNone(self.integrator.searcher)
        self.assertIsInstance(self.integrator.searcher, NgramTacticSearcher)
        
        # Memory management and checkpoints should be None (disabled)
        self.assertIsNone(self.integrator.memory_manager)
        self.assertIsNone(self.integrator.checkpoint_manager)
    
    def test_initialize_components_with_management(self):
        """Test component initialization with management enabled"""
        integrator = NgramPipelineIntegrator(
            max_depth=2,
            enable_checkpoints=True,
            enable_memory_management=True
        )
        
        integrator.initialize_components()
        
        self.assertIsNotNone(integrator.searcher)
        self.assertIsNotNone(integrator.memory_manager)
        self.assertIsNotNone(integrator.checkpoint_manager)


def run_unit_tests():
    """Run all unit tests"""
    print("🧪 Running N-gram System Unit Tests")
    print("=" * 60)
    
    # Create test suite
    test_suite = unittest.TestSuite()
    
    # Add test classes
    test_classes = [
        TestTacticNode,
        TestHoleSearchTree,
        TestProofStepCacheEntry,
        TestNgramTacticSearcher,
        TestMemoryManager,
        TestCheckpointManager,
        TestNgramPipelineIntegrator
    ]
    
    for test_class in test_classes:
        tests = unittest.TestLoader().loadTestsFromTestCase(test_class)
        test_suite.addTests(tests)
    
    # Run tests with detailed output
    runner = unittest.TextTestRunner(verbosity=2)
    result = runner.run(test_suite)
    
    # Print summary
    print(f"\n" + "=" * 60)
    print(f"🧪 UNIT TEST SUMMARY")
    print(f"=" * 60)
    print(f"Tests run: {result.testsRun}")
    print(f"✅ Passed: {result.testsRun - len(result.failures) - len(result.errors)}")
    print(f"❌ Failed: {len(result.failures)}")
    print(f"💥 Errors: {len(result.errors)}")
    
    if result.failures:
        print(f"\n❌ FAILURES:")
        for test, traceback in result.failures:
            print(f"  - {test}: {traceback.split(chr(10))[-2]}")
    
    if result.errors:
        print(f"\n💥 ERRORS:")
        for test, traceback in result.errors:
            print(f"  - {test}: {traceback.split(chr(10))[-2]}")
    
    success_rate = (result.testsRun - len(result.failures) - len(result.errors)) / result.testsRun * 100
    print(f"\nSuccess rate: {success_rate:.1f}%")
    
    if result.wasSuccessful():
        print(f"\n🎉 ALL UNIT TESTS PASSED!")
        print(f"✅ N-gram system components are well-tested and ready")
    else:
        print(f"\n⚠️  Some tests failed - review and fix before deployment")
    
    return result.wasSuccessful()


if __name__ == "__main__":
    success = run_unit_tests()
    sys.exit(0 if success else 1)