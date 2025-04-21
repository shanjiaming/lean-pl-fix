python extract_have.py ./minif2f/lean_code ./minif2f/have_theorems
python collectpath.py --dir ./minif2f/lean_code --output-dir ./minif2f/module_paths_output
python static_theorem_filter.py --input-dir ./minif2f/module_paths_output --output-dir minif2f/static_filtered_theorems_output
python update_tyrell_theorems.py --json-input-dir minif2f/static_filtered_theorems_output --tyrell-input semantic/lean.tyrell --tyrell-output-dir minif2f/tyrell_batch_output
