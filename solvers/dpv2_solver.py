from typing import Dict, Any, Union, Optional, List
import subprocess
import tempfile
import os
import time
from pathlib import Path

from .base_solver import BaseSolver, SolverResult, SolverStatus, SolverConfig
from data_management.unified_problem_manager import Problem, problem_manager


class DPV2Solver(BaseSolver):
    """
    DPV2-based solver that uses the DPV2 system for proof generation.
    """
    
    def __init__(self, name: str = "DPV2Solver", 
                 dpv2_path: Optional[str] = None,
                 config: Optional[SolverConfig] = None):
        super().__init__(name, config)
        self.dpv2_path = dpv2_path or self._find_dpv2_path()
        self.temp_dir = None
        self._setup_temp_directory()
    
    def _find_dpv2_path(self) -> str:
        """Find DPV2 installation path"""
        # Try common locations
        possible_paths = [
            "/usr/local/bin/dpv2",
            "/usr/bin/dpv2",
            "dpv2",  # In PATH
            "./dpv2",  # Local directory
            "../dpv2/dpv2",  # Relative path
        ]
        
        for path in possible_paths:
            if os.path.exists(path) or self._check_command_exists(path):
                return path
        
        # If not found, return default and let it fail gracefully
        return "dpv2"
    
    def _check_command_exists(self, command: str) -> bool:
        """Check if a command exists in PATH"""
        try:
            subprocess.run([command, "--version"], 
                         capture_output=True, 
                         timeout=5)
            return True
        except (subprocess.TimeoutExpired, subprocess.CalledProcessError, FileNotFoundError):
            return False
    
    def _setup_temp_directory(self):
        """Setup temporary directory for DPV2 operations"""
        if self.temp_dir is None:
            self.temp_dir = tempfile.mkdtemp(prefix="dpv2_solver_")
    
    def _cleanup_temp_directory(self):
        """Cleanup temporary directory"""
        if self.temp_dir and os.path.exists(self.temp_dir):
            import shutil
            shutil.rmtree(self.temp_dir, ignore_errors=True)
            self.temp_dir = None
    
    def solve(self, problem: Union[Problem, str], **kwargs) -> SolverResult:
        """
        Solve a problem using DPV2.
        
        Args:
            problem: Either a Problem object or a string containing the problem
            **kwargs: Additional parameters for DPV2
            
        Returns:
            SolverResult containing the solution
        """
        start_time = time.time()
        
        try:
            # Extract problem content
            if isinstance(problem, Problem):
                header_content = problem_manager.get_header_content(problem)
                problem_content = problem_manager.get_problem_content(problem)
                full_content = problem_manager.get_full_content(problem)
            else:
                problem_content = str(problem)
                header_content = ""
                full_content = problem_content
            
            # Prepare the input for DPV2
            lean_content = self._prepare_lean_content(header_content, problem_content)
            
            # Write to temporary file
            temp_file = os.path.join(self.temp_dir, "problem.lean")
            with open(temp_file, 'w') as f:
                f.write(lean_content)
            
            # Run DPV2
            result = self._run_dpv2(temp_file, **kwargs)
            
            execution_time = time.time() - start_time
            
            if result['success']:
                return SolverResult(
                    status=SolverStatus.SUCCESS,
                    solution=result['solution'],
                    original_problem=full_content,
                    execution_time=execution_time,
                    metadata={
                        'dpv2_version': result.get('version'),
                        'dpv2_output': result.get('output'),
                        'dpv2_command': result.get('command')
                    }
                )
            else:
                return SolverResult(
                    status=SolverStatus.FAILURE,
                    original_problem=full_content,
                    execution_time=execution_time,
                    error_message=result.get('error', 'DPV2 failed to solve the problem'),
                    metadata={
                        'dpv2_output': result.get('output'),
                        'dpv2_command': result.get('command')
                    }
                )
                
        except Exception as e:
            execution_time = time.time() - start_time
            return SolverResult(
                status=SolverStatus.ERROR,
                original_problem=self._extract_problem_content(problem),
                execution_time=execution_time,
                error_message=str(e)
            )
    
    def _prepare_lean_content(self, header_content: str, problem_content: str) -> str:
        """Prepare Lean content for DPV2"""
        content_parts = []
        
        if header_content.strip():
            content_parts.append(header_content.strip())
        
        if problem_content.strip():
            content_parts.append(problem_content.strip())
        
        return '\n\n'.join(content_parts)
    
    def _run_dpv2(self, input_file: str, **kwargs) -> Dict[str, Any]:
        """
        Run DPV2 on the input file.
        
        Args:
            input_file: Path to the Lean file
            **kwargs: Additional DPV2 parameters
            
        Returns:
            Dictionary with result information
        """
        try:
            # Build DPV2 command
            cmd = [self.dpv2_path]
            
            # Add common DPV2 options
            if kwargs.get('timeout'):
                cmd.extend(['--timeout', str(kwargs['timeout'])])
            
            if kwargs.get('max_depth'):
                cmd.extend(['--max-depth', str(kwargs['max_depth'])])
            
            if kwargs.get('verbose', self.config.debug):
                cmd.append('--verbose')
            
            # Add the input file
            cmd.append(input_file)
            
            # Set timeout from config if not specified
            timeout = kwargs.get('timeout') or self.config.timeout or 300  # 5 minutes default
            
            if self.config.debug:
                print(f"Running DPV2 command: {' '.join(cmd)}")
            
            # Run DPV2
            result = subprocess.run(
                cmd,
                capture_output=True,
                text=True,
                timeout=timeout,
                cwd=self.temp_dir
            )
            
            output = result.stdout
            error_output = result.stderr
            
            if self.config.debug:
                print(f"DPV2 stdout: {output}")
                print(f"DPV2 stderr: {error_output}")
            
            # Parse DPV2 output
            if result.returncode == 0:
                # DPV2 succeeded
                solution = self._parse_dpv2_output(output)
                return {
                    'success': True,
                    'solution': solution,
                    'output': output,
                    'command': ' '.join(cmd)
                }
            else:
                # DPV2 failed
                return {
                    'success': False,
                    'error': error_output or output,
                    'output': output,
                    'command': ' '.join(cmd)
                }
                
        except subprocess.TimeoutExpired:
            return {
                'success': False,
                'error': f'DPV2 timed out after {timeout} seconds',
                'command': ' '.join(cmd)
            }
        except FileNotFoundError:
            return {
                'success': False,
                'error': f'DPV2 executable not found at {self.dpv2_path}',
                'command': ' '.join(cmd)
            }
        except Exception as e:
            return {
                'success': False,
                'error': f'Error running DPV2: {str(e)}',
                'command': ' '.join(cmd) if 'cmd' in locals() else 'unknown'
            }
    
    def _parse_dpv2_output(self, output: str) -> str:
        """
        Parse DPV2 output to extract the solution.
        
        Args:
            output: Raw DPV2 output
            
        Returns:
            Extracted solution
        """
        # DPV2 output parsing logic
        # This is a simplified version - actual parsing may need to be more sophisticated
        
        lines = output.split('\n')
        solution_lines = []
        in_solution = False
        
        for line in lines:
            # Look for solution markers
            if 'theorem' in line.lower() or 'proof' in line.lower():
                in_solution = True
                solution_lines.append(line)
            elif in_solution:
                if line.strip() == '' and solution_lines:
                    # End of solution
                    break
                solution_lines.append(line)
        
        if solution_lines:
            return '\n'.join(solution_lines)
        else:
            # If no clear solution found, return the entire output
            return output.strip()
    
    def get_solver_info(self) -> Dict[str, Any]:
        """Get information about the DPV2 solver"""
        return {
            'name': self.name,
            'type': 'dpv2',
            'description': 'Uses DPV2 system for automated proof generation',
            'dpv2_path': self.dpv2_path,
            'dpv2_available': self._check_command_exists(self.dpv2_path),
            'capabilities': ['automated_proving', 'theorem_solving'],
            'config': {
                'timeout': self.config.timeout,
                'debug': self.config.debug,
                'temp_dir': self.temp_dir
            }
        }
    
    def __del__(self):
        """Cleanup when solver is destroyed"""
        self._cleanup_temp_directory()


class DPV2BatchSolver(DPV2Solver):
    """
    Batch version of DPV2 solver for processing multiple problems efficiently.
    """
    
    def __init__(self, name: str = "DPV2BatchSolver", 
                 dpv2_path: Optional[str] = None,
                 config: Optional[SolverConfig] = None):
        super().__init__(name, dpv2_path, config)
        self.batch_size = config.get_param('batch_size', 10) if config else 10
    
    def solve_batch(self, problems: List[Union[Problem, str]], **kwargs) -> List[SolverResult]:
        """
        Solve a batch of problems using DPV2 in batch mode.
        
        Args:
            problems: List of problems to solve
            **kwargs: Additional parameters
            
        Returns:
            List of SolverResults
        """
        results = []
        
        # Process problems in batches
        for i in range(0, len(problems), self.batch_size):
            batch = problems[i:i + self.batch_size]
            batch_results = self._solve_batch_internal(batch, **kwargs)
            results.extend(batch_results)
            
            # Update statistics
            for result in batch_results:
                self._update_stats(result)
        
        return results
    
    def _solve_batch_internal(self, batch: List[Union[Problem, str]], **kwargs) -> List[SolverResult]:
        """
        Solve a batch of problems internally.
        
        Args:
            batch: Batch of problems to solve
            **kwargs: Additional parameters
            
        Returns:
            List of SolverResults for the batch
        """
        # For now, just solve each problem individually
        # In the future, this could be optimized to use DPV2's batch capabilities
        results = []
        
        for problem in batch:
            result = self.solve(problem, **kwargs)
            results.append(result)
        
        return results
    
    def get_solver_info(self) -> Dict[str, Any]:
        """Get information about the DPV2 batch solver"""
        info = super().get_solver_info()
        info.update({
            'name': self.name,
            'type': 'dpv2_batch',
            'batch_size': self.batch_size,
            'description': 'Batch version of DPV2 solver for efficient processing of multiple problems'
        })
        return info


# Convenience functions for backward compatibility
def solve_with_dpv2(problem: Union[Problem, str], **kwargs) -> str:
    """
    Solve a problem using DPV2 (convenience function).
    
    Args:
        problem: Problem to solve
        **kwargs: Additional parameters
        
    Returns:
        Solution string
        
    Raises:
        RuntimeError: If solving fails
    """
    solver = DPV2Solver()
    result = solver.solve(problem, **kwargs)
    
    if result.is_success():
        return result.solution
    else:
        raise RuntimeError(f"DPV2 failed to solve problem: {result.error_message}")


def batch_solve_with_dpv2(problems: List[Union[Problem, str]], **kwargs) -> List[str]:
    """
    Solve multiple problems using DPV2 (convenience function).
    
    Args:
        problems: List of problems to solve
        **kwargs: Additional parameters
        
    Returns:
        List of solution strings
        
    Raises:
        RuntimeError: If any solving fails
    """
    solver = DPV2BatchSolver()
    results = solver.solve_batch(problems, **kwargs)
    
    solutions = []
    for i, result in enumerate(results):
        if result.is_success():
            solutions.append(result.solution)
        else:
            raise RuntimeError(f"DPV2 failed to solve problem {i}: {result.error_message}")
    
    return solutions 