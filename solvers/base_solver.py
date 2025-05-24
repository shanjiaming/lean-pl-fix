from abc import ABC, abstractmethod
from typing import Dict, List, Optional, Any, Union
from dataclasses import dataclass
from enum import Enum
import time
from datetime import datetime

from data_management.unified_problem_manager import Problem


class SolverStatus(Enum):
    """Status of solver execution"""
    SUCCESS = "success"
    FAILURE = "failure"
    TIMEOUT = "timeout"
    ERROR = "error"
    PARTIAL = "partial"  # Partial solution found


@dataclass
class SolverResult:
    """Result of a solver execution"""
    status: SolverStatus
    solution: Optional[str] = None
    original_problem: Optional[str] = None
    execution_time: Optional[float] = None
    error_message: Optional[str] = None
    metadata: Optional[Dict[str, Any]] = None
    intermediate_steps: Optional[List[str]] = None
    confidence_score: Optional[float] = None
    
    def is_success(self) -> bool:
        """Check if the solver was successful"""
        return self.status == SolverStatus.SUCCESS
    
    def is_partial(self) -> bool:
        """Check if the solver found a partial solution"""
        return self.status == SolverStatus.PARTIAL
    
    def has_solution(self) -> bool:
        """Check if the solver has any solution (complete or partial)"""
        return self.solution is not None and self.solution.strip() != ""


@dataclass
class SolverConfig:
    """Configuration for solver execution"""
    timeout: Optional[float] = None  # Timeout in seconds
    max_iterations: Optional[int] = None
    debug: bool = False
    save_intermediate: bool = False
    custom_params: Optional[Dict[str, Any]] = None
    
    def get_param(self, key: str, default: Any = None) -> Any:
        """Get a custom parameter with default value"""
        if self.custom_params is None:
            return default
        return self.custom_params.get(key, default)


class BaseSolver(ABC):
    """Abstract base class for all solvers"""
    
    def __init__(self, name: str, config: Optional[SolverConfig] = None):
        self.name = name
        self.config = config or SolverConfig()
        self._stats = {
            'total_attempts': 0,
            'successful_attempts': 0,
            'failed_attempts': 0,
            'total_execution_time': 0.0,
            'average_execution_time': 0.0
        }
    
    @abstractmethod
    def solve(self, problem: Union[Problem, str], **kwargs) -> SolverResult:
        """
        Solve a given problem.
        
        Args:
            problem: Either a Problem object or a string containing the problem
            **kwargs: Additional solver-specific parameters
            
        Returns:
            SolverResult containing the solution and metadata
        """
        pass
    
    def solve_with_timeout(self, problem: Union[Problem, str], timeout: Optional[float] = None, **kwargs) -> SolverResult:
        """
        Solve a problem with timeout handling.
        
        Args:
            problem: Either a Problem object or a string containing the problem
            timeout: Timeout in seconds (overrides config timeout)
            **kwargs: Additional solver-specific parameters
            
        Returns:
            SolverResult with timeout handling
        """
        effective_timeout = timeout or self.config.timeout
        start_time = time.time()
        
        try:
            if effective_timeout:
                # TODO: Implement proper timeout mechanism
                # For now, just track time and check manually
                result = self.solve(problem, **kwargs)
                execution_time = time.time() - start_time
                
                if execution_time > effective_timeout:
                    return SolverResult(
                        status=SolverStatus.TIMEOUT,
                        original_problem=self._extract_problem_content(problem),
                        execution_time=execution_time,
                        error_message=f"Solver timed out after {execution_time:.2f} seconds"
                    )
                
                result.execution_time = execution_time
                return result
            else:
                result = self.solve(problem, **kwargs)
                result.execution_time = time.time() - start_time
                return result
                
        except Exception as e:
            execution_time = time.time() - start_time
            return SolverResult(
                status=SolverStatus.ERROR,
                original_problem=self._extract_problem_content(problem),
                execution_time=execution_time,
                error_message=str(e)
            )
    
    def solve_batch(self, problems: List[Union[Problem, str]], **kwargs) -> List[SolverResult]:
        """
        Solve a batch of problems.
        
        Args:
            problems: List of problems to solve
            **kwargs: Additional solver-specific parameters
            
        Returns:
            List of SolverResults
        """
        results = []
        for i, problem in enumerate(problems):
            if self.config.debug:
                print(f"Solving problem {i+1}/{len(problems)}")
            
            result = self.solve_with_timeout(problem, **kwargs)
            results.append(result)
            self._update_stats(result)
        
        return results
    
    def _extract_problem_content(self, problem: Union[Problem, str]) -> str:
        """Extract problem content from Problem object or string"""
        if isinstance(problem, Problem):
            from data_management.unified_problem_manager import problem_manager
            return problem_manager.get_full_content(problem)
        else:
            return str(problem)
    
    def _update_stats(self, result: SolverResult):
        """Update solver statistics"""
        self._stats['total_attempts'] += 1
        
        if result.is_success():
            self._stats['successful_attempts'] += 1
        else:
            self._stats['failed_attempts'] += 1
        
        if result.execution_time:
            self._stats['total_execution_time'] += result.execution_time
            self._stats['average_execution_time'] = (
                self._stats['total_execution_time'] / self._stats['total_attempts']
            )
    
    def get_stats(self) -> Dict[str, Any]:
        """Get solver statistics"""
        stats = self._stats.copy()
        if stats['total_attempts'] > 0:
            stats['success_rate'] = stats['successful_attempts'] / stats['total_attempts']
        else:
            stats['success_rate'] = 0.0
        return stats
    
    def reset_stats(self):
        """Reset solver statistics"""
        self._stats = {
            'total_attempts': 0,
            'successful_attempts': 0,
            'failed_attempts': 0,
            'total_execution_time': 0.0,
            'average_execution_time': 0.0
        }
    
    @abstractmethod
    def get_solver_info(self) -> Dict[str, Any]:
        """
        Get information about the solver.
        
        Returns:
            Dictionary containing solver information
        """
        pass
    
    def __str__(self) -> str:
        return f"{self.__class__.__name__}(name='{self.name}')"
    
    def __repr__(self) -> str:
        return self.__str__()


class CompositeSolver(BaseSolver):
    """A solver that combines multiple solvers"""
    
    def __init__(self, name: str, solvers: List[BaseSolver], 
                 strategy: str = "first_success", config: Optional[SolverConfig] = None):
        """
        Initialize composite solver.
        
        Args:
            name: Name of the composite solver
            solvers: List of solvers to use
            strategy: Strategy for combining solvers:
                - "first_success": Try solvers until one succeeds
                - "best_result": Try all solvers and return the best result
                - "majority_vote": Use majority voting among successful solvers  
                - "chain_fix": Chain solvers for error fixing (each solver's output becomes next solver's input)
            config: Solver configuration
        """
        super().__init__(name, config)
        self.solvers = solvers
        self.strategy = strategy
    
    def solve(self, problem: Union[Problem, str], **kwargs) -> SolverResult:
        """Solve using the composite strategy"""
        if self.strategy == "first_success":
            return self._solve_first_success(problem, **kwargs)
        elif self.strategy == "best_result":
            return self._solve_best_result(problem, **kwargs)
        elif self.strategy == "majority_vote":
            return self._solve_majority_vote(problem, **kwargs)
        elif self.strategy == "chain_fix":
            return self._solve_chain_fix(problem, **kwargs)
        else:
            raise ValueError(f"Unknown strategy: {self.strategy}")
    
    def _solve_first_success(self, problem: Union[Problem, str], **kwargs) -> SolverResult:
        """Try solvers until one succeeds"""
        for solver in self.solvers:
            result = solver.solve_with_timeout(problem, **kwargs)
            if result.is_success():
                result.metadata = result.metadata or {}
                result.metadata['solver_used'] = solver.name
                return result
        
        # If no solver succeeded, return the last result
        if self.solvers:
            last_result = self.solvers[-1].solve_with_timeout(problem, **kwargs)
            last_result.metadata = last_result.metadata or {}
            last_result.metadata['all_solvers_failed'] = True
            return last_result
        else:
            return SolverResult(
                status=SolverStatus.ERROR,
                error_message="No solvers available"
            )
    
    def _solve_best_result(self, problem: Union[Problem, str], **kwargs) -> SolverResult:
        """Try all solvers and return the best result"""
        results = []
        for solver in self.solvers:
            result = solver.solve_with_timeout(problem, **kwargs)
            results.append((solver, result))
        
        if not results:
            return SolverResult(
                status=SolverStatus.ERROR,
                error_message="No solvers available"
            )
        
        # Find the best result (prioritize success, then confidence score)
        best_solver, best_result = max(results, key=lambda x: (
            x[1].is_success(),
            x[1].confidence_score or 0.0
        ))
        
        best_result.metadata = best_result.metadata or {}
        best_result.metadata['solver_used'] = best_solver.name
        best_result.metadata['all_results'] = [
            {'solver': s.name, 'status': r.status.value, 'confidence': r.confidence_score}
            for s, r in results
        ]
        
        return best_result
    
    def _solve_majority_vote(self, problem: Union[Problem, str], **kwargs) -> SolverResult:
        """Use majority voting among successful solvers"""
        results = []
        for solver in self.solvers:
            result = solver.solve_with_timeout(problem, **kwargs)
            if result.is_success() and result.solution:
                results.append((solver, result))
        
        if not results:
            # Fall back to first_success strategy
            return self._solve_first_success(problem, **kwargs)
        
        # Count solutions
        solution_counts = {}
        for solver, result in results:
            solution = result.solution.strip()
            if solution not in solution_counts:
                solution_counts[solution] = []
            solution_counts[solution].append((solver, result))
        
        # Find the most common solution
        best_solution = max(solution_counts.keys(), key=lambda s: len(solution_counts[s]))
        best_solvers_results = solution_counts[best_solution]
        
        # Use the result with highest confidence among the majority
        best_solver, best_result = max(best_solvers_results, key=lambda x: x[1].confidence_score or 0.0)
        
        best_result.metadata = best_result.metadata or {}
        best_result.metadata['solver_used'] = best_solver.name
        best_result.metadata['majority_vote'] = True
        best_result.metadata['vote_count'] = len(best_solvers_results)
        best_result.metadata['total_voters'] = len(results)
        
        return best_result
    
    def _solve_chain_fix(self, problem: Union[Problem, str], **kwargs) -> SolverResult:
        """Chain solvers for error fixing - each solver's output becomes next solver's input"""
        if not self.solvers:
            return SolverResult(
                status=SolverStatus.ERROR,
                error_message="No solvers available"
            )
        
        current_problem = problem
        original_problem = self._extract_problem_content(problem)
        chain_results = []
        successful_fixes = []
        
        for i, solver in enumerate(self.solvers):
            if self.config.debug:
                print(f"Chain step {i+1}: Running solver '{solver.name}'")
            
            result = solver.solve_with_timeout(current_problem, **kwargs)
            chain_results.append({
                'solver': solver.name,
                'status': result.status.value,
                'success': result.is_success(),
                'execution_time': result.execution_time
            })
            
            if result.is_success() and result.solution:
                # This solver succeeded, use its output as input for next solver
                successful_fixes.append({
                    'solver': solver.name,
                    'result': result
                })
                current_problem = result.solution
                if self.config.debug:
                    print(f"Solver '{solver.name}' succeeded, passing result to next solver")
            else:
                # This solver failed, but continue with original problem for next solver
                if self.config.debug:
                    print(f"Solver '{solver.name}' failed: {result.error_message or 'No solution found'}")
        
        # Determine final result
        if successful_fixes:
            # Use the last successful fix as the final result
            final_fix = successful_fixes[-1]
            final_result = final_fix['result']
            
            # Update metadata to reflect the chain
            final_result.metadata = final_result.metadata or {}
            final_result.metadata.update({
                'chain_fix': True,
                'chain_length': len(self.solvers),
                'successful_fixes': len(successful_fixes),
                'final_solver': final_fix['solver'],
                'chain_details': chain_results,
                'successful_solvers': [fix['solver'] for fix in successful_fixes]
            })
            
            # Keep original problem reference
            if final_result.original_problem is None:
                final_result.original_problem = original_problem
                
            return final_result
        else:
            # No solver succeeded
            return SolverResult(
                status=SolverStatus.FAILURE,
                original_problem=original_problem,
                error_message="All solvers in chain failed",
                metadata={
                    'chain_fix': True,
                    'chain_length': len(self.solvers),
                    'successful_fixes': 0,
                    'chain_details': chain_results
                }
            )
    
    def get_solver_info(self) -> Dict[str, Any]:
        """Get information about the composite solver"""
        return {
            'name': self.name,
            'type': 'composite',
            'strategy': self.strategy,
            'num_solvers': len(self.solvers),
            'solvers': [solver.get_solver_info() for solver in self.solvers]
        } 