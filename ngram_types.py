#!/usr/bin/env python3
"""
Type definitions for N-gram pipeline

Avoids circular imports, centralized management of shared types.
"""

from dataclasses import dataclass


@dataclass
class HolePickleInfo:
    """Information about a pickled hole"""
    hole_id: str
    sorry_index: int
    pickle_file: str
    original_proof_state_id: int
    line: int
    column: int