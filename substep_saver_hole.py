import os
from decompose_solver import solve_theorem, run_with_header_env, unified_env
from unified_problem_manager import problem_manager, Problem

def pos2idx(content, pos):
    idx = 0
    for i, line in enumerate(content.split("\n")):
        if i == pos.line - 1:
            idx += pos.column
            return idx
        idx += len(line) + 1
    breakpoint()
    assert False


def process_lean_file_holeformat(problem: Problem, outpath: str):
    """Process a problem to create hole format version"""
    # Get content using unified system
    full_content = problem_manager.get_full_content(problem)
    header_content = problem_manager.get_header_content(problem) 
    problem_content = problem_manager.get_problem_content(problem)
    
    current_location = None
    run_result = unified_env.run_with_header(header_content, problem_content, all_tactics=True)
    remove_tactic_pos = []
    for tactic in run_result.tactics:
        tactictxt = tactic.tactic
        # print("tactictxt", tactictxt)
        # breakpoint()
        tacticname = tactictxt.strip().split()[0]
        if current_location is not None and current_location >= tactic.start_pos:
            continue
        current_location = tactic.end_pos
        if tacticname != "have":
            remove_tactic_pos.append((tactic.start_pos, tactic.end_pos))
    
    content = problem_content
    for reverse_remove in reversed(remove_tactic_pos):
        # start = pos2idx(content, reverse_remove[0])
        # end = pos2idx(content, reverse_remove[1])
        # content = content[:start] + "/-" + content[start:end] + "-/" + content[end:]
        # for all line between start and end, 
        contentlines = content.split("\n")
        for i in range(reverse_remove[0].line-1, reverse_remove[1].line):
            if i == 0:
                contentlines[i] = contentlines[i].replace(":=by ", ":=by -- ")
                contentlines[i] = contentlines[i].replace(" by ", " by -- ")
            if i != 0:
                contentlines[i] = "  --" + contentlines[i]
        content = "\n".join(contentlines)
    
    # Add hole macro to header
    enhanced_header = header_content + "\nmacro \"hole\" : tactic => `(tactic| admit)"
    content = enhanced_header + "\n\n" + content + "\n  hole"
    
    # save the content to the outdir
    with open(outpath, "w") as f:
        f.write(content)


def process_legacy_file_holeformat(filepath, outpath):
    """Legacy function for processing individual files (backward compatibility)"""
    with open(filepath, "r") as f:
        content = f.read()
    current_location = None
    run_result = run_with_header_env(content, all_tactics=True)
    remove_tactic_pos = []
    for tactic in run_result.tactics:
        tactictxt = tactic.tactic
        # print("tactictxt", tactictxt)
        # breakpoint()
        tacticname = tactictxt.strip().split()[0]
        if current_location is not None and current_location >= tactic.start_pos:
            continue
        current_location = tactic.end_pos
        if tacticname != "have":
            remove_tactic_pos.append((tactic.start_pos, tactic.end_pos))
    for reverse_remove in reversed(remove_tactic_pos):
        # start = pos2idx(content, reverse_remove[0])
        # end = pos2idx(content, reverse_remove[1])
        # content = content[:start] + "/-" + content[start:end] + "-/" + content[end:]
        # for all line between start and end, 
        contentlines = content.split("\n")
        for i in range(reverse_remove[0].line-1, reverse_remove[1].line):
            if i == 0:
                contentlines[i] = contentlines[i].replace(":=by ", ":=by -- ")
                contentlines[i] = contentlines[i].replace(" by ", " by -- ")
            if i != 0:
                contentlines[i] = "  --" + contentlines[i]
        content = "\n".join(contentlines)
    content = """import Mathlib
import Aesop
set_option maxHeartbeats 0
open BigOperators Real Nat Topology Rat
macro "hole" : tactic => `(tactic| admit)
""" + content + "\n  hole"
    # save the content to the outdir
    with open(outpath, "w") as f:
        f.write(content)


def generate_holes_for_dataset(dataset_name: str, output_base_dir: str = "unified_problems"):
    """Generate hole versions for all problems in a dataset"""
    problems = problem_manager.list_problems(dataset_name)
    if not problems:
        print(f"No problems found in dataset: {dataset_name}")
        return
    
    print(f"Generating hole versions for {len(problems)} problems in {dataset_name}")
    
    for problem in problems:
        try:
            # Create hole file in the problem's hole directory
            hole_filename = f"{problem.problem_id.replace('/', '_')}_hole.lean"
            hole_filepath = os.path.join(problem.hole_dir, hole_filename)
            
            os.makedirs(os.path.dirname(hole_filepath), exist_ok=True)
            
            process_lean_file_holeformat(problem, hole_filepath)
            print(f"Generated hole version for {problem.dataset}/{problem.problem_id}")
            
        except Exception as e:
            print(f"Failed to generate hole version for {problem.dataset}/{problem.problem_id}: {e}")


def generate_holes_for_all():
    """Generate hole versions for all problems in the unified system"""
    datasets = problem_manager.list_datasets()
    print(f"Generating hole versions for all datasets: {datasets}")
    
    for dataset in datasets:
        generate_holes_for_dataset(dataset)


def legacy_process():
    """Legacy processing for backward compatibility"""
    # Define base directories
    input_base_dir = "minif2f-dspv2/test_passed"
    output_base_dir = "minif2f-dspv2/hole/test_passed"

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
            #       output: minif2f-dspv2/hole/test_passed/example.lean

            for filename in os.listdir(input_filepath):
                input_filepath = os.path.join(input_base_dir, foldername, filename)
                output_filepath = os.path.join(output_base_dir, foldername, filename)
                os.makedirs(os.path.dirname(output_filepath), exist_ok=True)
                process_legacy_file_holeformat(input_filepath, output_filepath)


if __name__ == "__main__":
    import sys
    
    if len(sys.argv) > 1:
        command = sys.argv[1]
        if command == "legacy":
            legacy_process()
        elif command == "all":
            generate_holes_for_all()
        elif command.startswith("dataset:"):
            dataset_name = command.split(":")[1]
            generate_holes_for_dataset(dataset_name)
        else:
            print("Usage: python substep_saver_hole.py [legacy|all|dataset:NAME]")
    else:
        # Default to generate holes for all
        generate_holes_for_all()