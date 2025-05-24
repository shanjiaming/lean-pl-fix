# Lean Have Extractor

This utility extracts theorem names that follow 'have' statements in Lean files and outputs them as a JSON list.

## Overview

In Lean theorem proving, 'have' statements are used to introduce local facts or lemmas within a proof. This tool parses Lean files to identify all such statements and extracts the theorem names for further analysis or documentation.

## Usage

### Single File Mode

```bash
python utils/extract_have.py <lean_file_path> <output_json_path>
```

### Directory Mode

```bash
python utils/extract_have.py <directory_path> <output_directory>
```

### Parameters

- `<lean_file_path>`: Path to a single Lean file to analyze
- `<directory_path>`: Path to a directory containing Lean files (will process all .lean files recursively)
- `<output_json_path>`: Path where the JSON output will be saved for single file mode
- `<output_directory>`: Directory where individual JSON files will be saved for directory mode

### Examples

#### Process a single file:

```bash
python utils/extract_have.py /home/matheye/lean-pl-fix/minif2f/lean_code/100.lean /path/to/output/theorems.json
```

#### Process an entire directory:

```bash
python utils/extract_have.py ./minif2f/lean_code ./minif2f/have_theorems
```

This will create files like:
- `./minif2f/have_theorems/100.json`
- `./minif2f/have_theorems/101.json`
- ...and so on for each .lean file

## Output Format

### Single File Mode

The tool outputs a JSON array of strings, where each string is a theorem name:

```json
[
  "hx",
  "hy",
  "h₁'",
  "h_factor",
  ...
]
```

If no 'have' statements are found, an empty array is output:

```json
[]
```

### Directory Mode

For each processed Lean file, a corresponding JSON file is created containing an array of theorem names:

```json
[
  "hx",
  "hy",
  "h₁'",
  "h_factor",
  ...
]
```

Every Lean file in the input directory will have a corresponding JSON file created, even if no 'have' statements are found (in which case, an empty array is output).

## Implementation Details

- The extractor uses regular expressions to identify 'have' statements in Lean files
- The script only matches 'have' statements that appear at the beginning of a line (possibly after whitespace)
- It matches everything after "have" and whitespace until it encounters a space, colon, or any opening bracket (like '(', '[', '{')
- The pattern `^\s*have\s+([^\s:\(\[\{]+)` captures theorem names from statements where 'have' is the first non-whitespace token on the line
- Duplicate theorem names are removed while preserving the order of first appearance
- For directory processing, it recursively finds all .lean files and processes each one, creating individual JSON files
- The output is formatted as a pretty-printed JSON file with UTF-8 encoding
- For files with no 'have' statements, an empty JSON array is output

## Error Handling

The script provides clear error messages when:
- The input file cannot be read (skips the file in directory mode)
- The output path cannot be written to
- Incorrect command-line arguments are provided 