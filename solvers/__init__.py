"""
Solvers Module

This module contains different solving strategies and implementations for Lean theorem proving.
It provides a unified interface for various solving approaches including decomposition,
DPV2-based solving, and batch processing.

Main components:
- base_solver: Abstract base classes and interfaces
- decompose_solver_unified: Unified decomposition solving approach
- dpv2_solver: DPV2-based theorem solving
- dpv2_batch_solver: Batch processing with DPV2 solver
"""

from .base_solver import (
    BaseSolver,
    SolverConfig,
    SolverResult,
    SolverStatus,
    CompositeSolver
)

from .decompose_solver_unified import (
    solve_theorem_unified,
    unified_env,
    get_unified_env
)

from .dpv2_solver import (
    solve_with_dpv2,
    batch_solve_with_dpv2,
    DPV2Solver,
    DPV2BatchSolver
)

# Import batch solver
try:
    from .dpv2_batch_solver import *
except ImportError:
    pass

__all__ = [
    # Base solver interface
    'BaseSolver',
    'SolverConfig', 
    'SolverResult',
    'SolverStatus',
    'CompositeSolver',
    
    # Decompose solver
    'solve_theorem_unified',
    'unified_env',
    'get_unified_env',
    
    # DPV2 solver
    'solve_with_dpv2',
    'batch_solve_with_dpv2',
    'DPV2Solver',
    'DPV2BatchSolver'
] 