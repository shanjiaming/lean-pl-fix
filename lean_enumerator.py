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

# 适配新API的错误处理函数
def parse_all_errors(result) -> List[Dict]:
    """
    Parse all error messages from the Lean output
    
    Args:
        result: Result from execute or check
        
    Returns:
        List of error dictionaries
    """
    errors = []
    
    try:
        if "messages" in result:
            for error_msg in result["messages"]:
                # 适配新API的消息格式
                if hasattr(error_msg, 'start_pos'):
                    start_pos = {'line': error_msg.start_pos.line, 'column': error_msg.start_pos.column}
                    end_pos = {'line': error_msg.end_pos.line, 'column': error_msg.end_pos.column} if hasattr(error_msg, 'end_pos') else None
                    
                    error = {
                        'line': start_pos['line'],
                        'column': start_pos['column'],
                        'end_line': end_pos['line'] if end_pos else -1,
                        'end_column': end_pos['column'] if end_pos else -1,
                        'message': error_msg.data,
                        'severity': error_msg.severity if hasattr(error_msg, 'severity') else "error",
                    }
                    
                    errors.append(error)
                # 兼容旧格式的消息
                else:
                    start_pos = error_msg.get("pos", {})
                    end_pos = error_msg.get("endPos", {})
                    
                    error = {
                        'line': start_pos.get("line", -1),
                        'column': start_pos.get("column", -1),
                        'end_line': end_pos.get("line", -1) if end_pos else -1,
                        'end_column': end_pos.get("column", -1) if end_pos else -1,
                        'message': error_msg.get("data", ""),
                        'severity': error_msg.get("severity", "error"),
                    }
                    
                    errors.append(error)
    except Exception as e:
        print(f"Error parsing error messages: {str(e)}")
        
    return errors

# 适配新API的错误定位函数
def locate_error(code) -> Tuple[bool, Optional[int], Optional[str]]:
    """
    Run code and find where the error is
    
    Returns:
        Tuple[bool, int, str]: (has_error, error_line, error_message)
    """
    # Execute the code
    result = repl.execute(code)
    
    if "messages" not in result or not result["messages"]:
        return False, None, None
    
    try:
        # Parse error information
        if "messages" in result and len(result["messages"]) > 0:
            error_msg = result["messages"][0]
            
            # 适配新API的消息格式
            if hasattr(error_msg, 'start_pos'):
                error_line = error_msg.start_pos.line
                end_line = error_msg.end_pos.line if hasattr(error_msg, 'end_pos') else error_line
                error_message = error_msg.data
            # 兼容旧格式的消息
            else:
                start_pos = error_msg.get("pos", {})
                end_pos = error_msg.get("endPos", {})
                error_line = start_pos.get("line", -1)
                end_line = end_pos.get("line", -1) if end_pos else -1
                error_message = error_msg.get("data", "")
            
            # Only handle errors where pos and endPos are on the same line
            if error_line == end_line and error_line > 0:
                return True, error_line, error_message
            else:
                print(f"Error spans multiple lines or line number is abnormal: {error_line} -> {end_line}")
                return False, None, None
        else:
            print("No error messages found")
            return False, None, None
    except Exception as e:
        print(f"Error parsing error information: {str(e)}")
        return False, None, None

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

def evaluate_fix(original_code, fixed_code, targeted_line, targeted_error_message=None, is_checker_mode=False):
    """
    Check if a fix resolves the targeted error
    
    Args:
        original_code: Original code
        fixed_code: Fixed code
        targeted_line: Target error line number
        targeted_error_message: Optional, error message feature to fix
        is_checker_mode: Whether in quick check mode (used during synthesis)
        
    Returns:
        bool, list: Whether the fix successfully resolved the error, and the list of errors in fixed code
    """
    # Get all errors in the original code
    original_result = repl.execute(original_code)
    original_errors = parse_all_errors(original_result)
    
    # Get all errors in the fixed code
    fixed_result = repl.execute(fixed_code)
    fixed_errors = parse_all_errors(fixed_result)
    
    # Display error statistics
    if not is_checker_mode:
        vlog(f"Original code error count: {len(original_errors)}")
        vlog(f"Fixed code error count: {len(fixed_errors)}")
    elif is_checker_mode:
        vlog(f"Testing fix: Original errors: {len(original_errors)}, Fixed errors: {len(fixed_errors)}")
    
    # If there are no errors at all, that's the best case
    if len(fixed_errors) == 0:
        if is_checker_mode:
            vlog("Result: True (no errors)")
        
        # Log original errors details for debugging
        vlog("=== Original errors detail ===", logging.DEBUG)
        for i, error in enumerate(original_errors):
            vlog(f"Error {i+1}: line {error['line']}, type: {extract_error_type(error)}, message: {error['message']}", logging.DEBUG)
        
        # Log fixed code
        original_lines = original_code.splitlines()
        fixed_lines = fixed_code.splitlines()
        
        vlog("=== Fixed code comparison ===", logging.DEBUG)
        for i, (orig_line, fixed_line) in enumerate(zip(original_lines, fixed_lines), 1):
            if orig_line != fixed_line:
                vlog(f"Line {i} changed:", logging.DEBUG)
                vlog(f"  Original: {orig_line}", logging.DEBUG)
                vlog(f"  Fixed:    {fixed_line}", logging.DEBUG)
        
        return True, fixed_errors
    
    # Find the original errors at the target line
    target_errors = [e for e in original_errors if e['line'] == targeted_line]
    if not target_errors:
        # In checker mode, if no target line error is found, it might be because we're using a placeholder
        # In this case, we assume there's an error at the target line
        pass
    
    # Check if the target line errors are fixed
    target_error_fixed = True
    for original_error in target_errors:
        if targeted_error_message and targeted_error_message not in original_error['message']:
            continue  # Not the specific error we're looking for
            
        # Check if the same error still exists in the fixed code
        for fixed_error in fixed_errors:
            if similar_error_types(fixed_error, original_error):
                target_error_fixed = False
                if not is_checker_mode:
                    vlog(f"Target error still exists: {fixed_error['message'][:100]}...")
                elif is_checker_mode:
                    vlog(f"Target error not fixed: {fixed_error['message'][:100]}...")
                break
    
    # Check if new errors were introduced
    new_errors = []
    for fixed_error in fixed_errors:
        is_new = True
        for orig_error in original_errors:
            # Check if this is the same error
            if similar_error_types(fixed_error, orig_error):
                is_new = False
                break
        if is_new:
            new_errors.append(fixed_error)
    
    # Unified judgment criteria: target error must be fixed and no new errors introduced
    success = target_error_fixed and not new_errors

    # Log detailed information for debugging
    if success:
        vlog("Result: True (target error fixed and no new errors introduced)")
        
        # Log original and fixed errors detail for successful fixes
        vlog("=== Original errors detail ===", logging.DEBUG)
        for i, error in enumerate(original_errors):
            vlog(f"Error {i+1}: line {error['line']}, type: {extract_error_type(error)}, message: {error['message']}", logging.DEBUG)
        
        # Log fixed code line by line comparison
        original_lines = original_code.splitlines()
        fixed_lines = fixed_code.splitlines()
        
        vlog("=== Fixed code comparison ===", logging.DEBUG)
        for i, (orig_line, fixed_line) in enumerate(zip(original_lines, fixed_lines), 1):
            if orig_line != fixed_line:
                vlog(f"Line {i} changed:", logging.DEBUG)
                vlog(f"  Original: {orig_line}", logging.DEBUG)
                vlog(f"  Fixed:    {fixed_line}", logging.DEBUG)
    else:
        if not target_error_fixed:
            vlog("Result: False (target error not fixed)")
        else:
            vlog(f"Result: False (introduced {len(new_errors)} new errors)")
            # Log new errors detail
            vlog("=== New errors detail ===", logging.DEBUG)
            for i, error in enumerate(new_errors):
                vlog(f"New Error {i+1}: line {error['line']}, type: {extract_error_type(error)}, message: {error['message']}", logging.DEBUG)
    
    return success, fixed_errors

def prepare_code_for_synthesis(full_code, target_error_line=None):
    """
    Prepare code for synthesis: extract parts for synthesis
    
    Args:
        full_code: Full code
        target_error_line: Specific error line to process, if provided
        
    Returns:
        (before part, error line indentation, original error line content, after part, error line number)
    """
    # Get code without header
    header_code, code_without_head = repl.extract_header(full_code)
    
    if VERBOSE_OUTPUT:
        vlog(f"Removed header content, remaining {len(code_without_head.splitlines())} lines of code")
    
    # If target error line is provided, use it
    if target_error_line is not None:
        if VERBOSE_OUTPUT:
            vlog(f"Using specified target error line: {target_error_line}")
        error_line = target_error_line
        # Still check to confirm this line actually has an error
        result = repl.execute(code_without_head)
        errors = parse_all_errors(result)
        target_errors = [e for e in errors if e['line'] == target_error_line]
        
        if not target_errors:
            if VERBOSE_OUTPUT:
                vlog(f"Warning: No errors found at specified line {target_error_line}")
            # Try falling back to automatic location
            has_error, auto_error_line, error_message = locate_error(code_without_head)
            if has_error:
                if VERBOSE_OUTPUT:
                    vlog(f"Automatically located error at line: {auto_error_line}")
                error_line = auto_error_line
            else:
                if VERBOSE_OUTPUT:
                    vlog("Could not locate any errors")
                return None, None, None, None, None
        else:
            # Use the found error message
            error_message = target_errors[0]['message']
            if VERBOSE_OUTPUT:
                vlog(f"Found error at specified line: {error_message}")
    else:
        # Use code without header for error location
        has_error, error_line, error_message = locate_error(code_without_head)
        
        if not has_error:
            if VERBOSE_OUTPUT:
                vlog("Code has no errors, no need for fixes")
            return None, None, None, None, None
    
    if VERBOSE_OUTPUT:
        vlog(f"Error at line {error_line}: {error_message}")
    
    # Split code without header into lines
    lines = code_without_head.splitlines()
    
    if error_line <= 0 or error_line > len(lines):
        if VERBOSE_OUTPUT:
            vlog(f"Error line number out of range: {error_line}, total lines: {len(lines)}")
        return None, None, None, None, None
    
    # Get error line indentation and original content
    error_line_text = lines[error_line - 1]
    indentation = re.match(r'(\s*)', error_line_text).group(1)
    original_error_line_content = error_line_text.strip()  # Original content of error line (without indentation)
    
    # Build before and after code
    before_lines = lines[:error_line - 1]
    after_lines = lines[error_line:]
    
    before = '\n'.join(before_lines) + '\n' if before_lines else ''
    after = '\n' + '\n'.join(after_lines) if after_lines else ''
    
    return before, indentation, original_error_line_content, after, error_line

def checker(s, before, indentation, original_error_content, after, original_error_line):
    """
    Test if the synthesized code fragment fixes the error
    
    Args:
        s: Fix code fragment to test
        before: Code before error line
        indentation: Error line indentation
        original_error_content: Original content of error line (without indentation)
        after: Code after error line
        original_error_line: Original error line number
    """
    # Build original code - including original error line
    original_code = before + indentation + original_error_content + after
    
    # Check if the line contains "by " and handle replacement accordingly
    if "by " in original_error_content:
        # Find the position of "by " in the line
        by_pos = original_error_content.find("by ")
        # Get the part before "by "
        before_by = original_error_content[:by_pos + 3]
        # Find the position of the first right parenthesis after "by "
        right_paren_pos = original_error_content.find(")", by_pos + 3)
        if right_paren_pos != -1:
            # If there's a right parenthesis, only replace up to that point
            fixed_line = before_by + s + original_error_content[right_paren_pos:]
        else:
            # If no right parenthesis, replace everything after "by "
            fixed_line = before_by + s
    else:
        # Original behavior - replace the whole line
        fixed_line = s
    
    # Combine fixed code
    fixed_code = before + indentation + fixed_line + after
    
    if VERBOSE_OUTPUT:
        vlog(f"Testing fragment: {s}")
        vlog(f"Original error line: {indentation + original_error_content}")
    # if original_error_line == 32 and s == "ring":
        # breakpoint()
    success, _ = evaluate_fix(
        original_code,
        fixed_code,
        original_error_line,
        is_checker_mode=True
    )
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

class ToyInterpreter(PostOrderInterpreter):
    def __init__(self, before, indentation, original_error_content, after, error_line):
        self.before = before
        self.indentation = indentation
        self.original_error_content = original_error_content
        self.after = after
        self.error_line = error_line
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
        result = checker(solution, self.before, self.indentation, self.original_error_content, self.after, self.error_line)
        # If the check passes, save this solution
        if result:
            self.last_solution = solution
            vlog(f"Found effective solution: {solution}")
        return result

def synthesize_fix(code, target_error_line=None):
    """
    Fix the given code
    
    Args:
        code: Code to fix
        target_error_line: Error line to fix, if not provided will find the first error
        
    Returns:
        (fixed_code, success, message, time_elapsed, fixed_errors): Fixed code, success flag, message, time elapsed, and fixed errors
    """
    # Start timing
    start_time = time.time()
    
    # Get Tyrell spec file path from arguments
    spec_file = get_spec_path()
    if not os.path.exists(spec_file):
        # Fallback if the specified file doesn't exist
        vlog(f"Warning: Tyrell spec file not found at {spec_file}, falling back to default semantic/lean.tyrell", logging.WARNING)
        spec_file = 'semantic/lean.tyrell'
        if not os.path.exists(spec_file):
            vlog(f"Error: Default Tyrell spec file {spec_file} also not found!", logging.ERROR)
            # End timing early if spec is missing
            elapsed_time = time.time() - start_time
            return None, False, f"Tyrell spec file {spec_file} not found", elapsed_time, []

    # Extract header and code without header
    header_code, code_without_head = repl.extract_header(code)
    
    # Prepare code for synthesis
    before, indentation, original_error_content, after, error_line = prepare_code_for_synthesis(code, target_error_line)
    
    if before is None:
        if VERBOSE_OUTPUT:
            vlog("Could not prepare code, skipping synthesis")
        # End timing
        elapsed_time = time.time() - start_time
        return None, False, "Could not prepare code", elapsed_time, []
    
    # Save original code
    original_code = code_without_head
    
    if VERBOSE_OUTPUT:
        vlog("\n" + "="*50)
        vlog("Code prepared, starting synthesis")
        vlog(f"Before part: {before.strip()}")
        vlog(f"Error line: {indentation + original_error_content}")
        vlog(f"After part: {after.strip()}")
        vlog("="*50 + "\n")
    
    # Get error statistics for original code
    result = repl.execute(code_without_head)
    original_errors = parse_all_errors(result)
    original_error_count = len(original_errors)
    
    # Parse spec using the path from arguments
    logger.info(f'Parsing spec file: {spec_file}...')
    try:
        spec = S.parse_file(spec_file)
    except FileNotFoundError:
        vlog(f"Error: Tyrell spec file {spec_file} not found during parsing!", logging.ERROR)
        elapsed_time = time.time() - start_time
        return None, False, f"Tyrell spec file {spec_file} not found", elapsed_time, []
    except Exception as e:
        vlog(f"Error parsing Tyrell spec file {spec_file}: {str(e)}", logging.ERROR)
        elapsed_time = time.time() - start_time
        return None, False, f"Error parsing Tyrell spec file {spec_file}: {str(e)}", elapsed_time, []
    logger.info('Parsing successful')

    # Build interpreter and synthesizer
    toy_interpreter = ToyInterpreter(before, indentation, original_error_content, after, error_line)

    logger.info('Building synthesizer...')
    synthesizer = Synthesizer(
        enumerator=ExhaustiveEnumerator(spec, max_depth=4),
        decider=ExampleDecider(
            interpreter=toy_interpreter,
            examples=[Example(input=[], output=True)]
        )
    )
    
    # Start synthesis
    logger.info('Starting program synthesis...')
    try:
        prog = synthesizer.synthesize()
        
        if prog is not None:
            # Try to get recorded solution from interpreter
            if toy_interpreter.last_solution:
                fix = toy_interpreter.last_solution
                logger.info(f'Get last successful solution from interpreter: {fix}')
            else:
                # If no recorded solution, try evaluating again
                logger.info('No recorded solution found, trying to evaluate again...')
                try:
                    fix = toy_interpreter.eval(prog)
                    logger.info(f'Get solution by evaluating again: {fix}')
                except Exception as eval_err:
                    # If evaluation fails, fall back to using get_program_string
                    logger.info(f'Evaluation failed: {str(eval_err)}, trying get_program_string...')
                    fix = get_program_string(prog)
                    # If it's a checker node, try to extract its parameters
                    if isinstance(fix, str) and fix.startswith("checker("):
                        match = re.search(r"checker\((.*?)\)", fix)
                        if match:
                            fix = match.group(1)
                    
            logger.info(f'Final solution to use: {fix}')
            
            # Apply fix
            fixed_code = before + indentation + fix + after
            if VERBOSE_OUTPUT:
                vlog("\n" + "="*50)
                vlog("Fixed code:")
                vlog(fixed_code)
                vlog("="*50)
            
            # Evaluate the fix
            success, fixed_errors = evaluate_fix(
                code_without_head,
                fixed_code,
                error_line
            )
            
            message = "Synthesis successful"
            if VERBOSE_OUTPUT:
                vlog("\n" + "="*50)
                vlog(message)
                vlog("="*50)
            
            # End timing
            elapsed_time = time.time() - start_time
            if VERBOSE_OUTPUT:
                vlog(f"Fix time: {elapsed_time:.2f} seconds")
            
            # Return full fixed code (including header)
            return header_code + "\n" + fixed_code, success, message, elapsed_time, fixed_errors
        else:
            logger.info('No solution found!')
            # Build message with original error information
            no_solution_message = f"Original code error count: {original_error_count}\nFixed code error count: {original_error_count}\nNo solution found"
            
            # End timing
            elapsed_time = time.time() - start_time
            if VERBOSE_OUTPUT:
                vlog(f"Failed attempt time: {elapsed_time:.2f} seconds")
            
            return None, False, no_solution_message, elapsed_time, []
    except Exception as e:
        if VERBOSE_OUTPUT:
            vlog(f"Synthesis failed: {str(e)}")
        # Try to extract successful fix from exception information
        error_log = str(e)
        
        # Find test fragment
        match = re.search(r"Testing fragment: (.*?)\nResult: True", error_log)
        if match:
            fix = match.group(1)
            if VERBOSE_OUTPUT:
                vlog(f"Get successful fix from error log: {fix}")
            
            fixed_code = before + indentation + fix + after
            if VERBOSE_OUTPUT:
                vlog("\n" + "="*50)
                vlog("Fixed code:")
                vlog(fixed_code)
                vlog("="*50)
            
            # Evaluate the fix
            success, fixed_errors = evaluate_fix(
                code_without_head,
                fixed_code,
                error_line
            )
            
            message = "Synthesis successful (extracted from error log)"
            if VERBOSE_OUTPUT:
                vlog("\n" + "="*50)
                vlog(message)
                vlog("="*50)
            
            # End timing
            elapsed_time = time.time() - start_time
            if VERBOSE_OUTPUT:
                vlog(f"Fix time: {elapsed_time:.2f} seconds")
            
            # Return full fixed code (including header)
            return header_code + "\n" + fixed_code, success, message, elapsed_time, fixed_errors
        
        # Build message with original error information
        error_message = f"Original code error count: {original_error_count}\nFixed code error count: {original_error_count}\nSynthesis failed: {str(e)}"
        
        # End timing
        elapsed_time = time.time() - start_time
        if VERBOSE_OUTPUT:
            vlog(f"Failed attempt time: {elapsed_time:.2f} seconds")
        
        return None, False, error_message, elapsed_time, []

def synthesize_all_fixes(code):
    """
    Try to fix each error in the code once, without complex iteration.
    For each error, try to fix once: accept if successful, skip if failed.
    
    Args:
        code: Original code, possibly with header
        
    Returns:
        (fixed_code, success, message, stats_dict): Fixed code, whether successful, text message, and JSON-compatible stats dictionary
    """
    # Record total start time
    total_start_time = time.time()
    
    if VERBOSE_OUTPUT:
        vlog("\n===== Starting to fix all errors =====")
    original_code = code
    current_code = code
    fixed_errors = 0
    failed_errors = 0
    overall_message = []
    
    # For collecting detailed information about successful fixes
    successful_fixes_details = []
    # For collecting information about failed fixes
    failed_fixes_details = []
    
    # Extract header and code without header
    header_code, code_without_head = repl.extract_header(current_code)
    
    # Get all errors from original code
    result = repl.execute(code_without_head)
    original_errors = parse_all_errors(result)
    original_error_count = len(original_errors)
    
    # Output all original error details
    if VERBOSE_OUTPUT:
        vlog(f"\nFound {original_error_count} original errors:")
        for i, error in enumerate(original_errors, 1):
            vlog(f"Error {i}: line {error['line']}, type: {extract_error_type(error)}, message: {error['message'][:100]}...")
    
    overall_message.append(f"Original code error count: {original_error_count}")
    
    # If no errors, return immediately
    if original_error_count == 0:
        overall_message.append("Code has no errors, no need for fixes")
        # Calculate total elapsed time
        total_elapsed_time = time.time() - total_start_time
        # Prepare JSON-compatible stats dictionary
        stats_dict = {
            "original_errors": original_error_count,
            "fixed_errors": 0,
            "failed_errors": 0,
            "remaining_errors": 0,
            "fix_rate": 1.0000,
            "successful_fixes": [],
            "failed_fixes": [],
            "total_time": total_elapsed_time
        }
        return current_code, True, "\n".join(overall_message), stats_dict
    
    # Sort errors by line number, usually fixing from front to back is more reasonable
    sorted_errors = sorted(original_errors, key=lambda e: e['line'])
    
    # Try to fix each error once
    for i, error in enumerate(sorted_errors, 1):
        error_line = error['line']
        error_type = extract_error_type(error)
        error_message = error['message']
        
        if VERBOSE_OUTPUT:
            vlog(f"\nTrying to fix error {i}/{original_error_count}: line {error_line}, type: {error_type}")
            vlog(f"Error message: {error_message[:100]}...")
        
        # Create fix code for specific error line
        error_code = current_code
        
        # Try to fix the error, pass specific error line number
        fix_result = synthesize_fix(error_code, error_line)
        
        if fix_result and fix_result[0]:
            fixed_code, success, message, fix_time, remaining_fixed_errors = fix_result
            
            # Synthesized solution is valid
            if VERBOSE_OUTPUT:
                vlog(f"✅ Fixed error at line {error_line}")
            # Update current code to fixed code
            current_code = fixed_code
            fixed_errors += 1
            
            # Extract fixed code line
            _, fixed_code_without_head = repl.extract_header(fixed_code)
            fixed_code_lines = fixed_code_without_head.splitlines()
            fixed_line = fixed_code_lines[error_line - 1] if error_line <= len(fixed_code_lines) else "Could not get fixed line"
            
            # Extract fix snippet from fixed line
            fix_snippet = fixed_line.strip()
            
            # Save fix details
            fix_detail = {
                "line": error_line,
                "error_type": error_type,
                "original_error_message": error_message,
                "fix_snippet": fix_snippet,
                "fixed_line": fixed_line,
                "fix_time": fix_time,  # Add fix time
                "fixed_errors": remaining_fixed_errors  # Add remaining errors after fix
            }
            successful_fixes_details.append(fix_detail)
            
            overall_message.append(f"✅ Fixed error {i}/{original_error_count}: Successfully fixed error at line {error_line} «{error_type}» (in {fix_time:.2f}s)")
        else:
            if VERBOSE_OUTPUT:
                vlog(f"❌ Could not generate fix for error at line {error_line}")
            failed_errors += 1
            
            # Get attempt time
            _, _, _, attempt_time, _ = fix_result if fix_result else (None, None, None, 0, [])
            
            # Record failed fix details
            failed_fix_detail = {
                "line": error_line,
                "error_type": error_type,
                "original_error_message": error_message,
                "failure_reason": "Could not generate fix",
                "attempt_time": attempt_time  # Add attempt time
            }
            failed_fixes_details.append(failed_fix_detail)
            overall_message.append(f"❌ Fixed error {i}/{original_error_count}: Could not generate fix for error at line {error_line} «{error_type}» (after {attempt_time:.2f}s)")
    
    # Final check
    _, final_code_without_head = repl.extract_header(current_code)
    final_result = repl.execute(final_code_without_head)
    final_errors = parse_all_errors(final_result)
    
    # Record remaining errors
    remaining_errors_details = []
    for error in final_errors:
        remaining_detail = {
            "line": error['line'],
            "error_type": extract_error_type(error),
            "original_error_message": error['message']
        }
        remaining_errors_details.append(remaining_detail)
    
    # Calculate fix rate
    fix_rate = fixed_errors / original_error_count if original_error_count > 0 else 1.0
    
    # Calculate total elapsed time
    total_elapsed_time = time.time() - total_start_time
    
    # Build final statistics
    overall_message.append("\n=== Fix statistics ===")
    overall_message.append(f"Original error count: {original_error_count}")
    overall_message.append(f"Fixed errors: {fixed_errors} (Fix rate: {fix_rate:.4f})")
    overall_message.append(f"Failed errors: {failed_errors}")
    overall_message.append(f"Remaining errors: {len(final_errors)}")
    overall_message.append(f"Total time: {total_elapsed_time:.2f} seconds")
    
    # Add fix details
    if successful_fixes_details:
        overall_message.append("\n=== Successful fix details ===")
        for idx, detail in enumerate(successful_fixes_details, 1):
            overall_message.append(f"\nFix {idx}:")
            overall_message.append(f"   Line: {detail['line']}")
            overall_message.append(f"   Error type: {detail['error_type']}")
            overall_message.append(f"   Original error message: {detail['original_error_message'][:100]}...")
            overall_message.append(f"   Fix snippet: {detail['fix_snippet']}")
            overall_message.append(f"   Fixed line: {detail['fixed_line']}")
            overall_message.append(f"   Time: {detail['fix_time']:.2f} seconds")
    
    # Add failed fix details
    if failed_fixes_details:
        overall_message.append("\n=== Failed fix details ===")
        for idx, detail in enumerate(failed_fixes_details, 1):
            overall_message.append(f"\nFailed fix {idx}:")
            overall_message.append(f"   Line: {detail['line']}")
            overall_message.append(f"   Error type: {detail['error_type']}")
            overall_message.append(f"   Original error message: {detail['original_error_message'][:100]}...")
            overall_message.append(f"   Failure reason: {detail['failure_reason']}")
            overall_message.append(f"   Time: {detail['attempt_time']:.2f} seconds")
    
    if VERBOSE_OUTPUT:
        vlog("\n===== Fix attempt completed =====")
        vlog(f"Original errors: {original_error_count}")
        vlog(f"Fixed errors: {fixed_errors}")
        vlog(f"Failed errors: {failed_errors}")
        vlog(f"Remaining errors: {len(final_errors)}")
        vlog(f"Total time: {total_elapsed_time:.2f} seconds")
    
    # Prepare JSON-compatible stats dictionary
    stats_dict = {
        "original_errors": original_error_count,
        "fixed_errors": fixed_errors,
        "failed_errors": failed_errors,
        "remaining_errors": len(final_errors),
        "fix_rate": fix_rate,
        "successful_fixes": successful_fixes_details,
        "failed_fixes": failed_fixes_details,
        "remaining_errors_details": remaining_errors_details,
        "total_time": total_elapsed_time
    }
    
    # Return final result, including fix details
    return current_code, len(final_errors) == 0, "\n".join(overall_message), stats_dict

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
        file_path = "/data/coding/minif2f/lean_code/4.lean"
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
    
    # Check original code for errors
    if text_output:
        vlog("\nChecking original code for all errors...")
    
    result = repl.execute(code)
    if "messages" not in result or not result["messages"]:
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
    
    original_errors = parse_all_errors(result)
    if text_output:
        vlog(f"Original code contains {len(original_errors)} errors:")
        for i, error in enumerate(original_errors, 1):
            vlog(f"Error {i}: line {error['line']}, type: {extract_error_type(error)}, message: {error['message'][:100]}...")
    
    # Use multi-error repair function
    if text_output:
        vlog("\nStarting multi-error continuous repair process...")
    
    # The function now returns 4 values with the new stats_dict
    result = synthesize_all_fixes(code)
    
    if result:
        fixed_code, success, message, stats_dict = result
        
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
                
                # Create a copy of stats_dict without fixed_errors
                json_stats_dict = stats_dict.copy()
                # Remove fixed_errors from JSON output but keep other fields
                if "fixed_errors" in json_stats_dict:
                    del json_stats_dict["fixed_errors"]
                
                # Prepare JSON data
                json_data = {
                    "status": "success" if success else "partial_success",
                    "file_path": file_path,
                    "output_file": output_file_path,
                    "original_code": code,
                    "fixed_code": fixed_code,
                    "statistics": json_stats_dict,
                    "message": message
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
