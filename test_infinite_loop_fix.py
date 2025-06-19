#!/usr/bin/env python3

import sys
import time
from ngram_tactic_searcher import NgramTacticSearcher
from proofstep_lean_integration import MinimalLeanProofStepIntegrator

def test_infinite_loop_fix():
    """Test the infinite loop fix with a simple failing case"""
    print("🧪 Testing Infinite Loop Fix")
    print("=" * 50)
    
    # Initialize searcher
    searcher = NgramTacticSearcher(max_depth=2)
    lean_integrator = MinimalLeanProofStepIntegrator()
    searcher.lean_integrator = lean_integrator
    
    # Create a simple test case that will fail all tactics
    header_content = "import Mathlib"
    hole_content = """
theorem impossible_theorem : False := by
  admit
"""
    
    print("📝 Testing with impossible theorem (all tactics should fail)")
    print(f"Header: {header_content}")
    print(f"Hole content: {hole_content}")
    
    # Extract proof states
    proof_states = lean_integrator.extract_proof_states_from_sorries(header_content, hole_content)
    
    print(f"📊 Proof states result: {type(proof_states)}, content: {proof_states}")
    
    if isinstance(proof_states, dict) and proof_states:
        proof_state_id = list(proof_states.keys())[0]  # Get first proof state
    elif isinstance(proof_states, list) and proof_states:
        # Handle case where it returns a list - use index 0
        proof_state_id = 0
    else:
        print("❌ Failed to get proof state information")
        return False
    
    print(f"🎯 Got proof state ID: {proof_state_id}")
    
    # Start search with timeout
    start_time = time.time()
    timeout = 30  # 30 seconds timeout
    
    try:
        print(f"🚀 Starting search with {timeout}s timeout...")
        
        # This should NOT run infinitely anymore
        successful_paths, results = searcher.search_hole(
            hole_id="test_hole",
            initial_proof_state_id=proof_state_id
        )
        
        elapsed = time.time() - start_time
        print(f"✅ Search completed in {elapsed:.2f}s")
        print(f"📊 Results:")
        print(f"  - Successful paths: {len(successful_paths)}")
        print(f"  - Total nodes: {results.get('total_nodes', 0)}")
        print(f"  - Max depth reached: {results.get('max_depth_reached', 0)}")
        
        if elapsed < timeout:  # Search completed within timeout
            print("🎉 INFINITE LOOP FIX: SUCCESS!")
            return True
        else:
            print("❌ INFINITE LOOP FIX: FAILED - took too long")
            return False
            
    except Exception as e:
        elapsed = time.time() - start_time
        print(f"❌ Search failed after {elapsed:.2f}s with error: {e}")
        return False

def test_with_timeout():
    """Run test with process timeout protection"""
    import signal
    
    def timeout_handler(signum, frame):
        print("🚨 TIMEOUT: Test took too long, infinite loop detected!")
        sys.exit(1)
    
    # Set 60 second timeout
    signal.signal(signal.SIGALRM, timeout_handler)
    signal.alarm(60)
    
    try:
        result = test_infinite_loop_fix()
        signal.alarm(0)  # Cancel timeout
        return result
    except SystemExit:
        return False

if __name__ == "__main__":
    print("🔧 Testing N-gram System Infinite Loop Fix")
    print("=" * 60)
    
    success = test_with_timeout()
    
    if success:
        print("\n✅ ALL TESTS PASSED - Infinite loop fixed!")
    else:
        print("\n❌ TESTS FAILED - Infinite loop still exists!")
        sys.exit(1)