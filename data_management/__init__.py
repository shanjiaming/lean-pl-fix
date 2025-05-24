"""
Data Management Module for lean-pl-fix

This module provides unified interfaces for managing problems, datasets, and metadata
across different proof systems and datasets.

Main components:
- unified_problem_manager: Central manager for all problem data
- dataset_processor: Tools for processing and organizing datasets
- metadata_manager: Handling of problem metadata and annotations
"""

from .unified_problem_manager import problem_manager, Problem, ProblemMetadata
from .dataset_processor import DatasetProcessor
from .metadata_manager import MetadataManager

__all__ = [
    'problem_manager',
    'Problem', 
    'ProblemMetadata',
    'DatasetProcessor',
    'MetadataManager'
] 