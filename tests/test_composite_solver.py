#!/usr/bin/env python3
"""
Tests for CompositeSolver, especially the chain_fix strategy.
"""

import pytest
import sys
import os

# Add the project root to the path
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from solvers.base_solver import BaseSolver, CompositeSolver, SolverResult, SolverStatus, SolverConfig
from typing import Union

class MockSuccessfulSolver(BaseSolver):
    """Mock solver that always succeeds and appends its name to the solution."""
    
    def solve(self, problem: Union[str, object], **kwargs) -> SolverResult:
        problem_str = str(problem)
        solution = f"{problem_str}_fixed_by_{self.name}"
        
        return SolverResult(
            status=SolverStatus.SUCCESS,
            solution=solution,
            original_problem=problem_str,
            execution_time=0.1,
            confidence_score=0.8
        )
    
    def get_solver_info(self):
        return {'name': self.name, 'type': 'mock_successful'}

class MockFailingSolver(BaseSolver):
    """Mock solver that always fails."""
    
    def solve(self, problem: Union[str, object], **kwargs) -> SolverResult:
        problem_str = str(problem)
        
        return SolverResult(
            status=SolverStatus.FAILURE,
            original_problem=problem_str,
            error_message=f"Mock failure from {self.name}",
            execution_time=0.05
        )
    
    def get_solver_info(self):
        return {'name': self.name, 'type': 'mock_failing'}

class TestCompositeSolver:
    """Test cases for CompositeSolver."""
    
    def test_chain_fix_all_succeed(self):
        """Test chain_fix when all solvers succeed."""
        solver1 = MockSuccessfulSolver("solver1")
        solver2 = MockSuccessfulSolver("solver2")
        solver3 = MockSuccessfulSolver("solver3")
        
        composite_solver = CompositeSolver(
            name="test_chain",
            solvers=[solver1, solver2, solver3],
            strategy="chain_fix"
        )
        
        result = composite_solver.solve("original_problem")
        
        assert result.is_success()
        assert result.solution == "original_problem_fixed_by_solver1_fixed_by_solver2_fixed_by_solver3"
        assert result.metadata['chain_fix'] is True
        assert result.metadata['successful_fixes'] == 3
        assert result.metadata['final_solver'] == "solver3"
        assert len(result.metadata['successful_solvers']) == 3
        assert result.metadata['successful_solvers'] == ["solver1", "solver2", "solver3"]
    
    def test_chain_fix_some_fail(self):
        """Test chain_fix when some solvers fail."""
        solver1 = MockSuccessfulSolver("solver1")
        solver2 = MockFailingSolver("solver2")
        solver3 = MockSuccessfulSolver("solver3")
        
        composite_solver = CompositeSolver(
            name="test_chain",
            solvers=[solver1, solver2, solver3],
            strategy="chain_fix"
        )
        
        result = composite_solver.solve("original_problem")
        
        assert result.is_success()
        # solver3 should work on solver1's output since solver2 failed
        assert result.solution == "original_problem_fixed_by_solver1_fixed_by_solver3"
        assert result.metadata['chain_fix'] is True
        assert result.metadata['successful_fixes'] == 2
        assert result.metadata['final_solver'] == "solver3"
        assert result.metadata['successful_solvers'] == ["solver1", "solver3"]
    
    def test_chain_fix_all_fail(self):
        """Test chain_fix when all solvers fail."""
        solver1 = MockFailingSolver("solver1")
        solver2 = MockFailingSolver("solver2")
        solver3 = MockFailingSolver("solver3")
        
        composite_solver = CompositeSolver(
            name="test_chain",
            solvers=[solver1, solver2, solver3],
            strategy="chain_fix"
        )
        
        result = composite_solver.solve("original_problem")
        
        assert not result.is_success()
        assert result.status == SolverStatus.FAILURE
        assert result.metadata['chain_fix'] is True
        assert result.metadata['successful_fixes'] == 0
        assert 'final_solver' not in result.metadata
        assert len(result.metadata['chain_details']) == 3
    
    def test_chain_fix_empty_solvers(self):
        """Test chain_fix with no solvers."""
        composite_solver = CompositeSolver(
            name="test_chain",
            solvers=[],
            strategy="chain_fix"
        )
        
        result = composite_solver.solve("original_problem")
        
        assert not result.is_success()
        assert result.status == SolverStatus.ERROR
        assert "No solvers available" in result.error_message
    
    def test_first_success_strategy(self):
        """Test first_success strategy for comparison."""
        solver1 = MockFailingSolver("solver1")
        solver2 = MockSuccessfulSolver("solver2")
        solver3 = MockSuccessfulSolver("solver3")  # Should not be called
        
        composite_solver = CompositeSolver(
            name="test_first_success",
            solvers=[solver1, solver2, solver3],
            strategy="first_success"
        )
        
        result = composite_solver.solve("original_problem")
        
        assert result.is_success()
        assert result.solution == "original_problem_fixed_by_solver2"
        assert result.metadata['solver_used'] == "solver2"
    
    def test_best_result_strategy(self):
        """Test best_result strategy for comparison."""
        solver1 = MockSuccessfulSolver("solver1")
        solver2 = MockSuccessfulSolver("solver2")
        
        # Manually set different confidence scores
        def mock_solve1(problem, **kwargs):
            result = MockSuccessfulSolver.solve(solver1, problem, **kwargs)
            result.confidence_score = 0.6
            return result
            
        def mock_solve2(problem, **kwargs):
            result = MockSuccessfulSolver.solve(solver2, problem, **kwargs)
            result.confidence_score = 0.9
            return result
        
        solver1.solve = mock_solve1
        solver2.solve = mock_solve2
        
        composite_solver = CompositeSolver(
            name="test_best_result",
            solvers=[solver1, solver2],
            strategy="best_result"
        )
        
        result = composite_solver.solve("original_problem")
        
        assert result.is_success()
        assert result.metadata['solver_used'] == "solver2"  # Higher confidence
    
    def test_invalid_strategy(self):
        """Test that invalid strategy raises ValueError."""
        solver1 = MockSuccessfulSolver("solver1")
        
        composite_solver = CompositeSolver(
            name="test_invalid",
            solvers=[solver1],
            strategy="invalid_strategy"
        )
        
        with pytest.raises(ValueError, match="Unknown strategy: invalid_strategy"):
            composite_solver.solve("test_problem")
    
    def test_solver_info(self):
        """Test get_solver_info method."""
        solver1 = MockSuccessfulSolver("solver1")
        solver2 = MockFailingSolver("solver2")
        
        composite_solver = CompositeSolver(
            name="test_info",
            solvers=[solver1, solver2],
            strategy="chain_fix"
        )
        
        info = composite_solver.get_solver_info()
        
        assert info['name'] == "test_info"
        assert info['type'] == 'composite'
        assert info['strategy'] == 'chain_fix'
        assert info['num_solvers'] == 2
        assert len(info['solvers']) == 2
        assert info['solvers'][0]['name'] == 'solver1'
        assert info['solvers'][1]['name'] == 'solver2'

if __name__ == "__main__":
    pytest.main([__file__, "-v"]) 