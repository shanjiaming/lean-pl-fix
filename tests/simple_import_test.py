#!/usr/bin/env python3
"""
Simple import test for the new modular architecture
"""

def test_core_imports():
    """Test core module imports"""
    try:
        from core import hole_fixer_interface
        print("✓ core.hole_fixer_interface imported successfully")
    except ImportError as e:
        print(f"✗ Failed to import core.hole_fixer_interface: {e}")
    
    try:
        from core import proof_repair_interface
        print("✓ core.proof_repair_interface imported successfully")
    except ImportError as e:
        print(f"✗ Failed to import core.proof_repair_interface: {e}")
    
    try:
        from core import theorem_search_interface
        print("✓ core.theorem_search_interface imported successfully")
    except ImportError as e:
        print(f"✗ Failed to import core.theorem_search_interface: {e}")

def test_utils_imports():
    """Test utils module imports"""
    try:
        from utils import file_utils
        print("✓ utils.file_utils imported successfully")
    except ImportError as e:
        print(f"✗ Failed to import utils.file_utils: {e}")
    
    try:
        from utils import text_utils
        print("✓ utils.text_utils imported successfully")
    except ImportError as e:
        print(f"✗ Failed to import utils.text_utils: {e}")
    
    try:
        from utils import lean_utils
        print("✓ utils.lean_utils imported successfully")
    except ImportError as e:
        print(f"✗ Failed to import utils.lean_utils: {e}")

def test_solvers_imports():
    """Test solvers module imports"""
    try:
        from solvers import base_solver
        print("✓ solvers.base_solver imported successfully")
    except ImportError as e:
        print(f"✗ Failed to import solvers.base_solver: {e}")
    
    try:
        from solvers import decompose_solver_unified
        print("✓ solvers.decompose_solver_unified imported successfully")
    except ImportError as e:
        print(f"✗ Failed to import solvers.decompose_solver_unified: {e}")

if __name__ == "__main__":
    print("Testing new modular architecture imports...")
    print("=" * 50)
    
    test_core_imports()
    print()
    test_utils_imports()
    print()
    test_solvers_imports()
    
    print("=" * 50)
    print("Import test completed!") 