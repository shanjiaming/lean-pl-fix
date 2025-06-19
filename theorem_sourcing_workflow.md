# Workflow for Generating Related Theorems

This document outlines the two-step automated workflow for generating a list of relevant theorems for a given Lean problem. This process is essential for providing context to other tools that may need to reason about or solve the proof.

The workflow consists of two main scripts:
1.  `collectpath.py`: Dynamically finds the source module for every identifier in a problem file.
2.  `static_theorem_filter.py`: Statically extracts all theorem and lemma definitions from the modules identified in the first step.

## Step 1: Dynamically Sourcing Module Dependencies

The first step is to run `collectpath.py`. This script analyzes a specific problem, communicates with a live Lean environment to authoritatively determine the origin module for every identifier mentioned in the problem, and saves this mapping to a file.

### Command

To run this script, you only need to specify the dataset and the problem name. The script handles all file paths automatically.

```bash
python collectpath.py --dataset <dataset_name> --problem <problem_name>
```

### Parameters

-   `--dataset`: The name of the dataset containing the problem (e.g., `minif2f`, `demo`).
-   `--problem`: The specific ID or name of the problem.

### Example

To process the `aime_1983_p1` problem from the `minif2f` dataset:

```bash
python collectpath.py --dataset minif2f --problem aime_1983_p1
```

### Output

This command will automatically create a file named `identifier_to_module_map.json` inside the problem's directory: `decomposition_results/<dataset_name>/decomposed/<problem_name>/`.

---

## Step 2: Statically Extracting Related Theorems

The second step is to run `static_theorem_filter.py`. This script uses the output from Step 1 to perform its task. It automatically locates the `identifier_to_module_map.json` file, reads the list of relevant modules, and scans those modules to extract every defined theorem and lemma.

### Command

The command structure is identical to the first step, promoting ease of use and consistency.

```bash
python static_theorem_filter.py --dataset <dataset_name> --problem <problem_name>
```

### Parameters

-   `--dataset`: The name of the dataset.
-   `--problem`: The specific ID or name of the problem.

### Example

To process the same `aime_1983_p1` problem from the `minif2f` dataset:

```bash
python static_theorem_filter.py --dataset minif2f --problem aime_1983_p1
```

### Output

This command reads the `identifier_to_module_map.json` file from the problem's directory and creates the final output file, `related_theorems.json`, in the **same directory**. This file contains a simple JSON list of all relevant theorem names. 