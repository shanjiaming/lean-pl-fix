#!/usr/bin/env python

import Trinity.tyrell.spec as S
from Trinity.tyrell.interpreter import PostOrderInterpreter
from Trinity.tyrell.enumerator import RandomEnumerator
from Trinity.tyrell.enumerator import ExhaustiveEnumerator
from Trinity.tyrell.decider import Example, ExampleDecider
from Trinity.tyrell.synthesizer import Synthesizer
from Trinity.tyrell.logger import get_logger

from .lean_api import repl
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
        
        # Check if this is a "no goals to be solved" error that we want to ignore
        error_message = fixed_error.get('message', '').lower()
        is_no_goals_error = "no goals to be solved" in error_message
        
        # Skip "no goals to be solved" errors in new errors check
        # Note: We have a separate fix channel for handling these errors.
        # These errors often occur after fixing other tactical errors and aren't 
        # considered true errors but rather indicators that a tactical goal
        # has been completed but the tactic sequence isn't terminated correctly.
        if is_no_goals_error:
            continue
            
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
def checker(s: str, before: str, indentation: str, original_error_content: str, after: str, original_error_line: int, header_code: str, place: str) -> bool:
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
        place: Place to insert the fix, either "here" or "before"
    """
    # Build original full code
    original_full_code = before + indentation + original_error_content + after
    
    # --- Build fixed code based on 'place' ---
    fixed_full_code = ""
    if place == "here":
        # Replace the current line's content
        if "by " in original_error_content:
            # Special handling for `by` tactics: replace only the tactic part
            by_pos = original_error_content.find("by ")
            prefix = original_error_content[:by_pos + 3] # Include "by "
            fixed_line_content = prefix + s 
        else:
            # Default: replace the whole stripped line content
            fixed_line_content = s
        fixed_full_code = before + indentation + fixed_line_content + after
        # vlog(f"Testing ({place}): Replace line {original_error_line} with {fixed_line_content}", level=logging.DEBUG)
    elif place == "before":
        # Insert the new line before the original error line
        new_line_to_insert = indentation + s + '\n' # Add newline after inserted line
        original_line_full = indentation + original_error_content # Keep original line
        fixed_full_code = before + new_line_to_insert + original_line_full + after
        # vlog(f"Testing ({place}): Insert '{s}' before line {original_error_line}", level=logging.DEBUG)
    else:
        # Should not happen with current spec, but handle defensively
        vlog(f"Warning: Unknown placement '{place}' received in checker. Defaulting to 'here'.", logging.WARNING)
        fixed_line_content = s # Default to replacing
        fixed_full_code = before + indentation + fixed_line_content + after
    # --- End Build fixed code --- 
    
    # vlog(f"Original code slice:\n...{original_error_content}...", level=logging.DEBUG)
    # vlog(f"Generated fixed code slice for check:\n...{fixed_full_code[len(before):len(fixed_full_code)-len(after)]}...", level=logging.DEBUG)

    # Use the modified evaluate_fix which takes full codes
    success, _ = evaluate_fix(
        original_full_code,
        fixed_full_code,
        original_error_line,
        is_checker_mode=True # Indicate this is a quick check
    )
    # vlog(f"Checker result for '{s}' ({place}): {success}", level=logging.DEBUG)
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
        self.last_solution_place = None # Save placement ("here" or "before")
        self.theorem_in_parenthesis = original_error_content[original_error_content.find("[") + 1 : original_error_content.find("]")]
        super().__init__()

    def eval_rw(self, node, args):
        return f"rw [{args[0]}]"
    
    def eval_use_theorem_tactic(self, node, args):
        return f"rw [<- {args[1]}]" if args[0] == "rwhat" else f"{args[0]} [{args[1]}]"
    
    def eval_oneline(self, node, args):
        return f"{args[0]}"
    
    def eval_delete(self, node, args):
        return "" # for simplicity, we have a redundant delete place, before or here, though before is never used.
    
    def eval_unfold(self, node, args):
        return "unfold " + self.theorem_in_parenthesis
    
    def eval_nth_rw(self, node, args):
        return "nth_rw " + args[0] + " [" + self.theorem_in_parenthesis + "]"
    
    def eval_checker(self, node, args):
        """
        Check if the given fix is effective
        args[0] is a string representing a possible fix
        Returns a boolean indicating whether the fix is valid
        """
        solution = args[0]  # Save the solution string
        place = args[1]
        # Pass header_code to checker
        result = checker(solution, self.before, self.indentation, self.original_error_content, self.after, self.error_line, self.header_code, place)
        # If the check passes, save this solution and its placement
        if result:
            self.last_solution = solution
            self.last_solution_place = place # Store the placement
            # vlog(f"Found effective solution: {solution} ({place})") # Be less verbose in interpreter
        return result

    def extract_dsl_info(self, exception_str):
        """Extract DSL information from exception string if available."""
        if 'checker' not in exception_str:
            return None
        
        # 提取DSL信息，改进正则表达式以处理嵌套括号
        try:
            # 查找checker(开始到最后一个)结束的内容
            start_idx = exception_str.find('checker(')
            if start_idx == -1:
                return None
            
            # 找到匹配的右括号
            open_count = 1
            end_idx = start_idx + len('checker(')
            
            while open_count > 0 and end_idx < len(exception_str):
                if exception_str[end_idx] == '(':
                    open_count += 1
                elif exception_str[end_idx] == ')':
                    open_count -= 1
                end_idx += 1
            
            if open_count == 0:
                # 成功找到匹配的括号
                dsl_str = exception_str[start_idx:end_idx]
                
                # 从checker(和最后一个参数之间提取内容
                # 查找第一个参数的开始和结束位置
                param_start = dsl_str.find('(') + 1
                
                # 寻找第一个参数的结束位置（在最后一个逗号之前）
                # 使用栈来匹配括号以处理嵌套情况
                bracket_stack = []
                param_end = param_start
                
                while param_end < len(dsl_str):
                    char = dsl_str[param_end]
                    if char == '(':
                        bracket_stack.append('(')
                    elif char == ')':
                        if bracket_stack:
                            bracket_stack.pop()
                        else:
                            # 到达checker的闭括号
                            break
                    elif char == ',' and not bracket_stack:
                        # 找到了第一个参数的结束位置（非嵌套内的逗号）
                        break
                    param_end += 1
                
                if param_end > param_start:
                    first_param = dsl_str[param_start:param_end].strip()
                    return first_param
            
            # 如果上面的方法失败，尝试更简单的方法提取checker内容
            try:
                # 移除"checker("和")"，保留中间内容
                inner_content = exception_str[start_idx + len('checker('):end_idx-1]
                # 找到最后一个参数（通常以逗号分隔）
                parts = inner_content.rsplit(',', 1)
                if len(parts) > 1:
                    return parts[0].strip()
                return inner_content
            except:
                pass
                
            return None
        except Exception as e:
            print(f"Error extracting DSL info: {e}")
            return None

# Modify synthesize_fix to use updated helpers
def synthesize_fix(code: str, target_error_line_num: Optional[int]=None, file_path: Optional[str]=None) -> Tuple[Optional[str], bool, str, float, List[Dict]]:
    """
    Attempt to fix a single error in the given code using header mode implicitly.
    
    Args:
        code: Full code to fix (including header).
        target_error_line_num: Specific error line number to fix (relative to full code). 
                               If None, targets the first error found.
        file_path: Path to the file being processed (for Tyrell spec selection).
        
    Returns:
        Tuple[Optional[str], bool, str, float, List[Dict]]: 
            (fixed_code, success, message, time_elapsed, list_of_remaining_errors)
            fixed_code is the full code with the fix applied (or original if failed).
            success indicates if the specific error was fixed without new errors.
            list_of_remaining_errors contains errors present *after* the fix attempt.
    """
    start_time = time.time()
    # 设置超时时间（120秒 = 2分钟）
    TIMEOUT = 120  
    
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

    # Get the specific error we're targeting
    target_error = next((e for e in original_errors if e.get('line') == error_line), None)
    if not target_error:
        vlog(f"Warning: No error found at line {error_line}. Using first error.", logging.WARNING)
        target_error = original_errors[0] if original_errors else None
    
    # Get error line content for classification
    error_line_content = original_error_content if original_error_content else ""
    
    # Get appropriate spec file based on error type and file path
    spec_file = get_spec_path(target_error, error_line_content, file_path)
    vlog(f'Using spec file: {spec_file}')
    
    # Check if spec file exists
    if not os.path.exists(spec_file):
        vlog(f"Error: Tyrell spec file {spec_file} not found!", logging.ERROR)
        elapsed_time = time.time() - start_time
        return code, False, f"Tyrell spec file {spec_file} not found", elapsed_time, original_errors

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
    
    # *** Try/Except Block with Timeout Check ***
    try:
        # 添加超时检查
        remaining_time = TIMEOUT - (time.time() - start_time)
        if remaining_time <= 0:
            raise TimeoutError("Preparation took too long before synthesis could start")
        
        # 使用单独的线程来实现超时
        import threading
        
        # 设置超时标志
        timeout_occurred = threading.Event()
        
        # 在单独的线程中检查超时
        def check_timeout():
            time_to_wait = TIMEOUT - (time.time() - start_time)
            if time_to_wait <= 0:
                timeout_occurred.set()
                return
                
            # 等待剩余的超时时间
            timeout_occurred.wait(time_to_wait)
        
        # 启动超时检查线程
        timeout_thread = threading.Thread(target=check_timeout)
        timeout_thread.daemon = True  # 设为守护线程，使其不会阻止主程序退出
        timeout_thread.start()
        
        # 周期性检查超时标志的函数
        def check_if_timeout():
            if timeout_occurred.is_set() or (time.time() - start_time) > TIMEOUT:
                raise TimeoutError("Synthesis timeout after 2 minutes")
            return False
        
        # 开始合成，并周期性检查超时
        synthesis_start_time = time.time()
        prog = synthesizer.synthesize()
        
        # 每次迭代后检查超时
        if check_if_timeout():
            raise TimeoutError("Synthesis timeout during execution")
        
        if prog is not None:
            fix = None
            place = None # Initialize place
            if toy_interpreter.last_solution:
                fix = toy_interpreter.last_solution
                place = toy_interpreter.last_solution_place # Get placement
                logger.info(f'Using last successful solution from interpreter: {fix} (place: {place})')
                
                # 获取DSL字符串表示
                dsl_str = None
                if prog is not None:
                    try:
                        # 获取DSL程序的字符串表示，不包含checker()外壳
                        dsl_str = str(prog)
                        # 如果DSL字符串包含checker，尝试提取内部实际DSL内容
                        if "checker" in dsl_str:
                            # 旧的正则表达式只能捕获到第一个逗号前的内容，会导致嵌套结构被截断
                            # match = re.search(r'checker\(\s*([^,]+),', dsl_str)
                            # if match:
                            #     dsl_str = match.group(1).strip()
                            
                            # 改进方法：处理嵌套括号，提取完整的第一个参数
                            # 使用栈来跟踪括号层级
                            parts = dsl_str.split("checker(", 1)
                            if len(parts) > 1:
                                content = parts[1].strip()
                                stack = []
                                param_end = -1
                                
                                for i, char in enumerate(content):
                                    if char == '(':
                                        stack.append(char)
                                    elif char == ')':
                                        if stack:
                                            stack.pop()
                                        else:
                                            # 不匹配的右括号，可能是checker的结束括号
                                            continue
                                    elif char == ',' and not stack:
                                        # 找到了第一个参数的结束位置
                                        param_end = i
                                        break
                                
                                if param_end > 0:
                                    dsl_str = content[:param_end].strip()
                                    vlog(f"Extracted DSL: {dsl_str}", level=logging.DEBUG)
                                else:
                                    # 提取失败，保留原始DSL字符串但去掉checker外壳
                                    vlog("Failed to extract first parameter with precise method, using fallback", level=logging.WARNING)
                                    # 备用方法：移除外部checker调用，保留内部内容
                                    if dsl_str.startswith("checker(") and dsl_str.endswith(")"):
                                        inner_content = dsl_str[8:-1].strip()  # 去掉"checker("和最后的")"
                                        # 从内部内容中提取第一个参数（简单实现，仅用于备用）
                                        first_param = inner_content.split(',', 1)[0].strip()
                                        dsl_str = first_param
                    except Exception as e:
                        vlog(f"Unable to extract DSL representation: {e}", logging.WARNING)
                        dsl_str = None
            else:
                logger.warning('No recorded solution found in interpreter after synthesis, likely synthesis failed internally or no solution exists.')
                # Attempt to evaluate the program directly (might fail or give non-string)
                # Direct evaluation might not work well with the checker logic, so we prioritize last_solution
                fix = None 
                place = None

            # 再次检查是否超时
            if timeout_occurred.is_set() or (time.time() - start_time) > TIMEOUT:
                raise TimeoutError("Synthesis completed but timed out before applying fix")

            if fix and place: # Proceed only if we have a string fix and a place
                logger.info(f'Applying synthesized fix: {fix} (place: {place})')
                
                # --- Apply fix based on 'place' (logic matches checker) ---
                final_fixed_full_code = ""
                if place == "here":
                    if "by " in original_error_content:
                        by_pos = original_error_content.find("by ")
                        prefix = original_error_content[:by_pos + 3]
                        fixed_line_content = prefix + fix
                    else:
                        fixed_line_content = fix
                    final_fixed_full_code = before + indentation + fixed_line_content + after
                elif place == "before":
                    new_line_to_insert = indentation + fix + '\n'
                    original_line_full = indentation + original_error_content
                    final_fixed_full_code = before + new_line_to_insert + original_line_full + after
                else: 
                    # Default to 'here' if place is unexpected (shouldn't happen)
                    logger.warning(f"Unexpected place '{place}' from interpreter, defaulting to 'here'.")
                    fixed_line_content = fix
                    final_fixed_full_code = before + indentation + fixed_line_content + after
                # --- End Apply fix ---

                # 再次检查是否超时
                if timeout_occurred.is_set() or (time.time() - start_time) > TIMEOUT:
                    raise TimeoutError("Fix applied but evaluation timed out")

                # Evaluate the final constructed fix using full codes
                success, remaining_errors = evaluate_fix(
                    original_full_code, 
                    final_fixed_full_code, # Use the code constructed based on 'place'
                    error_line 
                )
                
                if success:
                    fixed_full_code = final_fixed_full_code # Update the code to be returned
                    message = f"Synthesis successful (fix applied {place})"
                    # 记录DSL信息作为返回值的一部分
                    if dsl_str:
                        message += f" [DSL: {dsl_str}]"
                else:
                    # Fix failed validation, keep original code
                    fixed_full_code = original_full_code 
                    message = f"Synthesized fix ({fix}, {place}) failed validation (error persisted or new errors introduced)"
            else:
                # No valid fix string or place obtained
                 message = "Synthesis failed: No valid fix/placement generated or extracted."
                 success = False
                 remaining_errors = original_errors # Errors remain unchanged
                 fixed_full_code = original_full_code # Return original code
        else:
             logger.info('Synthesizer returned None (no solution found).')
             message = "Synthesis failed: No solution found by synthesizer."
             success = False
             remaining_errors = original_errors
             fixed_full_code = original_full_code
    
    except TimeoutError as e:
        # 处理超时异常
        logger.error(f"Synthesis process timed out after {TIMEOUT} seconds: {e}")
        message = f"Synthesis timed out after {TIMEOUT} seconds: {str(e)}"
        success = False
        remaining_errors = original_errors
        fixed_full_code = original_full_code
    
    except Exception as e:
        logger.error(f"Synthesis process failed with exception: {e}", exc_info=True) # Log traceback
        message = f"Synthesis failed with exception: {e}"
        success = False
        remaining_errors = original_errors # Assume errors unchanged on exception
        fixed_full_code = original_full_code
    # *** End Try/Except Block ***

    elapsed_time = time.time() - start_time
    
    # 如果超时了但是未捕获到TimeoutError，添加超时标记到消息中
    if elapsed_time >= TIMEOUT and "timed out" not in message:
        message = f"Synthesis timed out after {TIMEOUT} seconds: {message}"
    
    # 确保成功的情况下添加DSL信息
    if success and 'dsl_str' in locals() and dsl_str and "[DSL: " not in message:
        message += f" [DSL: {dsl_str}]"
    
    vlog(f"Fix attempt for line {error_line} finished in {elapsed_time:.2f}s. Success: {success}. Message: {message}")
    
    return fixed_full_code, success, message, elapsed_time, remaining_errors

# Function to decompose complex rw ... at ... tactics
def decompose_rw_at(line_content: str, indentation: str) -> Optional[str]:
    """
    Decompose 'rw [th1, th2]' or 'rw [th1, th2] at loc1 loc2' into multiple lines.

    Args:
        line_content: The content of the line (stripped).
        indentation: The indentation of the line.

    Returns:
        A string with decomposed lines, or None if not applicable.
    """
    vlog(f"[Decompose Debug] Received line_content: '{line_content}'", logging.DEBUG)
    # Group 1: Theorems
    # Group 2: Locations (only if 'at' is present)
    # --- Fixed Correct Regex --- #
    match = re.match(r'^\s*(rw)\s*(\[.*?\])(?:\s+(at)\s+(.*?))?\s*$', line_content)
    # -------------------------- #
    # match = re.match(r'^\\s*(rw)\\s*(\[.*?\])(?:\\s+(at)\\s+(.*?))?\\s*$', line_content)
    # --------------------
    # match = re.match(r'^\\s*(rw)\\s*(\\[.*?\\])(?:\\s+(at)\\s+(.*?))?\\s*$', line_content)
    # --------------------
    # match = re.match(r'^\\s*rw\\s*\\[(.*?)\\](?:\\s+at\\s+(.*?))?\\s*$', line_content)
    # ----------------------------------------
    if not match:
        vlog("[Decompose Debug] Regex did not match.", logging.DEBUG)
        return None

    # Adjust group indices based on new regex
    theorems_str = match.group(2)[1:-1].strip() # Remove brackets and strip
    locations_str = match.group(4).strip() if match.group(4) else None
    # theorems_str = match.group(1).strip()
    # locations_str = match.group(2).strip() if match.group(2) else None # Locations string or None
    # at_part = match.group(2) # This will be None if 'at' is not present
    # locations_str = match.group(3).strip() if at_part else "" # Locations string or empty

    theorems = [th.strip() for th in theorems_str.split(',') if th.strip()]
    locations = [loc.strip() for loc in locations_str.split() if loc.strip()] if locations_str else []

    # Only decompose if more than one theorem OR (more than one location AND at least one theorem)
    # We need at least one theorem to decompose anything.
    if not theorems or (len(theorems) <= 1 and len(locations) <= 1):
        vlog(f"[Decompose Debug] Condition not met: theorems={len(theorems)}, locations={len(locations)}", logging.DEBUG)
        return None

    decomposed_lines = []
    # If no locations specified (either 'at' was absent or location list was empty)
    if not locations:
        # Only decompose if there's more than one theorem
        if len(theorems) > 1:
            for th in theorems:
                decomposed_lines.append(f"{indentation}rw [{th}]")
        else:
             # Single theorem, no locations - no decomposition needed
             vlog("[Decompose Debug] Single theorem, no locations. No decomposition needed.", logging.DEBUG)
             return None
    # If locations are specified (and we have at least one theorem)
    else:
        for th in theorems:
            for loc in locations:
                decomposed_lines.append(f"{indentation}rw [{th}] at {loc}")

    # Ensure we actually generated lines (handles edge cases like rw [] at loc)
    if not decomposed_lines:
        vlog("[Decompose Debug] No decomposed lines generated.", logging.DEBUG)
        return None

    result = '\n'.join(decomposed_lines)
    vlog(f"[Decompose Debug] Decomposing line: '{line_content}' into {len(decomposed_lines)} lines. Result: {result}", logging.INFO)
    # vlog(f"Decomposing line: '{line_content}' into {len(decomposed_lines)} lines.", logging.INFO)
    return result

# Modify synthesize_all_fixes to use updated helpers
def synthesize_all_fixes(code: str, file_path: Optional[str]=None) -> Tuple[str, bool, str, Dict]:
    """
    Try to fix errors in the code iteratively, attempting decomposition first.
    Uses header mode for checks.

    Args:
        code: Original full code (including header).
        file_path: Path to the file being processed (for Tyrell spec selection).

    Returns:
        Tuple[str, bool, str, Dict]:
            (final_fixed_code, overall_success, summary_message, stats_dict)
            overall_success is True only if *all* original errors are fixed.
    """
    total_start_time = time.time()
    vlog("\n===== Starting iterative error fixing =====")

    current_code = code
    stats = {
        "original_errors": 0,
        "decompositions_applied": 0,
        "successful_syntheses": 0,
        "failed_syntheses": {}, # 只存储timeout情况 {line_num: timeout_message}
        "timeout_syntheses": 0,  # 计数超时发生的次数
        "attempts_per_line": {},  # 记录每行尝试的总次数 {line_num: count}
        "remaining_errors": 0,
        "fix_rate": 0.0,
        "successful_fixes_details": [], # Keep track of successful synthesis details
        "failed_fixes_details": [],     # Keep track of failed synthesis attempts
        "timeout_fixes_details": [],    # 记录超时的修复尝试详情
        "remaining_errors_details": [],
        "total_time": 0.0,
        "no_goals_fixes_applied": 0,    # Track number of "no goals to be solved" fixes applied
    }

    # Initial error check
    initial_result = repl.execute(current_code, env_mode='header')
    initial_errors = [m for m in initial_result.get("messages", []) if m.get('severity') == 'error']
    stats["original_errors"] = len(initial_errors)
    vlog(f"Found {stats['original_errors']} initial errors.")

    if stats["original_errors"] == 0:
        vlog("Original code has no errors.")
        stats["fix_rate"] = 1.0
        stats["total_time"] = time.time() - total_start_time
        return code, True, "No errors found.", stats

    pass_num = 0
    # 用于追踪timeout的行
    timeout_lines = set()  
    while True:
        pass_num += 1
        vlog(f"\n--- Starting Fix Pass {pass_num} ---")

        # Get current errors
        pass_result = repl.execute(current_code, env_mode='header')
        current_errors = [m for m in pass_result.get("messages", []) if m.get('severity') == 'error']
        current_errors_sorted = sorted(current_errors, key=lambda e: e.get('line', 0))

        if not current_errors_sorted:
            vlog("No errors remaining. Fixing process complete.")
            break # Success

        vlog(f"Errors remaining at start of pass {pass_num}: {len(current_errors_sorted)}")

        made_change_this_pass = False
        attempted_synthesis_in_this_pass = set() # Track lines where synthesis failed *this pass*

        current_code_lines = current_code.splitlines()

        for error_to_process in current_errors_sorted:
            target_line_num = error_to_process.get('line')
            error_type = extract_error_type(error_to_process)
            error_message = error_to_process.get('message', '')

            if target_line_num is None:
                vlog(f"Skipping error due to missing line number: {error_message[:100]}...", logging.WARNING)
                continue

            # 只有timeout的情况才检查failed_syntheses
            # 其他普通失败情况只检查当前pass中的attempted_synthesis_in_this_pass
            if (target_line_num in timeout_lines or target_line_num in attempted_synthesis_in_this_pass):
                continue # 不重试已超时的行或当前pass已尝试的行

            if not (0 < target_line_num <= len(current_code_lines)):
                 vlog(f"Skipping error at line {target_line_num} - line number out of bounds for current code ({len(current_code_lines)} lines).", logging.WARNING)
                 continue

            error_line_full_content = current_code_lines[target_line_num - 1]
            indentation = re.match(r'(\s*)', error_line_full_content).group(1)
            error_line_content_stripped = error_line_full_content.strip()

            # --- Strip comment before attempting decomposition ---
            code_part = error_line_content_stripped.split('--')[0].strip()
            # ----------------------------------------------------
            
            # 0. Special handling for "no goals to be solved" errors
            if error_type == "no_goals_to_solve":
                vlog(f"Detected 'no goals to be solved' error at line {target_line_num}. Attempting to clean up...")
                new_code_lines, clean_applied = clean_no_goals_lines(
                    current_code_lines, 
                    target_line_num, 
                    error_message
                )
                
                if clean_applied:
                    vlog(f"Successfully cleaned up 'no goals to be solved' error at line {target_line_num}")
                    # Update current code with fixed version
                    current_code = '\n'.join(new_code_lines)
                    current_code_lines = new_code_lines
                    stats["no_goals_fixes_applied"] += 1
                    made_change_this_pass = True
                    
                    # 如果是超时行，移除其状态
                    if target_line_num in timeout_lines:
                        timeout_lines.remove(target_line_num)
                        if target_line_num in stats["failed_syntheses"]:
                            del stats["failed_syntheses"][target_line_num]
                        
                    vlog(f"Code updated after cleaning 'no goals to be solved' error at line {target_line_num}. Starting new pass.")
                    break # Break inner for loop, start new pass immediately
                else:
                    vlog(f"Could not clean up 'no goals to be solved' error at line {target_line_num}. Continuing with normal fix attempts.")
                    # Continue to try other fix methods

            # 1. Attempt Decomposition
            decomposed_code_block = decompose_rw_at(code_part, indentation)
            if decomposed_code_block is not None:
                vlog(f"Applying decomposition at line {target_line_num}")
                # Replace the line
                new_code_lines = current_code_lines[:target_line_num - 1] + decomposed_code_block.split('\n') + current_code_lines[target_line_num:]
                current_code = '\n'.join(new_code_lines)
                current_code_lines = current_code.splitlines() # Update lines list
                stats["decompositions_applied"] += 1
                made_change_this_pass = True
                
                # 如果是超时行，移除其状态
                if target_line_num in timeout_lines:
                    timeout_lines.remove(target_line_num)
                    if target_line_num in stats["failed_syntheses"]:
                        del stats["failed_syntheses"][target_line_num]
                
                vlog(f"Code updated after decomposition at line {target_line_num}. Starting new pass.")
                break # Break inner for loop, start new pass immediately

            # 更新尝试次数统计
            stats["attempts_per_line"][target_line_num] = stats["attempts_per_line"].get(target_line_num, 0) + 1

            # 2. Attempt Synthesis (only if decomposition didn't happen)
            vlog(f"Attempting synthesis for error at line {target_line_num} ({error_type})...")
            fixed_code_attempt, success, message, fix_time, remaining_errors_after_fix = synthesize_fix(
                current_code, # Pass the current state of the code
                target_line_num,
                file_path  # Pass file_path for Tyrell spec selection
            )

            # 检测超时情况
            is_timeout = "timed out" in message

            if success:
                vlog(f"✅ Successfully synthesized and validated fix for error at line {target_line_num} ({error_type}) in {fix_time:.2f}s.")
                current_code = fixed_code_attempt # Update code
                current_code_lines = current_code.splitlines() # Update lines list
                stats["successful_syntheses"] += 1
                
                # 提取DSL信息
                dsl_info = None
                if "[DSL: " in message:
                    dsl_match = re.search(r'\[DSL: (.*?)\]', message)
                    if dsl_match:
                        dsl_info = dsl_match.group(1)
                
                # Record success details with DSL information
                stats["successful_fixes_details"].append({
                    "pass": pass_num,
                    "line": target_line_num,
                    "error_type": error_type,
                    "original_error_message": error_message, # Error message *before* this fix
                    "fix_time": fix_time,
                    "errors_after_this_fix": len(remaining_errors_after_fix),
                    "fix_snippet": fixed_code_attempt.splitlines()[target_line_num - 1].strip(), # 记录实际应用的修复内容
                    "dsl": dsl_info  # 记录DSL信息
                })
                
                # 如果是超时行，移除其状态
                if target_line_num in timeout_lines:
                    timeout_lines.remove(target_line_num)
                    if target_line_num in stats["failed_syntheses"]:
                        del stats["failed_syntheses"][target_line_num]
                
                made_change_this_pass = True
                vlog(f"Code updated after successful synthesis at line {target_line_num}. Starting new pass.")
                break # Break inner for loop, start new pass immediately
            elif is_timeout:
                # 处理超时情况
                vlog(f"⏱ Synthesis for error at line {target_line_num} ({error_type}) timed out after {fix_time:.2f}s.")
                # 记录超时统计
                stats["timeout_syntheses"] += 1
                # 记录超时详情
                stats["timeout_fixes_details"].append({
                     "pass": pass_num,
                     "line": target_line_num,
                     "error_type": error_type,
                     "original_error_message": error_message,
                     "timeout_message": message,
                     "attempt_time": fix_time
                })
                # 标记为当前pass已尝试和永久超时
                attempted_synthesis_in_this_pass.add(target_line_num)
                timeout_lines.add(target_line_num)
                # 记录为持久失败（只记录timeout情况）
                stats["failed_syntheses"][target_line_num] = "Timed out: " + message
                # 继续下一个错误
                continue
            else:
                vlog(f"❌ Failed to synthesize fix for error at line {target_line_num} ({error_type}) after {fix_time:.2f}s. Message: {message}")
                
                # 只标记为当前pass已尝试，不记录为持久失败
                attempted_synthesis_in_this_pass.add(target_line_num)
                
                # Record failure details (similar to previous version)
                stats["failed_fixes_details"].append({
                     "pass": pass_num,
                     "line": target_line_num,
                     "error_type": error_type,
                     "original_error_message": error_message, # Error message before this attempt
                     "failure_reason": message,
                     "attempt_time": fix_time
                 })
                # Continue the inner for loop to the next error in this pass

        # After iterating through all errors in the pass
        if not made_change_this_pass:
            vlog(f"No changes made in pass {pass_num}. Stopping iterative fixing.")
            break # Break outer while loop

        # Safety break to prevent infinite loops (e.g., if fixes introduce new errors repeatedly)
        if pass_num >= (stats["original_errors"] * 2) + 5: # Allow roughly 2 passes per original error + buffer
             vlog(f"Warning: Reached pass limit ({pass_num}). Stopping iterative fixing to prevent infinite loops.", logging.WARNING)
             break


    # --- Final Assessment ---
    vlog("\n===== Iterative fixing complete =====")
    final_result = repl.execute(current_code, env_mode='header')
    final_errors = [m for m in final_result.get("messages", []) if m.get('severity') == 'error']
    stats["remaining_errors"] = len(final_errors)

    overall_success = (stats["remaining_errors"] == 0 and stats["original_errors"] > 0) # Success only if all original errors are gone

    # Prepare summary message
    summary_lines = []
    summary_lines.append("=== Fix Summary ===")
    summary_lines.append(f"Original errors: {stats['original_errors']}")
    summary_lines.append(f"Decompositions applied: {stats['decompositions_applied']}")
    summary_lines.append(f"No goals error fixes applied: {stats['no_goals_fixes_applied']}")
    summary_lines.append(f"Successful syntheses: {stats['successful_syntheses']}")
    summary_lines.append(f"Timed out syntheses: {stats['timeout_syntheses']}")
    
    # 显示每行尝试次数
    summary_lines.append(f"Synthesis attempts per line:")
    for line, count in sorted(stats["attempts_per_line"].items()):
        summary_lines.append(f"  - Line {line}: {count} attempts")
    
    # 只显示超时失败情况
    summary_lines.append(f"Timed out syntheses (line: reason): {len(stats['failed_syntheses'])}")
    for line, reason in stats['failed_syntheses'].items():
        summary_lines.append(f"  - Line {line}: {reason[:100]}...")
    
    summary_lines.append(f"Remaining errors: {stats['remaining_errors']}")

    stats["remaining_errors_details"] = []
    if final_errors:
        summary_lines.append("\nRemaining Errors:")
        for err in final_errors:
            line = err.get('line')
            etype = extract_error_type(err)
            emsg = err.get('message', '')[:100].replace('\n', ' ')
            summary_lines.append(f"  - Line {line}: {etype} - {emsg}...")
            stats["remaining_errors_details"].append({"line": line, "error_type": etype, "message": err.get('message', '')})

    total_elapsed_time = time.time() - total_start_time
    stats["total_time"] = total_elapsed_time
    # Calculate fix rate based on reduction in errors
    errors_fixed = stats['original_errors'] - stats['remaining_errors']
    stats["fix_rate"] = errors_fixed / stats['original_errors'] if stats['original_errors'] > 0 else 1.0
    summary_lines.append(f"\nOverall Fix Rate (Errors Fixed / Original Errors): {stats['fix_rate']:.4f}")
    summary_lines.append(f"Total time: {total_elapsed_time:.2f} seconds")
    summary_message = "\n".join(summary_lines)

    vlog(summary_message) # Log the summary

    # The stats dictionary is already updated throughout the process
    return current_code, overall_success, summary_message, stats

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
    
    # Pass file_path to synthesize_all_fixes
    fix_result = synthesize_all_fixes(code, file_path)
    
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
                    "message": message, # Use the summary message
                    "dsl": None  # Initialize DSL info field
                }
                
                # Try to extract DSL info from successful fix records
                if "successful_fixes_details" in json_stats_dict and json_stats_dict["successful_fixes_details"]:
                    # Find the first record with DSL info
                    for fix_detail in json_stats_dict["successful_fixes_details"]:
                        if "dsl" in fix_detail and fix_detail["dsl"]:
                            json_data["dsl"] = fix_detail["dsl"]
                            break
                
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

def is_local_theorem_error(error, code_line, file_path=None):
    """
    Check if the error is related to a local theorem (have series) by verifying
    if the theorem exists in the corresponding have_theorems JSON file.
    
    Args:
        error: Error dictionary
        code_line: The content of the error line
        file_path: The path to the Lean file being processed
        
    Returns:
        bool: True if the error is related to a local theorem
    """
    # If no file path provided, we can't check the have_theorems file
    if file_path is None:
        return False
        
    # 简化条件：不再检查错误类型
    
    # Check if the line contains rw [theorem_name]
    rw_match = re.search(r'rw\s*\[(.*?)\]', code_line)
    if not rw_match:
        return False
    
    # Extract the theorem name
    theorem_name = rw_match.group(1).strip()
    
    # Determine the have_theorems JSON file path for this Lean file
    input_basename = os.path.basename(file_path)
    input_name = os.path.splitext(input_basename)[0]
    
    # 修复：使用绝对路径直接访问minif2f/have_theorems目录
    # 获取当前文件的路径
    current_file = os.path.abspath(__file__)
    # 获取项目根目录（lean-pl-fix）
    project_root = os.path.dirname(current_file)
    vlog(f"Project root directory: {project_root}", logging.DEBUG)
    
    have_json_path = os.path.join(project_root, "minif2f", "have_theorems", f"{input_name}.json")
    vlog(f"Looking for have theorems JSON file at: {have_json_path}", logging.DEBUG)
    
    # Check if the have_theorems JSON file exists
    if not os.path.exists(have_json_path):
        vlog(f"Have theorems JSON file not found: {have_json_path}", logging.INFO)
        return False
    
    # Read the have_theorems JSON file and check if the theorem exists
    try:
        with open(have_json_path, 'r', encoding='utf-8') as f:
            have_theorems = json.load(f)
        
        # 检查定理名是否存在于have_theorems列表中
        vlog(f"Checking if theorem '{theorem_name}' exists in have_theorems file", logging.DEBUG)
        if theorem_name in have_theorems:
            vlog(f"Theorem '{theorem_name}' found in have_theorems file", logging.INFO)
            return True
        
        vlog(f"Theorem '{theorem_name}' not found in have_theorems file", logging.INFO)
        return False
    except Exception as e:
        vlog(f"Error reading have_theorems JSON file: {e}", logging.ERROR)
        return False

def get_spec_path(error=None, error_line=None, file_path=None):
    """
    Get the path to the Tyrell specification file.
    Choose different specs based on error type if available.
    
    Args:
        error: Optional error dictionary
        error_line: Optional content of the error line
        file_path: Optional path to the Lean file being processed
        
    Returns:
        str: Path to the Tyrell spec file
    """
    parser = argparse.ArgumentParser()
    parser.add_argument('--tyrell-spec', type=str, help='Path to the Tyrell specification file', default='semantic/lean.tyrell')
    args, _ = parser.parse_known_args() # Parse only known args to avoid conflicts
    
    # Default spec path from args or default
    default_spec_path = args.tyrell_spec
    
    # 修复：使用绝对路径直接访问minif2f目录
    # 获取当前文件的路径
    current_file = os.path.abspath(__file__)
    # 获取项目根目录（lean-pl-fix）
    project_root = os.path.dirname(current_file)
    vlog(f"Project root directory: {project_root}", logging.DEBUG)
    
    # 如果提供了文件路径，尝试根据文件编号选择特定规范
    if file_path:
        filename = os.path.basename(file_path)
        input_name = os.path.splitext(filename)[0]
        match = re.match(r'(\d+)', input_name)
        if match:
            file_number = int(match.group(1))
            
            # 先检查是否是local theorem错误（即使用have tyrell）
            if error is not None and error_line is not None:
                # 强制调用is_local_theorem_error进行调试跟踪
                is_local = is_local_theorem_error(error, error_line, file_path)
                vlog(f"Local theorem check for {filename} (line: {error.get('line', 'unknown')}): {is_local}", logging.INFO)
                
                if is_local:
                    # 构建have tyrell规范路径
                    have_spec_path = os.path.join(project_root, "minif2f", "have_tyrell_output", f"{input_name}.tyrell")
                    vlog(f"Looking for have tyrell spec at: {have_spec_path}", logging.INFO)
                    
                    if os.path.exists(have_spec_path):
                        vlog(f"Found have tyrell spec: {have_spec_path}", logging.INFO)
                        return have_spec_path
                    else:
                        vlog(f"Have tyrell spec not found: {have_spec_path}, falling back to static", logging.WARNING)
            
            # 尝试查找具体的static规范
            static_spec = os.path.join(project_root, "minif2f", "static_tyrell_output", f"{file_number}_static_filtered.tyrell")
            vlog(f"Looking for static tyrell spec at: {static_spec}", logging.DEBUG)
            
            if os.path.exists(static_spec):
                vlog(f"Using specific static tyrell spec for file {file_number}: {static_spec}", logging.INFO)
                return static_spec
            else:
                vlog(f"Static tyrell spec not found at: {static_spec}", logging.WARNING)
    
    # If no error info provided, return default spec
    if error is None or error_line is None:
        return default_spec_path
    
    # For any other case, use the static_tyrell_output directory if applicable
    if file_path:
        input_basename = os.path.basename(file_path)
        input_name = os.path.splitext(input_basename)[0]
        
        # 尝试查找文件号对应的static规范
        static_spec_path = os.path.join(project_root, "minif2f", "static_tyrell_output", f"{input_name}_static_filtered.tyrell")
        vlog(f"Looking for static tyrell spec at: {static_spec_path}", logging.DEBUG)
        
        # If the static spec exists, use it; otherwise fall back to default
        if os.path.exists(static_spec_path):
            vlog(f"Using static series spec file: {static_spec_path}", logging.INFO)
            return static_spec_path
        else:
            vlog(f"Static series spec file not found: {static_spec_path}, using default", logging.WARNING)
    
    # Fall back to default
    vlog(f"Using default spec file: {default_spec_path}", logging.INFO)
    return default_spec_path

def clean_no_goals_lines(code_lines, error_line_num, error_message):
    """
    Clean up lines when encountering 'no goals to be solved' error.
    Removes lines starting from the error line until encountering a line with less indentation.
    
    Args:
        code_lines: List of code lines
        error_line_num: Line number with the 'no goals to be solved' error (1-indexed)
        error_message: Error message text
        
    Returns:
        Tuple[List[str], bool]: (Updated code lines, whether cleanup was performed)
    """
    if "no goals to be solved" not in error_message.lower():
        return code_lines, False
    
    if error_line_num <= 0 or error_line_num > len(code_lines):
        return code_lines, False
    
    # Get indentation of error line
    error_line = code_lines[error_line_num - 1]
    indent_match = re.match(r'^(\s*)', error_line)
    if not indent_match:
        return code_lines, False
        
    error_indentation = indent_match.group(1)
    indent_level = len(error_indentation)
    
    # Determine which lines to remove
    lines_to_remove = []
    for i in range(error_line_num - 1, len(code_lines)):
        current_line = code_lines[i]
        # Check if line is empty or comment-only
        is_empty_or_comment = not current_line.strip() or current_line.strip().startswith('--')
        
        # Get current line indentation
        current_indent_match = re.match(r'^(\s*)', current_line)
        current_indent = current_indent_match.group(1) if current_indent_match else ""
        current_indent_level = len(current_indent)
        
        # If line has content and less indentation than error line, stop removing
        if (not is_empty_or_comment) and current_indent_level < indent_level:
            break
            
        # Otherwise, mark for removal
        lines_to_remove.append(i)
    
    # If no lines to remove, return original
    if not lines_to_remove:
        return code_lines, False
    
    # Create new code with lines removed
    new_code_lines = code_lines.copy()
    # Remove lines in reverse order to avoid index shifting
    for line_idx in reversed(lines_to_remove):
        del new_code_lines[line_idx]
    
    vlog(f"Removed {len(lines_to_remove)} lines starting from line {error_line_num} due to 'no goals to be solved' error")
    return new_code_lines, True

if __name__ == '__main__':
    main()
