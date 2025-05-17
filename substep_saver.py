import os
from decompose_solver import solve_theorem, run_with_header_env

def make_step_saver(outdir):
    os.makedirs(outdir, exist_ok=True)
    step_counter = {"idx": 0}
    failed_steps = []

    def fix_single_proof(proof_framework):
        step_counter["idx"] += 1
        idx = step_counter["idx"]
        step_path = os.path.join(outdir, f"step{idx}.lean")
        with open(step_path, "w") as f:
            f.write(proof_framework)
        run_result = run_with_header_env(proof_framework)
        error_messages = [m.data for m in getattr(run_result, 'messages', []) if m.severity == "error"]
        if error_messages:
            failed_steps.append(f"step{idx}")
        return proof_framework

    return fix_single_proof, failed_steps

def process_lean_file(filepath, outdir):
    if os.path.exists(outdir):
        return
    with open(filepath, "r") as f:
        content = f.read()
    # if content > 500 lines, skip
    if len(content.split("\n")) > 500:
        return
    fix_single_proof, failed_steps = make_step_saver(outdir)
    solve_theorem(content, fix_single_proof)
    if failed_steps:
        with open(os.path.join(outdir, "failed_steps.txt"), "w") as f:
            f.write("\n".join(failed_steps))
        print(f"In {filepath}")
        print(f"Failed steps: {failed_steps}")
        # log to failed_files.txt
        with open("failed_files.txt", "a") as f:
            f.write(f"{filepath}\n")
        # exit()

def process_folder(folder):
    for filename in os.listdir(folder):
        if filename.endswith(".lean"):# and "algebra_absxm1pabsxpabsxp1eqxp2_0leqxleq1" in filename:
            name = filename[:-5]
            outdir = os.path.join(folder, name)
            process_lean_file(os.path.join(folder, filename), outdir)

def main():
    process_folder("minif2f-dspv2/test_passed")
    process_folder("minif2f-dspv2/test_failed")

if __name__ == "__main__":
    main()