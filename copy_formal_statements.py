import os
import shutil

source_base_dir = "unified_problems/proverbench/"
target_base_dir = "decomposition_results/proverbench/decomposed/"

def copy_files():
    """
    Copies formal_statement.lean files from source_base_dir to target_base_dir,
    maintaining the subdirectory structure.
    """
    for root, dirs, files in os.walk(source_base_dir):
        for file in files:
            if file == "formal_statement.lean":
                source_file_path = os.path.join(root, file)
                # Extract the part of the path relative to source_base_dir
                relative_path = os.path.relpath(root, source_base_dir)
                
                target_dir = os.path.join(target_base_dir, relative_path)
                target_file_path = os.path.join(target_dir, file)
                
                # Create target directory if it doesn't exist
                os.makedirs(target_dir, exist_ok=True)
                
                # Copy the file
                shutil.copy2(source_file_path, target_file_path)
                print(f"Copied: {source_file_path}  to  {target_file_path}")

if __name__ == "__main__":
    copy_files()
    print("Finished copying all formal_statement.lean files.") 