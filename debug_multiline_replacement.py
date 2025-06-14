#!/usr/bin/env python3
"""
Debug script to reproduce and fix the multi-line hole replacement issue.
This isolates the core problem without the complexity of the full pipeline.
"""

def test_multiline_replacement():
    """Test case reproducing the putnam_2007_b6 hole_38 issue."""
    
    # Use ACTUAL content from putnam_2007_b6.lean file
    # These are the real lines 91-95 (1-based) from the file
    content_lines = [
        "            have h₂₀ : ((n : ℝ) ^ 2 / 2 + (1 : ℝ) * n : ℝ) * Real.log n + (-(n ^ 2 : ℝ) / 4 : ℝ) ≥ 0 := by",  # Line 91
        "              nlinarith [Real.log_le_sub_one_of_pos (by positivity : 0 < (n : ℝ)), Real.log_le_sub_one_of_pos (by positivity : 0 < (2 : ℝ)),",  # Line 92
        "                Real.log_le_sub_one_of_pos (by positivity : 0 < (n : ℝ))]",  # Line 93
        "            exact h₂₀",  # Line 94
        "          have h₂₁ : Real.exp ((n ^ 2 / 2 + (1 : ℝ) * n : ℝ) * Real.log n + (-(n ^ 2 : ℝ) / 4 : ℝ)) ≥ Real.exp 0 := by"  # Line 95
    ]
    
    print("=== Original Content ===")
    for i, line in enumerate(content_lines):
        print(f"{i+91:2d}: {line}")
    
    # hole_38 coordinates: Start(92, 14) -> End(93, 73)
    # This should replace only the nlinarith call, not the have statement or exact
    hole_id = "hole_38"
    start_line = 92  # 1-based
    start_col = 14
    end_line = 93    # 1-based  
    end_col = 73
    
    # Let's also test what the original file actually contains at these positions
    print(f"\\nActual file content check:")
    print(f"  Original file line 92: '{content_lines[1]}'")
    print(f"  Column 14 char: '{content_lines[1][14]}'")
    print(f"  Original file line 93: '{content_lines[2]}'")
    print(f"  Column 73 char: '{content_lines[2][73] if len(content_lines[2]) > 73 else 'EOL'}'")
    print(f"  Expected nlinarith text from file: '{content_lines[1][14:] + content_lines[2][:73]}'\\n")
    
    start_line_idx = start_line - 91  # Convert to 0-based relative to our array  
    end_line_idx = end_line - 91
    
    print(f"\n=== Replacement Target ===")
    print(f"Coordinates: Start({start_line}, {start_col}) -> End({end_line}, {end_col})")
    print(f"Array indices: {start_line_idx} -> {end_line_idx}")
    print(f"Start line: {content_lines[start_line_idx]}")
    print(f"End line: {content_lines[end_line_idx]}")
    print(f"Start column character: '{content_lines[start_line_idx][start_col]}'")
    print(f"Text before start: '{content_lines[start_line_idx][:start_col]}'")
    print(f"Text after end: '{content_lines[end_line_idx][end_col:]}'")
    
    # Show what should be replaced
    if start_line_idx == end_line_idx:
        replaced_text = content_lines[start_line_idx][start_col:end_col]
    else:
        lines_to_replace = []
        lines_to_replace.append(content_lines[start_line_idx][start_col:])
        for i in range(start_line_idx + 1, end_line_idx):
            lines_to_replace.append(content_lines[i])
        lines_to_replace.append(content_lines[end_line_idx][:end_col])
        replaced_text = '\n'.join(lines_to_replace)
    
    print(f"\n=== Text to be replaced ===")
    print(replaced_text)
    
    # Apply the current (buggy) logic
    print(f"\n=== Applying CURRENT (buggy) multi-line replacement logic ===")
    
    # Create a copy for testing
    test_lines = content_lines.copy()
    
    first_line = test_lines[start_line_idx]
    last_line = test_lines[end_line_idx]
    
    modified_first_line = first_line[:start_col]
    modified_last_line = last_line[end_col:]
    
    print(f"Modified first line: '{modified_first_line}'")
    print(f"Modified last line: '{modified_last_line}'")
    print(f"First line has content: {bool(modified_first_line.strip())}")
    print(f"Last line has content: {bool(modified_last_line.strip())}")
    
    indent = ' ' * start_col
    
    # Current buggy logic
    if modified_first_line.strip() or modified_last_line.strip():
        # We have content to preserve on first or last line
        if start_line_idx == end_line_idx:
            new_line = modified_first_line + hole_id + modified_last_line
            test_lines[start_line_idx] = new_line
        else:
            # Multi-line case with partial content preservation
            replacement_lines = []
            if modified_first_line.strip():
                replacement_lines.append(modified_first_line.rstrip())
            replacement_lines.append(f"{indent}{hole_id}")
            if modified_last_line.strip():
                replacement_lines.append(modified_last_line.lstrip())
            
            # Replace the entire block with the new lines
            test_lines = test_lines[:start_line_idx] + replacement_lines + test_lines[end_line_idx + 1:]
    else:
        # Both first and last lines are just whitespace, simple replacement
        replacement_block = [f"{indent}{hole_id}"]
        test_lines = test_lines[:start_line_idx] + replacement_block + test_lines[end_line_idx + 1:]
    
    print(f"\n=== Result with CURRENT logic ===")
    for i, line in enumerate(test_lines):
        print(f"{i+91:2d}: {line}")
        
    # Now apply FIXED logic
    print(f"\n=== Applying FIXED multi-line replacement logic ===")
    
    test_lines_fixed = content_lines.copy()
    
    # Fixed logic: properly handle partial line replacement
    if start_line_idx == end_line_idx:
        # Single line replacement
        line = test_lines_fixed[start_line_idx]
        new_line = line[:start_col] + hole_id + line[end_col:]
        test_lines_fixed[start_line_idx] = new_line
    else:
        # Multi-line replacement with proper boundary handling
        first_line = test_lines_fixed[start_line_idx]
        last_line = test_lines_fixed[end_line_idx]
        
        # Keep content before and after the hole
        prefix = first_line[:start_col]
        suffix = last_line[end_col:]
        
        # Create the replacement
        if prefix.strip() and suffix.strip():
            # Both prefix and suffix have content
            replacement_lines = [
                prefix.rstrip(),
                f"{indent}{hole_id}",
                suffix.lstrip()
            ]
        elif prefix.strip():
            # Only prefix has content
            replacement_lines = [
                prefix.rstrip(),
                f"{indent}{hole_id}"
            ]
        elif suffix.strip():
            # Only suffix has content  
            replacement_lines = [
                f"{indent}{hole_id}",
                suffix.lstrip()
            ]
        else:
            # Neither has content
            replacement_lines = [f"{indent}{hole_id}"]
        
        # Replace the block
        test_lines_fixed = test_lines_fixed[:start_line_idx] + replacement_lines + test_lines_fixed[end_line_idx + 1:]
    
    print(f"\n=== Result with FIXED logic ===")
    for i, line in enumerate(test_lines_fixed):
        print(f"{i+91:2d}: {line}")
        
    # Verify correctness
    print(f"\n=== Verification ===")
    
    # Check if have statement is preserved
    have_preserved = any("have h₂₀" in line for line in test_lines_fixed)
    print(f"Have statement preserved: {have_preserved}")
    
    # Check if exact statement is preserved  
    exact_preserved = any("exact h₂₀" in line for line in test_lines_fixed)
    print(f"Exact statement preserved: {exact_preserved}")
    
    # Check if hole is properly placed
    hole_present = any(hole_id in line for line in test_lines_fixed)
    print(f"Hole properly placed: {hole_present}")
    
    # Check for residual nlinarith
    nlinarith_residual = any("nlinarith" in line and hole_id not in line for line in test_lines_fixed)
    print(f"Residual nlinarith found: {nlinarith_residual}")

if __name__ == "__main__":
    test_multiline_replacement()