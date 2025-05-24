"""
Utilities Module

This module provides common utility functions and helper classes used throughout
the lean-pl-fix system. It includes file operations, text processing, logging,
and other general-purpose utilities.

Main components:
- file_utils: File and directory operations
- text_utils: Text processing and manipulation
- lean_utils: Lean-specific utilities
- logging_utils: Logging and debugging utilities
- substep_saver_hole: Hole format processing utilities
- substep_saver: Step saving utilities
- similarity_utils: Similarity calculation utilities
- tactic_collector: Collect and analyze tactics
- extract_have: Extract 'have' statements from Lean code
- lean_theorem_analyzer: Analyze Lean theorems
- mathlib_analyzer: Analyze Mathlib content
- collectpath: Path collection utilities
- log_analyzer: Analyze log files
"""

from .file_utils import (
    ensure_directory,
    read_file_safe,
    write_file_safe,
    find_files_by_extension,
    get_file_hash,
    backup_file
)

from .text_utils import (
    clean_whitespace,
    extract_code_blocks,
    normalize_lean_code,
    count_lines,
    split_by_delimiter
)

from .lean_utils import (
    extract_theorem_name,
    extract_theorem_statement,
    validate_lean_syntax,
    format_lean_code,
    parse_lean_error
)

from .logging_utils import (
    setup_logger,
    log_execution_time,
    create_progress_bar,
    LogLevel
)

from .substep_saver_hole import (
    process_lean_file_holeformat,
    generate_holes_for_dataset,
    generate_holes_for_all,
    process_legacy_file_holeformat
)

from .substep_saver import (
    make_step_saver,
    process_lean_file,
    process_folder
)

from .similarity_utils import (
    rank_by_similarity
)

# Import additional utility modules
try:
    from .tactic_collector import *
except ImportError:
    pass

try:
    from .extract_have import *
except ImportError:
    pass

try:
    from .lean_theorem_analyzer import *
except ImportError:
    pass

try:
    from .mathlib_analyzer import *
except ImportError:
    pass

try:
    from .collectpath import *
except ImportError:
    pass

try:
    from .log_analyzer import *
except ImportError:
    pass

__all__ = [
    # File utilities
    'ensure_directory',
    'read_file_safe',
    'write_file_safe', 
    'find_files_by_extension',
    'get_file_hash',
    'backup_file',
    
    # Text utilities
    'clean_whitespace',
    'extract_code_blocks',
    'normalize_lean_code',
    'count_lines',
    'split_by_delimiter',
    
    # Lean utilities
    'extract_theorem_name',
    'extract_theorem_statement',
    'validate_lean_syntax',
    'format_lean_code',
    'parse_lean_error',
    
    # Logging utilities
    'setup_logger',
    'log_execution_time',
    'create_progress_bar',
    'LogLevel',
    
    # Substep saver utilities
    'process_lean_file_holeformat',
    'generate_holes_for_dataset', 
    'generate_holes_for_all',
    'process_legacy_file_holeformat',
    'make_step_saver',
    'process_lean_file',
    'process_folder',
    
    # Similarity utilities
    'rank_by_similarity'
] 