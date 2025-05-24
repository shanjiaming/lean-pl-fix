#!/bin/bash

# Clean up previous results to avoid interference
echo "Cleaning up previous results..."
rm -rf ./minif2f/static_theorems
rm -rf ./minif2f/static_modules
rm -rf ./minif2f/static_filtered_theorems_output
rm -rf ./minif2f/static_tyrell_output
rm -rf ./minif2f/have_tyrell_output
rm -rf ./minif2f/module_paths_output
echo "Clean up complete."

# First generate have theorems extraction
echo "Step 1: Extracting have theorems..."
python extract_have.py ./minif2f/lean_code ./minif2f/have_theorems
echo "Have theorems extraction complete."

# Second collect module paths from lean code
echo "Step 2: Collecting module paths..."
python collectpath.py --dir ./minif2f/lean_code --output-dir ./minif2f/module_paths_output
echo "Module paths collection complete."

# Third filter theorems statically
echo "Step 3: Filtering theorems statically..."
python static_theorem_filter.py --input-dir ./minif2f/module_paths_output --output-dir minif2f
echo "Static theorem filtering complete. Results saved in:"
echo "- Static theorems in minif2f/static_theorems"
echo "- Static modules in minif2f/static_modules"
echo "- Combined data in minif2f/static_filtered_theorems_output"

# Fourth generate Tyrell files from static filtered theorems
echo "Step 4: Generating Tyrell files from static filtered theorems..."
python update_tyrell_theorems.py --input-dir minif2f/static_filtered_theorems_output --tyrell-input semantic/lean.tyrell --tyrell-output-dir minif2f/static_tyrell_output
echo "Static Tyrell files generation complete. Results saved in minif2f/static_tyrell_output"

# Fifth generate Tyrell files from have theorems
echo "Step 5: Generating Tyrell files from have theorems..."
python update_tyrell_theorems.py --input-dir minif2f/have_theorems --tyrell-input semantic/lean.tyrell --tyrell-output-dir minif2f/have_tyrell_output
echo "Have Tyrell files generation complete. Results saved in minif2f/have_tyrell_output"

echo "All Tyrell generation tasks completed successfully."
