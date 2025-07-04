#!/usr/bin/env python3
"""
Run N-gram pipeline on demo dataset
This script actually executes the N-gram processing
"""

import os
import sys
import json
from datetime import datetime
from typing import Optional

# Add project root to path
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

def run_ngram_on_demo_problem(problem_id: Optional[str] = None):
    """Run N-gram pipeline on a specific demo problem"""
    
    try:
        # Import after path setup to avoid Lean initialization issues
        from unified_problem_manager import problem_manager
        
        # Get demo problems
        problems = problem_manager.list_problems("demo")
        if not problems:
            print("❌ No demo problems found")
            return False
        
        # Select problem
        if problem_id:
            selected_problem = None
            for p in problems:
                if p.problem_id == problem_id:
                    selected_problem = p
                    break
            if not selected_problem:
                print(f"❌ Problem '{problem_id}' not found in demo dataset")
                return False
        else:
            # Use first ready problem
            selected_problem = None
            for p in problems:
                decomp_dir = f"decomposition_results/demo/decomposed/{p.problem_id}"
                if os.path.exists(os.path.join(decomp_dir, "decomposition.json")):
                    selected_problem = p
                    break
            
            if not selected_problem:
                print("❌ No ready problems found in demo dataset")
                return False
        
        print(f"🎯 Running N-gram pipeline on: {selected_problem.problem_id}")
        print("=" * 60)
        
        # Check if decomposition exists
        decomp_dir = f"decomposition_results/demo/decomposed/{selected_problem.problem_id}"
        decomp_json = os.path.join(decomp_dir, "decomposition.json")
        hole_version_path = os.path.join(decomp_dir, "hole_version.lean")
        
        if not os.path.exists(decomp_json):
            print(f"❌ Decomposition not found: {decomp_json}")
            print(f"💡 Run: python decompose_hole_merge_pipeline.py problem demo {selected_problem.problem_id}")
            return False
        
        if not os.path.exists(hole_version_path):
            print(f"❌ Hole version not found: {hole_version_path}")
            return False
        
        # Load decomposition data
        with open(decomp_json, 'r') as f:
            decomp_data = json.load(f)
        
        with open(hole_version_path, 'r') as f:
            hole_version_content = f.read()
        
        print(f"📊 Problem info:")
        print(f"   Holes in decomposition: {len(decomp_data.get('holes', []))}")
        print(f"   Hole version size: {len(hole_version_content)} chars")
        
        # Get content
        header_content = problem_manager.get_header_content(selected_problem)
        print(f"   Header content size: {len(header_content)} chars")
        
        # Now run the minimal verification pipeline with ngram
        print(f"\n🚀 Running minimal verification pipeline with N-gram...")
        
        # Use the existing pipeline that includes N-gram
        from minimal_verification_pipeline_ngram import MinimalVerificationPipeline
        
        pipeline = MinimalVerificationPipeline()
        
        start_time = datetime.now()
        result = pipeline.process_problem_with_constraint(selected_problem)
        end_time = datetime.now()
        
        processing_time = (end_time - start_time).total_seconds()
        
        print(f"\n✅ N-gram processing completed in {processing_time:.2f}s")
        
        # Analyze results
        print(f"\n📊 Results Analysis:")
        print(f"   Problem ID: {result.problem_id}")
        print(f"   Verification count: {result.verification_count}/{result.max_verifications}")
        print(f"   Original verification: {'PASS' if result.original_verification_pass else 'FAIL'}")
        print(f"   Hole verification: {'PASS' if result.hole_verification_pass else 'FAIL'}")
        print(f"   Filled verification: {'PASS' if result.filled_verification_pass else 'FAIL'}")
        print(f"   Complete solve success: {'YES' if result.complete_solve_success else 'NO'}")
        print(f"   Constraint satisfied: {'YES' if result.constraint_satisfied else 'NO'}")
        print(f"   Proof state tests: {result.proof_state_tests}")
        print(f"   Processing time: {result.processing_time_seconds:.2f}s")
        
        print(f"\n🎯 Successful tactics:")
        if result.successful_tactics:
            for hole_id, tactic in result.successful_tactics.items():
                print(f"   {hole_id}: {tactic}")
        else:
            print(f"   None found")
        
        print(f"\n🗂️  Tactic mapping:")
        if result.tactic_mapping:
            for hole_id, tactic in result.tactic_mapping.items():
                print(f"   {hole_id}: {tactic}")
        else:
            print(f"   None found")
        
        # Check saved files
        ngram_result_file = os.path.join(decomp_dir, "minimal_verification_ngram.json")
        if os.path.exists(ngram_result_file):
            print(f"\n💾 N-gram results saved to: {ngram_result_file}")
        
        synthesized_file = os.path.join(decomp_dir, "synthesized_proof_ngram.lean")
        if os.path.exists(synthesized_file):
            print(f"💾 Synthesized proof saved to: {synthesized_file}")
            
            # Show a preview of the synthesized proof
            with open(synthesized_file, 'r') as f:
                synthesized_content = f.read()
            
            print(f"\n📄 Synthesized proof preview (first 300 chars):")
            print("-" * 50)
            print(synthesized_content[:300])
            if len(synthesized_content) > 300:
                print("...")
            print("-" * 50)
        
        success = result.constraint_satisfied and result.complete_solve_success
        print(f"\n{'🎉 SUCCESS' if success else '⚠️  PARTIAL SUCCESS' if result.constraint_satisfied else '❌ FAILED'}")
        
        return success
        
    except Exception as e:
        print(f"❌ Error during N-gram processing: {e}")
        import traceback
        traceback.print_exc()
        return False

def main():
    """Main function"""
    print("🧪 N-gram Demo Runner")
    print("=" * 50)
    
    # Check command line arguments
    problem_id = None
    if len(sys.argv) > 1:
        problem_id = sys.argv[1]
        print(f"🎯 Target problem: {problem_id}")
    else:
        print(f"🎯 Using first available demo problem")
    
    print(f"\n💡 Usage: python run_ngram_demo.py [problem_id]")
    print(f"💡 Example: python run_ngram_demo.py demo_complex_p1")
    
    success = run_ngram_on_demo_problem(problem_id)
    
    if success:
        print(f"\n🎉 N-gram demo completed successfully!")
    else:
        print(f"\n❌ N-gram demo failed")
        print(f"\n💡 Troubleshooting:")
        print(f"   - Make sure demo is set up: python migrate_demo.py")
        print(f"   - Run decomposition: python decompose_hole_merge_pipeline.py dataset demo 5")
        print(f"   - Check if Lean server is working")
    
    return success

if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)