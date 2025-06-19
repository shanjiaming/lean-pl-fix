#!/usr/bin/env python3
"""
Test Clean Pipeline with Real Holes

Test the clean pipeline using the demo_ngram_validation problem which has real holes.
"""

import os
import sys
import json
from typing import Dict, List

sys.path.append(os.path.dirname(__file__))

from ngram_pickle_pipeline import CleanNgramPipeline
from unified_problem_manager import problem_manager


def load_decomposition_data(problem_id: str):
    """Load decomposition data for a problem"""
    decomp_file = f"decomposition_results/demo/decomposed/{problem_id}/decomposition.json"
    
    if not os.path.exists(decomp_file):
        print(f"❌ Decomposition file not found: {decomp_file}")
        return None, None, None
    
    with open(decomp_file, 'r') as f:
        decomp_data = json.load(f)
    
    # Extract the information we need
    holes = decomp_data.get('holes', [])
    
    # Create sorry_map from holes
    from dataclasses import dataclass
    
    @dataclass
    class SorryInfo:
        hole_id: str
        line: int
        column: int
    
    sorry_map = {}
    enumerable_indices = []
    
    for i, hole in enumerate(holes):
        hole_id = hole.get('hole_id')
        if hole_id:
            # Use line numbers based on actual hole positions in hole_version.lean
            # hole_1 at line 7, hole_2 at line 9, hole_3 at line 10
            line_positions = [7, 9, 10]
            line = line_positions[i] if i < len(line_positions) else 6 + i * 2
            
            sorry_map[i] = SorryInfo(
                hole_id=hole_id,
                line=line,
                column=4  # hole_X starts at column 4
            )
            enumerable_indices.append(i)
    
    # Load hole version content
    hole_file = f"decomposition_results/demo/decomposed/{problem_id}/hole_version.lean"
    with open(hole_file, 'r') as f:
        hole_version = f.read()
    
    return sorry_map, enumerable_indices, hole_version


def test_clean_pipeline_with_real_holes():
    """Test clean pipeline with real holes from demo_ngram_validation"""
    print("🧪 Testing Clean Pipeline with Real Holes")
    print("=" * 60)
    
    problem_id = "demo_ngram_validation"
    
    # Initialize clean pipeline
    pipeline = CleanNgramPipeline(max_depth=2, stop_on_first_success=True)
    print("✅ Clean pipeline initialized")
    
    # Load problem data
    problem = problem_manager.get_problem('demo', problem_id)
    if not problem:
        print(f"❌ Problem {problem_id} not found")
        return False
    
    header_content = problem_manager.get_header_content(problem)
    print(f"📄 Loaded header content: {len(header_content)} chars")
    
    # Load decomposition data
    print("📂 Loading decomposition data...")
    sorry_map, enumerable_indices, hole_version = load_decomposition_data(problem_id)
    
    if not sorry_map:
        print("❌ Failed to load decomposition data")
        return False
    
    print(f"✅ Decomposition data loaded:")
    print(f"   Enumerable indices: {enumerable_indices}")
    print(f"   Holes: {[info.hole_id for info in sorry_map.values()]}")
    print(f"   Hole version length: {len(hole_version)} chars")
    
    # Show hole version content
    print(f"\n📝 Hole version content:")
    print("-" * 40)
    print(hole_version)
    print("-" * 40)
    
    # Test the clean pipeline
    print(f"\n🚀 Running clean pipeline with real holes...")
    
    try:
        results = pipeline.process_problem(
            header_content=header_content,
            clear_version=hole_version,
            enumerable_indices=enumerable_indices,
            sorry_map=sorry_map,
            problem_id=problem_id
        )
        
        print(f"\n📊 Clean Pipeline Results:")
        print(f"   Successful tactics: {len(results.get('successful_tactics', {}))}")
        print(f"   N-gram results: {len(results.get('ngram_results', {}))}")
        
        # Show successful tactics
        successful_tactics = results.get('successful_tactics', {})
        if successful_tactics:
            print(f"\n✅ Successful Tactics Found:")
            for hole_id, tactic in successful_tactics.items():
                print(f"   {hole_id}: {tactic}")
        else:
            print(f"\n⚠️  No successful tactics found")
        
        # Show detailed results for each hole
        ngram_results = results.get('ngram_results', {})
        if ngram_results:
            print(f"\n📈 Detailed N-gram Results:")
            for hole_id, result in ngram_results.items():
                successful_paths = result.get('successful_paths', [])
                total_nodes = result.get('total_nodes', 0)
                search_time = result.get('search_time_seconds', 0.0)
                
                print(f"   {hole_id}:")
                print(f"     Successful paths: {len(successful_paths)}")
                print(f"     Total nodes: {total_nodes}")
                print(f"     Search time: {search_time:.2f}s")
                
                if successful_paths:
                    print(f"     Paths found:")
                    for i, path in enumerate(successful_paths[:3]):  # Show first 3
                        print(f"       {i+1}: {' -> '.join(path)}")
                    if len(successful_paths) > 3:
                        print(f"       ... and {len(successful_paths)-3} more")
        
        # Show statistics
        stats = results.get('stats', {})
        if stats:
            print(f"\n📈 Performance Statistics:")
            print(f"   Total time: {stats.get('total_time', 0):.2f}s")
            print(f"   Pickle time: {stats.get('pickle_time', 0):.2f}s")
            print(f"   Processing time: {stats.get('processing_time', 0):.2f}s")
            print(f"   Holes processed: {stats.get('holes_processed', 0)}")
            print(f"   Successes: {stats.get('successes', 0)}")
            print(f"   Errors: {stats.get('errors', 0)}")
        
        print(f"\n🎉 Clean pipeline with real holes test completed!")
        
        # Determine success
        has_successes = len(successful_tactics) > 0
        no_errors = stats.get('errors', 0) == 0
        
        if has_successes and no_errors:
            print(f"✅ TEST PASSED - Found solutions and no errors!")
            return True
        elif no_errors:
            print(f"⚠️  TEST PARTIAL - No errors but no solutions found")
            return True
        else:
            print(f"❌ TEST FAILED - Errors occurred during processing")
            return False
        
    except Exception as e:
        print(f"\n❌ Test failed with error: {e}")
        import traceback
        traceback.print_exc()
        return False


if __name__ == "__main__":
    success = test_clean_pipeline_with_real_holes()
    print(f"\n{'🎉 SUCCESS!' if success else '❌ FAILED!'}")
    sys.exit(0 if success else 1)