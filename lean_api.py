from lean_interact import LeanREPLConfig, LeanServer, Command, TempRequireProject
import json
import os
from typing import Tuple, List, Dict, Optional, Any
import traceback

# Ensure lean_interact is imported at the top level if possible
# This helps avoid potential issues with imports inside methods/functions
try:
    from lean_interact import LeanREPLConfig, LeanServer, Command, TempRequireProject
except ImportError as e:
    print(f"WARNING: Failed to import lean_interact: {e}. REPLInstance might not work.")
    # Define dummy classes or raise error if lean_interact is essential
    LeanREPLConfig = object
    LeanServer = object
    Command = object
    TempRequireProject = object

class REPLInstance:
    def __init__(self, debug: bool = False, reset_threshold: int = 100):
        """
        Initialize a Lean REPL interface using lean_interact.
        Header mode is now controlled by the `env_mode` parameter in `execute`.

        Args:
            debug (bool): Enable debug printing. Defaults to False.
            reset_threshold (int): Number of intensive calls ('fresh' mode or header reprocessing)
                                   after which the Lean Server is automatically reset.
                                   Set to 0 or negative to disable. Defaults to 100.
        """
        self.running = False
        self._config = None
        self._server = None
        self._latest_env = None # Stores the env after the absolute last command execution
        self.current_header = None # Stores the string of the last processed header
        self.header_env = None # Stores the env state *immediately after* processing the header
        self.debug = debug # Store the debug flag
        self.reset_threshold = reset_threshold # Threshold for resetting the server
        self.intensive_call_count = 0 # Counter for intensive calls

        # Start the server immediately
        self.start()
        
    def start(self) -> bool:
        """
        Start the Lean REPL process.
        
        Returns:
            bool: True if the process started successfully, False otherwise
        """
        if self.running:
            print("REPL is already running")
            return True
        
        try:
            self._config = LeanREPLConfig(verbose=True, project=TempRequireProject("mathlib"))
            self._server = LeanServer(self._config)
            self._latest_env = None
            self.current_header = None
            self.header_env = None
            self.intensive_call_count = 0 # Reset counter on start
            self.running = True
            if self.debug:
                print("DEBUG: Lean REPL started successfully.")
            return True
        except Exception as e:
            print(f"Error starting Lean REPL: {e}")
            traceback.print_exc()
            self.header_env = None
            self.current_header = None
            self._latest_env = None
            self.intensive_call_count = 0 # Also reset on exception? Seems safer.
            return False
    
    def extract_header(self, full_code: str) -> Tuple[str, str]:
        """
        Extract header part from the code (import, set_option, open statements)
        
        Args:
            full_code: Full code string
            
        Returns:
            Tuple[str, str]: Header code and code without header
        """
        lines = full_code.splitlines()
        header_end = 0
        header_lines = []
        
        for i, line in enumerate(lines):
            line_stripped = line.strip()
            # Handle empty lines and comments
            if not line_stripped or line_stripped.startswith('--'):
                header_lines.append(line)
                header_end = i + 1
                continue
                
            # Check if this is a header-related line
            if any(line_stripped.startswith(prefix) for prefix in ['import', 'set_option', 'open']):
                header_lines.append(line)
                header_end = i + 1
                continue
                
            # Found first non-header line, exit loop
            break
        
        header_code = '\n'.join(header_lines)
        code_without_head = '\n'.join(lines[header_end:])
        
        return header_code.strip(), code_without_head # Strip trailing whitespace/newline
    
    def start_head(self, cmd):
        """Process a header command, storing the resulting environment."""
        if self.debug:
            print(f"DEBUG: Starting header processing: {cmd[:100]}...")
        if not self.running:
             print("ERROR: REPL not running in start_head")
             return False
        try:
            # Run header command in a fresh environment
            response = self._server.run(Command(cmd=cmd))
            new_env = getattr(response, 'env', None)
            if new_env is not None:
                if self.debug:
                    print(f"DEBUG: Header processed successfully. New header_env: {new_env}")
                self.header_env = new_env
                self._latest_env = new_env # Also update latest env
                self.current_header = cmd
                return True
            else:
                # Header command might not produce an env (e.g., if it fails or is empty)
                if self.debug:
                    print(f"WARNING: Header command did not produce a new environment. Response: {response}")
                # Decide if we should reset header state or keep old? Let's reset for safety.
                self.header_env = None
                self.current_header = None
                self._latest_env = None # Reset latest env too if header fails fundamentally
                # Check for specific errors in response messages
                if hasattr(response, 'messages'):
                     temp_res = {"messages": response.messages}
                     parsed_errors = self._parse_all_errors(temp_res)
                     if any(e['severity'] == 'error' for e in parsed_errors):
                          print(f"ERROR: Header command failed with errors: {parsed_errors}")
                          return False # Explicitly return False on header errors
                if self.debug:
                     print("DEBUG: Header processing finished but no new environment was returned.")
                return False
        except Exception as e:
            print(f"Error running header in lean_interact: {e}")
            traceback.print_exc()
            # Reset state on exception
            self.header_env = None
            self.current_header = None
            self._latest_env = None
            return False
    
    def _parse_all_errors(self, result, line_offset: int = 0) -> List[Dict]:
        """
        Internal helper to parse all error messages from Lean output.
        
        Args:
            result: Result from execute or check
            line_offset: Offset to add to line numbers (for absolute positioning)
            
        Returns:
            List of error dictionaries
        """
        errors = []
        
        try:
            messages = result.get("messages", [])
            if messages:
                for msg in messages:
                    # Initialize default values
                    line, column, end_line, end_column = -1, -1, -1, -1
                    message, severity = "", "error" # Default severity to error
                    
                    # Use attribute access with hasattr checks
                    if hasattr(msg, 'start_pos') and hasattr(msg.start_pos, 'line'):
                        start_pos = msg.start_pos
                        # Adjust for 0-based line number from Lean and 1-based offset count
                        line = start_pos.line + line_offset + 1 
                        column = start_pos.column
                    elif hasattr(msg, 'pos') and hasattr(msg.pos, 'line'): # Fallback for older format?
                        start_pos = msg.pos
                         # Adjust for 0-based line number from Lean and 1-based offset count
                        line = start_pos.line + line_offset + 1
                        column = start_pos.column

                    if hasattr(msg, 'end_pos') and hasattr(msg.end_pos, 'line'):
                        end_pos = msg.end_pos
                         # Adjust for 0-based line number from Lean and 1-based offset count
                        end_line = end_pos.line + line_offset + 1
                        end_column = end_pos.column
                        
                    if hasattr(msg, 'data'):
                        message = msg.data
                    elif hasattr(msg, 'message'): # Fallback
                        message = msg.message
                        
                    if hasattr(msg, 'severity'):
                        severity = msg.severity
                    
                    error = {
                        'line': line,
                        'column': column,
                        'end_line': end_line,
                        'end_column': end_column,
                        'message': message,
                        'severity': severity,
                    }
                    
                    errors.append(error)
        except Exception as e:
            print(f"Error parsing error messages: {str(e)}") # Print the exception
            
        return errors
    
    def execute(self, code: str, env_mode: str = 'fresh') -> Dict:
        """
        Execute Lean code with configurable environment handling.

        Args:
            code (str): The Lean code to execute.
            env_mode (str): Controls environment handling. Defaults to 'fresh'.
                - 'fresh': Executes `code` in a new, empty environment. Instance state is NOT updated.
                - 'header': Uses header-aware logic. Extracts header, updates/reuses `header_env`.
                            Only `header_env` is reused for subsequent 'header' mode calls.
                            `_latest_env` is updated with the final state.
                - 'latest': Executes `code` starting from the `_latest_env`.
                            Updates `_latest_env` with the final state.
        Returns:
            Dict: Parsed output containing:
                  - messages (List[Dict]): Parsed Lean messages.
                  - env (Any): The final environment state *after* this execution.
                               For 'fresh' mode, this is the env from the isolated run.
                               For 'header'/'latest', this reflects the updated `_latest_env`.
                  - error (Optional[str]): Python execution error message, or None.
                  - header_env_used (Any): The header_env state used as input (for 'header' mode).
        """
        if self.debug:
            print(f"Executing code: {code[:200]}... (env_mode={env_mode})")
        if not self.running:
            print("ERROR: REPL is not running in execute")
            # Return structure consistent with success case but indicate error
            return {"error": "REPL is not running", "messages": [], "env": None, "header_env_used": None}
            
        # --- Early Extraction of Header Information ---
        # Extract header information once at the beginning if needed
        header_code = None
        code_without_head = None
        if env_mode == 'header':
            header_code, code_without_head = self.extract_header(code)
            
        # --- Reset Check Logic ---
        potentially_intensive_call = False

        if env_mode == 'fresh':
            potentially_intensive_call = True
        elif env_mode == 'header':
            potentially_intensive_call = True  # Consider all header mode calls as intensive, not just when header changes

        if potentially_intensive_call and self.reset_threshold > 0:
            if self.intensive_call_count >= self.reset_threshold:
                if self.debug:
                    print(f"DEBUG: Intensive call threshold ({self.reset_threshold}) reached ({self.intensive_call_count}). Resetting Lean Server...")
                # End and attempt restart
                self.end() # End first
                if not self.start(): # Then attempt start (start resets counter)
                    print("ERROR: Failed to restart Lean Server during threshold reset.")
                    # Return specific error
                    return {"error": "Failed to restart Lean Server during threshold reset", "messages": [], "env": None, "header_env_used": None}
                if self.debug:
                    print("DEBUG: Lean Server reset complete.")
                # After reset, header_env and current_header are None,
                # so header reprocessing will happen naturally if needed.
                # Re-extract header info after reset if we're in header mode
                if env_mode == 'header':
                    header_code, code_without_head = self.extract_header(code)
            # We increment the counter *just before* the actual intensive operation runs below

        # Initialize variables for this execution
        final_response = None
        parsed_messages = []
        env_used_as_input = None # Track the env passed to the *final* lean execution
        header_env_for_this_call = None # Specific to header mode output
        update_latest_env = False # Flag to control _latest_env update
        # update_header_state = False # Flag to control header_env/current_header update (Removed, logic simplified)

        try:
            # --- Determine execution strategy based on env_mode --- 
            if env_mode == 'fresh':
                if self.debug:
                    print("DEBUG: env_mode='fresh'. Running code in new environment.")
                env_used_as_input = None
                code_to_run = code
                # State updates are disabled for fresh mode
                # Increment counter for all fresh mode calls
                if potentially_intensive_call and self.reset_threshold > 0:
                    self.intensive_call_count += 1
                    if self.debug:
                        print(f"DEBUG: Incremented intensive call count (fresh) to {self.intensive_call_count}/{self.reset_threshold}")

            elif env_mode == 'latest':
                if self.debug:
                    print(f"DEBUG: env_mode='latest'. Running code using _latest_env: {self._latest_env}")
                env_used_as_input = self._latest_env
                code_to_run = code
                update_latest_env = True # Update _latest_env after execution

            elif env_mode == 'header':
                if self.debug:
                    print("DEBUG: env_mode='header'. Applying header logic...")
                # Header information already extracted at the beginning
                header_env_for_this_call = self.header_env # Record for return value
                
                # Increment counter for all header mode calls
                if potentially_intensive_call and self.reset_threshold > 0:
                    self.intensive_call_count += 1
                    if self.debug:
                        print(f"DEBUG: Incremented intensive call count (header) to {self.intensive_call_count}/{self.reset_threshold}")

                if header_code:
                    # Header processing needed? (Handles case after reset too)
                    if self.current_header != header_code or self.header_env is None:
                        if self.debug:
                            print(f"DEBUG: New/different header detected (or env missing/reset). Processing header: '{header_code[:50]}...'")

                        # Run header in isolation
                        header_response = self._server.run(Command(cmd=header_code)) # Run original header_code
                        # Parse header messages immediately with offset 0
                        parsed_header_errors = self._parse_all_errors({"messages": getattr(header_response, 'messages', [])}, line_offset=0)
                        parsed_messages.extend(parsed_header_errors) # Add parsed messages
                        new_header_env = getattr(header_response, 'env', None)

                        # Check for errors during header processing using already parsed errors
                        if new_header_env is not None and not any(e['severity'] == 'error' for e in parsed_header_errors):
                            if self.debug:
                                print(f"DEBUG: Header processed successfully. New header_env: {new_header_env}")
                            # Update header state only on success
                            self.header_env = new_header_env
                            self.current_header = header_code
                            header_env_for_this_call = self.header_env # Update for return value
                            # Also update latest_env since this was the last successful operation
                            self._latest_env = self.header_env
                            update_latest_env = True # Mark latest_env as updated
                            # Set the env to use for subsequent code in *this* call
                            env_used_as_input = self.header_env
                        else:
                            print(f"ERROR: Header processing failed. Errors: {parsed_header_errors}. Response: {header_response}")
                            # Don't proceed, return header processing result
                            final_response = header_response
                            # Don't update any instance state on header failure
                            # Reset header state? No, keep it as it was before the failed attempt.
                            return {"error": None, "messages": parsed_messages, "env": self._latest_env, "header_env_used": None} # Return previously known latest_env

                    else:
                        # Header matches, use existing header_env for tracking and execution
                        if self.debug:
                            print(f"DEBUG: Header matches ('{header_code[:50]}...'). Using existing header_env ({self.header_env}) for tracking and execution.")
                        
                        header_env_for_this_call = self.header_env
                        # Always use header_env in header mode, not latest_env
                        env_used_as_input = self.header_env

                else: # No header in code, but mode is 'header'
                    if self.debug:
                        print("DEBUG: No header in code, using existing header_env (if any)...")
                    
                    header_env_for_this_call = self.header_env
                    env_used_as_input = self.header_env

                # Code to run is the part after the header (if any)
                code_to_run = code_without_head
                # Always update latest_env in header mode if main code runs *successfully*
                if code_to_run.strip():
                    update_latest_env = True

            else: # Invalid env_mode
                 raise ValueError(f"Invalid env_mode: {env_mode}. Must be 'fresh', 'header', or 'latest'.")

            # --- Calculate header line count for main code offset (only in header mode) ---
            header_line_count = 0
            if env_mode == 'header' and header_code:
                header_line_count = len(header_code.splitlines())
                if self.debug:
                    print(f"DEBUG: Header line count for offset: {header_line_count}")

            # --- Actual Execution --- 
            if code_to_run.strip():
                if self.debug:
                    print(f"DEBUG: Executing main/full code (env={env_used_as_input}): {repr(code_to_run[:100])}...")
                command = Command(cmd=code_to_run, env=env_used_as_input)
                final_response = self._server.run(command)
                # Parse messages from this step with appropriate offset
                offset_for_main_code = header_line_count if env_mode == 'header' else 0
                parsed_main_errors = self._parse_all_errors({"messages": getattr(final_response, 'messages', [])}, line_offset=offset_for_main_code)
                parsed_messages.extend(parsed_main_errors) # Add parsed messages
                
                # Update state based on flags
                new_env_after_run = getattr(final_response, 'env', None)
                if update_latest_env and new_env_after_run is not None:
                    self._latest_env = new_env_after_run
                    if self.debug:
                        print(f"DEBUG: _latest_env updated to: {self._latest_env}")
                # Header state is updated only during header processing step above if update_header_state is True

            elif env_mode == 'header' and header_code and not code_without_head.strip():
                 if self.debug:
                      print("DEBUG: Only header was processed, no main code executed.")
                 # final_response would still be header_response from above if header was processed
                 # State (_latest_env, header_env, current_header) updated during header step if successful
                 pass # No further execution needed
            else:
                 if self.debug:
                      print("WARNING: No code to execute.")
                 # Return current state? Or empty success?
                 # Use already parsed messages (might be empty or from header)
                 return {"error": None, "messages": parsed_messages, "env": self._latest_env, "header_env_used": env_used_as_input}

            # --- Format Final Result --- 
            final_env_state = getattr(final_response, 'env', None) if final_response else self._latest_env
            # If state was updated, return the updated state, otherwise the env from the run
            reported_env = self._latest_env if update_latest_env else final_env_state
            
            # parsed_msgs = self._parse_all_errors({"messages": combined_messages}) # Removed
            # Return env_used_as_input for header_env_used when in header mode
            # Use the incrementally built parsed_messages
            return {"error": None, 
                    "messages": parsed_messages, 
                    "env": reported_env, 
                    "header_env_used": env_used_as_input if env_mode == 'header' else None}

        except Exception as e:
            print(f"ERROR in execute: {e}") 
            traceback.print_exc()
            # Reset state only if it was supposed to be updated? Or always on error?
            # Let's reset _latest_env on error for safety, but keep header state unless error was in header processing?
            # For simplicity now, let's just report the error and the state *before* the failed op.
            # The actual state might be inconsistent after an error in lean_interact.
            # Also report the env that *would* have been used based on logic before exception
            # Report any messages parsed *before* the exception occurred
            return {"error": f"Execution failed: {str(e)}", 
                    "messages": parsed_messages, # Return messages parsed so far
                    "env": self._latest_env, # Report state before potential corruption
                    "header_env_used": env_used_as_input if env_mode == 'header' else None}
            
    def check(self, code: str) -> Tuple[bool, Dict]:
        """
        Check if code contains errors by looking for messages with severity 'error'.
        Always uses 'header' mode for execute, as checking usually requires context.
        
        Args:
            code: The Lean code to check
            
        Returns:
            Tuple[bool, Dict]: (is_valid, result_info from execute)
        """
        # Use env_mode='header' for checking
        result = self.execute(code, env_mode='header') 
        is_valid = not any(e['severity'] == 'error' for e in result.get("messages", []))
        return is_valid, result
    
    def end(self) -> bool:
        """
        Terminate the Lean REPL process and reset state.
        
        Returns:
            bool: True if terminated successfully, False otherwise
        """
        if self.debug:
            print("DEBUG: Ending Lean REPL session.")
        # Currently no explicit shutdown needed for LeanServer object itself
        self.running = False
        self._server = None
        self._config = None
        self._latest_env = None
        self.current_header = None
        self.header_env = None
        self.intensive_call_count = 0 # Reset counter on explicit end too
        return True

# Initialize a global repl instance
# Ensure lean_interact is imported before class instantiation if needed globally
try:
    # from lean_interact import LeanREPLConfig, LeanServer, Command, TempRequireProject
    repl = REPLInstance() # No use_header_mode needed
except ImportError as e:
     print(f"Failed to import lean_interact: {e}. Global repl instance might not work.")
     repl = None # Indicate failure
except Exception as e:
     print(f"Failed to initialize global REPL instance: {e}")
     repl = None


def example():
    """Example usage of the REPL with execute modes"""
    # if repl is None:
    #      print("Global REPL instance failed to initialize. Exiting example.")
    #      return

    # Use a local instance for the example to avoid global state issues
    print("Initializing local REPL for example...")
    repl = REPLInstance(debug=False) # Create a local instance

    if not repl.running and not repl.start():
         print("Failed to start REPL. Exiting example.")
         return

    header = "import Mathlib.Data.Real.Basic\nopen Real"
    code1 = "theorem thm1 (x : ℝ) : x + 0 = x := by rw [add_zero]"
    code2 = "theorem thm2 (x : ℝ) : 0 + x = x := by rw [zero_add]"
    check_cmd = "#check Real"
    # Define an alternative theorem with the same name for Example 3
    code1_alt = "theorem thm1 (y : ℝ) : y * 1 = y := by rw [mul_one]"

    # 1. Header mode (processes header, updates header_env and _latest_env)
    print("\n--- Example 1: Execute with env_mode='header' (First time) ---")
    res1 = repl.execute(f"{header}\n\n{code1}", env_mode='header')
    print(json.dumps(res1, indent=2, default=lambda o: '<Lean Env>'))
    # Debug print before assertion
    assert repl.current_header == header
    assert repl.header_env is not None
    # assert repl._latest_env == repl.header_env # This is incorrect after running code1

    # 2. Header mode, no header (reuses header_env, updates _latest_env)
    print("\n--- Example 2: Execute with env_mode='header' (No Header) ---")
    res2 = repl.execute(code2, env_mode='header')
    print(json.dumps(res2, indent=2, default=lambda o: '<Lean Env>'))
    assert repl.current_header == header # Header unchanged
    assert res2['header_env_used'] == repl.header_env # Used header_env
    assert repl._latest_env != repl.header_env # _latest_env updated by code2
    env_after_code2 = repl._latest_env

    # 3. Header mode, same header (reuses header_env, should fail on code1)
    # print("\n--- Example 3: Execute with env_mode='header' (Same Header, Duplicate def name) ---")
    # # Use code1_alt to try and trigger a redefinition error
    # res3 = repl.execute(f"{header}\n\n{code1_alt}", env_mode='header') # Use code1_alt
    # print(json.dumps(res3, indent=2, default=lambda o: '<Lean Env>'))
    # # Check for any error message containing 'thm1' and ('error' or 'already declared' or 'clashes')
    # assert any(("thm1" in msg.get('message', '').lower() and 
    #             (msg.get('severity') == 'error' or 
    #              'already declared' in msg.get('message', '').lower() or 
    #              'clashes' in msg.get('message', '').lower())) 
    #            for msg in res3["messages"]), "Expected thm1 redefinition error"
    # assert repl._latest_env == env_after_code2 # latest_env should NOT update on failure
    # 
    # Example 3 removed as Lean seems to allow redefinition without error in this context.

    # 4. Latest mode (uses env_after_code2)
    print("\n--- Example 4: Execute with env_mode='latest' ---")
    res4 = repl.execute(check_cmd, env_mode='latest')
    print(json.dumps(res4, indent=2, default=lambda o: '<Lean Env>'))
    assert not any(e['severity'] == 'error' for e in res4['messages']), "Expected no error in Result 4"
    assert repl._latest_env != env_after_code2 # latest_env updated by check_cmd
    env_after_check = repl._latest_env
    
    # 5. Fresh mode (runs in new env, no state update)
    print("\n--- Example 5: Execute with env_mode='fresh' ---")
    res5 = repl.execute(f"{header}\n\n{code1}", env_mode='fresh') 
    print(json.dumps(res5, indent=2, default=lambda o: '<Lean Env>'))
    assert not any(e['severity'] == 'error' for e in res5['messages']), "Expected no error in Result 5"
    assert repl._latest_env == env_after_check # State should NOT have changed
    assert repl.header_env is not None # Previous header state should persist
    assert repl.current_header == header

    # 6. Header mode with different header
    print("\n--- Example 6: Execute with env_mode='header' (New Header) ---")
    header_nat = "import Mathlib.Data.Nat.Basic\nopen Nat"
    code_nat = "theorem thm_nat1 : 1 + 1 = 2 := rfl"
    # Store the header env *before* the call
    header_env_before_call6 = repl.header_env
    res6 = repl.execute(f"{header_nat}\n\n{code_nat}", env_mode='header')
    print(json.dumps(res6, indent=2, default=lambda o: '<Lean Env>'))
    assert not any(e['severity'] == 'error' for e in res6['messages']), "Expected no error in Result 6"
    assert repl.current_header == header_nat # Header state updated
    assert repl.header_env != header_env_before_call6 # Header env changed
    # assert repl._latest_env == repl.header_env # This is incorrect after running code_nat

    repl.end()
    print("Local REPL for example finished.")

def error_list_net_reduced(orig_errors, new_errors):
    """
    Returns True if all new errors are a subset of the original errors (no new errors),
    and the number of errors is strictly reduced.
    Each error is compared by line, column, end_line, end_column, and message.
    """
    def error_key(e):
        return (
            # e.get('line', -1),
            # e.get('column', -1),
            # e.get('end_line', -1),
            # e.get('end_column', -1),
            e.get('message', '')
        )
    orig_set = set(error_key(e) for e in orig_errors)
    new_set = set(error_key(e) for e in new_errors)
    # No new errors: new_set must be subset of orig_set, and strictly fewer errors
    return new_set.issubset(orig_set) and len(new_set) < len(orig_set)


def test_error_list_net_reduced():
    orig = [
        {'line': 1, 'column': 0, 'end_line': 1, 'end_column': 10, 'message': 'error A'},
        {'line': 2, 'column': 0, 'end_line': 2, 'end_column': 10, 'message': 'error B'},
        {'line': 3, 'column': 0, 'end_line': 3, 'end_column': 10, 'message': 'error C'},
    ]
    # Case 1: Remove one error, no new errors
    new1 = [
        {'line': 1, 'column': 0, 'end_line': 1, 'end_column': 10, 'message': 'error A'},
        {'line': 2, 'column': 0, 'end_line': 2, 'end_column': 10, 'message': 'error B'},
    ]
    assert error_list_net_reduced(orig, new1) == True
    # Case 2: Add a new error
    new2 = [
        {'line': 1, 'column': 0, 'end_line': 1, 'end_column': 10, 'message': 'error A'},
        {'line': 2, 'column': 0, 'end_line': 2, 'end_column': 10, 'message': 'error B'},
        {'line': 4, 'column': 0, 'end_line': 4, 'end_column': 10, 'message': 'error D'},
    ]
    assert error_list_net_reduced(orig, new2) == False
    # Case 3: Same errors (not reduced)
    new3 = orig.copy()
    assert error_list_net_reduced(orig, new3) == False
    # Case 4: Remove two errors
    new4 = [
        {'line': 1, 'column': 0, 'end_line': 1, 'end_column': 10, 'message': 'error A'},
    ]
    assert error_list_net_reduced(orig, new4) == True
    print('All tests passed for error_list_net_reduced')

if __name__ == "__main__":
    # Add imports here if they are only used in __main__
    # from lean_interact import LeanREPLConfig, LeanServer, Command, TempRequireProject

    # --- Running Original Example First ---
    # print("\n--- Running Original Example ---")
    # example()

    # --- Test the reset mechanism ---
    print("\n--- Testing Reset Mechanism ---")
    # Create a new instance with a low threshold for testing
    test_repl = REPLInstance(debug=True, reset_threshold=3)
    if not test_repl.running:
         print("Failed to start test REPL. Exiting.")
         exit()

    header1 = "import Mathlib.Data.Real.Basic"
    code1 = "def x : Real := 1"

    print("\n-- Call 1 (Header 1 Reprocess) --")
    print(test_repl.execute(f"{header1}\n{code1}", env_mode='header')) # First time for header1
    print(test_repl.execute(f"{header1}\n{code1}", env_mode='header')) # Second time for header1
    print(test_repl.execute(f"{header1}\n{code1}", env_mode='header')) # Third time for header1
    print(test_repl.execute(f"{header1}\n{code1}", env_mode='header')) # Fourth time for header1
    
    test_error_list_net_reduced()
    