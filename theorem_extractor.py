import re
import os
import sys
import json

def extract_theorems_from_module(module_path):
    """
    Extract all theorem names from a given module path.
    
    Args:
        module_path: A string in the format "Mathlib.Algebra.Group.Basic"
    
    Returns:
        A list of theorem names defined in the module
    """
    # Convert module path to file path
    file_path = os.path.join("~/miniconda3/lib/python3.13/site-packages/lean_interact/cache/tmp_projects/v4.21.0-rc3/1e05fd82f2c4fc489117f059ac17237437a6dbc201ad266e76e4f63abf7f4e88/.lake/packages/mathlib", 
                            module_path.replace(".", "/") + ".lean")
    
    # Check if file exists
    if not os.path.exists(file_path):
        print(f"File not found: {file_path}")
        return []
    
    # Read the file content
    with open(file_path, 'r') as file:
        content = file.read()
    
    # Extract all theorem declarations
    theorems = []
    
    # Function to extract names from various definition patterns
    def extract_names(pattern_type, content):
        names = []
        # Pattern for declarations with regular names, backticked names, and possibly prefixed with @
        pattern = fr'{pattern_type}\s+((?:@?[a-zA-Z0-9_]+|`[^`]+`))(?!\s*by)'
        
        matches = re.finditer(pattern, content)
        for match in matches:
            name_part = match.group(1).strip()
            # Remove backticks if present
            if name_part.startswith('`') and name_part.endswith('`'):
                name_part = name_part[1:-1]
            # Remove @ if present
            if name_part.startswith('@'):
                name_part = name_part[1:]
            names.append(name_part)
        
        return names
    
    # Extract different types of declarations
    theorems.extend(extract_names('theorem', content))
    theorems.extend(extract_names('lemma', content))
    
    # Also check for instance declarations that define theorems
    instance_pattern = r'instance\s+(?:\[[^\]]+\]\s+)?:\s+([a-zA-Z0-9_.]+)'
    instance_matches = re.finditer(instance_pattern, content)
    
    for match in instance_matches:
        name_part = match.group(1).strip()
        if '.' in name_part:  # It's likely a qualified name, so take the last part
            name_part = name_part.split('.')[-1]
        theorems.append(name_part)
    
    # Remove duplicates
    return list(set(theorems))

def process_module_paths_from_file(file_path):
    """
    Process a file containing module paths (one per line) and extract theorems from each.
    
    Args:
        file_path: Path to the file containing module paths
    
    Returns:
        A dictionary mapping module paths to their theorems and a set of all theorems
    """
    all_theorems = set()
    module_theorems = {}
    
    with open(file_path, 'r') as file:
        module_paths = [line.strip() for line in file if line.strip()]
    
    for module_path in module_paths:
        print(f"Processing {module_path}...")
        theorems = extract_theorems_from_module(module_path)
        module_theorems[module_path] = theorems
        all_theorems.update(theorems)
    
    return module_theorems, all_theorems

def save_results_to_file(module_theorems, all_theorems, output_file):
    """
    Save the results to a JSON file.
    
    Args:
        module_theorems: Dictionary mapping module paths to their theorems
        all_theorems: Set of all theorems
        output_file: Path to the output file
    """
    # Convert set to list for JSON serialization
    results = {
        "module_theorems": {k: sorted(v) for k, v in module_theorems.items()},
        "all_theorems": sorted(list(all_theorems))
    }
    
    with open(output_file, 'w') as file:
        json.dump(results, file, indent=2)
    
    print(f"Results saved to {output_file}")

if __name__ == "__main__":
    # Parse command line arguments
    input_file = 'collectpath2'  # Default input file
    output_file = None  # Default: don't save to file
    
    # Process arguments
    i = 1
    while i < len(sys.argv):
        if sys.argv[i] == '-o' or sys.argv[i] == '--output':
            if i + 1 < len(sys.argv):
                output_file = sys.argv[i + 1]
                i += 2
            else:
                print("Error: Missing output file path")
                sys.exit(1)
        else:
            # Assume it's the input file
            input_file = sys.argv[i]
            i += 1
    
    # Check if the input file exists
    if not os.path.exists(input_file):
        print(f"Input file not found: {input_file}")
        sys.exit(1)
    
    # Process module paths from the file
    module_theorems, all_theorems = process_module_paths_from_file(input_file)
    
    # Print results for each module
    for module_path, theorems in module_theorems.items():
        print(f"\nTheorems found in {module_path}:")
        for theorem in sorted(theorems):
            print(f"  {theorem}")
        print(f"Total: {len(theorems)} theorems")
    
    # Print combined results
    print("\n============ COMBINED RESULTS ============")
    print(f"Total unique theorems across all modules: {len(all_theorems)}")
    
    # Print all theorems
    print("\nAll theorems:")
    for theorem in sorted(all_theorems):
        print(f"  {theorem}")
    
    # Save results to file if requested
    if output_file:
        save_results_to_file(module_theorems, all_theorems, output_file)
    
    # Example of how to use the function for multiple modules
    if False:  # Disabled for now
        test_modules = [
            "Mathlib.Algebra.Group.Basic",
            "Mathlib.Algebra.Group.Defs",
            "Mathlib.Algebra.Ring.Defs"
        ]
        
        for module in test_modules:
            print(f"\nProcessing {module}...")
            theorems = extract_theorems_from_module(module)
            print(f"Found {len(theorems)} theorems") 