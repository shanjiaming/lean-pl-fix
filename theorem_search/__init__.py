"""
Theorem Search Module

This module provides functionality for searching and extracting theorems from Lean code,
as well as filtering and ranking them by similarity. It supports both BLEU-based 
similarity and other similarity metrics.

Main components:
- theorem_searcher: Main theorem search implementation
- theorem_extractor: Extract theorems from code
- extract_related_theorems: Extract related theorems from Lean modules
- static_theorem_filter: Filter theorems based on static analysis
- update_tyrell_theorems: Update Tyrell specification with new theorems
- filter_json_theorems: Filter theorems from JSON datasets
"""

from .theorem_searcher import *
from .theorem_extractor import *

# Import additional theorem processing tools
try:
    from .extract_related_theorems import *
except ImportError:
    pass

try:
    from .static_theorem_filter import *
except ImportError:
    pass

try:
    from .update_tyrell_theorems import *
except ImportError:
    pass

try:
    from .filter_json_theorems import *
except ImportError:
    pass

__all__ = [
    # Main theorem search functionality exported from other modules
] 