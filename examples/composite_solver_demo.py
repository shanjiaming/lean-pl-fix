#!/usr/bin/env python3
"""
Demonstration of CompositeSolver with chain_fix strategy for Lean proof error fixing.

This example shows how to create a chain of specialized solvers that work together
to fix different types of errors in Lean proofs.
"""

import sys
import os
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from solvers.base_solver import BaseSolver, CompositeSolver, SolverResult, SolverStatus, SolverConfig
from typing import Union

class MockSyntaxFixerSolver(BaseSolver):
    """Mock solver that fixes basic syntax errors."""
    
    def solve(self, problem: Union[str, object], **kwargs) -> SolverResult:
        """Simulate fixing syntax errors like missing parentheses, colons, etc."""
        problem_str = str(problem)
        
        # Simulate syntax fixing
        if "missing :" in problem_str.lower():
            fixed_code = problem_str.replace("theorem example", "theorem example :")
            return SolverResult(
                status=SolverStatus.SUCCESS,
                solution=fixed_code,
                original_problem=problem_str,
                execution_time=0.1,
                confidence_score=0.9,
                metadata={'fix_type': 'syntax', 'fixed_missing_colon': True}
            )
        elif "unbalanced" in problem_str.lower():
            fixed_code = problem_str.replace("(x + y", "(x + y)")
            return SolverResult(
                status=SolverStatus.SUCCESS,
                solution=fixed_code,
                original_problem=problem_str,
                execution_time=0.1,
                confidence_score=0.8,
                metadata={'fix_type': 'syntax', 'fixed_parentheses': True}
            )
        
        # No syntax errors found
        return SolverResult(
            status=SolverStatus.FAILURE,
            original_problem=problem_str,
            error_message="No syntax errors to fix",
            execution_time=0.05
        )
    
    def get_solver_info(self):
        return {
            'name': self.name,
            'type': 'syntax_fixer',
            'specialization': 'syntax_errors'
        }

class MockLogicFixerSolver(BaseSolver):
    """Mock solver that fixes logical errors."""
    
    def solve(self, problem: Union[str, object], **kwargs) -> SolverResult:
        """Simulate fixing logic errors like wrong theorems, type mismatches."""
        problem_str = str(problem)
        
        # Simulate logic fixing
        if "unknown theorem" in problem_str.lower():
            fixed_code = problem_str.replace("unknown_theorem", "Nat.add_comm")
            return SolverResult(
                status=SolverStatus.SUCCESS,
                solution=fixed_code,
                original_problem=problem_str,
                execution_time=0.2,
                confidence_score=0.85,
                metadata={'fix_type': 'logic', 'replaced_theorem': True}
            )
        elif "type mismatch" in problem_str.lower():
            fixed_code = problem_str.replace("Nat.add x", "Nat.add x 0")
            return SolverResult(
                status=SolverStatus.SUCCESS,
                solution=fixed_code,
                original_problem=problem_str,
                execution_time=0.15,
                confidence_score=0.7,
                metadata={'fix_type': 'logic', 'fixed_type_mismatch': True}
            )
        
        # No logic errors found
        return SolverResult(
            status=SolverStatus.FAILURE,
            original_problem=problem_str,
            error_message="No logic errors to fix",
            execution_time=0.1
        )
    
    def get_solver_info(self):
        return {
            'name': self.name,
            'type': 'logic_fixer',
            'specialization': 'logic_errors'
        }

class MockTacticOptimizerSolver(BaseSolver):
    """Mock solver that optimizes proof tactics."""
    
    def solve(self, problem: Union[str, object], **kwargs) -> SolverResult:
        """Simulate optimizing proof tactics."""
        problem_str = str(problem)
        
        # Simulate tactic optimization
        if "simp" in problem_str.lower() and "ring" not in problem_str.lower():
            fixed_code = problem_str.replace("simp", "simp; ring")
            return SolverResult(
                status=SolverStatus.SUCCESS,
                solution=fixed_code,
                original_problem=problem_str,
                execution_time=0.3,
                confidence_score=0.6,
                metadata={'fix_type': 'tactic', 'added_ring_tactic': True}
            )
        elif "rw [" in problem_str and "; simp" not in problem_str:
            fixed_code = problem_str.replace("rw [", "rw [").replace("]", "]; simp")
            return SolverResult(
                status=SolverStatus.SUCCESS,
                solution=fixed_code,
                original_problem=problem_str,
                execution_time=0.25,
                confidence_score=0.5,
                metadata={'fix_type': 'tactic', 'added_simp_after_rw': True}
            )
        
        # No tactic optimizations available
        return SolverResult(
            status=SolverStatus.FAILURE,
            original_problem=problem_str,
            error_message="No tactic optimizations to apply",
            execution_time=0.1
        )
    
    def get_solver_info(self):
        return {
            'name': self.name,
            'type': 'tactic_optimizer',
            'specialization': 'tactic_optimization'
        }

def demo_chain_fix():
    """Demonstrate the chain_fix strategy with mock Lean code."""
    
    print("=== CompositeSolver Chain Fix Strategy Demo ===\n")
    
    # Create individual solvers
    syntax_fixer = MockSyntaxFixerSolver("syntax_fixer")
    logic_fixer = MockLogicFixerSolver("logic_fixer") 
    tactic_optimizer = MockTacticOptimizerSolver("tactic_optimizer")
    
    # Create composite solver with chain_fix strategy
    config = SolverConfig(debug=True)
    composite_solver = CompositeSolver(
        name="lean_error_fixer_chain",
        solvers=[syntax_fixer, logic_fixer, tactic_optimizer],
        strategy="chain_fix",
        config=config
    )
    
    # Test case 1: Multiple fixable errors
    print("Test Case 1: Code with syntax, logic, and tactic issues")
    print("-" * 60)
    
    problematic_code = """
    theorem example (x y : Nat) missing : x + y = y + x := by
      rw [unknown_theorem]
      simp
    """
    
    print(f"Original code:\n{problematic_code}")
    print("\nRunning chain fix...\n")
    
    result = composite_solver.solve(problematic_code)
    
    print(f"Final status: {result.status}")
    print(f"Success: {result.is_success()}")
    
    if result.solution:
        print(f"\nFixed code:\n{result.solution}")
    
    if result.metadata:
        print(f"\nChain metadata:")
        for key, value in result.metadata.items():
            print(f"  {key}: {value}")
    
    print("\n" + "="*80 + "\n")
    
    # Test case 2: Partial fixes only
    print("Test Case 2: Code with only some fixable errors")
    print("-" * 60)
    
    partial_code = """
    theorem example (x y : Nat) : x + y = y + x := by
      rw [type mismatch in Nat.add x]
      sorry
    """
    
    print(f"Original code:\n{partial_code}")
    print("\nRunning chain fix...\n")
    
    result2 = composite_solver.solve(partial_code)
    
    print(f"Final status: {result2.status}")
    print(f"Success: {result2.is_success()}")
    
    if result2.solution:
        print(f"\nFixed code:\n{result2.solution}")
    
    if result2.metadata:
        print(f"\nChain metadata:")
        for key, value in result2.metadata.items():
            print(f"  {key}: {value}")
    
    print("\n" + "="*80 + "\n")
    
    # Test case 3: No fixable errors
    print("Test Case 3: Code with no fixable errors")
    print("-" * 60)
    
    clean_code = """
    theorem example (x y : Nat) : x + y = y + x := by
      exact Nat.add_comm x y
    """
    
    print(f"Original code:\n{clean_code}")
    print("\nRunning chain fix...\n")
    
    result3 = composite_solver.solve(clean_code)
    
    print(f"Final status: {result3.status}")
    print(f"Success: {result3.is_success()}")
    
    if result3.metadata:
        print(f"\nChain metadata:")
        for key, value in result3.metadata.items():
            print(f"  {key}: {value}")

def demo_other_strategies():
    """Demonstrate other CompositeSolver strategies for comparison."""
    
    print("\n=== Comparison with Other Strategies ===\n")
    
    # Create solvers
    syntax_fixer = MockSyntaxFixerSolver("syntax_fixer")
    logic_fixer = MockLogicFixerSolver("logic_fixer")
    
    problematic_code = "theorem example missing : contains unknown_theorem"
    
    # Test first_success strategy
    print("First Success Strategy:")
    print("-" * 30)
    
    first_success_solver = CompositeSolver(
        name="first_success_solver",
        solvers=[syntax_fixer, logic_fixer],
        strategy="first_success"
    )
    
    result = first_success_solver.solve(problematic_code)
    print(f"Status: {result.status}")
    print(f"Solution: {result.solution}")
    if result.metadata and 'solver_used' in result.metadata:
        print(f"Solver used: {result.metadata['solver_used']}")
    
    print("\n" + "-"*50 + "\n")
    
    # Test best_result strategy  
    print("Best Result Strategy:")
    print("-" * 25)
    
    best_result_solver = CompositeSolver(
        name="best_result_solver", 
        solvers=[syntax_fixer, logic_fixer],
        strategy="best_result"
    )
    
    result = best_result_solver.solve(problematic_code)
    print(f"Status: {result.status}")
    print(f"Solution: {result.solution}")
    if result.metadata and 'solver_used' in result.metadata:
        print(f"Solver used: {result.metadata['solver_used']}")

if __name__ == "__main__":
    demo_chain_fix()
    demo_other_strategies() 