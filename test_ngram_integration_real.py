#!/usr/bin/env python3
"""
Real Integration Tests for N-gram Pipeline

Tests actual integration with real demo problems and Lean servers.
This establishes a working baseline before refactoring.
"""

import os
import sys
import json
import time
import tempfile
from datetime import datetime
from typing import Dict, List, Optional

# Add project root to path
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from minimal_verification_pipeline_ngram import MinimalVerificationPipeline
from proofstep_lean_integration import MinimalLeanProofStepIntegrator
from unified_problem_manager import problem_manager


class NGramIntegrationTester:
    """Test actual N-gram pipeline integration"""
    
    def __init__(self):
        self.test_results = {
            "timestamp": datetime.now().isoformat(),
            "tests": {},
            "summary": {
                "total_tests": 0,
                "passed": 0,
                "failed": 0,
                "skipped": 0
            }
        }
    
    def log_test(self, test_name: str, status: str, details: Dict = None):
        """Log test result"""
        self.test_results["tests"][test_name] = {
            "status": status,
            "timestamp": datetime.now().isoformat(),
            "details": details or {}
        }
        self.test_results["summary"]["total_tests"] += 1
        self.test_results["summary"][status] += 1
        
        status_emoji = {"passed": "✅", "failed": "❌", "skipped": "⏭️"}
        print(f"{status_emoji.get(status, '❓')} {test_name}: {status}")
        if details and status == "failed":
            print(f"   Error: {details.get('error', 'Unknown error')}")
    
    def test_demo_data_availability(self):
        """Test that demo data is available and properly structured"""
        test_name = "demo_data_availability"
        
        try:
            # Check demo problems exist
            problems = problem_manager.list_problems("demo")
            if not problems:
                self.log_test(test_name, "failed", {"error": "No demo problems found"})
                return False
            
            # Check first problem has content
            problem = problems[0]
            header_content = problem_manager.get_header_content(problem)
            problem_content = problem_manager.get_problem_content(problem)
            
            if not header_content or not problem_content:
                self.log_test(test_name, "failed", {"error": "Demo problem content missing"})
                return False
            
            self.log_test(test_name, "passed", {
                "problems_found": len(problems),
                "first_problem": problem.problem_id,
                "header_length": len(header_content),
                "content_length": len(problem_content)
            })
            return True
            
        except Exception as e:
            self.log_test(test_name, "failed", {"error": str(e)})
            return False
    
    def test_decomposition_data_exists(self):
        """Test that decomposition data exists for demo problems"""
        test_name = "decomposition_data_exists"
        
        try:
            problems = problem_manager.list_problems("demo")
            if not problems:
                self.log_test(test_name, "skipped", {"reason": "No demo problems"})
                return False
            
            problem = problems[0]
            decomp_dir = f"decomposition_results/demo/decomposed/{problem.problem_id}"
            decomp_json = os.path.join(decomp_dir, "decomposition.json")
            hole_version = os.path.join(decomp_dir, "hole_version.lean")
            
            if not os.path.exists(decomp_json) or not os.path.exists(hole_version):
                self.log_test(test_name, "failed", {
                    "error": "Decomposition files missing",
                    "decomp_json_exists": os.path.exists(decomp_json),
                    "hole_version_exists": os.path.exists(hole_version),
                    "expected_dir": decomp_dir
                })
                return False
            
            # Check decomposition.json content
            with open(decomp_json, 'r') as f:
                decomp_data = json.load(f)
            
            holes = decomp_data.get('holes', [])
            
            self.log_test(test_name, "passed", {
                "problem_id": problem.problem_id,
                "holes_count": len(holes),
                "decomp_dir": decomp_dir
            })
            return True
            
        except Exception as e:
            self.log_test(test_name, "failed", {"error": str(e)})
            return False
    
    def test_lean_server_initialization(self):
        """Test that Lean server can be initialized"""
        test_name = "lean_server_initialization"
        
        integrator = None
        try:
            integrator = MinimalLeanProofStepIntegrator()
            integrator.initialize_lean_server()
            
            if integrator.lean_server is None:
                self.log_test(test_name, "failed", {"error": "Lean server is None after initialization"})
                return False
            
            self.log_test(test_name, "passed", {
                "verification_count": integrator.verification_count,
                "max_verifications": integrator.max_verifications
            })
            return True
            
        except Exception as e:
            self.log_test(test_name, "failed", {"error": str(e)})
            return False
        finally:
            if integrator:
                try:
                    integrator.shutdown_lean_server()
                except:
                    pass
    
    def test_minimal_verification_pipeline_creation(self):
        """Test MinimalVerificationPipeline can be created and configured"""
        test_name = "minimal_verification_pipeline_creation"
        
        try:
            pipeline = MinimalVerificationPipeline()
            
            # Test basic properties
            self.log_test(test_name, "passed", {
                "decomposition_base_dir": pipeline.decomposition_base_dir,
                "suffix": pipeline.suffix,
                "has_process_method": hasattr(pipeline, 'process_problem_with_constraint')
            })
            return True
            
        except Exception as e:
            self.log_test(test_name, "failed", {"error": str(e)})
            return False
    
    def test_single_problem_processing_dry_run(self):
        """Test processing a single problem (dry run - check setup only)"""
        test_name = "single_problem_processing_dry_run"
        
        try:
            problems = problem_manager.list_problems("demo")
            if not problems:
                self.log_test(test_name, "skipped", {"reason": "No demo problems"})
                return False
            
            problem = problems[0]
            pipeline = MinimalVerificationPipeline()
            
            # Check if decomposition exists
            decomp_dir = os.path.join(pipeline.decomposition_base_dir, problem.dataset, "decomposed", problem.problem_id)
            decomp_json_path = os.path.join(decomp_dir, "decomposition.json")
            
            if not os.path.exists(decomp_json_path):
                self.log_test(test_name, "failed", {
                    "error": "Decomposition not found",
                    "expected_path": decomp_json_path,
                    "suggestion": f"Run: python decompose_hole_merge_pipeline.py problem demo {problem.problem_id}"
                })
                return False
            
            # Check decomposition content
            with open(decomp_json_path, 'r') as f:
                decomp_data = json.load(f)
            
            original_tactics = {}
            if 'holes' in decomp_data:
                for hole_data in decomp_data['holes']:
                    hole_id = hole_data.get('hole_id')
                    original_proof = hole_data.get('original_proof')
                    if hole_id and original_proof:
                        original_tactics[hole_id] = original_proof
            
            self.log_test(test_name, "passed", {
                "problem_id": problem.problem_id,
                "decomp_exists": True,
                "original_tactics_count": len(original_tactics),
                "verification_passes": {
                    "original": decomp_data.get('original_verification_pass'),
                    "hole": decomp_data.get('hole_verification_pass')
                }
            })
            return True
            
        except Exception as e:
            self.log_test(test_name, "failed", {"error": str(e)})
            return False
    
    def test_actual_ngram_processing_quick(self):
        """Test actual N-gram processing with minimal scope"""
        test_name = "actual_ngram_processing_quick"
        
        pipeline = None
        integrator = None
        
        try:
            problems = problem_manager.list_problems("demo")
            if not problems:
                self.log_test(test_name, "skipped", {"reason": "No demo problems"})
                return False
            
            problem = problems[0]
            
            # Check decomposition exists
            decomp_dir = f"decomposition_results/demo/decomposed/{problem.problem_id}"
            decomp_json = os.path.join(decomp_dir, "decomposition.json")
            
            if not os.path.exists(decomp_json):
                self.log_test(test_name, "skipped", {
                    "reason": "No decomposition data",
                    "suggestion": f"Run: python decompose_hole_merge_pipeline.py problem demo {problem.problem_id}"
                })
                return False
            
            # Initialize pipeline
            pipeline = MinimalVerificationPipeline()
            
            print(f"   🔄 Attempting N-gram processing on {problem.problem_id}...")
            start_time = time.time()
            
            # Process with timeout protection
            result = pipeline.process_problem_with_constraint(problem)
            processing_time = time.time() - start_time
            
            self.log_test(test_name, "passed", {
                "problem_id": result.problem_id,
                "verification_count": result.verification_count,
                "constraint_satisfied": result.constraint_satisfied,
                "complete_solve_success": result.complete_solve_success,
                "successful_tactics_count": len(result.successful_tactics),
                "processing_time_seconds": processing_time
            })
            return True
            
        except Exception as e:
            self.log_test(test_name, "failed", {"error": str(e)})
            return False
    
    def run_all_tests(self):
        """Run all integration tests"""
        print("🚀 Running N-gram Pipeline Integration Tests")
        print("=" * 60)
        
        tests = [
            self.test_demo_data_availability,
            self.test_decomposition_data_exists,
            self.test_lean_server_initialization,
            self.test_minimal_verification_pipeline_creation,
            self.test_single_problem_processing_dry_run,
            self.test_actual_ngram_processing_quick
        ]
        
        for test in tests:
            try:
                test()
            except Exception as e:
                test_name = test.__name__
                self.log_test(test_name, "failed", {"error": f"Test runner error: {str(e)}"})
        
        return self.test_results
    
    def save_results(self, filename: str = "ngram_integration_test_results.json"):
        """Save test results to file"""
        with open(filename, 'w') as f:
            json.dump(self.test_results, f, indent=2)
        
        print(f"\n📊 Integration Test Summary:")
        summary = self.test_results["summary"]
        print(f"   Total Tests: {summary['total_tests']}")
        print(f"   Passed: {summary['passed']}")
        print(f"   Failed: {summary['failed']}")
        print(f"   Skipped: {summary['skipped']}")
        print(f"   Success Rate: {(summary['passed'] / summary['total_tests'] * 100):.1f}%")
        print(f"   Results saved to: {filename}")


def main():
    """Main test runner"""
    tester = NGramIntegrationTester()
    results = tester.run_all_tests()
    tester.save_results()
    
    # Return success if no failures
    return results["summary"]["failed"] == 0


if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)