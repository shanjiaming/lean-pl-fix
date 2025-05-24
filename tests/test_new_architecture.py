#!/usr/bin/env python3
"""
Test script for the new modular architecture of lean-pl-fix.

This script tests the basic functionality of the newly created modules
to ensure they work correctly and can be imported properly.
"""

import sys
import traceback
from typing import List, Dict, Any


def test_imports() -> Dict[str, bool]:
    """Test if all modules can be imported successfully"""
    results = {}
    
    # Test core module imports
    try:
        from core import (
            HoleFixerInterface, ProofSynthesizer, DatasetProcessor,
            ProofRepairInterface, RepairProcessor,
            TheoremSearchInterface
        )
        results['core'] = True
        print("✅ Core module imports successful")
    except Exception as e:
        results['core'] = False
        print(f"❌ Core module import failed: {e}")
    
    # Test data management module imports
    try:
        from data_management import (
            Problem, UnifiedProblemManager, DatasetProcessor as DataMgmtProcessor,
            MetadataManager
        )
        results['data_management'] = True
        print("✅ Data management module imports successful")
    except Exception as e:
        results['data_management'] = False
        print(f"❌ Data management module import failed: {e}")
    
    # Test solvers module imports
    try:
        from solvers import (
            BaseSolver, SolverResult, SolverConfig,
            DecomposeSolver, DPV2Solver, CompositeSolver
        )
        results['solvers'] = True
        print("✅ Solvers module imports successful")
    except Exception as e:
        results['solvers'] = False
        print(f"❌ Solvers module import failed: {e}")
    
    # Test theorem search module imports
    try:
        from theorem_search import (
            TheoremSearcher, SearchResult, SearchConfig
        )
        results['theorem_search'] = True
        print("✅ Theorem search module imports successful")
    except Exception as e:
        results['theorem_search'] = False
        print(f"❌ Theorem search module import failed: {e}")
    
    # Test utils module imports
    try:
        from utils import (
            ensure_directory, clean_whitespace, extract_theorem_name,
            setup_logger, load_config
        )
        results['utils'] = True
        print("✅ Utils module imports successful")
    except Exception as e:
        results['utils'] = False
        print(f"❌ Utils module import failed: {e}")
    
    return results


def test_solver_creation():
    """Test creating solver instances"""
    try:
        from solvers import BaseSolver, SolverConfig, DecomposeSolver, DPV2Solver
        
        # Test solver config
        config = SolverConfig(timeout=30.0, debug=True)
        print(f"✅ SolverConfig created: timeout={config.timeout}, debug={config.debug}")
        
        # Test decompose solver
        decompose_solver = DecomposeSolver("TestDecompose", config=config)
        print(f"✅ DecomposeSolver created: {decompose_solver.name}")
        
        # Test DPV2 solver
        dpv2_solver = DPV2Solver("TestDPV2", config=config)
        print(f"✅ DPV2Solver created: {dpv2_solver.name}")
        
        # Test solver info
        decompose_info = decompose_solver.get_solver_info()
        print(f"✅ DecomposeSolver info: {decompose_info['type']}")
        
        dpv2_info = dpv2_solver.get_solver_info()
        print(f"✅ DPV2Solver info: {dpv2_info['type']}")
        
        return True
        
    except Exception as e:
        print(f"❌ Solver creation test failed: {e}")
        traceback.print_exc()
        return False


def test_problem_manager():
    """Test problem manager functionality"""
    try:
        from data_management import Problem, problem_manager
        
        # Test problem creation
        test_problem = Problem(
            dataset="test",
            problem_id="test_001",
            header_file="test_header.lean",
            problem_file="test_problem.lean"
        )
        print(f"✅ Problem created: {test_problem.dataset}/{test_problem.problem_id}")
        
        # Test problem manager
        print(f"✅ Problem manager available: {type(problem_manager).__name__}")
        
        return True
        
    except Exception as e:
        print(f"❌ Problem manager test failed: {e}")
        traceback.print_exc()
        return False


def test_theorem_searcher():
    """Test theorem searcher functionality"""
    try:
        from theorem_search import TheoremSearcher, SearchConfig, SearchType
        
        # Test search config
        config = SearchConfig(max_results=5, min_confidence=0.5)
        print(f"✅ SearchConfig created: max_results={config.max_results}")
        
        # Test theorem searcher
        searcher = TheoremSearcher(config)
        print(f"✅ TheoremSearcher created")
        
        # Test searcher methods
        stats = searcher.get_stats()
        print(f"✅ Searcher stats: {stats}")
        
        databases = searcher.get_available_databases()
        print(f"✅ Available databases: {len(databases)}")
        
        strategies = searcher.get_available_strategies()
        print(f"✅ Available strategies: {len(strategies)}")
        
        return True
        
    except Exception as e:
        print(f"❌ Theorem searcher test failed: {e}")
        traceback.print_exc()
        return False


def run_all_tests():
    """Run all tests and report results"""
    print("🚀 Testing new lean-pl-fix modular architecture")
    print("=" * 50)
    
    all_passed = True
    
    # Test imports
    print("\n📦 Testing module imports...")
    import_results = test_imports()
    if not all(import_results.values()):
        all_passed = False
    
    # Test solver creation
    print("\n🔧 Testing solver creation...")
    if not test_solver_creation():
        all_passed = False
    
    # Test problem manager
    print("\n📋 Testing problem manager...")
    if not test_problem_manager():
        all_passed = False
    
    # Test theorem searcher
    print("\n🔍 Testing theorem searcher...")
    if not test_theorem_searcher():
        all_passed = False
    
    # Final report
    print("\n" + "=" * 50)
    if all_passed:
        print("🎉 All tests passed! The new architecture is working correctly.")
    else:
        print("⚠️  Some tests failed. Please check the error messages above.")
    
    return all_passed


if __name__ == "__main__":
    success = run_all_tests()
    sys.exit(0 if success else 1) 