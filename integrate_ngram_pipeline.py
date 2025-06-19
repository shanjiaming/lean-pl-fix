import os
import json
import argparse
import time
from typing import Dict, List, Optional, Tuple

# Import necessary components
from unified_problem_manager import problem_manager, Problem
from proofstep_integration import ProofStepIntegrator, SorryInfo # Import SorryInfo for type hinting
from ngram_pickle_pipeline import CleanNgramPipeline

def main():
    parser = argparse.ArgumentParser(description="Integrate Clean N-gram Pipeline with Unified Problem Manager datasets.")
    parser.add_argument("--dataset", type=str, default="demo", help="Name of the dataset to process (e.g., 'demo', 'minif2f').")
    parser.add_argument("--limit", type=int, default=None, help="Limit the number of problems to process from the dataset.")
    parser.add_argument("--problem_id", type=str, default=None, help="Process a specific problem by its ID.")
    parser.add_argument("--max_depth", type=int, default=2, help="Max search depth for the N-gram pipeline.")
    parser.add_argument("--stop_on_first_success", type=bool, default=True, help="Stop search on first success.")
    
    args = parser.parse_args()

    print(f"🚀 Starting integration for dataset: {args.dataset}")
    if args.problem_id:
        print(f"🎯 Processing specific problem: {args.problem_id}")
    if args.limit:
        print(f"📊 Limiting to {args.limit} problems")

    # Initialize components
    # problem_manager is already a global instance from unified_problem_manager.py

    problems_to_process: List[Problem] = []
    if args.problem_id:
        problem = problem_manager.get_problem(args.dataset, args.problem_id)
        if problem:
            problems_to_process.append(problem)
        else:
            print(f"❌ Problem {args.problem_id} not found in dataset {args.dataset}.")
            return
    else:
        all_problems = problem_manager.list_problems(dataset=args.dataset)
        problems_to_process = all_problems[:args.limit] if args.limit else all_problems

    if not problems_to_process:
        print(f"⚠️ No problems found for dataset {args.dataset} (or specific problem not found).")
        return

    total_problems = len(problems_to_process)
    processed_count = 0
    successful_count = 0

    for problem in problems_to_process:
        processed_count += 1
        print(f"\n--- Processing problem {processed_count}/{total_problems}: {problem.dataset}/{problem.problem_id} ---")
        
        try:
            # 1. Load header and hole_version content
            header_content = problem_manager.get_header_content(problem)
            
            # Construct the path to hole_version.lean based on decomposition_results structure
            # This assumes decompose_hole_merge_pipeline has been run and generated these files
            decomposition_dir = os.path.join("decomposition_results", problem.dataset, "decomposed", problem.problem_id)
            hole_version_path = os.path.join(decomposition_dir, "hole_version.lean")
            
            if not os.path.exists(hole_version_path):
                print(f"❌ Error: {hole_version_path} not found. Please run decompose_hole_merge_pipeline.py first.")
                continue

            with open(hole_version_path, 'r', encoding='utf-8') as f:
                hole_version_content = f.read()

            # 2. Initialize ProofStepIntegrator and get sorry_map, enumerable_indices
            # The ProofStepIntegrator needs the header for its internal Lean server setup
            proofstep_integrator = ProofStepIntegrator(header_content=header_content)
            session = proofstep_integrator.initialize_session(header_content, hole_version_content)
            
            sorry_map: Dict[int, SorryInfo] = session.sorry_map
            enumerable_indices: List[int] = session.enumerable_indices

            print(f"  🔍 Found {len(sorry_map)} total sorries/holes.")
            print(f"  📊 {len(enumerable_indices)} enumerable holes.")

            # 3. Run CleanNgramPipeline
            ngram_pipeline = CleanNgramPipeline(
                max_depth=args.max_depth,
                stop_on_first_success=args.stop_on_first_success
            )

            results = ngram_pipeline.process_problem(
                header_content=header_content,
                clear_version=hole_version_content, # This is the content with macros, which the pipeline expects
                enumerable_indices=enumerable_indices,
                sorry_map=sorry_map,
                problem_id=problem.problem_id
            )
            
            # Add a preliminary 'complete_solve_success' based on whether all holes were solved
            if results and 'successful_tactics' in results:
                all_holes_solved = len(results['successful_tactics']) >= len(enumerable_indices)
                results['complete_solve_success'] = all_holes_solved
            elif results:
                results['complete_solve_success'] = False

            # Save results to a JSON file
            output_results_dir = os.path.join("decomposition_results", problem.dataset, "decomposed", problem.problem_id)
            os.makedirs(output_results_dir, exist_ok=True)
            output_file_path = os.path.join(output_results_dir, "ngram_search_results.json")
            
            with open(output_file_path, 'w', encoding='utf-8') as f:
                json.dump(results, f, indent=2, ensure_ascii=False)
            print(f"💾 N-gram search results saved to {output_file_path}")

            if results and results.get("complete_solve_success", False):
                print(f"🎉 Successfully processed {problem.problem_id}")
                successful_count += 1
                print(f"  Final tactics: {results.get('successful_tactics')}")
            else:
                print(f"❌ Failed to process {problem.problem_id}")
                if results:
                    print(f"  Reason: {results.get('error_message', 'Unknown error')}")

        except Exception as e:
            print(f"❌ An error occurred while processing {problem.problem_id}: {e}")
            import traceback
            traceback.print_exc() # Print full traceback for debugging
        finally:
            # Ensure Lean server is shut down if it was initialized by ProofStepIntegrator
            # ProofStepIntegrator does not have a direct shutdown method, its LeanServer is managed internally
            # For MinimalLeanProofStepIntegrator, there is shutdown_lean_server(), but not here.
            # We assume it's handled by the overall process or specific classes.
            pass

    print(f"\n=== Processing Summary for {args.dataset} ===")
    print(f"Total problems attempted: {processed_count}")
    print(f"Successfully processed: {successful_count}")
    print(f"Failed to process: {processed_count - successful_count}")
    print("===========================================")

if __name__ == "__main__":
    main() 