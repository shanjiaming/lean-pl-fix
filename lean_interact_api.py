from lean_interact import LeanREPLConfig, LeanServer, Command, TempRequireProject
import json
import os
from typing import Tuple, List, Dict, Optional, Any

class REPLInstance:
    def __init__(self, work_dir: str = None, use_header_mode: bool = True):
        """
        Initialize a Lean REPL interface using lean_interact.
        
        Args:
            work_dir (str): Working directory for the REPL process
            use_header_mode (bool): Whether to use header mode (extract and reuse header)
        """
        self.work_dir = work_dir
        self.use_header_mode = use_header_mode
        self.running = False
        self._config = None
        self._server = None
        self._last_env = None
        self.current_header = None
        
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
            self._last_env = None
            self.running = True
            return True
        except Exception as e:
            print(f"Error starting Lean REPL: {e}")
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
        
        return header_code, code_without_head
    
    def start_head(self, cmd):
        """Set header code in the REPL"""
        try:
            response = self._server.run(Command(cmd=cmd))
            self._last_env = response.env
            self.current_header = cmd
            return True
        except Exception as e:
            print(f"Error running header in lean_interact: {e}")
            return False
    
    def parse_all_errors(self, result) -> List[Dict]:
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
                    # Handle different message formats
                    if hasattr(error_msg, 'pos'):
                        start_pos = error_msg.pos
                        end_pos = error_msg.endPos if hasattr(error_msg, 'endPos') else None
                        message = error_msg.data if hasattr(error_msg, 'data') else ""
                        severity = error_msg.severity if hasattr(error_msg, 'severity') else "error"
                    else:
                        start_pos = error_msg.get("pos", {})
                        end_pos = error_msg.get("endPos", {})
                        message = error_msg.get("data", "")
                        severity = error_msg.get("severity", "error")
                    
                    # Extract line and column info
                    if hasattr(start_pos, 'line'):
                        line = start_pos.line
                        column = start_pos.column
                        end_line = end_pos.line if end_pos else -1
                        end_column = end_pos.column if end_pos else -1
                    else:
                        line = start_pos.get("line", -1)
                        column = start_pos.get("column", -1)
                        end_line = end_pos.get("line", -1) if end_pos else -1
                        end_column = end_pos.get("column", -1) if end_pos else -1
                    
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
            print(f"Error parsing error messages: {str(e)}")
            
        return errors
    
    def locate_error(self, code) -> Tuple[bool, Optional[int], Optional[str]]:
        """
        Run code and find where the error is
        
        Returns:
            Tuple[bool, int, str]: (has_error, error_line, error_message)
        """
        # Execute the code
        result = self.execute(code)
        
        if "messages" not in result or not result["messages"]:
            return False, None, None
        
        try:
            # Parse error information
            if "messages" in result and len(result["messages"]) > 0:
                error_msg = result["messages"][0]
                
                # Handle different message formats
                if hasattr(error_msg, 'pos'):
                    start_pos = error_msg.pos
                    end_pos = error_msg.endPos if hasattr(error_msg, 'endPos') else None
                    error_message = error_msg.data if hasattr(error_msg, 'data') else ""
                else:
                    start_pos = error_msg.get("pos", {})
                    end_pos = error_msg.get("endPos", {})
                    error_message = error_msg.get("data", "")
                
                # Extract line info
                if hasattr(start_pos, 'line'):
                    error_line = start_pos.line
                    end_line = end_pos.line if end_pos else -1
                else:
                    error_line = start_pos.get("line", -1)
                    end_line = end_pos.get("line", -1) if end_pos else -1
                
                # Only handle errors where pos and endPos are on the same line
                if error_line == end_line and error_line > 0:
                    return True, error_line, error_message
                else:
                    print(f"Error spans multiple lines or line number is abnormal: {start_pos} -> {end_pos}")
                    return False, None, None
            else:
                print("No error messages found")
                return False, None, None
        except Exception as e:
            print(f"Error parsing error information: {str(e)}")
            return False, None, None
    
    def execute(self, code: str) -> Dict:
        """
        Execute Lean code and return parsed output
        
        Args:
            code: The Lean code to execute
            
        Returns:
            Dict: Parsed output containing error or result information
        """
        if not self.running:
            raise Exception("REPL is not running")
            return {"error": "REPL is not running"}
        
        try:
            if self.use_header_mode:
                # Extract header if present
                header_code, code_without_head = self.extract_header(code)
                
                # Handle the header if present
                if header_code and not self._last_env:
                    response = self._server.run(Command(cmd=header_code))
                    self._last_env = response.env
                
                # Execute the main code
                if self._last_env:
                    response = self._server.run(Command(cmd=code_without_head, env=self._last_env))
                else:
                    response = self._server.run(Command(cmd=code))
            else:
                # Execute the entire code at once
                response = self._server.run(Command(cmd=code))
            
            # Update last environment
            if hasattr(response, 'env'):
                self._last_env = response.env
                
            # Convert response to a format compatible with legacy format
            result = {"env": self._last_env}
            
            # Handle messages - convert to list of dicts if needed
            if hasattr(response, 'messages') and response.messages:
                result["messages"] = response.messages
            else:
                result["messages"] = []
                
            return result
        except Exception as e:
            return {"error": f"Execution failed: {str(e)}", "messages": []}
            
    def check(self, code: str) -> Tuple[bool, Dict]:
        """
        Check if code contains errors
        
        Args:
            code: The Lean code to check
            
        Returns:
            Tuple[bool, Dict]: (is_valid, result_or_error_info)
        """
        result = self.execute(code)
        has_error = "messages" in result and len(result["messages"]) > 0
        return not has_error, result
    
    def end(self) -> bool:
        """
        Terminate the Lean REPL process.
        
        Returns:
            bool: True if terminated successfully, False otherwise
        """
        # Currently no explicit shutdown in LeanServer
        self.running = False
        self._server = None
        self._config = None
        return True
    
    def run(self, cmd: str, raw=False, timeout: float = 200.0, wait_for_env: bool = True) -> Tuple[bool, str]:
        """
        Run a command in the Lean REPL and return the output.
        
        Args:
            cmd (str): The command to execute
            raw (bool): Whether cmd is already properly formatted
            timeout (float): Maximum time in seconds to wait for execution
            wait_for_env (bool): Whether to wait for "env" to appear in output
            
        Returns:
            Tuple[bool, str]: (success, output)
        """
        try:
            if raw:
                # Parse the JSON command
                cmd_data = json.loads(cmd)
                if "cmd" in cmd_data:
                    response = self._server.run(Command(cmd=cmd_data["cmd"]))
                elif "path" in cmd_data:
                    response = self._server.run(Command(path=cmd_data["path"]))
                else:
                    return False, "Unsupported command format"
            else:
                response = self._server.run(Command(cmd=cmd))
                
            if hasattr(response, 'env'):
                self._last_env = response.env
                
            # Convert response to string for compatibility
            return True, str(response)
        except Exception as e:
            return False, str(e)

# Initialize a global repl instance with the specified work directory
work_dir = "/data/coding/Goedel-Prover/mathlib4"
repl = REPLInstance(work_dir=work_dir, use_header_mode=True)

def example():
    """Example usage of the REPL"""
    # Use the global repl instance
    if not repl.running:
        repl.start()
    
    # Example 1: Code with header
    full_code = """import Mathlib
import Aesop
set_option maxHeartbeats 0
open BigOperators Real Nat Topology Rat

theorem mathd_algebra_182 (y : ℂ) : 7 * (3 * y + 2) = 21 * y + 14 := by
  rw [mul_add]
  rw [<- mul_assoc]
  norm_num"""
    
    result = repl.execute(full_code)
    print("Result 1:", result)
    
    # Example 2: Code without header (reusing previous header)
    code_no_header = """theorem mathd_algebra_182 (y : ℂ) : 7 * (3 * y + 2) = 21 * y + 14 := by
  rw [mul_add]
  rw [mul_assoc]
  norm_num"""
    
    result = repl.execute(code_no_header)
    print("Result 2:", result)
    
    # Test a simple theorem 
    response = repl.run('theorem ex (n : Nat) : n = 5 → n = 5 := id')
    print("Simple theorem response:", response)
    
    # Clean up
    repl.end()

if __name__ == "__main__":
    example() 