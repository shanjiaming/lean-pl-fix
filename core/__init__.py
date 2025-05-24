"""
Core Module

This module contains the main interfaces and implementations for the lean-pl-fix system.
It includes hole fixing, proof repair, theorem search, and the main enumeration logic.

Main components:
- hole_fixer_interface: Interface for hole fixing strategies
- proof_repair_interface: Interface for proof repair strategies  
- theorem_search_interface: Interface for theorem search and replacement
- lean_enumerator: Main Lean code enumeration and fixing logic
- lean_batch_enumerator: Batch processing for multiple files
- lean_api: Lean REPL and API utilities
"""

from .hole_fixer_interface import (
    HoleFixerInterface,
    ProofSynthesizer, 
    DatasetProcessor,
    SimpleHoleFixer,
    DPV2HoleFixer,
    HoleResult,
    ProofSynthesisResult,
    DatasetReport,
    ProofStatus
)

from .proof_repair_interface import (
    ProofRepairInterface,
    ProofRepairer,
    RepairProcessor,
    SimpleProofRepairer,
    DPV2ProofRepairer,
    RepairResult,
    RepairReport,
    RepairStatus
)

from .theorem_search_interface import (
    TheoremSearchInterface,
    UnknownTheoremFixer,
    TheoremSearchProcessor,
    BLEUTheoremSearcher,
    SimpleTheoremSearcher,
    TheoremSearchResult,
    TheoremSearchReport,
    TheoremSearchStatus
)

# Import main enumeration logic
try:
    from .lean_enumerator import *
except ImportError:
    pass  # Handle missing dependencies gracefully

try:
    from .lean_batch_enumerator import *
except ImportError:
    pass  # Handle missing dependencies gracefully

try:
    from .lean_api import REPLInstance, error_list_net_reduced
except ImportError:
    pass  # Handle missing dependencies gracefully

__all__ = [
    # Hole Fixer Interface
    'HoleFixerInterface',
    'ProofSynthesizer',
    'DatasetProcessor', 
    'SimpleHoleFixer',
    'DPV2HoleFixer',
    'HoleResult',
    'ProofSynthesisResult',
    'DatasetReport',
    'ProofStatus',
    
    # Proof Repair Interface
    'ProofRepairInterface',
    'ProofRepairer',
    'RepairProcessor',
    'SimpleProofRepairer', 
    'DPV2ProofRepairer',
    'RepairResult',
    'RepairReport',
    'RepairStatus',
    
    # Theorem Search Interface
    'TheoremSearchInterface',
    'UnknownTheoremFixer',
    'TheoremSearchProcessor',
    'BLEUTheoremSearcher',
    'SimpleTheoremSearcher',
    'TheoremSearchResult',
    'TheoremSearchReport',
    'TheoremSearchStatus',
    
    # Lean API utilities
    'REPLInstance',
    'error_list_net_reduced'
] 