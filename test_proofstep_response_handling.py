#!/usr/bin/env python3
"""
ProofStep Response Handling Test

Test the correct handling of ProofStep responses, particularly the proper use
of the proof_state field for tactic sequence dependencies.
"""

import os
import sys
import unittest
from unittest.mock import Mock, MagicMock
from datetime import datetime

sys.path.append(os.path.dirname(__file__))

from ngram_tactic_searcher import NgramTacticSearcher, TacticNode, TacticNodeStatus


class MockProofStepResponse:
    """Mock ProofStep response that mimics real response structure"""
    
    def __init__(self, proof_status='Completed', goals=None, proof_state=None):
        self.proof_status = proof_status
        self.goals = goals if goals is not None else []
        self.proof_state = proof_state


class MockLeanError(Exception):
    """Mock Lean error"""
    
    def __init__(self, message):
        self.message = message
        super().__init__(message)


class TestProofStepResponseHandling(unittest.TestCase):
    """Test ProofStep response handling in n-gram searcher"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.searcher = NgramTacticSearcher(max_depth=2)
        
        # Mock the lean integrator
        self.searcher.lean_integrator = Mock()
        self.searcher.lean_integrator.lean_server = Mock()
        
    def test_successful_single_tactic_sequence(self):
        """Test successful single tactic that completes the goal"""
        # Create test node
        node = TacticNode(
            node_id="test_norm_num",
            hole_id="test_hole",
            tactic_sequence=["norm_num"],
            parent_id="root",
            depth=1
        )
        
        # Mock response: tactic succeeds and completes goal
        mock_response = MockProofStepResponse(
            proof_status='Completed',
            goals=[],
            proof_state=5  # Final proof state
        )
        
        self.searcher.lean_integrator.lean_server.run.return_value = mock_response
        
        # Execute tactic sequence
        result = self.searcher.execute_tactic_sequence(node, base_proof_state_id=3)
        
        # Verify result
        self.assertEqual(result, TacticNodeStatus.SUCCESS)
        
        # Verify ProofStep was called correctly
        self.searcher.lean_integrator.lean_server.run.assert_called_once()
        call_args = self.searcher.lean_integrator.lean_server.run.call_args[0][0]
        self.assertEqual(call_args.proof_state, 3)  # Started with base proof_state 3
        self.assertEqual(call_args.tactic, "norm_num")
    
    def test_two_tactic_sequence_with_intermediate_state(self):
        """Test two-tactic sequence with intermediate proof state"""
        # Create test node with two tactics
        node = TacticNode(
            node_id="test_norm_num_linarith",
            hole_id="test_hole", 
            tactic_sequence=["norm_num", "linarith"],
            parent_id="root",
            depth=2
        )
        
        # Mock responses for two tactics
        # First tactic: incomplete (generates new proof state)
        first_response = MockProofStepResponse(
            proof_status='Incomplete',
            goals=['goal1', 'goal2'],
            proof_state=7  # Intermediate proof state
        )
        
        # Second tactic: success
        second_response = MockProofStepResponse(
            proof_status='Completed',
            goals=[],
            proof_state=8  # Final proof state
        )
        
        # Set up mock to return different responses for each call
        self.searcher.lean_integrator.lean_server.run.side_effect = [first_response, second_response]
        
        # Execute tactic sequence
        result = self.searcher.execute_tactic_sequence(node, base_proof_state_id=3)
        
        # Verify result
        self.assertEqual(result, TacticNodeStatus.SUCCESS)
        
        # Verify ProofStep calls
        self.assertEqual(self.searcher.lean_integrator.lean_server.run.call_count, 2)
        
        # Check first call (norm_num on proof_state 3)
        first_call = self.searcher.lean_integrator.lean_server.run.call_args_list[0][0][0]
        self.assertEqual(first_call.proof_state, 3)
        self.assertEqual(first_call.tactic, "norm_num")
        
        # Check second call (linarith on proof_state 7)
        second_call = self.searcher.lean_integrator.lean_server.run.call_args_list[1][0][0]
        self.assertEqual(second_call.proof_state, 7)  # Uses intermediate proof_state
        self.assertEqual(second_call.tactic, "linarith")
    
    def test_tactic_sequence_with_error(self):
        """Test tactic sequence that fails with error"""
        # Create test node
        node = TacticNode(
            node_id="test_invalid",
            hole_id="test_hole",
            tactic_sequence=["invalid_tactic"],
            parent_id="root",
            depth=1
        )
        
        # Mock error response
        mock_error = MockLeanError("tactic 'invalid_tactic' failed")
        self.searcher.lean_integrator.lean_server.run.side_effect = mock_error
        
        # Execute tactic sequence
        result = self.searcher.execute_tactic_sequence(node, base_proof_state_id=3)
        
        # Verify result
        self.assertEqual(result, TacticNodeStatus.ERROR)
        self.assertIn("invalid_tactic", node.error_message)
    
    def test_missing_proof_state_error(self):
        """Test handling of response without proof_state field"""
        # Create test node with two tactics
        node = TacticNode(
            node_id="test_missing_state",
            hole_id="test_hole",
            tactic_sequence=["norm_num", "linarith"],
            parent_id="root",
            depth=2
        )
        
        # Mock response without proof_state (this should cause error)
        bad_response = MockProofStepResponse(
            proof_status='Incomplete',
            goals=['goal1'],
            proof_state=None  # Missing proof_state!
        )
        
        self.searcher.lean_integrator.lean_server.run.return_value = bad_response
        
        # Execute tactic sequence
        result = self.searcher.execute_tactic_sequence(node, base_proof_state_id=3)
        
        # Should fail due to missing proof_state
        self.assertEqual(result, TacticNodeStatus.ERROR)
        self.assertIn("No proof_state", node.error_message)
    
    def test_incomplete_sequence_stops_at_max_depth(self):
        """Test that incomplete sequence ends when reaching max tactics"""
        # Create test node with two tactics (max depth)
        node = TacticNode(
            node_id="test_incomplete",
            hole_id="test_hole",
            tactic_sequence=["simp", "ring"],
            parent_id="root",
            depth=2
        )
        
        # Mock responses - both incomplete
        first_response = MockProofStepResponse(
            proof_status='Incomplete',
            goals=['goal1'],
            proof_state=7
        )
        
        second_response = MockProofStepResponse(
            proof_status='Incomplete', 
            goals=['goal1'],  # Still has goals
            proof_state=8
        )
        
        self.searcher.lean_integrator.lean_server.run.side_effect = [first_response, second_response]
        
        # Execute tactic sequence
        result = self.searcher.execute_tactic_sequence(node, base_proof_state_id=3)
        
        # Should be incomplete (didn't solve all goals)
        self.assertEqual(result, TacticNodeStatus.INCOMPLETE)
        self.assertEqual(node.remaining_goals, 1)
        self.assertEqual(node.proof_state_id, 8)  # Final proof_state recorded
    
    def test_cache_uses_correct_proof_state_dependency(self):
        """Test that cache entries correctly capture proof_state dependencies"""
        # Create test node
        node = TacticNode(
            node_id="test_cache",
            hole_id="test_hole",
            tactic_sequence=["norm_num"],
            parent_id="root",
            depth=1
        )
        
        # Mock successful response
        mock_response = MockProofStepResponse(
            proof_status='Completed',
            goals=[],
            proof_state=42
        )
        
        self.searcher.lean_integrator.lean_server.run.return_value = mock_response
        
        # Execute tactic sequence
        result = self.searcher.execute_tactic_sequence(node, base_proof_state_id=10)
        
        # Verify cache entry
        cache_key = "10_norm_num"
        self.assertIn(cache_key, self.searcher.proof_state_cache)
        
        cache_entry = self.searcher.proof_state_cache[cache_key]
        self.assertEqual(cache_entry.base_proof_state_id, 10)
        self.assertEqual(cache_entry.tactic_sequence, ["norm_num"])
        self.assertEqual(cache_entry.status, TacticNodeStatus.SUCCESS)
        self.assertEqual(cache_entry.next_proof_state_id, 42)  # Records final proof_state
    
    def test_cache_hit_avoids_proofstep_call(self):
        """Test that cache hit avoids calling ProofStep"""
        # Create test node
        node = TacticNode(
            node_id="test_cache_hit",
            hole_id="test_hole",
            tactic_sequence=["norm_num"],
            parent_id="root",
            depth=1
        )
        
        # Pre-populate cache
        from ngram_tactic_searcher import ProofStepCacheEntry
        cache_entry = ProofStepCacheEntry(
            tactic_sequence=["norm_num"],
            base_proof_state_id=10,
            status=TacticNodeStatus.SUCCESS,
            next_proof_state_id=42,
            remaining_goals=0,
            execution_time=datetime.now()
        )
        
        cache_key = "10_norm_num"
        self.searcher.proof_state_cache[cache_key] = cache_entry
        
        # Execute tactic sequence
        result = self.searcher.execute_tactic_sequence(node, base_proof_state_id=10)
        
        # Verify result came from cache
        self.assertEqual(result, TacticNodeStatus.SUCCESS)
        
        # Verify ProofStep was NOT called
        self.searcher.lean_integrator.lean_server.run.assert_not_called()
        
        # Verify cache statistics
        self.assertEqual(self.searcher.cache_hits, 1)
        self.assertEqual(self.searcher.cache_misses, 0)


def run_proofstep_response_tests():
    """Run ProofStep response handling tests"""
    print("🧪 ProofStep Response Handling Tests")
    print("=" * 60)
    
    # Run tests
    test_suite = unittest.TestSuite()
    test_suite.addTests(unittest.TestLoader().loadTestsFromTestCase(TestProofStepResponseHandling))
    
    runner = unittest.TextTestRunner(verbosity=2)
    result = runner.run(test_suite)
    
    # Print summary
    print(f"\n" + "=" * 60)
    print(f"🧪 PROOFSTEP RESPONSE TEST SUMMARY")
    print(f"=" * 60)
    print(f"Tests run: {result.testsRun}")
    print(f"✅ Passed: {result.testsRun - len(result.failures) - len(result.errors)}")
    print(f"❌ Failed: {len(result.failures)}")
    print(f"💥 Errors: {len(result.errors)}")
    
    if result.failures:
        print(f"\n❌ FAILURES:")
        for test, traceback in result.failures:
            print(f"  - {test}")
    
    if result.errors:
        print(f"\n💥 ERRORS:")
        for test, traceback in result.errors:
            print(f"  - {test}")
    
    success_rate = (result.testsRun - len(result.failures) - len(result.errors)) / result.testsRun * 100
    print(f"\nSuccess rate: {success_rate:.1f}%")
    
    if result.wasSuccessful():
        print(f"\n🎉 ALL PROOFSTEP RESPONSE TESTS PASSED!")
        print(f"✅ ProofStep response handling is correct")
        print(f"✅ proof_state dependencies are properly managed")
        print(f"✅ Cache correctly captures proof_state information")
    else:
        print(f"\n⚠️  Some tests failed - ProofStep handling needs attention")
    
    print(f"\n📋 KEY VERIFICATION POINTS:")
    print(f"✅ Single tactic success with proof_state tracking")
    print(f"✅ Multi-tactic sequence with intermediate proof_states")
    print(f"✅ Error handling for failed tactics")
    print(f"✅ Missing proof_state detection and error handling")
    print(f"✅ Incomplete sequences with goal tracking")
    print(f"✅ Cache entries with correct proof_state dependencies")
    print(f"✅ Cache hits avoid redundant ProofStep calls")
    
    return result.wasSuccessful()


if __name__ == "__main__":
    success = run_proofstep_response_tests()
    sys.exit(0 if success else 1)