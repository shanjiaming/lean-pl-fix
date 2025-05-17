from decompose_solver import run_with_header_env, header, solve_theorem

current_file_str = ""

def fix_single_proof(input_content):
    global current_file_str
    current_list = []
    current_location = None
    run_result = run_with_header_env(input_content, all_tactics=True)
    for tactic in run_result.tactics:
        tactictxt = tactic.tactic
        print("tactictxt", tactictxt)
        # breakpoint()
        possible_big_tactic = ["calc", "induction", "cases"]
        tacticname = tactictxt.strip().split()[0]
        if current_location is not None and current_location >= tactic.start_pos:
            continue
        # going to add parameter
        paramlist = []
        if tacticname not in possible_big_tactic:
            if "only" in tactictxt:
                paramlist.append("only")

            if "[" in tactictxt and "at" in tactictxt:
                splitlist = tactictxt.split("at")
                list1_len = splitlist[0].count(",") + 1
                list2_len = splitlist[1].count(",") + 1
                paramlist.append(str(list1_len))
                paramlist.append("@" + str(list2_len))
            elif "[" in tactictxt:
                list1_len = tactictxt.count(",") + 1
                paramlist.append(str(list1_len))
        
        paramstr = "_" + "_".join(paramlist) if paramlist else ""

        current_location = tactic.end_pos
            
        current_list.append(tacticname + paramstr)
    current_file_str += " ".join(current_list) + "\n"
    return input_content


# fix_single_proof_dpv2("""import Mathlib
# import Aesop
# set_option maxHeartbeats 0
# open BigOperators Real Nat Topology Rat
# theorem hh (x_shadow_ x : ℝ) : x + 0 = x:= by 
#   smp""")

# fix_single_proof_dpv2 = lambda x: save_to_file(x, "dpv2_batch_solver.py")

import os
def fix_single_proof_dpv2(proof_framework):
    folder_name = f"zzz_proof_framework"
    os.makedirs(folder_name, exist_ok=True)
    filename = "demo_theorem"
    with open(os.path.join(folder_name, f"{filename}_tactic_collector.txt"), "w") as f:
        f.write(proof_framework)
    return proof_framework


def solve_theorem_dpv2(input_content):
    global current_file_str
    current_file_str = ""
    solve_theorem(input_content, fix_single_proof)
    return current_file_str


def collect_tactics(test_folder, result_folder):
    os.makedirs(result_folder, exist_ok=True)
    # Iterate through all files in test folder
    for filename in os.listdir(test_folder):
        if filename.endswith(".lean"):
            # Read input file
            with open(os.path.join(test_folder, filename), 'r') as f:
                input_content = f.read()
                
            # Run solver and get result
            result = solve_theorem_dpv2(input_content)
            
            # Write result to output file
            result_filename = os.path.splitext(filename)[0] + ".txt"
            with open(os.path.join(result_folder, result_filename), 'w') as f:
                f.write(result)

collect_tactics("minif2f-dspv2/test_passed", "minif2f-dspv2/test_passed_tactics")
collect_tactics("minif2f-dspv2/test_failed", "minif2f-dspv2/test_failed_tactics")