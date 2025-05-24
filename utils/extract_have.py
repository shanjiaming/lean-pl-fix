import re
import json
import sys
import os
import glob
from pathlib import Path

def extract_have_theorems(file_path):
    """
    Extract all theorem names that follow 'have' statements in Lean files.
    
    Args:
        file_path (str): Path to the Lean file
        
    Returns:
        list: List of theorem names
    """
    theorems = []
    
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            # Process the file line by line
            for line in file:
                # Regular expression to match "have" at the beginning of a line (after whitespace)
                # and then capture the name until a space, colon, or opening bracket
                match = re.search(r'^\s*have\s+([^\s:\(\[\{]+)', line)
                if match:
                    theorems.append(match.group(1))
            
            # Remove duplicates while preserving order
            seen = set()
            unique_theorems = [theorem for theorem in theorems if not (theorem in seen or seen.add(theorem))]
            theorems = unique_theorems
            
    except Exception as e:
        print(f"Error reading file {file_path}: {e}", file=sys.stderr)
        return []
    
    return theorems

def process_directory(directory_path, output_dir):
    """
    Process all Lean files in a directory and save each file's theorems to a corresponding JSON file.
    Always create a JSON file for each Lean file, even if no theorems are found.
    
    Args:
        directory_path (str): Path to the directory containing Lean files
        output_dir (str): Directory where to save the JSON output files
        
    Returns:
        tuple: (processed_files, total_theorems)
    """
    # Ensure output directory exists
    os.makedirs(output_dir, exist_ok=True)
    
    # Find all .lean files in the directory and its subdirectories
    lean_files = glob.glob(os.path.join(directory_path, "**", "*.lean"), recursive=True)
    processed_files = 0
    total_theorems = 0
    
    for file_path in lean_files:
        theorems = extract_have_theorems(file_path)
        
        # Get the file name and create an output file in the output directory
        file_name = os.path.basename(file_path)
        output_file = os.path.join(output_dir, f"{os.path.splitext(file_name)[0]}.json")
        
        # Save to JSON (even if theorems list is empty)
        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump(theorems, f, ensure_ascii=False, indent=2)
        
        processed_files += 1
        total_theorems += len(theorems)
        print(f"Extracted {len(theorems)} theorems from {file_path} to {output_file}")
    
    return processed_files, total_theorems

def save_to_json(data, output_path):
    """
    Save data to a JSON file.
    
    Args:
        data: Data to save (list or dict)
        output_path (str): Path where to save the JSON file
    """
    try:
        os.makedirs(os.path.dirname(output_path), exist_ok=True)
        with open(output_path, 'w', encoding='utf-8') as f:
            json.dump(data, f, ensure_ascii=False, indent=2)
    except Exception as e:
        print(f"Error saving to {output_path}: {e}", file=sys.stderr)
        sys.exit(1)

def main():
    if len(sys.argv) < 3:
        print("Usage: python extract_have.py <input_path> <output_path>", file=sys.stderr)
        print("  <input_path> can be a single Lean file or a directory", file=sys.stderr)
        print("  <output_path> is a JSON file for single file mode, or a directory for directory mode", file=sys.stderr)
        sys.exit(1)
    
    input_path = sys.argv[1]
    output_path = sys.argv[2]
    
    if os.path.isdir(input_path):
        # Check if output_path is a directory
        if not os.path.isdir(output_path) and os.path.exists(output_path):
            print(f"Error: When processing a directory, output_path must be a directory, not a file", file=sys.stderr)
            sys.exit(1)
        
        # Process directory
        processed_files, total_theorems = process_directory(input_path, output_path)
        print(f"Processed {processed_files} files with a total of {total_theorems} theorems")
    else:
        # Process single file
        theorems = extract_have_theorems(input_path)
        save_to_json(theorems, output_path)
        print(f"Extracted {len(theorems)} theorems to {output_path}")

if __name__ == "__main__":
    main() 