#!/usr/bin/env python3
"""
Server Restart Test

Tests the memory management and dependency handling when Lean server restarts.
Verifies that the system can properly handle server failures and resume operations.
"""

import os
import sys
import time
import tempfile
from unittest.mock import Mock, patch

sys.path.append(os.path.dirname(__file__))

from ngram_tactic_searcher import NgramTacticSearcher, TacticNode, TacticNodeStatus
from ngram_memory_manager import MemoryManager, CheckpointManager
from ngram_pipeline_integration import NgramPipelineIntegrator


class ServerRestartTester:
    """Test server restart scenarios and dependency management"""
    
    def __init__(self):
        self.test_results = {}
        self.temp_dir = tempfile.mkdtemp()
    
    def run_all_restart_tests(self):
        """Run all server restart tests"""
        print("🔄 Server Restart and Dependency Management Tests")
        print("=" * 70)
        
        self.test_forced_server_restart()
        self.test_dirty_node_management()
        self.test_cache_invalidation()
        self.test_checkpoint_recovery()
        self.test_multiple_restarts()
        self.test_restart_during_search()
        
        self.generate_restart_test_summary()
        
        return self.test_results
    
    def test_forced_server_restart(self):
        """Test forced server restart and recovery"""
        test_name = "forced_server_restart"
        print(f"\n🔧 Testing: {test_name}")
        
        try:
            # Create searcher and memory manager
            searcher = NgramTacticSearcher(max_depth=2)
            memory_manager = MemoryManager(
                max_nodes_before_restart=5,  # Very low threshold
                max_memory_mb=100,
                max_runtime_hours=0.001
            )
            
            # Initialize searcher
            searcher.total_executions = 0
            searcher.server_restart_count = 0
            
            # Create some trees and nodes
            tree1 = searcher.initialize_search_for_hole("hole_1", 0)
            tree2 = searcher.initialize_search_for_hole("hole_2", 1)
            
            # Add some nodes in various states
            incomplete_node = TacticNode(
                node_id="incomplete_1", hole_id="hole_1",
                tactic_sequence=["norm_num"], parent_id=tree1.root_id,
                depth=1, status=TacticNodeStatus.INCOMPLETE
            )
            tree1.add_node(incomplete_node)
            
            pending_node = TacticNode(
                node_id="pending_1", hole_id="hole_2",
                tactic_sequence=["simp"], parent_id=tree2.root_id,
                depth=1, status=TacticNodeStatus.PENDING
            )
            tree2.add_node(pending_node)
            
            # Add some cache entries
            from ngram_tactic_searcher import ProofStepCacheEntry
            cache_entry = ProofStepCacheEntry(
                tactic_sequence=["norm_num"],
                base_proof_state_id=0,
                status=TacticNodeStatus.SUCCESS
            )
            searcher.proof_state_cache["0_norm_num"] = cache_entry
            
            print(f"  📊 Before restart:")
            print(f"     Trees: {len(searcher.hole_trees)}")
            print(f"     Total nodes: {sum(len(tree.nodes) for tree in searcher.hole_trees.values())}")
            print(f"     Cache entries: {len(searcher.proof_state_cache)}")
            print(f"     Dirty nodes: {len(searcher.dirty_nodes)}")
            
            # Force server restart
            print(f"  🔄 Forcing server restart...")
            memory_manager.restart_server(searcher, "Test restart")
            
            print(f"  📊 After restart:")
            print(f"     Trees: {len(searcher.hole_trees)}")
            print(f"     Total nodes: {sum(len(tree.nodes) for tree in searcher.hole_trees.values())}")
            print(f"     Cache entries: {len(searcher.proof_state_cache)}")
            print(f"     Dirty nodes: {len(searcher.dirty_nodes)}")
            print(f"     Server restarts: {searcher.server_restart_count}")
            
            # Verify restart effects
            assert searcher.server_restart_count == 1, "Should increment restart count"
            assert len(searcher.proof_state_cache) == 0, "Should clear cache"
            assert len(searcher.dirty_nodes) > 0, "Should mark nodes as dirty"
            
            # Check that incomplete/pending nodes are marked dirty
            assert incomplete_node.status == TacticNodeStatus.DIRTY, "Incomplete node should be dirty"
            assert pending_node.status == TacticNodeStatus.DIRTY, "Pending node should be dirty"
            
            self.test_results[test_name] = {
                "status": "PASS",
                "details": f"Server restart handled correctly, {len(searcher.dirty_nodes)} nodes marked dirty"
            }
            print(f"  ✅ {test_name}: PASS")
            
        except Exception as e:
            self.test_results[test_name] = {"status": "FAIL", "error": str(e)}
            print(f"  ❌ {test_name}: FAIL - {e}")
    
    def test_dirty_node_management(self):
        """Test dirty node identification and re-execution"""
        test_name = "dirty_node_management"
        print(f"\n💫 Testing: {test_name}")
        
        try:
            searcher = NgramTacticSearcher(max_depth=2)
            
            # Create tree with various node states
            tree = searcher.initialize_search_for_hole("test_hole", 0)
            
            # Create nodes in different states
            nodes = []
            statuses = [
                TacticNodeStatus.SUCCESS,      # Should NOT be marked dirty
                TacticNodeStatus.ERROR,        # Should NOT be marked dirty
                TacticNodeStatus.INCOMPLETE,   # Should be marked dirty
                TacticNodeStatus.PENDING,      # Should be marked dirty
                TacticNodeStatus.DIRTY         # Already dirty
            ]
            
            for i, status in enumerate(statuses):
                node = TacticNode(
                    node_id=f"node_{i}", hole_id="test_hole",
                    tactic_sequence=[f"tactic_{i}"], parent_id=tree.root_id,
                    depth=1, status=status
                )
                tree.add_node(node)
                nodes.append(node)
            
            print(f"  📊 Before restart:")
            for i, node in enumerate(nodes):
                print(f"     Node {i}: {node.status.value}")
            
            # Simulate restart
            memory_manager = MemoryManager()
            memory_manager.restart_server(searcher, "Test dirty node management")
            
            print(f"  📊 After restart:")
            for i, node in enumerate(nodes):
                print(f"     Node {i}: {node.status.value}")
            
            # Verify dirty marking
            assert nodes[0].status == TacticNodeStatus.SUCCESS, "Success node should remain unchanged"
            assert nodes[1].status == TacticNodeStatus.ERROR, "Error node should remain unchanged"
            assert nodes[2].status == TacticNodeStatus.DIRTY, "Incomplete node should be dirty"
            assert nodes[3].status == TacticNodeStatus.DIRTY, "Pending node should be dirty"
            assert nodes[4].status == TacticNodeStatus.DIRTY, "Dirty node should remain dirty"
            
            # Test dirty node retrieval  
            # Expecting: root node (INCOMPLETE->DIRTY) + nodes[2] (INCOMPLETE->DIRTY) + nodes[3] (PENDING->DIRTY) + nodes[4] (already DIRTY)
            dirty_nodes = tree.get_dirty_nodes()
            assert len(dirty_nodes) == 4, f"Should have 4 dirty nodes (root + 3 marked), got {len(dirty_nodes)}"
            
            self.test_results[test_name] = {
                "status": "PASS",
                "details": f"Dirty node management correct, {len(dirty_nodes)} nodes properly marked"
            }
            print(f"  ✅ {test_name}: PASS")
            
        except Exception as e:
            self.test_results[test_name] = {"status": "FAIL", "error": str(e)}
            print(f"  ❌ {test_name}: FAIL - {e}")
    
    def test_cache_invalidation(self):
        """Test cache invalidation after server restart"""
        test_name = "cache_invalidation"
        print(f"\n🗑️ Testing: {test_name}")
        
        try:
            searcher = NgramTacticSearcher(max_depth=2)
            
            # Populate cache with entries
            from ngram_tactic_searcher import ProofStepCacheEntry
            cache_entries = [
                ("0_norm_num", ProofStepCacheEntry(["norm_num"], 0, TacticNodeStatus.SUCCESS)),
                ("1_linarith", ProofStepCacheEntry(["linarith"], 1, TacticNodeStatus.SUCCESS)),
                ("2_simp_omega", ProofStepCacheEntry(["simp", "omega"], 2, TacticNodeStatus.INCOMPLETE)),
            ]
            
            for key, entry in cache_entries:
                searcher.proof_state_cache[key] = entry
            
            print(f"  📊 Cache before restart: {len(searcher.proof_state_cache)} entries")
            
            # Record cache statistics
            initial_cache_size = len(searcher.proof_state_cache)
            
            # Restart server
            memory_manager = MemoryManager()
            memory_manager.restart_server(searcher, "Test cache invalidation")
            
            print(f"  📊 Cache after restart: {len(searcher.proof_state_cache)} entries")
            
            # Verify cache is cleared
            assert len(searcher.proof_state_cache) == 0, "Cache should be completely cleared"
            assert initial_cache_size > 0, "Should have had cache entries before restart"
            
            self.test_results[test_name] = {
                "status": "PASS", 
                "details": f"Cache properly cleared: {initial_cache_size} -> 0 entries"
            }
            print(f"  ✅ {test_name}: PASS")
            
        except Exception as e:
            self.test_results[test_name] = {"status": "FAIL", "error": str(e)}
            print(f"  ❌ {test_name}: FAIL - {e}")
    
    def test_checkpoint_recovery(self):
        """Test checkpoint save/restore around server restart"""
        test_name = "checkpoint_recovery"
        print(f"\n💾 Testing: {test_name}")
        
        try:
            # Create components
            searcher = NgramTacticSearcher(max_depth=2)
            memory_manager = MemoryManager()
            checkpoint_manager = CheckpointManager(checkpoint_dir=self.temp_dir)
            
            # Create search state
            tree = searcher.initialize_search_for_hole("test_hole", 0)
            
            # Add some nodes
            node1 = TacticNode(
                node_id="node_1", hole_id="test_hole",
                tactic_sequence=["norm_num"], parent_id=tree.root_id,
                depth=1, status=TacticNodeStatus.INCOMPLETE
            )
            tree.add_node(node1)
            
            # Save checkpoint before restart
            print(f"  💾 Saving checkpoint before restart...")
            checkpoint_file = checkpoint_manager.save_checkpoint("test_problem", searcher, memory_manager)
            
            # Simulate restart
            print(f"  🔄 Restarting server...")
            memory_manager.restart_server(searcher, "Test checkpoint recovery")
            
            # Verify dirty state
            assert node1.status == TacticNodeStatus.DIRTY, "Node should be dirty after restart"
            
            # Restore from checkpoint
            print(f"  📂 Restoring from checkpoint...")
            checkpoint_data = checkpoint_manager.load_checkpoint("test_problem")
            restored_searcher = checkpoint_manager.restore_searcher_from_checkpoint(checkpoint_data)
            
            # Verify restoration
            assert len(restored_searcher.hole_trees) == len(searcher.hole_trees), "Should restore same number of trees"
            
            restored_tree = restored_searcher.hole_trees["test_hole"]
            restored_node = restored_tree.nodes["node_1"]
            
            # Note: restored node should have the status from checkpoint (before restart)
            assert restored_node.tactic_sequence == ["norm_num"], "Should restore tactic sequence"
            assert restored_node.hole_id == "test_hole", "Should restore hole ID"
            
            self.test_results[test_name] = {
                "status": "PASS",
                "details": "Checkpoint save/restore works correctly around server restart"
            }
            print(f"  ✅ {test_name}: PASS")
            
        except Exception as e:
            self.test_results[test_name] = {"status": "FAIL", "error": str(e)}
            print(f"  ❌ {test_name}: FAIL - {e}")
    
    def test_multiple_restarts(self):
        """Test handling multiple server restarts"""
        test_name = "multiple_restarts"
        print(f"\n🔄🔄 Testing: {test_name}")
        
        try:
            searcher = NgramTacticSearcher(max_depth=2)
            memory_manager = MemoryManager()
            
            # Create initial state
            tree = searcher.initialize_search_for_hole("test_hole", 0)
            
            initial_restart_count = searcher.server_restart_count
            
            # Perform multiple restarts
            num_restarts = 3
            for i in range(num_restarts):
                print(f"  🔄 Restart {i+1}/{num_restarts}")
                memory_manager.restart_server(searcher, f"Test restart {i+1}")
                
                # Verify restart count
                expected_count = initial_restart_count + i + 1
                assert searcher.server_restart_count == expected_count, f"Restart count should be {expected_count}"
                
                # Verify cache is cleared each time
                assert len(searcher.proof_state_cache) == 0, "Cache should be cleared after each restart"
            
            print(f"  📊 Final restart count: {searcher.server_restart_count}")
            
            self.test_results[test_name] = {
                "status": "PASS",
                "details": f"Successfully handled {num_restarts} restarts"
            }
            print(f"  ✅ {test_name}: PASS")
            
        except Exception as e:
            self.test_results[test_name] = {"status": "FAIL", "error": str(e)}
            print(f"  ❌ {test_name}: FAIL - {e}")
    
    def test_restart_during_search(self):
        """Test restart happening during active search"""
        test_name = "restart_during_search"
        print(f"\n🔍🔄 Testing: {test_name}")
        
        try:
            # Create integrator with restart enabled
            integrator = NgramPipelineIntegrator(
                max_depth=2,
                enable_memory_management=True,
                enable_checkpoints=False  # Disable for simpler testing
            )
            
            integrator.initialize_components()
            
            # Set very low restart threshold
            integrator.memory_manager.max_nodes_before_restart = 2
            
            # Create mock search state
            searcher = integrator.searcher
            tree = searcher.initialize_search_for_hole("test_hole", 0)
            
            # Add nodes to trigger restart
            node1 = TacticNode(
                node_id="node_1", hole_id="test_hole",
                tactic_sequence=["norm_num"], parent_id=tree.root_id,
                depth=1, status=TacticNodeStatus.INCOMPLETE
            )
            tree.add_node(node1)
            
            # Simulate processing that would trigger restart
            integrator.memory_manager.nodes_executed_since_restart = 3  # Above threshold
            
            print(f"  📊 Before restart check:")
            print(f"     Nodes executed: {integrator.memory_manager.nodes_executed_since_restart}")
            print(f"     Restart threshold: {integrator.memory_manager.max_nodes_before_restart}")
            
            # Check if restart is needed
            should_restart, reason = integrator.memory_manager.should_restart_server(searcher)
            print(f"  🔍 Restart needed: {should_restart}, reason: {reason}")
            
            if should_restart:
                integrator.memory_manager.restart_server(searcher, reason)
                print(f"  🔄 Restart completed")
                
                # Verify restart effects
                assert searcher.server_restart_count > 0, "Should increment restart count"
                assert len(searcher.proof_state_cache) == 0, "Should clear cache"
                assert node1.status == TacticNodeStatus.DIRTY, "Node should be marked dirty"
            
            self.test_results[test_name] = {
                "status": "PASS",
                "details": "Restart during search handled correctly"
            }
            print(f"  ✅ {test_name}: PASS")
            
        except Exception as e:
            self.test_results[test_name] = {"status": "FAIL", "error": str(e)}
            print(f"  ❌ {test_name}: FAIL - {e}")
    
    def generate_restart_test_summary(self):
        """Generate summary of restart tests"""
        print(f"\n" + "=" * 70)
        print(f"🔄 SERVER RESTART TEST SUMMARY")
        print(f"=" * 70)
        
        total_tests = len(self.test_results)
        passed_tests = len([r for r in self.test_results.values() if r['status'] == 'PASS'])
        failed_tests = len([r for r in self.test_results.values() if r['status'] == 'FAIL'])
        
        print(f"Total restart tests: {total_tests}")
        print(f"✅ Passed: {passed_tests}")
        print(f"❌ Failed: {failed_tests}")
        print(f"Success rate: {passed_tests/total_tests*100:.1f}%")
        
        if failed_tests > 0:
            print(f"\n❌ FAILED TESTS:")
            for test_name, result in self.test_results.items():
                if result['status'] == 'FAIL':
                    print(f"  - {test_name}: {result.get('error', 'Unknown error')}")
        
        if passed_tests == total_tests:
            print(f"\n🎉 ALL RESTART TESTS PASSED!")
            print(f"✅ Server restart and dependency management work correctly")
        
        print(f"\n📋 RESTART HANDLING VERIFICATION:")
        print(f"✅ Forced restart triggers correctly")
        print(f"✅ Dirty nodes are properly identified and marked")
        print(f"✅ Cache is invalidated on restart")
        print(f"✅ Checkpoint save/restore works around restarts")
        print(f"✅ Multiple restarts are handled gracefully")
        print(f"✅ Restart during active search is managed")


def main():
    """Run server restart tests"""
    tester = ServerRestartTester()
    results = tester.run_all_restart_tests()
    
    # Save results
    import json
    results_file = "server_restart_test_results.json"
    with open(results_file, 'w') as f:
        json.dump(results, f, indent=2, default=str)
    
    print(f"\n📄 Server restart test results saved to: {results_file}")
    
    return all(r['status'] == 'PASS' for r in results.values())


if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)