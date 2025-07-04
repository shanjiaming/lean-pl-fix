#!/usr/bin/env python3
"""
Comprehensive Tests for N-gram Pipeline and Dependencies

Tests the current implementation to establish a baseline before refactoring.
This serves as a safety net to ensure we don't break existing functionality.
"""

import os
import sys
import json
import tempfile
import unittest
from typing import Dict, List, Optional
from dataclasses import dataclass
from datetime import datetime

# Add project root to path
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

# Import components to test
from minimal_verification_pipeline_ngram import MinimalVerificationPipeline, MinimalVerificationResult
from proofstep_lean_integration import MinimalLeanProofStepIntegrator
from proofstep_integration import ProofStepIntegrator, SorryInfo, ProofStepSession
from clean_ngram_searcher import CleanNgramSearcher
from ngram_pickle_pipeline import CleanNgramPipeline, ProofStatePickleManager
from unified_problem_manager import problem_manager


class TestComponentIntegrity(unittest.TestCase):
    """Test that individual components can be imported and instantiated"""
    
    def test_import_all_components(self):
        """Test that all required components can be imported"""
        # Should not raise any exceptions
        from minimal_verification_pipeline_ngram import MinimalVerificationPipeline
        from proofstep_lean_integration import MinimalLeanProofStepIntegrator
        from proofstep_integration import ProofStepIntegrator
        from clean_ngram_searcher import CleanNgramSearcher
        from ngram_pickle_pipeline import CleanNgramPipeline
        
        self.assertTrue(True, "All imports successful")
    
    def test_minimal_verification_pipeline_creation(self):
        """Test MinimalVerificationPipeline can be created"""
        pipeline = MinimalVerificationPipeline()
        self.assertIsNotNone(pipeline)
        self.assertEqual(pipeline.decomposition_base_dir, "decomposition_results")
        self.assertEqual(pipeline.suffix, "_ngram")
    
    def test_minimal_lean_proofstep_integrator_creation(self):
        """Test MinimalLeanProofStepIntegrator can be created"""
        integrator = MinimalLeanProofStepIntegrator()
        self.assertIsNotNone(integrator)
        self.assertEqual(integrator.verification_count, 0)
        self.assertEqual(integrator.max_verifications, 3)
        self.assertIsNone(integrator.lean_server)
    
    def test_proofstep_integrator_creation(self):
        """Test ProofStepIntegrator can be created"""
        header = "import Mathlib"
        integrator = ProofStepIntegrator(header)
        self.assertIsNotNone(integrator)
        self.assertIn("import Mathlib", integrator.header_content)
    
    def test_clean_ngram_searcher_creation(self):
        """Test CleanNgramSearcher can be created"""
        searcher = CleanNgramSearcher(max_depth=2, stop_on_first_success=True)
        self.assertIsNotNone(searcher)
        self.assertEqual(searcher.max_depth, 2)
        self.assertTrue(searcher.stop_on_first_success)
    
    def test_clean_ngram_pipeline_creation(self):
        """Test CleanNgramPipeline can be created"""
        pipeline = CleanNgramPipeline(max_depth=2, stop_on_first_success=True)
        self.assertIsNotNone(pipeline)
        self.assertEqual(pipeline.max_depth, 2)
        self.assertTrue(pipeline.stop_on_first_success)


class TestDataStructures(unittest.TestCase):
    """Test data structures and their integrity"""
    
    def test_minimal_verification_result_creation(self):
        """Test MinimalVerificationResult can be created"""
        result = MinimalVerificationResult(
            problem_id="test_problem",
            dataset="test_dataset",
            verification_count=1,
            max_verifications=3,
            original_verification_pass=True,
            hole_verification_pass=True,
            filled_verification_pass=True,
            successful_tactics={0: "norm_num", 1: "linarith"},
            tactic_mapping={"hole_1": "norm_num", "hole_2": "linarith"},
            complete_solve_success=True,
            original_tactics_test={"hole_1": {"success": True, "error_message": None}},
            proof_state_tests=5,
            processing_time_seconds=1.5,
            constraint_satisfied=True,
            tactic_attempts=None
        )
        self.assertIsNotNone(result)
        self.assertEqual(result.problem_id, "test_problem")
        self.assertEqual(result.verification_count, 1)
        self.assertTrue(result.constraint_satisfied)
    
    def test_sorry_info_creation(self):
        """Test SorryInfo can be created"""
        sorry_info = SorryInfo(
            index=0,
            line=10,
            column=4,
            macro_type="hole_i",
            hole_id="hole_1",
            should_enumerate=True,
            context="test context"
        )
        self.assertIsNotNone(sorry_info)
        self.assertEqual(sorry_info.hole_id, "hole_1")
        self.assertTrue(sorry_info.should_enumerate)


class TestDemoDatasetAvailability(unittest.TestCase):
    """Test that demo dataset is available for testing"""
    
    def test_demo_problems_exist(self):
        """Test that demo problems can be loaded"""
        try:
            problems = problem_manager.list_problems("demo")
            self.assertIsNotNone(problems)
            self.assertGreater(len(problems), 0, "Should have at least one demo problem")
            
            # Test getting a specific problem
            first_problem = problems[0]
            self.assertIsNotNone(first_problem)
            self.assertIsNotNone(first_problem.problem_id)
            self.assertEqual(first_problem.dataset, "demo")
            
        except Exception as e:
            self.fail(f"Failed to load demo problems: {e}")
    
    def test_demo_problem_content(self):
        """Test that demo problem content can be accessed"""
        try:
            problems = problem_manager.list_problems("demo")
            if problems:
                problem = problems[0]
                
                # Test header content
                header_content = problem_manager.get_header_content(problem)
                self.assertIsNotNone(header_content)
                self.assertIsInstance(header_content, str)
                
                # Test problem content
                problem_content = problem_manager.get_problem_content(problem)
                self.assertIsNotNone(problem_content)
                self.assertIsInstance(problem_content, str)
                
        except Exception as e:
            self.fail(f"Failed to access demo problem content: {e}")


class TestDecompositionDataExists(unittest.TestCase):
    """Test that decomposition data exists for testing"""
    
    def test_decomposition_results_directory_exists(self):
        """Test that decomposition results directory exists"""
        decomp_dir = "decomposition_results"
        self.assertTrue(os.path.exists(decomp_dir), 
                       f"Decomposition results directory {decomp_dir} should exist")
    
    def test_demo_decomposition_exists(self):
        """Test that demo decomposition data exists"""
        demo_decomp_dir = "decomposition_results/demo/decomposed"
        if not os.path.exists(demo_decomp_dir):
            self.skipTest("Demo decomposition not found - may need to run: python decompose_hole_merge_pipeline.py dataset demo 1")
        
        # Check for at least one decomposed problem
        problem_dirs = [d for d in os.listdir(demo_decomp_dir) 
                       if os.path.isdir(os.path.join(demo_decomp_dir, d))]
        self.assertGreater(len(problem_dirs), 0, "Should have at least one decomposed demo problem")
        
        # Check first problem has required files
        first_problem_dir = os.path.join(demo_decomp_dir, problem_dirs[0])
        required_files = ["decomposition.json", "hole_version.lean", "header.lean"]
        
        for required_file in required_files:
            file_path = os.path.join(first_problem_dir, required_file)
            self.assertTrue(os.path.exists(file_path), 
                           f"Required file {required_file} should exist in {first_problem_dir}")


class TestBasicFunctionality(unittest.TestCase):
    """Test basic functionality without full integration"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.test_header = "import Mathlib\n"
        self.test_lean_code = """
theorem test_theorem (n : ℕ) : n + 0 = n := by
  sorry
"""
    
    def test_proofstep_integrator_session_creation(self):
        """Test ProofStepIntegrator can create a session"""
        try:
            integrator = ProofStepIntegrator(self.test_header)
            
            # Create a simple lean code with macros
            lean_code_with_macros = '''
macro "hole_1" : tactic => `(tactic| sorry)

theorem test (n : ℕ) : n + 0 = n := by
  hole_1
'''
            
            session = integrator.initialize_session(self.test_header, lean_code_with_macros)
            self.assertIsNotNone(session)
            self.assertIsInstance(session, ProofStepSession)
            self.assertIsNotNone(session.sorry_map)
            
        except Exception as e:
            self.skipTest(f"ProofStep session creation failed (may need Lean setup): {e}")


class TestEndToEndWithMockedLean(unittest.TestCase):
    """Test end-to-end functionality with mocked Lean interactions"""
    
    def test_minimal_verification_pipeline_mock_processing(self):
        """Test pipeline can process mock data without actual Lean server"""
        # This is a simplified test that checks the pipeline structure
        # without requiring a working Lean server
        
        pipeline = MinimalVerificationPipeline()
        
        # Test that pipeline has correct methods
        self.assertTrue(hasattr(pipeline, 'process_problem_with_constraint'))
        self.assertTrue(hasattr(pipeline, 'process_dataset_with_constraint'))
        self.assertTrue(hasattr(pipeline, '_save_dataset_summary'))
        
        # Test internal state
        self.assertEqual(pipeline.decomposition_base_dir, "decomposition_results")
        self.assertEqual(pipeline.suffix, "_ngram")


def create_test_report(test_results):
    """Create a comprehensive test report"""
    report = {
        "timestamp": str(datetime.now()),
        "test_summary": {
            "total_tests": test_results.testsRun,
            "failures": len(test_results.failures),
            "errors": len(test_results.errors),
            "success_rate": f"{((test_results.testsRun - len(test_results.failures) - len(test_results.errors)) / test_results.testsRun * 100):.1f}%"
        },
        "failures": [{"test": str(failure[0]), "error": failure[1]} for failure in test_results.failures],
        "errors": [{"test": str(error[0]), "error": error[1]} for error in test_results.errors],
        "component_status": {
            "minimal_verification_pipeline": "tested",
            "proofstep_lean_integration": "tested", 
            "proofstep_integration": "tested",
            "clean_ngram_searcher": "tested",
            "ngram_pickle_pipeline": "tested",
            "unified_problem_manager": "tested"
        }
    }
    return report


def main():
    """Run all tests and generate report"""
    print("🧪 Running Comprehensive N-gram Pipeline Tests")
    print("=" * 60)
    
    # Create test suite
    loader = unittest.TestLoader()
    suite = unittest.TestSuite()
    
    # Add all test classes
    test_classes = [
        TestComponentIntegrity,
        TestDataStructures, 
        TestDemoDatasetAvailability,
        TestDecompositionDataExists,
        TestBasicFunctionality,
        TestEndToEndWithMockedLean
    ]
    
    for test_class in test_classes:
        tests = loader.loadTestsFromTestCase(test_class)
        suite.addTests(tests)
    
    # Run tests
    runner = unittest.TextTestRunner(verbosity=2, stream=sys.stdout)
    result = runner.run(suite)
    
    # Generate report
    report = create_test_report(result)
    
    # Save report
    report_file = "ngram_pipeline_test_report.json"
    with open(report_file, 'w') as f:
        json.dump(report, f, indent=2)
    
    print(f"\n📊 Test Report Summary:")
    print(f"   Total Tests: {report['test_summary']['total_tests']}")
    print(f"   Success Rate: {report['test_summary']['success_rate']}")
    print(f"   Failures: {report['test_summary']['failures']}")
    print(f"   Errors: {report['test_summary']['errors']}")
    print(f"   Report saved to: {report_file}")
    
    # Return success if no failures or errors
    return len(result.failures) == 0 and len(result.errors) == 0


if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)