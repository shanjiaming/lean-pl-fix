#!/usr/bin/env python3
"""
N-gram Tactic Search System Test

Comprehensive test suite for the n-gram tactic search system.
Tests all major components and integration points.
"""

import os
import sys
import json
import tempfile
from typing import Dict, List, Any

# Add current directory to path for imports
sys.path.append(os.path.dirname(__file__))

from ngram_tactic_searcher import (
    NgramTacticSearcher, TacticNode, HoleSearchTree, 
    TacticNodeStatus, TerminalTacticType
)
from ngram_memory_manager import MemoryManager, CheckpointManager
from ngram_pipeline_integration import NgramPipelineIntegrator, create_ngram_wrapper_for_existing_pipeline
from unified_problem_manager import problem_manager


class NgramSystemTester:
    """Comprehensive tester for the n-gram system"""
    
    def __init__(self):
        self.test_results = {}
        self.temp_dir = tempfile.mkdtemp()
        
    def run_all_tests(self) -> Dict[str, Any]:
        """Run all test cases"""
        print("🧪 N-gram Tactic Search System - Comprehensive Test Suite")
        print("=" * 70)
        
        # Test core data structures
        self.test_tactic_node_creation()
        self.test_hole_search_tree()
        self.test_searcher_initialization()
        
        # Test memory management
        self.test_memory_manager()
        self.test_checkpoint_manager()
        
        # Test integration
        self.test_pipeline_integration()
        
        # Test with demo data (if available)
        self.test_with_demo_data()
        
        # Generate summary
        self.generate_test_summary()
        
        return self.test_results
    
    def test_tactic_node_creation(self):
        """Test TacticNode creation and methods"""
        test_name = "tactic_node_creation"
        print(f"\n🔧 Testing: {test_name}")
        
        try:
            # Create root node
            root_node = TacticNode(
                node_id="test_hole_root",
                hole_id="test_hole",
                tactic_sequence=[],
                parent_id=None,
                depth=0
            )
            
            assert root_node.get_last_tactic() is None, "Root node should have no last tactic"
            assert not root_node.is_terminal(), "Root node should not be terminal"
            
            # Create child node
            child_node = TacticNode(
                node_id="test_hole_norm_num",
                hole_id="test_hole",
                tactic_sequence=["norm_num"],
                parent_id="test_hole_root",
                depth=1
            )
            
            assert child_node.get_last_tactic() == "norm_num", "Child node should have correct last tactic"
            
            # Create terminal node
            terminal_node = TacticNode(
                node_id="test_hole_linarith",
                hole_id="test_hole",
                tactic_sequence=["linarith"],
                parent_id="test_hole_root",
                depth=1,
                terminal_type=TerminalTacticType.SOLVER,
                can_expand=False
            )
            
            assert terminal_node.is_terminal(), "Terminal node should be terminal"
            
            self.test_results[test_name] = {"status": "PASS", "details": "All node creation tests passed"}
            print(f"  ✅ {test_name}: PASS")
            
        except Exception as e:
            self.test_results[test_name] = {"status": "FAIL", "error": str(e)}
            print(f"  ❌ {test_name}: FAIL - {e}")
    
    def test_hole_search_tree(self):
        """Test HoleSearchTree functionality"""
        test_name = "hole_search_tree"
        print(f"\n🌳 Testing: {test_name}")
        
        try:
            # Create search tree
            tree = HoleSearchTree(
                hole_id="test_hole",
                initial_proof_state_id=0,
                max_depth=2
            )
            
            # Create and add nodes
            root_node = TacticNode(
                node_id="test_hole_root",
                hole_id="test_hole",
                tactic_sequence=[],
                parent_id=None,
                depth=0,
                status=TacticNodeStatus.INCOMPLETE
            )
            
            tree.add_node(root_node)
            tree.root_id = root_node.node_id
            
            # Add child nodes
            child1 = TacticNode(
                node_id="test_hole_norm_num",
                hole_id="test_hole",
                tactic_sequence=["norm_num"],
                parent_id="test_hole_root",
                depth=1,
                status=TacticNodeStatus.INCOMPLETE
            )
            
            child2 = TacticNode(
                node_id="test_hole_linarith",
                hole_id="test_hole",
                tactic_sequence=["linarith"],
                parent_id="test_hole_root",
                depth=1,
                status=TacticNodeStatus.SUCCESS
            )
            
            tree.add_node(child1)
            tree.add_node(child2)
            
            # Test tree functionality
            assert len(tree.nodes) == 3, "Tree should have 3 nodes"
            assert len(tree.get_expandable_nodes()) == 1, "Should have 1 expandable node"
            assert len(tree.get_pending_nodes()) == 0, "Should have 0 pending nodes"
            
            # Test successful path tracking
            tree.successful_paths.append(["linarith"])
            assert len(tree.successful_paths) == 1, "Should have 1 successful path"
            
            self.test_results[test_name] = {"status": "PASS", "details": "All tree functionality tests passed"}
            print(f"  ✅ {test_name}: PASS")
            
        except Exception as e:
            self.test_results[test_name] = {"status": "FAIL", "error": str(e)}
            print(f"  ❌ {test_name}: FAIL - {e}")
    
    def test_searcher_initialization(self):
        """Test NgramTacticSearcher initialization"""
        test_name = "searcher_initialization"
        print(f"\n🔍 Testing: {test_name}")
        
        try:
            # Create searcher
            searcher = NgramTacticSearcher(max_depth=2)
            
            assert searcher.max_depth == 2, "Max depth should be set correctly"
            assert len(searcher.available_tactics) > 0, "Should have available tactics"
            assert "linarith" in searcher.terminal_tactics, "Should have terminal tactics"
            
            # Test tree initialization
            tree = searcher.initialize_search_for_hole("test_hole", 0)
            
            assert tree.hole_id == "test_hole", "Tree should have correct hole ID"
            assert tree.initial_proof_state_id == 0, "Tree should have correct initial proof state"
            assert len(tree.nodes) == 1, "Tree should have root node"
            assert tree.root_id is not None, "Tree should have root ID set"
            
            # Test node expansion
            root_node = tree.nodes[tree.root_id]
            children = searcher.expand_node(root_node)
            
            assert len(children) == len(searcher.available_tactics), "Should create child for each tactic"
            
            # Check terminal tactic handling
            terminal_children = [c for c in children if not c.can_expand]
            assert len(terminal_children) == len(searcher.terminal_tactics), "Terminal tactics should not be expandable"
            
            self.test_results[test_name] = {"status": "PASS", "details": "Searcher initialization tests passed"}
            print(f"  ✅ {test_name}: PASS")
            
        except Exception as e:
            self.test_results[test_name] = {"status": "FAIL", "error": str(e)}
            print(f"  ❌ {test_name}: FAIL - {e}")
    
    def test_memory_manager(self):
        """Test MemoryManager functionality"""
        test_name = "memory_manager"
        print(f"\n🧠 Testing: {test_name}")
        
        try:
            # Create memory manager with low thresholds for testing
            memory_manager = MemoryManager(
                max_nodes_before_restart=10,
                max_memory_mb=100,
                max_runtime_hours=0.001  # Very short for testing
            )
            
            # Create mock searcher
            searcher = NgramTacticSearcher(max_depth=1)
            
            # Test memory stats recording
            stats = memory_manager.record_memory_stats(searcher)
            assert stats.total_nodes == 0, "Should start with 0 nodes"
            assert stats.cache_size == 0, "Should start with 0 cache size"
            
            # Test restart conditions
            memory_manager.nodes_executed_since_restart = 15  # Above threshold
            should_restart, reason = memory_manager.should_restart_server(searcher)
            assert should_restart, "Should trigger restart due to node limit"
            assert "Node limit" in reason, "Reason should mention node limit"
            
            # Test memory report
            report = memory_manager.get_memory_report(searcher)
            assert 'current' in report, "Report should have current stats"
            assert 'limits' in report, "Report should have limits"
            
            self.test_results[test_name] = {"status": "PASS", "details": "Memory manager tests passed"}
            print(f"  ✅ {test_name}: PASS")
            
        except Exception as e:
            self.test_results[test_name] = {"status": "FAIL", "error": str(e)}
            print(f"  ❌ {test_name}: FAIL - {e}")
    
    def test_checkpoint_manager(self):
        """Test CheckpointManager functionality"""
        test_name = "checkpoint_manager"
        print(f"\n💾 Testing: {test_name}")
        
        try:
            # Create checkpoint manager with temp directory
            checkpoint_manager = CheckpointManager(checkpoint_dir=self.temp_dir)
            
            # Create mock searcher with some data
            searcher = NgramTacticSearcher(max_depth=2)
            tree = searcher.initialize_search_for_hole("test_hole", 0)
            
            # Save checkpoint
            checkpoint_file = checkpoint_manager.save_checkpoint("test_problem", searcher)
            assert os.path.exists(checkpoint_file), "Checkpoint file should be created"
            
            # Load checkpoint
            checkpoint_data = checkpoint_manager.load_checkpoint("test_problem")
            assert checkpoint_data is not None, "Should load checkpoint data"
            assert 'hole_trees' in checkpoint_data, "Should have hole trees in checkpoint"
            
            # Restore searcher
            restored_searcher = checkpoint_manager.restore_searcher_from_checkpoint(checkpoint_data)
            assert restored_searcher.max_depth == searcher.max_depth, "Should restore max depth"
            assert len(restored_searcher.hole_trees) == len(searcher.hole_trees), "Should restore hole trees"
            
            # Test checkpoint listing
            checkpoints = checkpoint_manager.list_checkpoints()
            assert len(checkpoints) >= 1, "Should list at least one checkpoint"
            
            self.test_results[test_name] = {"status": "PASS", "details": "Checkpoint manager tests passed"}
            print(f"  ✅ {test_name}: PASS")
            
        except Exception as e:
            self.test_results[test_name] = {"status": "FAIL", "error": str(e)}
            print(f"  ❌ {test_name}: FAIL - {e}")
    
    def test_pipeline_integration(self):
        """Test pipeline integration functionality"""
        test_name = "pipeline_integration"
        print(f"\n🔗 Testing: {test_name}")
        
        try:
            # Create integrator
            integrator = NgramPipelineIntegrator(
                max_depth=2,
                enable_checkpoints=False,  # Disable for testing
                enable_memory_management=False,
                fallback_to_unigram=True
            )
            
            # Test component initialization
            integrator.initialize_components()
            assert integrator.searcher is not None, "Should initialize searcher"
            
            # Test wrapper installation
            create_ngram_wrapper_for_existing_pipeline()
            
            # Check that the method was added
            from proofstep_lean_integration import MinimalLeanProofStepIntegrator
            assert hasattr(MinimalLeanProofStepIntegrator, 'enumerate_ngram_tactics_with_proof_states'), \
                   "Should add n-gram method to integrator"
            
            # Test statistics tracking
            initial_stats = integrator.integration_stats.copy()
            assert initial_stats['holes_processed'] == 0, "Should start with 0 holes processed"
            
            self.test_results[test_name] = {"status": "PASS", "details": "Pipeline integration tests passed"}
            print(f"  ✅ {test_name}: PASS")
            
        except Exception as e:
            self.test_results[test_name] = {"status": "FAIL", "error": str(e)}
            print(f"  ❌ {test_name}: FAIL - {e}")
    
    def test_with_demo_data(self):
        """Test with actual demo data if available"""
        test_name = "demo_data_integration"
        print(f"\n🎯 Testing: {test_name}")
        
        try:
            # Try to get a demo problem
            problems = problem_manager.list_problems('demo')
            
            if not problems:
                self.test_results[test_name] = {"status": "SKIP", "details": "No demo data available"}
                print(f"  ⏭️  {test_name}: SKIP - No demo data available")
                return
            
            # Use first demo problem
            problem = problems[0]
            print(f"  🔍 Testing with problem: {problem.problem_id}")
            
            # Check if decomposition results exist
            decomp_dir = f"decomposition_results/demo/decomposed/{problem.problem_id}"
            
            if not os.path.exists(decomp_dir):
                self.test_results[test_name] = {"status": "SKIP", "details": "No decomposition results available"}
                print(f"  ⏭️  {test_name}: SKIP - No decomposition results")
                print(f"      Run: python decompose_hole_merge_pipeline.py problem demo {problem.problem_id}")
                return
            
            # Try to load decomposition data
            decomp_json_path = os.path.join(decomp_dir, "decomposition.json")
            if os.path.exists(decomp_json_path):
                with open(decomp_json_path, 'r') as f:
                    decomp_data = json.load(f)
                
                holes_count = len(decomp_data.get('holes', []))
                print(f"  📊 Found {holes_count} holes in decomposition data")
                
                self.test_results[test_name] = {
                    "status": "PASS", 
                    "details": f"Successfully loaded demo data with {holes_count} holes"
                }
                print(f"  ✅ {test_name}: PASS - Demo data loaded successfully")
            else:
                self.test_results[test_name] = {"status": "PARTIAL", "details": "Demo problem found but no decomposition JSON"}
                print(f"  ⚠️  {test_name}: PARTIAL - Missing decomposition.json")
            
        except Exception as e:
            self.test_results[test_name] = {"status": "FAIL", "error": str(e)}
            print(f"  ❌ {test_name}: FAIL - {e}")
    
    def generate_test_summary(self):
        """Generate overall test summary"""
        print(f"\n" + "=" * 70)
        print(f"🧪 TEST SUMMARY")
        print(f"=" * 70)
        
        total_tests = len(self.test_results)
        passed_tests = len([r for r in self.test_results.values() if r['status'] == 'PASS'])
        failed_tests = len([r for r in self.test_results.values() if r['status'] == 'FAIL'])
        skipped_tests = len([r for r in self.test_results.values() if r['status'] in ['SKIP', 'PARTIAL']])
        
        print(f"Total tests: {total_tests}")
        print(f"✅ Passed: {passed_tests}")
        print(f"❌ Failed: {failed_tests}")
        print(f"⏭️  Skipped/Partial: {skipped_tests}")
        print(f"Success rate: {passed_tests/total_tests*100:.1f}%")
        
        if failed_tests > 0:
            print(f"\n❌ FAILED TESTS:")
            for test_name, result in self.test_results.items():
                if result['status'] == 'FAIL':
                    print(f"  - {test_name}: {result.get('error', 'Unknown error')}")
        
        if passed_tests == total_tests - skipped_tests:
            print(f"\n🎉 ALL CORE TESTS PASSED!")
            print(f"✅ N-gram tactic search system is ready for use")
        
        print(f"\n📋 NEXT STEPS:")
        print(f"1. Run decomposition pipeline on demo data:")
        print(f"   python decompose_hole_merge_pipeline.py dataset demo 3")
        print(f"2. Test n-gram search integration:")
        print(f"   python test_ngram_integration_live.py")
        print(f"3. Use n-gram search in production:")
        print(f"   from ngram_pipeline_integration import create_ngram_wrapper_for_existing_pipeline")
        print(f"   create_ngram_wrapper_for_existing_pipeline()")


def main():
    """Run the test suite"""
    tester = NgramSystemTester()
    results = tester.run_all_tests()
    
    # Save results to file
    results_file = "ngram_test_results.json"
    with open(results_file, 'w') as f:
        json.dump(results, f, indent=2, default=str)
    
    print(f"\n📄 Test results saved to: {results_file}")


if __name__ == "__main__":
    main()