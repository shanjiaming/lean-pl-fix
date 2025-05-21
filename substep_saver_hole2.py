import os
from decompose_solver import solve_theorem, run_with_header_env

def pos2idx(content, pos):
    idx = 0
    for i, line in enumerate(content.split("\n")):
        if i == pos.line - 1:
            idx += pos.column
            return idx
        idx += len(line) + 1
    breakpoint()
    assert False


def process_lean_file_holeformat(filepath, outpath):
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


# Define base directories
# input_base_dir = "minif2f-dspv2/test_passed"
# output_base_dir = "minif2f-dspv2/hole/test_passed"

input_base_dir = "dataset/proverbench_simpleheader_failed"
output_base_dir = "dataset/hole/proverbench_simpleheader_failed"

# Iterate over items in the input directory
for foldername in os.listdir(input_base_dir):
    input_filepath = os.path.join(input_base_dir, foldername)
    # with open("failed_files.txt", "r") as f:
        # failed_files = f.readlines()
    # failed_files = [line.strip() for line in failed_files]
    # Process only if it's a .lean file
    if os.path.isdir(input_filepath):
        # if input_filepath + '.lean' in failed_files:
            # continue
        # Construct the corresponding output filepath
        # e.g., input: minif2f-dspv2/test_passed/example.lean
        #       output: minif2f-dspv2/hole/test_passed/example.lean

        for filename in os.listdir(input_filepath):
            input_filepath = os.path.join(input_base_dir, foldername, filename)
            output_filepath = os.path.join(output_base_dir, foldername, filename)
            os.makedirs(os.path.dirname(output_filepath), exist_ok=True)
            process_lean_file_holeformat(input_filepath, output_filepath)