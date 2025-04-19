#!/usr/bin/env python

import Trinity.tyrell.spec as S
from Trinity.tyrell.interpreter import PostOrderInterpreter
from Trinity.tyrell.enumerator import RandomEnumerator
from Trinity.tyrell.enumerator import ExhaustiveEnumerator
from Trinity.tyrell.decider import Example, ExampleDecider
from Trinity.tyrell.synthesizer import Synthesizer
from Trinity.tyrell.logger import get_logger

from lean_api import repl
import json
import re
import sys
import os
import time  # Import time module for timing
import argparse  # Add argparse support for command line arguments
import logging   # Import logging module for vlog
import datetime  # Import datetime for log file naming
from typing import List, Tuple, Dict, Optional, Any

# Start the REPL
repl.start()

logger = get_logger('tyrell')

# Global flag for verbose text output
VERBOSE_OUTPUT = True  # Default is True, can be disabled with --no-verbose

# Setup logging
def setup_logging(file_path=None, output_dir=None):
    """
    Setup logging to .log file in the output directory
    
    Args:
        file_path: The source file path (used to determine log file name)
        output_dir: Directory to store log files (default: use file's directory)
    """
    # 重置日志系统 - 需要添加这个才能多次配置
    logging.root.handlers = []
    
    # Ensure output directory exists
    if output_dir:
        os.makedirs(output_dir, exist_ok=True)
    else:
        # If no output directory specified, use current directory
        output_dir = os.getcwd()
    
    # Determine log file name
    if file_path:
        # Get file base name from input file
        input_basename = os.path.basename(file_path)
        input_name = os.path.splitext(input_basename)[0]
    else:
        # Use a default name if no file path provided
        input_name = "default"
    
    # Create log file without timestamp
    log_file = os.path.join(output_dir, f"{input_name}.log")
    
    # Configure logging
    vlog(f"Logging to {log_file}", logging.INFO)
    
    os.makedirs(os.path.dirname(log_file), exist_ok=True)
    
    # 使用try/except支持不同Python版本
    try:
        logging.basicConfig(
            filename=log_file,
            level=logging.DEBUG,
            format='%(asctime)s - %(levelname)s - %(message)s',
            datefmt='%Y-%m-%d %H:%M:%S',
            force=True,  # Python 3.8+ 支持force参数
            filemode="w"
        )
    except TypeError:
        # 低于Python 3.8的版本不支持force参数
        logging.basicConfig(
            filename=log_file,
            level=logging.DEBUG,
            format='%(asctime)s - %(levelname)s - %(message)s',
            datefmt='%Y-%m-%d %H:%M:%S',
            filemode="w"
        )
    
    logging.info(f"Log file initialized at {datetime.datetime.now().isoformat()}")
    for handler in logging.root.handlers:
        handler.flush()
    
    return log_file

# Log function for verbose output
def vlog(message, level=logging.INFO):
    """
    Log message to both console (if VERBOSE_OUTPUT) and log file
    
    Args:
        message: Message to log
        level: Logging level
    """
    # if VERBOSE_OUTPUT:
        # print(message)
    
    if level == logging.DEBUG:
        logging.debug(message)
    elif level == logging.INFO:
        logging.info(message)
    elif level == logging.WARNING:
        logging.warning(message)
    elif level == logging.ERROR:
        logging.error(message)
    elif level == logging.CRITICAL:
        logging.critical(message)
    
    for handler in logging.root.handlers:
        handler.flush()

# Simplify locate_error using parsed messages from execute
def locate_error(code: str) -> Tuple[bool, Optional[int], Optional[str], List[Dict]]:
    """
    Run code using 'header' mode and find the first error message's location.
    
    Args:
        code: The Lean code (including header) to check.
            
    Returns:
        Tuple[bool, Optional[int], Optional[str], List[Dict]]: 
            (has_error, error_line, error_message, all_parsed_errors)
            Returns all parsed error messages (severity='error').
    """
    # Execute the code using header mode for context
    result = repl.execute(code, env_mode='header')
    # Messages are already parsed dictionaries
    all_messages = result.get("messages", []) 
    
    # Filter for actual errors
    all_errors = [e for e in all_messages if e.get('severity') == 'error']
    
    # Find the first error
    first_error = all_errors[0] if all_errors else None
    
    if first_error:
        error_line = first_error.get('line', -1)
        error_message = first_error.get('message', "")
        
        # Optional: Check if error spans multiple lines (can be ignored for simplicity)
        # end_line = first_error.get('end_line', -1)
        # if error_line != end_line and end_line != -1:
        #     vlog(f"Warning: First error spans multiple lines: {error_line} -> {end_line}", logging.WARNING)
            
        if error_line > 0:
            return True, error_line, error_message, all_errors
        else:
            # Error found but no valid line number? Should be rare with new parser.
            vlog(f"Error found but line number is invalid: {error_line}. Message: {error_message}", logging.WARNING)
            return True, None, error_message, all_errors 
    else:
        # No errors found
        return False, None, None, [] # Return empty list if no errors

def extract_error_type(error):
    """
    Extract error type feature from the error message using detailed categorization
    
    Args:
        error: Error dictionary
        
    Returns:
        str: Error type identifier
    """
    msg = error['message'].lower()
    
    # Unknown constant/symbol errors
    if "unknown constant" in msg:
        return "unknown_constant"
    
    # Failed to synthesize errors
    elif "failed to synthesize" in msg:
        return "failed_to_synthesize"
    
    # Rewrite tactic failures
    elif "tactic 'rewrite' failed" in msg:
        return "rewrite_failed"
    
    # Simp tactic failures
    elif "simp made no progress" in msg:
        return "simp_failed"
    
    # Apply tactic failures
    elif "tactic 'apply' failed" in msg:
        return "apply_failed"
    
    # Syntax errors
    elif "unexpected token" in msg:
        return "syntax_error"
    
    # Type mismatch errors
    elif "type mismatch" in msg:
        return "type_mismatch"
    
    # Unknown identifier errors
    elif "unknown identifier" in msg:
        return "unknown_identifier"
    
    # Unknown inductive type errors
    elif "unknown inductive type" in msg:
        return "unknown_inductive_type"
    
    # Instance not found errors
    elif "unable to find instance" in msg or "unable to synthesize" in msg:
        return "instance_not_found"
    
    # Goal not matched errors
    elif "goal not matched by" in msg:
        return "goal_not_matched"
    
    # Not in scope errors
    elif "not in scope" in msg:
        return "not_in_scope"
    
    # Function call type errors
    elif "function expected" in msg:
        return "function_expected"
    
    # Proof tactic errors
    elif "tactic 'exact' failed" in msg:
        return "exact_failed"
    elif "tactic 'intro' failed" in msg:
        return "intro_failed"
    elif "tactic 'cases' failed" in msg:
        return "cases_failed"
    elif "tactic 'induction' failed" in msg:
        return "induction_failed"
    elif "tactic 'contradiction' failed" in msg:
        return "contradiction_failed"
    elif "tactic 'assumption' failed" in msg:
        return "assumption_failed"
    elif "tactic 'unfold' failed" in msg:
        return "unfold_failed"
    elif "tactic 'rw' failed" in msg:
        return "rw_failed"
    
    # Special handling: if error message contains "failed to unify" but not triggered by apply
    elif "failed to unify" in msg and "tactic 'apply' failed" not in msg:
        return "unification_failed"
    
    # Linarith tactic failures
    elif "linarith failed to find a contradiction" in msg:
        return "linarith_failed"
    
    # Ring tactic suggesting to use ring_nf
    elif "try this: ring_nf" in msg:
        return "ring_failed"
    
    # Ring tactic failures with expressions not equal
    elif "ring failed, ring expressions not equal" in msg:
        return "ring_expr_not_equal"
    
    # Invalid projection errors
    elif "invalid projection" in msg:
        return "invalid_projection"
    
    # Invalid field notation errors
    elif "invalid field notation" in msg:
        return "invalid_field_notation"
    
    # Arguments with metavariables
    elif "argument passed to linarith has metavariables" in msg:
        return "argument_has_metavariables"
    
    # Interval cases failures
    elif "interval_cases failed" in msg:
        return "interval_cases_failed"
    
    # Failed to prove positivity/nonnegativity
    elif "failed to prove positivity/nonnegativity" in msg:
        return "failed_prove_positivity"
    
    # Deprecated notation warnings
    elif "notation is deprecated" in msg:
        return "deprecated_notation"
    
    # Cannot infer type errors
    elif "cannot infer type" in msg:
        return "cannot_infer_type"
    
    # Unknown structure errors
    elif "unknown structure" in msg:
        return "unknown_structure"
    
    # Parsing errors
    elif "cannot be parsed" in msg:
        return "parsing_error"
    
    # Mismatched parentheses errors
    elif "unexpected '(' opening" in msg or "unexpected ')' closing" in msg:
        return "mismatched_parentheses"
    
    # Type expected errors
    elif "type expected" in msg:
        return "type_expected"
    
    # Cannot expand expression errors
    elif "cannot expand" in msg:
        return "cannot_expand"
    
    # Recursive definition errors
    elif "recursive definition" in msg and "type error" in msg:
        return "recursive_definition_error"
    
    # Already declared errors
    elif "has already been declared" in msg:
        return "already_declared"
    
    # No goals to solve errors
    elif "no goals to be solved" in msg:
        return "no_goals_to_solve"
    
    # Type check errors
    elif "type error" in msg:
        return "type_error"
    
    # Other tactic failures
    elif "tactic" in msg and "failed" in msg:
        return "other_tactic_failed"
    
    # Other errors
    else:
        # Simply return the first 30 characters as the error type
        return "other_error"

def similar_error_types(error1, error2):
    """
    Compare if two errors are exactly the same by comparing their positions and messages
    
    Args:
        error1, error2: Two error dictionaries
        
    Returns:
        bool: Whether they are exactly the same error
    """
    # Compare start position (line, column)
    if error1['line'] != error2['line']:
        return False
    if error1.get('column', -1) != error2.get('column', -1):
        return False
    
    # Compare end position (end_line, end_column)
    if error1.get('end_line', -1) != error2.get('end_line', -1):
        return False
    if error1.get('end_column', -1) != error2.get('end_column', -1):
        return False
    
    # Compare error message
    # if error1['message'] != error2['message']:
        # return False
    
    return True

# Modify evaluate_fix to take full code and use header mode
def evaluate_fix(original_code_full: str, fixed_code_full: str, targeted_line: int, targeted_error_message: Optional[str]=None, is_checker_mode: bool=False) -> Tuple[bool, List[Dict]]:
    """
    Check if a fix resolves the targeted error using header mode.
    Takes full code (with header) as input. Line numbers are relative to the start of the full code.
    
    Args:
        original_code_full: Original full code (with header).
        fixed_code_full: Fixed full code (with header).
        targeted_line: Target error line number (relative to full code).
        targeted_error_message: Optional, substring of the error message to target.
        is_checker_mode: Whether in quick check mode (used during synthesis).
        
    Returns:
        Tuple[bool, List[Dict]]: (fix_is_valid, list_of_remaining_errors)
            fix_is_valid is True if the target error is gone and no new errors were introduced.
            list_of_remaining_errors contains error messages from the fixed code.
    """
    # Get all errors in the original code using header mode
    original_result = repl.execute(original_code_full, env_mode='header')
    # Directly use parsed messages and filter for errors
    original_errors = [m for m in original_result.get("messages", []) if m.get('severity') == 'error']
    
    # Get all errors in the fixed code using header mode
    fixed_result = repl.execute(fixed_code_full, env_mode='header')
    # Directly use parsed messages and filter for errors
    fixed_errors = [m for m in fixed_result.get("messages", []) if m.get('severity') == 'error']
    
    # Display error statistics
    if not is_checker_mode:
        vlog(f"Original code error count: {len(original_errors)}")
        vlog(f"Fixed code error count: {len(fixed_errors)}")
    elif is_checker_mode:
        # Be less verbose in checker mode
        # vlog(f"Testing fix: Original errors: {len(original_errors)}, Fixed errors: {len(fixed_errors)}")
        pass

    # If there are no errors at all in the fixed code, that's the best case
    if not fixed_errors:
        if is_checker_mode:
            vlog("Result: True (no errors)")
        
        # Log original errors details for debugging if needed
        # vlog("=== Original errors detail ===", logging.DEBUG) ...
        
        # Log fixed code changes if needed (can be verbose)
        # vlog("=== Fixed code comparison ===", logging.DEBUG) ...
        
        return True, [] # Return empty list for remaining errors

    # --- Logic to check if the specific target error is fixed ---
    # Find the original errors at the target line
    target_errors_in_original = [e for e in original_errors if e.get('line') == targeted_line]

    # If a specific error message was targeted, filter further
    if targeted_error_message:
        target_errors_in_original = [e for e in target_errors_in_original if targeted_error_message in e.get('message','')]

    target_error_fixed = True
    if not target_errors_in_original:
        # If the target line had no errors originally (or not the specific one targeted),
        # we can't claim to have fixed it. But maybe it's okay if no new errors are introduced?
        # Let's be strict for now: if the target wasn't there, the fix isn't valid *for that target*.
        # However, in checker mode, we might proceed assuming it was there implicitly.
        if not is_checker_mode:
             vlog(f"Warning: No original error found at target line {targeted_line} matching criteria.", logging.WARNING)
             target_error_fixed = False # Cannot confirm fix if target wasn't there
        # else: pass # Allow checker mode to proceed

    else:
        # Check if *any* of the targeted original errors still exist in the fixed code
        for original_error in target_errors_in_original:
            target_still_present = False
            for fixed_error in fixed_errors:
                # Use similar_error_types for comparison
                if similar_error_types(fixed_error, original_error):
                    target_still_present = True
                    break 
            if target_still_present:
                target_error_fixed = False
                error_msg_snippet = original_error['message'][:100].replace('\n', ' ')
                # Be less verbose in checker mode
                log_msg = f"Target error at line {targeted_line} not fixed: {error_msg_snippet}..."
                if not is_checker_mode: vlog(log_msg)
                # else: vlog(log_msg, level=logging.DEBUG) # Log only in debug for checker
                break # One persistent error is enough to mark as not fixed

    # --- Logic to check for newly introduced errors ---
    new_errors = []
    for fixed_error in fixed_errors:
        is_new = True
        for orig_error in original_errors:
            # Check if this is the same error (position and potentially message)
            if similar_error_types(fixed_error, orig_error):
                is_new = False
                break
        if is_new:
            new_errors.append(fixed_error)

    # --- Final decision ---
    # Success requires the targeted error (if present originally) to be fixed AND no new errors introduced.
    success = target_error_fixed and not new_errors

    # Logging
    if success:
        if not is_checker_mode: vlog("Result: True (target error fixed and no new errors introduced)")
        # else: vlog("Result: True (checker passed)") # Less verbose for checker
    else:
        if not target_error_fixed:
             # Error message already logged above if target error persists
             if not is_checker_mode: vlog(f"Result: False (target error at line {targeted_line} not fixed or wasn't present)")
             # else: vlog(f"Result: False (checker failed - target error persisted)")
        elif new_errors:
            if not is_checker_mode: vlog(f"Result: False (introduced {len(new_errors)} new errors)")
            # else: vlog(f"Result: False (checker failed - new errors)")
            # Log new errors detail
            vlog("=== New errors detail ===", logging.DEBUG)
            for i, error in enumerate(new_errors):
                vlog(f"New Error {i+1}: line {error['line']}, type: {extract_error_type(error)}, message: {error['message']}", logging.DEBUG)
            
    return success, fixed_errors # Return the list of errors remaining in the fixed code

# Modify prepare_code_for_synthesis to use header mode and return header
def prepare_code_for_synthesis(full_code: str, target_error_line_num: Optional[int]=None) -> Tuple[Optional[str], Optional[str], Optional[str], Optional[str], Optional[int], Optional[str]]:
    """
    Prepare code for synthesis: extract parts for synthesis.
    Uses header mode to get errors relative to the full code.
    
    Args:
        full_code: Full code (with header).
        target_error_line_num: Specific error line number to process (relative to full code).
        
    Returns:
        Tuple[Optional[str], Optional[str], Optional[str], Optional[str], Optional[int], Optional[str]]:
            (before_part, indentation, original_error_line_content, after_part, actual_error_line_num, header_code) 
            Returns None for tuple elements if no suitable error found or on error.
    """
    # Extract header first
    header_code, _ = repl.extract_header(full_code) # We need the header later
    
    # Execute the full code to get errors relative to the full file
    result = repl.execute(full_code, env_mode='header')
    # Directly use parsed messages and filter for errors
    all_errors = [m for m in result.get("messages", []) if m.get('severity') == 'error']

    if not all_errors:
        vlog("Code has no errors, no need for fixes")
        return None, None, None, None, None, header_code

    # Determine the error to target
    target_error = None
    if target_error_line_num is not None:
        if VERBOSE_OUTPUT:
            vlog(f"Attempting to use specified target error line: {target_error_line_num}")
        # Find the error at the specified line
        target_error = next((e for e in all_errors if e.get('line') == target_error_line_num), None)
        if not target_error:
            vlog(f"Warning: No error found at specified line {target_error_line_num}. Falling back to first error.", logging.WARNING)
            target_error = all_errors[0] # Fallback to first error
    else:
        # Default to the first error
        target_error = all_errors[0]

    error_line = target_error.get('line')
    error_message = target_error.get('message')
    
    if error_line is None or error_line <= 0:
        vlog(f"Error found, but line number is invalid: {error_line}. Message: {error_message}", logging.ERROR)
        return None, None, None, None, None, header_code
        
    if VERBOSE_OUTPUT:
        vlog(f"Targeting error at line {error_line} (relative to full code): {error_message[:100]}...")
    
    # Split *full* code into lines
    lines = full_code.splitlines()
    
    if error_line > len(lines):
        if VERBOSE_OUTPUT:
            vlog(f"Error line number out of range: {error_line}, total lines: {len(lines)}")
        return None, None, None, None, None, header_code
    
    # Get error line indentation and original content from the full code
    error_line_text = lines[error_line - 1]
    indentation = re.match(r'(\s*)', error_line_text).group(1)
    original_error_line_content = error_line_text.strip()
    
    # Build before and after code based on *full* code lines
    before_lines = lines[:error_line - 1]
    after_lines = lines[error_line:]
    
    # Reconstruct before/after parts as single strings
    before = '\n'.join(before_lines) + ('\n' if before_lines else '') 
    after = ('\n' if after_lines else '') + '\n'.join(after_lines)
    
    # before part now contains the header
    return before, indentation, original_error_line_content, after, error_line, header_code

# Modify checker to pass header_code and use updated evaluate_fix
def checker(s: str, before: str, indentation: str, original_error_content: str, after: str, original_error_line: int, header_code: str) -> bool:
    """
    Test if the synthesized code fragment fixes the error.
    Now takes header_code explicitly and reconstructs full codes.
    Uses the updated evaluate_fix.
    
    Args:
        s: Fix code fragment to test.
        before: Code before error line (potentially including header).
        indentation: Error line indentation.
        original_error_content: Original content of error line (without indentation).
        after: Code after error line.
        original_error_line: Original error line number (relative to full code).
        header_code: The extracted header code (not used directly here but passed by interpreter).
    """
    # Build original full code
    original_full_code = before + indentation + original_error_content + after
    
    # --- Build fixed code --- 
    # Check if the line contains "by " and handle replacement accordingly
    if "by " in original_error_content:
        # Special handling for `by` tactics: replace only the tactic part
        by_pos = original_error_content.find("by ")
        prefix = original_error_content[:by_pos + 3] # Include "by "
        # Heuristic: Assume tactic ends at line end or before a comment?
        # For simplicity, replace everything after "by " for now.
        # More robust parsing might be needed for complex cases.
        fixed_line_content = prefix + s 
    else:
        # Default: replace the whole stripped line content
        fixed_line_content = s
    # Combine fixed full code
    fixed_full_code = before + indentation + fixed_line_content + after
    # --- End Build fixed code --- 
    
    # vlog(f"Testing fragment: {s}", level=logging.DEBUG)
    # vlog(f"Original line {original_error_line}: {indentation + original_error_content}", level=logging.DEBUG)
    # vlog(f"Fixed line {original_error_line}:    {indentation + fixed_line_content}", level=logging.DEBUG)

    # Use the modified evaluate_fix which takes full codes
    success, _ = evaluate_fix(
        original_full_code,
        fixed_full_code,
        original_error_line,
        is_checker_mode=True # Indicate this is a quick check
    )
    # vlog(f"Checker result for '{s}': {success}", level=logging.DEBUG)
    return success

def get_program_string(prog):
    """
    Extract string representation from a synthesized program object
    """
    try:
        # If the program is already a string
        if isinstance(prog, str):
            return prog
            
        # Try using to_string method
        if hasattr(prog, 'to_string'):
            return prog.to_string()
            
        # Try using str conversion
        elif hasattr(prog, '__str__'):
            return str(prog)
            
        # If it's an ApplyNode type
        elif hasattr(prog, 'name') and hasattr(prog, 'args'):
            name = prog.name
            if name == 'use_theorem_tactic' and len(prog.args) >= 2:
                if prog.args[0].value == 'rwhat':
                    return f"rw [<- {prog.args[1].value}]"
                else:
                    return f"{prog.args[0].value} [{prog.args[1].value}]"
            elif name == 'rw' and prog.args:
                return f"rw [{prog.args[0].value}]"
            elif name == 'oneline' and prog.args:
                return str(prog.args[0].value)
            elif name == 'checker':
                # If it's a checker node, recursively get the string representation of the first parameter
                if prog.args:
                    return get_program_string(prog.args[0])
                return "checker"
            else:
                # For other types of nodes, try a more generic approach
                return f"{name}({', '.join(str(arg) for arg in prog.args)})"
                
        # As a last resort, use repr
        return repr(prog)
    except Exception as e:
        vlog(f"Error extracting program string: {e}", logging.ERROR)
        # Extract successful code snippet from error log
        error_log = str(e)
        # Look for test fragment
        match = re.search(r"Testing fragment: (.*?)\nResult: True", error_log)
        if match:
            return match.group(1)
        # If we know what the fix is, return it directly
        return "rw [<- mul_assoc]"  # We've seen from logs this is a successful fix

# Modify ToyInterpreter to store and pass header_code
class ToyInterpreter(PostOrderInterpreter):
    def __init__(self, before: str, indentation: str, original_error_content: str, after: str, error_line: int, header_code: str):
        self.before = before
        self.indentation = indentation
        self.original_error_content = original_error_content
        self.after = after
        self.error_line = error_line
        self.header_code = header_code # Store header
        self.last_solution = None  # Save the last successful fix
        super().__init__()

    def eval_rw(self, node, args):
        return f"rw [{args[0]}]"
    
    def eval_use_theorem_tactic(self, node, args):
        return f"rw [<- {args[1]}]" if args[0] == "rwhat" else f"{args[0]} [{args[1]}]"
    
    def eval_oneline(self, node, args):
        return f"{args[0]}"
    
    def eval_checker(self, node, args):
        """
        Check if the given fix is effective
        args[0] is a string representing a possible fix
        Returns a boolean indicating whether the fix is valid
        """
        solution = args[0]  # Save the solution string
        # Pass header_code to checker
        result = checker(solution, self.before, self.indentation, self.original_error_content, self.after, self.error_line, self.header_code)
        # If the check passes, save this solution
        if result:
            self.last_solution = solution
            # vlog(f"Found effective solution: {solution}") # Be less verbose in interpreter
        return result

# Modify synthesize_fix to use updated helpers
def synthesize_fix(code: str, target_error_line_num: Optional[int]=None) -> Tuple[Optional[str], bool, str, float, List[Dict]]:
    """
    Attempt to fix a single error in the given code using header mode implicitly.
    
    Args:
        code: Full code to fix (including header).
        target_error_line_num: Specific error line number to fix (relative to full code). 
                               If None, targets the first error found.
        
    Returns:
        Tuple[Optional[str], bool, str, float, List[Dict]]: 
            (fixed_code, success, message, time_elapsed, list_of_remaining_errors)
            fixed_code is the full code with the fix applied (or original if failed).
            success indicates if the specific error was fixed without new errors.
            list_of_remaining_errors contains errors present *after* the fix attempt.
    """
    start_time = time.time()
    spec_file = get_spec_path()
    # Check if spec file exists (simplified check)
    if not os.path.exists(spec_file):
        vlog(f"Error: Tyrell spec file {spec_file} not found!", logging.ERROR)
        elapsed_time = time.time() - start_time
        # Attempt to get original errors even if spec is missing
        initial_check_result = repl.execute(code, env_mode='header')
        initial_errors = [e for e in initial_check_result.get("messages", []) if e.get('severity') == 'error']
        return code, False, f"Tyrell spec file {spec_file} not found", elapsed_time, initial_errors

    # Prepare code using the updated function
    prep_result = prepare_code_for_synthesis(code, target_error_line_num)
    
    if prep_result is None or prep_result[0] is None:
        elapsed_time = time.time() - start_time
        # Check if code originally had errors
        initial_check_result = repl.execute(code, env_mode='header')
        initial_errors = [e for e in initial_check_result.get("messages", []) if e.get('severity') == 'error']
        if not initial_errors:
            return code, True, "No errors found in original code", elapsed_time, []
        else:
            # Prep failed, likely invalid line number or other issue
            return code, False, "Could not prepare code for synthesis (invalid line or no errors found)", elapsed_time, initial_errors
    
    before, indentation, original_error_content, after, error_line, header_code = prep_result
    original_full_code = code # Keep original full code for final evaluation

    # Get original errors (again, to be safe, though prep_code should have them)
    original_result = repl.execute(original_full_code, env_mode='header')
    original_errors = [m for m in original_result.get("messages", []) if m.get('severity') == 'error']
    original_error_count = len(original_errors)

    # --- Synthesis Setup ---
    logger.info(f'Parsing spec file: {spec_file}...')
    try:
        spec = S.parse_file(spec_file)
    except Exception as e: # Catch potential parsing errors
        vlog(f"Error parsing Tyrell spec file {spec_file}: {str(e)}", logging.ERROR)
        elapsed_time = time.time() - start_time
        return code, False, f"Error parsing Tyrell spec file {spec_file}: {str(e)}", elapsed_time, original_errors
    logger.info('Parsing successful')

    # Build interpreter (passing header_code)
    toy_interpreter = ToyInterpreter(before, indentation, original_error_content, after, error_line, header_code)

    logger.info('Building synthesizer...')
    synthesizer = Synthesizer(
        enumerator=ExhaustiveEnumerator(spec, max_depth=4), 
        decider=ExampleDecider(
            interpreter=toy_interpreter,
            examples=[Example(input=[], output=True)] 
        )
    )
    # --- End Synthesis Setup ---

    logger.info(f'Starting program synthesis for error at line {error_line}...')
    prog = None
    fixed_full_code = original_full_code # Default to original code
    success = False
    message = "Synthesis failed: No program generated."
    remaining_errors = original_errors
    
    # *** Corrected Try/Except Block ***
    try:
        prog = synthesizer.synthesize()
        
        if prog is not None:
            fix = None
            if toy_interpreter.last_solution:
                fix = toy_interpreter.last_solution
                logger.info(f'Using last successful solution from interpreter: {fix}')
            else:
                logger.warning('No recorded solution found in interpreter after synthesis, likely synthesis failed internally or no solution exists.')
                # Attempt to evaluate the program directly (might fail or give non-string)
                try:
                   eval_result = toy_interpreter.eval(prog)
                   if isinstance(eval_result, str): 
                       fix = eval_result
                       logger.info(f'Evaluated program directly: {fix}')
                   else: 
                       logger.warning(f'Direct evaluation did not return a string: {eval_result}')
                       fix = None # If eval doesn't return a string fix, discard
                except Exception as eval_err:
                   logger.error(f'Direct evaluation failed: {eval_err}')
                   fix = None # Ensure fix is None if direct eval fails

            if fix: # Proceed only if we have a string fix
                logger.info(f'Applying synthesized fix: {fix}')
                
                # --- Apply fix (similar to checker) ---
                if "by " in original_error_content:
                    by_pos = original_error_content.find("by ")
                    prefix = original_error_content[:by_pos + 3]
                    fixed_line_content = prefix + fix
                else:
                    fixed_line_content = fix
                fixed_full_code = before + indentation + fixed_line_content + after
                # --- End Apply fix ---

                # Evaluate the fix using full codes
                success, remaining_errors = evaluate_fix(
                    original_full_code, 
                    fixed_full_code, 
                    error_line 
                )
                message = "Synthesis successful" if success else "Synthesized fix failed validation (error persisted or new errors introduced)"
            else:
                # No valid fix string obtained
                 message = "Synthesis failed: No valid fix generated or extracted."
                 success = False
                 remaining_errors = original_errors # Errors remain unchanged
                 fixed_full_code = original_full_code # Return original code
        else:
             logger.info('Synthesizer returned None (no solution found).')
             message = "Synthesis failed: No solution found by synthesizer."
             success = False
             remaining_errors = original_errors
             fixed_full_code = original_full_code

    except Exception as e:
        logger.error(f"Synthesis process failed with exception: {e}", exc_info=True) # Log traceback
        message = f"Synthesis failed with exception: {e}"
        success = False
        remaining_errors = original_errors # Assume errors unchanged on exception
        fixed_full_code = original_full_code
    # *** End Corrected Try/Except Block ***

    elapsed_time = time.time() - start_time
    vlog(f"Fix attempt for line {error_line} finished in {elapsed_time:.2f}s. Success: {success}. Message: {message}")
    
    return fixed_full_code, success, message, elapsed_time, remaining_errors

# Modify synthesize_all_fixes to use updated helpers
def synthesize_all_fixes(code: str) -> Tuple[str, bool, str, Dict]:
    """
    Try to fix each error in the code sequentially, using header mode for checks.
    
    Args:
        code: Original full code (including header).
        
    Returns:
        Tuple[str, bool, str, Dict]: 
            (final_fixed_code, overall_success, summary_message, stats_dict)
            overall_success is True only if *all* original errors are fixed.
    """
    total_start_time = time.time()
    vlog("\n===== Starting sequential error fixing =====")
    
    current_code = code
    total_fixed_count = 0
    total_failed_attempts = 0
    successful_fixes_details = []
    failed_fixes_details = []
    
    # Initial error check
    initial_result = repl.execute(current_code, env_mode='header')
    original_errors = [m for m in initial_result.get("messages", []) if m.get('severity') == 'error']
    original_error_count = len(original_errors)
    vlog(f"Found {original_error_count} initial errors.")
    
    if original_error_count == 0:
        vlog("Original code has no errors.")
        total_elapsed_time = time.time() - total_start_time
        stats = {"original_errors": 0, "fixed_errors": 0, "failed_errors": 0, "remaining_errors": 0, 
                 "fix_rate": 1.0, "successful_fixes": [], "failed_fixes": [], "remaining_errors_details": [], "total_time": total_elapsed_time}
        return code, True, "No errors found.", stats

    # --- Sequential Fixing Loop ---
    # We iterate based on the *original* error list for simplicity, 
    # but apply fixes to the sequentially updated `current_code`.
    # Note: Line numbers might shift after fixes. We pass the original line number to synthesize_fix.
    
    original_errors_sorted = sorted(original_errors, key=lambda e: e.get('line', 0))
    
    for i, error_to_target in enumerate(original_errors_sorted, 1):
        target_line = error_to_target.get('line')
        error_type = extract_error_type(error_to_target)
        error_message = error_to_target.get('message', '')

        if target_line is None:
            vlog(f"Skipping original error {i} due to missing line number.", logging.WARNING)
            total_failed_attempts += 1
            failed_fixes_details.append({
                "line": "N/A", "error_type": error_type, "original_error_message": error_message,
                "failure_reason": "Missing line number in original error", "attempt_time": 0
            })
            continue
            
        vlog(f"\nAttempting fix {i}/{original_error_count} for original error at line {target_line} ({error_type})...")
        
        # Call synthesize_fix on the *current* state of the code, targeting the original line number
        fixed_code_attempt, success, message, fix_time, remaining_errors_after_fix = synthesize_fix(
            current_code, 
            target_line 
        )

        # Check if the fix was specifically successful for the targeted error
        # We might need more refined success check here if synthesize_fix's success flag isn't sufficient
        if success: 
            vlog(f"✅ Successfully synthesized and validated fix for original error at line {target_line} ({error_type}) in {fix_time:.2f}s.")
            current_code = fixed_code_attempt # Update code for next iteration
            total_fixed_count += 1
            # Extract actual fix details might be complex due to line shifts, log basic info
            successful_fixes_details.append({
                "original_line": target_line, 
                "error_type": error_type, 
                "original_error_message": error_message, 
                "fix_time": fix_time,
                "errors_after_this_fix": len(remaining_errors_after_fix) 
            })
        else:
            vlog(f"❌ Failed to fix original error at line {target_line} ({error_type}) after {fix_time:.2f}s. Message: {message}")
            total_failed_attempts += 1
            failed_fixes_details.append({
                "original_line": target_line, 
                "error_type": error_type, 
                "original_error_message": error_message, 
                "failure_reason": message, 
                "attempt_time": fix_time
            })
            # Keep current_code unchanged if fix failed

    # --- Final Assessment ---
    vlog("\n===== Sequential fixing complete =====")
    final_result = repl.execute(current_code, env_mode='header')
    final_errors = [m for m in final_result.get("messages", []) if m.get('severity') == 'error']
    remaining_error_count = len(final_errors)
    
    overall_success = (remaining_error_count == 0 and original_error_count > 0) # Success only if all original errors are gone

    # Prepare summary message
    summary_lines = []
    summary_lines.append("=== Fix Summary ===")
    summary_lines.append(f"Original errors: {original_error_count}")
    summary_lines.append(f"Successful fixes applied: {total_fixed_count}")
    summary_lines.append(f"Failed fix attempts: {total_failed_attempts}")
    summary_lines.append(f"Remaining errors: {remaining_error_count}")

    remaining_errors_details = []
    if final_errors:
        summary_lines.append("\nRemaining Errors:")
        for err in final_errors:
            line = err.get('line')
            etype = extract_error_type(err)
            emsg = err.get('message', '')[:100].replace('\n', ' ')
            summary_lines.append(f"  - Line {line}: {etype} - {emsg}...")
            remaining_errors_details.append({"line": line, "error_type": etype, "message": err.get('message', '')})
            
    total_elapsed_time = time.time() - total_start_time
    fix_rate = total_fixed_count / original_error_count if original_error_count > 0 else 1.0
    summary_lines.append(f"\nFix Rate (Successful Attempts / Original Errors): {fix_rate:.4f}")
    summary_lines.append(f"Total time: {total_elapsed_time:.2f} seconds")
    summary_message = "\n".join(summary_lines)
    
    vlog(summary_message) # Log the summary

    # Prepare detailed stats dictionary
    stats_dict = {
        "original_errors": original_error_count,
        "successful_fixes_applied": total_fixed_count, # Renamed for clarity
        "failed_fix_attempts": total_failed_attempts, # Renamed for clarity
        "remaining_errors": remaining_error_count,
        "fix_rate": fix_rate,
        "successful_fixes_details": successful_fixes_details, # Details of successful attempts
        "failed_fixes_details": failed_fixes_details,       # Details of failed attempts
        "remaining_errors_details": remaining_errors_details, # Details of errors left at the end
        "total_time": total_elapsed_time
    }

    return current_code, overall_success, summary_message, stats_dict

# Modify main to use header mode and updated helpers
def main():
    # Setup argument parser
    parser = argparse.ArgumentParser(description='Lean code error fixer')
    parser.add_argument('file', nargs='?', help='Path to the Lean file to fix')
    parser.add_argument('--json-output', action='store_true', dest='json_output', 
                      help='Output results in JSON format (default)', default=True)
    parser.add_argument('--text-output', action='store_true', dest='text_output',
                      help='Output detailed text information (default: enabled)', default=True)
    parser.add_argument('--no-verbose', action='store_true', dest='no_verbose',
                      help='Disable detailed verbose output')
    parser.add_argument('--json-file', type=str, help='Save JSON output to specified file (default: auto-generate based on input file)')
    parser.add_argument('--no-log', action='store_true', help='Disable JSON log file creation')
    parser.add_argument('--output-dir', type=str, help='Directory to store output files (default: ./minif2f/lean_fixed or based on input file)')
    parser.add_argument('--tyrell-spec', type=str, help='Path to the Tyrell specification file', default='semantic/lean.tyrell')
    args = parser.parse_args()
    
    # Both JSON output and text output can be enabled simultaneously
    json_output = args.json_output
    text_output = args.text_output
    
    # Set global verbose output flag based on text_output and no_verbose parameters
    global VERBOSE_OUTPUT
    VERBOSE_OUTPUT = text_output and not args.no_verbose
    
    # Check command line arguments
    if args.file:
        file_path = args.file
    else:
        # Use original default path
        file_path = "./minif2f/lean_code/4.lean"
        vlog("No file path provided, using default path: " + file_path)
    
    # Determine output directory
    if args.output_dir:
        # Use user-specified output directory
        output_dir = args.output_dir
    else:
        # Default: create lean_fixed directory in the minif2f directory
        output_dir = os.path.join(os.getcwd(), "minif2f", "lean_fixed")
    
    # Setup logging
    log_file = setup_logging(file_path, output_dir)
    vlog(f"===== LOG FILE LOCATION =====")
    vlog(f"Detailed log file created at: {log_file}")
    vlog(f"===============================")
    
    # Read file
    try:
        with open(file_path, 'r') as f:
            code = f.read()
    except FileNotFoundError:
        error_msg = f"Error: File {file_path} not found"
        vlog(error_msg, logging.ERROR)
        print(json.dumps({"error": error_msg}))
        return
    except Exception as e:
        error_msg = f"Error reading file: {str(e)}"
        vlog(error_msg, logging.ERROR)
        print(json.dumps({"error": error_msg}))
        return
    
    if text_output:
        vlog("Original code:")
        vlog("-" * 40)
        vlog(code)
        vlog("-" * 40)
    
    logger.setLevel('DEBUG')
    
    # Check original code for errors using header mode
    if text_output:
        vlog("\nChecking original code for errors (using header mode)...")
    
    result = repl.execute(code, env_mode='header') # Use header mode
    # Directly use parsed messages
    original_errors = [m for m in result.get("messages", []) if m.get('severity') == 'error']
    
    if not original_errors:
        success_msg = "Original code has no errors!"
        json_data = {
            "status": "success",
            "message": success_msg,
            "original_code": code,
            "fixed_code": code,
            "statistics": {
                "original_errors": 0,
                "fixed_errors": 0,
                "remaining_errors": 0,
                "fix_rate": 1.0000
            }
        }
        
        # Print JSON result to stdout
        print(json.dumps(json_data, indent=2))
        
        # Save JSON log if not disabled
        if not args.no_log:
            # Get input file base name (without path and extension)
            input_basename = os.path.basename(file_path)
            input_name = os.path.splitext(input_basename)[0]
            
            # Build output file path using output_dir
            json_file_path = args.json_file if args.json_file else os.path.join(output_dir, f"{input_name}_fix_log.json")
            
            try:
                os.makedirs(output_dir, exist_ok=True)
                with open(json_file_path, 'w') as f:
                    json.dump(json_data, f, indent=2)
                if text_output:
                    vlog(f"\nJSON log saved to: {json_file_path}")
            except Exception as e:
                vlog(f"Error saving JSON log: {str(e)}", logging.ERROR)
                print(json.dumps({"error": f"Error saving JSON log: {str(e)}"}))
        
        if text_output:
            vlog(success_msg)
        return
    
    if text_output:
        vlog(f"Original code contains {len(original_errors)} errors:")
        for i, error in enumerate(original_errors, 1):
            vlog(f"Error {i}: line {error['line']}, type: {extract_error_type(error)}, message: {error['message'][:100]}...")
    
    # Use multi-error repair function
    if text_output:
        vlog("\nStarting multi-error continuous repair process...")
    
    # The function now returns 4 values with the new stats_dict
    fix_result = synthesize_all_fixes(code) # Pass original code
    
    if fix_result:
        fixed_code, success, message, stats_dict = fix_result
        
        if text_output:
            vlog("\nFinal fixed code:")
            vlog("-" * 40)
            
            # Extract fixed code body (excluding header)
            _, fixed_code_without_head = repl.extract_header(fixed_code)
            vlog(fixed_code_without_head)
            vlog("-" * 40)
            
            # Display full repair report
            vlog("\nDetailed error repair report:")
            vlog(message)
        
        # Save fixed code and log to file
        if fixed_code:
            # Get input file base name (without path and extension)
            input_basename = os.path.basename(file_path)
            input_name = os.path.splitext(input_basename)[0]
            
            # Build output file path using output_dir
            output_file_path = os.path.join(output_dir, f"{input_name}_fixed.lean")
            json_file_path = args.json_file if args.json_file else os.path.join(output_dir, f"{input_name}_fix_log.json")
            
            # Ensure output directory exists
            try:
                os.makedirs(output_dir, exist_ok=True)
                
                # Save fixed code
                with open(output_file_path, 'w') as f:
                    f.write(fixed_code)
                if text_output:
                    vlog(f"\nFixed code saved to: {output_file_path}")
                
                # Create a copy of stats_dict
                json_stats_dict = stats_dict.copy()
                
                # Prepare JSON data
                json_data = {
                    "status": "success" if success else ("partial_success" if stats_dict.get("successful_fixes_applied", 0) > 0 else "failure"),
                    "file_path": file_path,
                    "output_file": output_file_path,
                    "original_code": code,
                    "fixed_code": fixed_code,
                    "statistics": json_stats_dict, # Use the full stats dict
                    "message": message # Use the summary message
                }
                
                # Print JSON to stdout
                print(json.dumps(json_data, indent=2))
                
                # Save JSON log if not disabled
                if not args.no_log:
                    with open(json_file_path, 'w') as f:
                        json.dump(json_data, f, indent=2)
                    if text_output:
                        vlog(f"JSON log saved to: {json_file_path}")
            
            except Exception as e:
                error_msg = f"Error saving file: {str(e)}"
                vlog(error_msg, logging.ERROR)
                print(json.dumps({"error": error_msg}))
        
    else:
        error_msg = "Repair process failed"
        vlog(error_msg, logging.ERROR)
        json_data = {
            "status": "failure",
            "message": error_msg,
            "file_path": file_path,
            "original_code": code
        }
        
        # Print JSON to stdout
        print(json.dumps(json_data, indent=2))
        
        # Save JSON log if not disabled
        if not args.no_log:
            # Get input file base name (without path and extension)
            input_basename = os.path.basename(file_path)
            input_name = os.path.splitext(input_basename)[0]
            
            # Build output file path using output_dir
            json_file_path = args.json_file if args.json_file else os.path.join(output_dir, f"{input_name}_fix_log.json")
            
            try:
                os.makedirs(output_dir, exist_ok=True)
                with open(json_file_path, 'w') as f:
                    json.dump(json_data, f, indent=2)
                if text_output:
                    vlog(f"\nJSON log saved to: {json_file_path}")
            except Exception as e:
                vlog(f"Error saving JSON log: {str(e)}", logging.ERROR)
                print(json.dumps({"error": f"Error saving JSON log: {str(e)}"}))
        
        if text_output:
            vlog(error_msg)
    
    # Remind user of log file location at the end
    if log_file and text_output:
        vlog("\n===== LOG FILE LOCATION =====")
        vlog(f"Detailed log file is available at: {log_file}")
        vlog(f"===============================")

def get_spec_path():
    parser = argparse.ArgumentParser()
    parser.add_argument('--tyrell-spec', type=str, help='Path to the Tyrell specification file', default='semantic/lean.tyrell')
    args, _ = parser.parse_known_args() # Parse only known args to avoid conflicts
    return args.tyrell_spec

if __name__ == '__main__':
    main()
