import json
import os
import argparse
import re
import glob # Added for directory processing
from pathlib import Path # Added for path manipulation

def read_theorems_from_json(json_path):
    """Reads the list of theorems from the specified JSON file."""
    try:
        with open(json_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
        # Assuming the key for the theorem list is "theorems"
        theorems = data.get("theorems", [])
        if not isinstance(theorems, list):
            print(f"Error: 'theorems' key in {json_path} is not a list.")
            return None
        print(f"Read {len(theorems)} theorems from {json_path}")
        return theorems
    except FileNotFoundError:
        print(f"Error: Input JSON file not found at {json_path}")
        return None
    except json.JSONDecodeError:
        print(f"Error: Could not decode JSON from {json_path}")
        return None
    except Exception as e:
        print(f"Error reading JSON file {json_path}: {e}")
        return None

def read_tyrell_content(tyrell_path):
    """Reads the content of the original Tyrell file."""
    try:
        with open(tyrell_path, 'r', encoding='utf-8') as f:
            return f.read()
    except FileNotFoundError:
        print(f"Error: Tyrell file not found at {tyrell_path}")
        return None
    except Exception as e:
        print(f"Error reading Tyrell file {tyrell_path}: {e}")
        return None

def format_theorems_for_tyrell(theorems):
    """Formats the list of theorems for the Tyrell enum block."""
    if not theorems:
        return "" # Return empty string if no theorems
    # Format each theorem name in double quotes
    formatted_theorems = [f'    "{theorem}"' for theorem in theorems]
    # Join with commas and newlines for readability
    return ",\n".join(formatted_theorems)

def update_tyrell_file(original_content, formatted_theorems):
    """Replaces the enum Theorem block in the Tyrell content."""
    # Find the start and end of the enum Theorem block
    # Regex to find 'enum Theorem {' up to the closing '}'
    # DOTALL allows . to match newlines
    # Non-greedy match .*? to find the *first* closing brace
    pattern = re.compile(r"(enum\s+Theorem\s*\{)(.*?)(\})", re.DOTALL | re.MULTILINE)
    match = pattern.search(original_content)
    
    if not match:
        print("Error: Could not find 'enum Theorem { ... }' block in the Tyrell file.")
        return None
        
    start_block = match.group(1) # "enum Theorem {"
    end_block = match.group(3)   # "}"
    
    # Construct the new block content
    new_block_content = f"\n{formatted_theorems}\n"
    
    # Replace the old content with the new content
    # A more robust replacement using the match object
    updated_content = original_content[:match.start()] + start_block + new_block_content + end_block + original_content[match.end():]
    
    return updated_content

def save_updated_tyrell(content, output_path):
    """Saves the updated content to the specified output file."""
    try:
        output_dir = os.path.dirname(output_path)
        if output_dir:
            os.makedirs(output_dir, exist_ok=True)
            
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"Successfully saved updated Tyrell file to {output_path}")
    except Exception as e:
        print(f"Error saving updated Tyrell file to {output_path}: {e}")

def main():
    parser = argparse.ArgumentParser(description='Update the enum Theorem block in a Tyrell file for multiple JSON inputs.')
    parser.add_argument('--json-input-dir', required=True, help='Directory containing input JSON files.')
    parser.add_argument('--tyrell-input', required=True, help='Path to the original Tyrell file (template).')
    parser.add_argument('--tyrell-output-dir', required=True, help='Directory to save the updated Tyrell files.')
    args = parser.parse_args()

    # 1. Read the original Tyrell template content once
    print(f"Reading Tyrell template file: {args.tyrell_input}")
    original_tyrell_content = read_tyrell_content(args.tyrell_input)
    if original_tyrell_content is None:
        return # Error message already printed

    # 2. Find all JSON files in the input directory
    json_files = sorted(glob.glob(os.path.join(args.json_input_dir, '*.json')))
    if not json_files:
        print(f"No JSON files found in directory: {args.json_input_dir}")
        return
        
    print(f"Found {len(json_files)} JSON files to process.")
    processed_count = 0
    failed_count = 0

    # 3. Process each JSON file
    for json_path in json_files:
        print(f"\nProcessing JSON file: {json_path}")
        theorems = read_theorems_from_json(json_path)
        if theorems is None:
            print(f"Skipping file {json_path} due to read error.")
            failed_count += 1
            continue

        # Format theorems
        formatted_theorems_str = format_theorems_for_tyrell(theorems)

        # Update Tyrell content using the original template
        updated_tyrell_content = update_tyrell_file(original_tyrell_content, formatted_theorems_str)
        if updated_tyrell_content is None:
            print(f"Skipping file {json_path} due to update error.")
            failed_count += 1
            continue
            
        # Construct output path
        json_filename_stem = Path(json_path).stem
        output_filename = f"{json_filename_stem}.tyrell"
        output_path = os.path.join(args.tyrell_output_dir, output_filename)
        
        # Save updated file
        save_updated_tyrell(updated_tyrell_content, output_path)
        processed_count += 1

    print(f"\nBatch processing complete.")
    print(f"Successfully processed: {processed_count} files.")
    print(f"Failed/Skipped: {failed_count} files.")

if __name__ == "__main__":
    main() 