import os
from decompose_solver import solve_theorem, run_with_header_env, unified_env
from unified_problem_manager import problem_manager, Problem

def process_lean_file_decompose(problem: Problem, outpath: str):
    """Process a problem to create decomposed version using unified system"""
    # Get content using unified system
    header_content = problem_manager.get_header_content(problem) 
    problem_content = problem_manager.get_problem_content(problem)
    
    run_result = unified_env.run_with_header(header_content, problem_content, all_tactics=True)
    
    # Build decomposed content
    decomposed_lines = []
    
    # Add header
    decomposed_lines.append(header_content)
    decomposed_lines.append("")
    
    # Process problem content with tactics
    problem_lines = problem_content.split('\n')
    
    for i, line in enumerate(problem_lines):
        decomposed_lines.append(line)
        
        # Add tactics that occur after this line
        for tactic in run_result.tactics:
            if tactic.start_pos.line == i + 1:  # Line numbers are 1-indexed
                tactic_text = tactic.tactic.strip()
                if tactic_text and not tactic_text.startswith('--'):
                    decomposed_lines.append(f"  -- Tactic: {tactic_text}")
                    if hasattr(tactic, 'goal_before'):
                        decomposed_lines.append(f"  -- Goal before: {tactic.goal_before}")
                    if hasattr(tactic, 'goal_after'):
                        decomposed_lines.append(f"  -- Goal after: {tactic.goal_after}")
    
    content = '\n'.join(decomposed_lines)
    
    # Save the content to the output path
    with open(outpath, "w") as f:
        f.write(content)


def process_legacy_file_decompose(filepath, outpath):
    """Legacy function for processing individual files (backward compatibility)"""
    with open(filepath, "r") as f:
        content = f.read()
    
    run_result = run_with_header_env(content, all_tactics=True)
    
    # Build decomposed content with tactics information
    lines = content.split('\n')
    decomposed_lines = []
    
    for i, line in enumerate(lines):
        decomposed_lines.append(line)
        
        # Add tactics that occur after this line
        for tactic in run_result.tactics:
            if tactic.start_pos.line == i + 1:  # Line numbers are 1-indexed
                tactic_text = tactic.tactic.strip()
                if tactic_text and not tactic_text.startswith('--'):
                    decomposed_lines.append(f"  -- Tactic: {tactic_text}")
                    if hasattr(tactic, 'goal_before'):
                        decomposed_lines.append(f"  -- Goal before: {tactic.goal_before}")
                    if hasattr(tactic, 'goal_after'):
                        decomposed_lines.append(f"  -- Goal after: {tactic.goal_after}")
    
    content = '\n'.join(decomposed_lines)
    
    # Save the content to the output path
    with open(outpath, "w") as f:
        f.write(content)


def generate_decomposed_for_dataset(dataset_name: str, output_base_dir: str = "unified_problems"):
    """Generate decomposed versions for all problems in a dataset"""
    problems = problem_manager.list_problems(dataset_name)
    if not problems:
        print(f"No problems found in dataset: {dataset_name}")
        return
    
    print(f"Generating decomposed versions for {len(problems)} problems in {dataset_name}")
    
    for problem in problems:
        try:
            # Create decomposed file in the problem's decomposed directory
            decomposed_filename = f"{problem.problem_id.replace('/', '_')}_decomposed.lean"
            decomposed_filepath = os.path.join(problem.decomposed_dir, decomposed_filename)
            
            os.makedirs(os.path.dirname(decomposed_filepath), exist_ok=True)
            
            process_lean_file_decompose(problem, decomposed_filepath)
            print(f"Generated decomposed version for {problem.dataset}/{problem.problem_id}")
            
        except Exception as e:
            print(f"Failed to generate decomposed version for {problem.dataset}/{problem.problem_id}: {e}")


def generate_decomposed_for_all():
    """Generate decomposed versions for all problems in the unified system"""
    datasets = problem_manager.list_datasets()
    print(f"Generating decomposed versions for all datasets: {datasets}")
    
    for dataset in datasets:
        generate_decomposed_for_dataset(dataset)


def legacy_process():
    """Legacy processing for backward compatibility"""
    # Define base directories
    input_base_dir = "minif2f-dspv2/test_passed"
    output_base_dir = "minif2f-dspv2/decomposed/test_passed"

    # Iterate over items in the input directory
    for foldername in os.listdir(input_base_dir):
        input_filepath = os.path.join(input_base_dir, foldername)
        with open("failed_files.txt", "r") as f:
            failed_files = f.readlines()
        failed_files = [line.strip() for line in failed_files]
        # Process only if it's a .lean file
        if os.path.isdir(input_filepath):
            if input_filepath + '.lean' in failed_files:
                continue
            # Construct the corresponding output filepath
            # e.g., input: minif2f-dspv2/test_passed/example.lean
            #       output: minif2f-dspv2/decomposed/test_passed/example.lean

            for filename in os.listdir(input_filepath):
                input_filepath = os.path.join(input_base_dir, foldername, filename)
                output_filepath = os.path.join(output_base_dir, foldername, filename)
                os.makedirs(os.path.dirname(output_filepath), exist_ok=True)
                process_legacy_file_decompose(input_filepath, output_filepath)


if __name__ == "__main__":
    import sys
    
    if len(sys.argv) > 1:
        command = sys.argv[1]
        if command == "legacy":
            legacy_process()
        elif command == "all":
            generate_decomposed_for_all()
        elif command.startswith("dataset:"):
            dataset_name = command.split(":")[1]
            generate_decomposed_for_dataset(dataset_name)
        else:
            print("Usage: python substep_saver_decompose.py [legacy|all|dataset:NAME]")
    else:
        # Default to generate decomposed for all
        generate_decomposed_for_all() 