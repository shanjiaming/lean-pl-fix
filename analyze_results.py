import json
import csv
from pathlib import Path
from natsort import natsorted

def analyze_pipeline_results(result_path, suite_name):
    with open(Path(result_path).expanduser(), "r") as f:
        result_json = json.load(f)

    result_json = natsorted(result_json, key=lambda x: x.get("problem_id"))

    header = ["suite", "benchmark", "#steps", "original_verification_pass", "hole_verification_pass", "complete_solve_success"]
    
    output_rows = [header]

    for entry in result_json:
        if entry.get("status") != "success":
            steps = -1
        else:
            steps = entry.get("num_steps", -1)

        row = [
            suite_name,
            entry.get("problem_id", "unknown"),
            steps,
            1 if entry.get("original_verification_pass") else 0,
            1 if entry.get("hole_verification_pass") else 0,
            1 if entry.get("filled_verification_pass") else 0,
        ]
        output_rows.append(row)

    return output_rows

def main():
    suite_name = "minif2f@1"
    folder = "minif2f"
    result_path = f"decomposition_results/{folder}_pipeline_results.json"
    
    rows = analyze_pipeline_results(result_path, suite_name)

    output_filename = 'minif2f_final_analysis.csv'
    with open(output_filename, 'w', newline='') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerows(rows)
    
    print(f"Analysis complete. Results are in {output_filename}")
    for row in rows:
        print(",".join(map(str, row)))

if __name__ == "__main__":
    main() 