# Lean Enumerator

## Overview

Lean Enumerator is an automated tool for fixing errors in Lean mathematical proof code, utilizing program synthesis techniques to identify and apply appropriate fixes. By interacting with Lean's REPL interface, it can automatically detect, analyze, and fix various types of errors in code, thereby improving the efficiency of formal mathematical proof development.

## Key Features

- **Automated Error Fixing**: Automatically detects and fixes various types of errors in Lean code
- **Batch Processing**: Can process all errors in code one by one, not limited to just the first error
- **Detailed Logging**: Provides detailed JSON format logs recording the repair process and results
- **Statistical Analysis**: Calculates fix rates, successful and failed error types, and other statistics
- **Configurable Output**: Supports both text and JSON output, with configurable verbosity levels
- **Error Classification**: Able to identify and classify multiple types of Lean errors for targeted fixing strategies

## Installation

Ensure you have Lean and Lake installed. After cloning the repository, install the required Python dependencies:

```bash
pip install -r requirements.txt
```

## Usage

### Basic Usage

To fix a single Lean file:

```bash
python Trinity/lean_enumerator.py path/to/your/file.lean
```

### Command Line Arguments

```
usage: lean_enumerator.py [-h] [--json-output] [--text-output] [--no-verbose]
                         [--json-file JSON_FILE] [--no-log]
                         [--log-file LOG_FILE]
                         [file]

Lean code error fixer

positional arguments:
  file                  Path to the Lean file to fix

optional arguments:
  -h, --help            show this help message and exit
  --json-output         Output results in JSON format (default)
  --text-output         Output detailed text information in addition to JSON
  --no-verbose          Disable verbose logging output
  --json-file JSON_FILE
                        Save JSON output to specified file (default: auto-generate based on input file)
  --no-log              Disable JSON log file creation
  --log-file LOG_FILE   Path to verbose log file (default: lean_enumerator_verbose.log)
```

### Output Details

- The fixed code will be saved to `../lean_fixed/[original_filename]_fixed.lean`
- The fix log will be saved to `../lean_fixed/[original_filename]_fix_log.json`
- Detailed debug logs will be saved to `lean_enumerator_verbose.log` (can be changed with the `--log-file` parameter)

## System Architecture

Lean Enumerator consists of the following main components:

1. **REPL Interface**: Uses `leanapi.py` to interact with Lean's REPL, execute code, and retrieve error information
2. **Error Analyzer**: Analyzes and classifies errors through `extract_error_type` and `similar_error_types` functions
3. **Code Synthesizer**: A program synthesis system based on the Tyrell framework that attempts to generate possible fixes
4. **Evaluator**: Uses `evaluate_fix` and `checker` to verify if the fix is effective
5. **Logging System**: Records detailed information about the repair process and results

## Error Fixing Process

1. Parse the Lean file, extracting header information and code
2. Locate the error line that needs to be fixed
3. Decompose the code into parts before the error line, the error line itself, and parts after the error line
4. Use the program synthesizer to attempt possible fixes
5. Evaluate whether the fix resolves the target error
6. Apply successful fixes and output the fixed code
7. Continue to process the next error (if any)

## Log Analysis

You can use the companion `log_analyzer.py` tool to analyze fix logs:

```bash
python Trinity/log_analyzer.py --input-dir path/to/logs
```

The analyzer will generate statistical reports and visualization charts to help you understand the fixing effectiveness.

## Common Error Types and Fixing Strategies

Lean Enumerator can identify and fix common error types including:

- Type mismatch errors (type_mismatch)
- Unknown constant errors (unknown_constant)
- Syntax errors (syntax_error)
- Rewrite tactic failures (rewrite_failed)
- Apply tactic failures (apply_failed)
- Instance not found errors (instance_not_found)
- Various proof tactic failures (exact_failed, intro_failed, etc.)

## Development

### Adding New Fixing Strategies

Fixing strategies are defined in the `example/lean.tyrell` file. To add a new fixing strategy:

1. Add new production rules in the specification file
2. Add corresponding evaluation functions in the `ToyInterpreter` class
3. Test the effectiveness of the new strategy

### Debugging

Use the `--text-output` parameter to get detailed text output, which is helpful for debugging. The `VERBOSE_OUTPUT` variable controls detailed log output.

## License

[Add license information]

## Contributions

Issue reports and improvement suggestions are welcome. 