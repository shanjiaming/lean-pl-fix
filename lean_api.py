import os
import pty
import subprocess
import threading
import time
import io
import fcntl
import select
import signal
import json
import re
from typing import Tuple, List, Dict, Optional, Any

class LakeREPL:
    def __init__(self, work_dir: str = None):
        """
        Initialize a Lake REPL interface.
        
        Args:
            work_dir (str): Working directory for the REPL process
        """
        self.work_dir = work_dir
        self.process = None
        self.master_fd = None
        self.running = False
        self.output_thread = None
        self.collected_output = []
        self.output_lock = threading.Lock()
        self.sentinel_value = None
        self.sentinel_found = threading.Event()
        self.current_header = None
        
    def start(self) -> bool:
        """
        Start the Lake REPL process.
        
        Returns:
            bool: True if the process started successfully, False otherwise
        """
        if self.running:
            print("REPL is already running")
            return False
        
        try:
            # Create a pseudo-terminal
            master_fd, slave_fd = pty.openpty()
            
            # Make the master file descriptor non-blocking
            flags = fcntl.fcntl(master_fd, fcntl.F_GETFL)
            fcntl.fcntl(master_fd, fcntl.F_SETFL, flags | os.O_NONBLOCK)
            
            # Start Lake REPL process
            self.process = subprocess.Popen(
                ["lake", "exe", "repl"],
                stdin=slave_fd,
                stdout=slave_fd,
                stderr=slave_fd,
                text=True,
                start_new_session=True,
                cwd=self.work_dir
            )
            
            # Close the slave fd in the parent process
            os.close(slave_fd)
            
            self.master_fd = master_fd
            self.running = True
            self.collected_output = []
            
            # Start the output reading thread
            self.output_thread = threading.Thread(target=self._read_output)
            self.output_thread.daemon = True
            self.output_thread.start()
            return True
            
        except Exception as e:
            print(f"Error starting Lake REPL: {e}")
            if self.process:
                self.process.terminate()
            return False

    def start_head(self, cmd):
        """Set header code in the REPL"""
        cmd = repr(cmd)[1:-1]
        cmd_to_send = r'{"cmd": "' + cmd + r'"}'
        success, output = self.run(cmd_to_send, raw=True)
        self.current_header = cmd
        return success
    
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
    
    def parse_output(self, text: str) -> Dict:
        """
        Parse JSON output from Lean, focusing on the response or error messages
        
        Args:
            text: Raw output text from Lean
            
        Returns:
            Dict: JSON object containing response or error messages
        """
        if isinstance(text, dict):
            return text
            
        json_objects = []
        current_pos = 0
        
        while current_pos < len(text):
            try:
                next_start = text.find('{', current_pos)
                if next_start == -1:
                    break
                
                decoder = json.JSONDecoder()
                obj, end = decoder.raw_decode(text[next_start:])
                
                json_objects.append(obj)
                current_pos = next_start + end
                
            except json.JSONDecodeError:
                current_pos += 1
        
        # Return the object with error messages
        for obj in json_objects:
            if "messages" in obj and len(obj["messages"]) > 0:
                return obj
        
        # Second object is typically the response (not the echo of the command)
        if len(json_objects) >= 2:
            return json_objects[1]
        
        # Fallback to first object
        if json_objects:
            return json_objects[0]
            
        return {"error": "No JSON objects found in output"}

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
                start_pos = error_msg.get("pos", {})
                end_pos = error_msg.get("endPos", {})
                error_line = start_pos.get("line", -1)
                end_line = end_pos.get("line", -1)
                error_message = error_msg.get("data", "")
                
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
            return {"error": "REPL is not running"}
        
        # Extract header if present
        header_code, code_without_head = self.extract_header(code)
        
        # Handle header
        if header_code:
            if self.current_header is None:
                self.start_head(header_code)
            elif self.current_header != header_code:
                return {"error": "Header mismatch with previously set header"}
        
        # Execute the code without header
        escaped_code = code_without_head.replace('\\', '\\\\').replace('"', '\\"').replace('\n', '\\n')
        cmd_to_send = r'{"cmd": "' + escaped_code + r'", "env": 0}'
        
        success, output = self.run(cmd_to_send, raw=True)
        if not success:
            return {"error": "Execution failed", "details": output}
            
        # Parse the output - ensure we get the actual response, not the echo
        return self.parse_output(output)
    
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
        Terminate the Lake REPL process.
        
        Returns:
            bool: True if terminated successfully, False otherwise
        """
        if not self.running:
            print("No REPL is running")
            return False
        
        try:
            # First try gentle exit with Ctrl+D
            try:
                os.write(self.master_fd, b"\x04")
                time.sleep(1)
            except:
                pass
            
            # Terminate if still running
            if self.process.poll() is None:
                self.process.terminate()
                self.process.wait(timeout=2)
            
            # Kill if still running
            if self.process.poll() is None:
                self.process.kill()
                self.process.wait(timeout=1)
            
            # Close the master fd
            os.close(self.master_fd)
            
            # Update status
            self.running = False
            
            # Wait for thread to exit
            if self.output_thread and self.output_thread.is_alive():
                self.output_thread.join(timeout=1)
            
            return True
            
        except Exception as e:
            print(f"Error ending Lake REPL: {e}")
            return False

    def run(self, cmd: str, raw=False, timeout: float = 600.0, wait_for_env: bool = True) -> Tuple[bool, str]:
        """
        Run a command in the Lake REPL and return the output.
        For Lake REPL, we append two newlines to each command as specified.
        
        Args:
            cmd (str): The command to execute
            raw (bool): Whether cmd is already properly formatted
            timeout (float): Maximum time in seconds to wait for execution
            wait_for_env (bool): Whether to wait for "env" to appear in output
            
        Returns:
            Tuple[bool, str]: (success, output)
        """
        if not self.running:
            return False, "REPL is not running. Call start() first."
        
        try:
            # Clear previous output
            with self.output_lock:
                self.collected_output = []
            
            # Send the command with two newlines as specified
            if not raw:
                cmd = r'{"cmd": "' + cmd + r'", "env": 0}'
            cmd_to_send = cmd.rstrip() + "\n\n"
            os.write(self.master_fd, cmd_to_send.encode())
            
            # Wait for execution to complete
            start_time = time.time()
            def judge():
                return (r'"ast":' in "".join(self.collected_output)) or (r'"messages":' in "".join(self.collected_output))

            if wait_for_env:
                while not judge() and time.time() - start_time < timeout:
                    time.sleep(0.01)
                
                execution_complete = judge()
            else:
                # Wait a fixed amount of time if not looking for "env"
                time.sleep(min(3.0, timeout))
                execution_complete = True
            
            # Get the output
            with self.output_lock:
                output = "".join(self.collected_output)
                
            if not execution_complete:
                # Try to interrupt the current execution with Ctrl+C if timed out
                os.write(self.master_fd, b"\x03")
                return False, f"Execution timed out after {timeout} seconds. Partial output:\n{output}"
            
            return True, output
            
        except Exception as e:
            return False, f"Error executing command: {e}"
    
    def _read_output(self):
        """
        Thread function to continuously read output from the REPL process.
        """
        buffer = b""
        
        while self.running:
            try:
                # Wait for data to be available
                rlist, _, _ = select.select([self.master_fd], [], [], 0.01)
                
                if self.master_fd in rlist:
                    # Read available data
                    chunk = os.read(self.master_fd, 4096)
                    if not chunk:
                        time.sleep(0.01)
                        continue
                    
                    # Decode the chunk
                    try:
                        text = chunk.decode()
                        
                        # Add to output buffer
                        with self.output_lock:
                            self.collected_output.append(text)
                            
                    except UnicodeDecodeError:
                        # Handle potential decoding errors
                        buffer += chunk
                        try:
                            text = buffer.decode()
                            buffer = b""
                            
                            # Add to output buffer
                            with self.output_lock:
                                self.collected_output.append(text)
                                
                        except UnicodeDecodeError:
                            pass  # Keep accumulating in buffer
            
            except OSError:
                # Process terminated or error in reading
                break
            except Exception as e:
                print(f"Error in output thread: {e}")
                break

# Initialize a global repl instance with the specified work directory
work_dir = "/data/coding/Goedel-Prover/mathlib4"
repl = LakeREPL(work_dir=work_dir)

def example():
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
    
    # Check code for errors
    is_valid, check_result = repl.check(code_no_header)
    print("Check result:", is_valid, check_result)

if __name__ == "__main__":
    example()
    
    # Additional test to verify global repl works
    print("\nSimple test of global repl instance:")
    if not repl.running:
        repl.start()
    
    test_code = "theorem test_theorem (x : ℝ): x + 0 = x := by\n  rw [add_zero]"
    result = repl.execute(test_code)
    print("Test result:", result)
    
    # End the repl when done
    repl.end()