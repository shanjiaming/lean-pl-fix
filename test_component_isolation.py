#!/usr/bin/env python3
"""
Component Isolation Tests

Tests each component independently to identify which parts work
and which parts have issues. This helps isolate problems before refactoring.
"""

import os
import sys
import json
import tempfile
from datetime import datetime
from typing import Dict, List, Optional

# Add project root to path
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))


class ComponentIsolationTester:
    """Test components in isolation"""
    
    def __init__(self):
        self.results = {}
    
    def log_result(self, component: str, test: str, status: str, details: Dict = None):
        """Log test result"""
        if component not in self.results:
            self.results[component] = {}
        
        self.results[component][test] = {
            "status": status,
            "details": details or {},
            "timestamp": datetime.now().isoformat()
        }
        
        emoji = {"pass": "✅", "fail": "❌", "skip": "⏭️"}
        print(f"{emoji.get(status, '❓')} {component}.{test}: {status}")
        if status == "fail" and details:
            print(f"   Error: {details.get('error', 'Unknown')}")
    
    def test_unified_problem_manager(self):
        """Test unified_problem_manager in isolation"""
        component = "unified_problem_manager"
        
        try:
            from unified_problem_manager import problem_manager, Problem
            self.log_result(component, "import", "pass")
            
            # Test listing problems
            try:
                demo_problems = problem_manager.list_problems("demo")
                self.log_result(component, "list_demo_problems", "pass", {
                    "count": len(demo_problems) if demo_problems else 0
                })
                
                if demo_problems:
                    problem = demo_problems[0]
                    
                    # Test getting content
                    try:
                        header = problem_manager.get_header_content(problem)
                        content = problem_manager.get_problem_content(problem)
                        self.log_result(component, "get_content", "pass", {
                            "header_length": len(header),
                            "content_length": len(content)
                        })
                    except Exception as e:
                        self.log_result(component, "get_content", "fail", {"error": str(e)})
                        
                else:
                    self.log_result(component, "get_content", "skip", {"reason": "No demo problems"})
                    
            except Exception as e:
                self.log_result(component, "list_demo_problems", "fail", {"error": str(e)})
                
        except Exception as e:
            self.log_result(component, "import", "fail", {"error": str(e)})
    
    def test_proofstep_integration(self):
        """Test proofstep_integration in isolation"""
        component = "proofstep_integration"
        
        try:
            from proofstep_integration import ProofStepIntegrator, SorryInfo, ProofStepSession
            self.log_result(component, "import", "pass")
            
            # Test creating integrator
            try:
                integrator = ProofStepIntegrator("import Mathlib")
                self.log_result(component, "create_integrator", "pass")
                
                # Test parsing macro structure
                try:
                    test_code = '''
macro "hole_1" : tactic => `(tactic| sorry)
macro "hole_2" : tactic => `(tactic| sorry)

theorem test : 1 + 1 = 2 := by
  hole_1
'''
                    result = integrator.parse_macro_structure(test_code)
                    self.log_result(component, "parse_macros", "pass", {
                        "definitions_found": len(result.get("definitions", {})),
                        "usages_found": len(result.get("usages", []))
                    })
                except Exception as e:
                    self.log_result(component, "parse_macros", "fail", {"error": str(e)})
                    
            except Exception as e:
                self.log_result(component, "create_integrator", "fail", {"error": str(e)})
                
        except Exception as e:
            self.log_result(component, "import", "fail", {"error": str(e)})
    
    def test_proofstep_lean_integration(self):
        """Test proofstep_lean_integration in isolation"""
        component = "proofstep_lean_integration"
        
        try:
            from proofstep_lean_integration import MinimalLeanProofStepIntegrator
            self.log_result(component, "import", "pass")
            
            # Test creating integrator
            try:
                integrator = MinimalLeanProofStepIntegrator()
                self.log_result(component, "create_integrator", "pass", {
                    "verification_count": integrator.verification_count,
                    "max_verifications": integrator.max_verifications
                })
                
                # Test Lean server initialization (careful - might fail)
                try:
                    integrator.initialize_lean_server()
                    
                    if integrator.lean_server is not None:
                        self.log_result(component, "lean_server_init", "pass")
                        
                        # Test shutdown
                        try:
                            integrator.shutdown_lean_server()
                            self.log_result(component, "lean_server_shutdown", "pass")
                        except Exception as e:
                            self.log_result(component, "lean_server_shutdown", "fail", {"error": str(e)})
                    else:
                        self.log_result(component, "lean_server_init", "fail", {"error": "Server is None"})
                        
                except Exception as e:
                    self.log_result(component, "lean_server_init", "fail", {"error": str(e)})
                    
            except Exception as e:
                self.log_result(component, "create_integrator", "fail", {"error": str(e)})
                
        except Exception as e:
            self.log_result(component, "import", "fail", {"error": str(e)})
    
    def test_clean_ngram_searcher(self):
        """Test clean_ngram_searcher in isolation"""
        component = "clean_ngram_searcher"
        
        try:
            from clean_ngram_searcher import CleanNgramSearcher, SearchNode, NodeStatus
            self.log_result(component, "import", "pass")
            
            # Test creating searcher
            try:
                searcher = CleanNgramSearcher(max_depth=2, stop_on_first_success=True)
                self.log_result(component, "create_searcher", "pass", {
                    "max_depth": searcher.max_depth,
                    "stop_on_first_success": searcher.stop_on_first_success,
                    "available_tactics_count": len(searcher.available_tactics)
                })
                
                # Test SearchNode creation
                try:
                    node = SearchNode(
                        node_id="test_node",
                        tactic_sequence=["norm_num"],
                        parent_id=None,
                        depth=0
                    )
                    self.log_result(component, "create_search_node", "pass", {
                        "node_id": node.node_id,
                        "tactic_sequence": node.tactic_sequence,
                        "status": node.status.value
                    })
                except Exception as e:
                    self.log_result(component, "create_search_node", "fail", {"error": str(e)})
                    
            except Exception as e:
                self.log_result(component, "create_searcher", "fail", {"error": str(e)})
                
        except Exception as e:
            self.log_result(component, "import", "fail", {"error": str(e)})
    
    def test_ngram_pickle_pipeline(self):
        """Test ngram_pickle_pipeline in isolation"""
        component = "ngram_pickle_pipeline"
        
        try:
            from ngram_pickle_pipeline import CleanNgramPipeline, ProofStatePickleManager
            self.log_result(component, "import", "pass")
            
            # Test creating pipeline
            try:
                pipeline = CleanNgramPipeline(max_depth=2, stop_on_first_success=True)
                self.log_result(component, "create_pipeline", "pass", {
                    "max_depth": pipeline.max_depth,
                    "stop_on_first_success": pipeline.stop_on_first_success
                })
                
                # Test pickle manager
                try:
                    pickle_manager = ProofStatePickleManager(
                        problem_id="test_problem",
                        dataset="test_dataset"
                    )
                    self.log_result(component, "create_pickle_manager", "pass", {
                        "pickle_dir": pickle_manager.pickle_dir
                    })
                except Exception as e:
                    self.log_result(component, "create_pickle_manager", "fail", {"error": str(e)})
                    
            except Exception as e:
                self.log_result(component, "create_pipeline", "fail", {"error": str(e)})
                
        except Exception as e:
            self.log_result(component, "import", "fail", {"error": str(e)})
    
    def test_minimal_verification_pipeline(self):
        """Test minimal_verification_pipeline in isolation"""
        component = "minimal_verification_pipeline"
        
        try:
            from minimal_verification_pipeline_ngram import MinimalVerificationPipeline, MinimalVerificationResult
            self.log_result(component, "import", "pass")
            
            # Test creating pipeline
            try:
                pipeline = MinimalVerificationPipeline()
                self.log_result(component, "create_pipeline", "pass", {
                    "decomposition_base_dir": pipeline.decomposition_base_dir,
                    "suffix": pipeline.suffix
                })
                
                # Test result structure
                try:
                    result = MinimalVerificationResult(
                        problem_id="test",
                        dataset="test",
                        verification_count=0,
                        max_verifications=3,
                        original_verification_pass=True,
                        hole_verification_pass=True,
                        filled_verification_pass=True,
                        successful_tactics={},
                        tactic_mapping={},
                        complete_solve_success=True,
                        original_tactics_test={},
                        proof_state_tests=0,
                        processing_time_seconds=0.0,
                        constraint_satisfied=True
                    )
                    self.log_result(component, "create_result", "pass")
                except Exception as e:
                    self.log_result(component, "create_result", "fail", {"error": str(e)})
                    
            except Exception as e:
                self.log_result(component, "create_pipeline", "fail", {"error": str(e)})
                
        except Exception as e:
            self.log_result(component, "import", "fail", {"error": str(e)})
    
    def test_decompose_hole_merge_pipeline(self):
        """Test decompose_hole_merge_pipeline dependency"""
        component = "decompose_hole_merge_pipeline"
        
        try:
            from decompose_hole_merge_pipeline import DecomposeHoleMergePipeline
            self.log_result(component, "import", "pass")
            
            try:
                pipeline = DecomposeHoleMergePipeline()
                self.log_result(component, "create_pipeline", "pass")
            except Exception as e:
                self.log_result(component, "create_pipeline", "fail", {"error": str(e)})
                
        except Exception as e:
            self.log_result(component, "import", "fail", {"error": str(e)})
    
    def test_lean_interact_dependency(self):
        """Test lean_interact dependency"""
        component = "lean_interact"
        
        try:
            from lean_interact import LeanREPLConfig, LeanServer, FileCommand, ProofStep
            self.log_result(component, "import_basic", "pass")
            
            try:
                from lean_interact import PickleProofState, UnpickleProofState
                self.log_result(component, "import_pickle", "pass")
            except Exception as e:
                self.log_result(component, "import_pickle", "fail", {"error": str(e)})
                
            try:
                config = LeanREPLConfig()
                self.log_result(component, "create_config", "pass")
            except Exception as e:
                self.log_result(component, "create_config", "fail", {"error": str(e)})
                
        except Exception as e:
            self.log_result(component, "import_basic", "fail", {"error": str(e)})
    
    def run_all_tests(self):
        """Run all component isolation tests"""
        print("🔬 Running Component Isolation Tests")
        print("=" * 50)
        
        tests = [
            self.test_unified_problem_manager,
            self.test_proofstep_integration,
            self.test_proofstep_lean_integration,
            self.test_clean_ngram_searcher,
            self.test_ngram_pickle_pipeline,
            self.test_minimal_verification_pipeline,
            self.test_decompose_hole_merge_pipeline,
            self.test_lean_interact_dependency
        ]
        
        for test in tests:
            print(f"\n--- Testing {test.__name__.replace('test_', '')} ---")
            try:
                test()
            except Exception as e:
                component = test.__name__.replace('test_', '')
                self.log_result(component, "test_runner", "fail", {"error": str(e)})
    
    def generate_summary(self):
        """Generate test summary"""
        summary = {
            "total_components": len(self.results),
            "component_status": {},
            "overall_health": "unknown"
        }
        
        healthy_components = 0
        
        for component, tests in self.results.items():
            passed = sum(1 for test in tests.values() if test["status"] == "pass")
            failed = sum(1 for test in tests.values() if test["status"] == "fail")
            skipped = sum(1 for test in tests.values() if test["status"] == "skip")
            total = len(tests)
            
            status = "healthy" if failed == 0 and passed > 0 else "unhealthy" if failed > 0 else "untested"
            summary["component_status"][component] = {
                "status": status,
                "passed": passed,
                "failed": failed,
                "skipped": skipped,
                "total": total
            }
            
            if status == "healthy":
                healthy_components += 1
        
        health_ratio = healthy_components / len(self.results) if self.results else 0
        if health_ratio >= 0.8:
            summary["overall_health"] = "good"
        elif health_ratio >= 0.5:
            summary["overall_health"] = "fair"
        else:
            summary["overall_health"] = "poor"
        
        return summary
    
    def save_results(self, filename: str = "component_isolation_results.json"):
        """Save results to file"""
        summary = self.generate_summary()
        
        output = {
            "timestamp": datetime.now().isoformat(),
            "summary": summary,
            "detailed_results": self.results
        }
        
        with open(filename, 'w') as f:
            json.dump(output, f, indent=2)
        
        print(f"\n📊 Component Isolation Summary:")
        print(f"   Overall Health: {summary['overall_health'].upper()}")
        print(f"   Total Components: {summary['total_components']}")
        print(f"   Component Status:")
        
        for component, status in summary["component_status"].items():
            emoji = {"healthy": "✅", "unhealthy": "❌", "untested": "❓"}
            print(f"     {emoji.get(status['status'], '❓')} {component}: {status['status']} ({status['passed']}/{status['total']} passed)")
        
        print(f"   Results saved to: {filename}")
        
        return summary


def main():
    """Main test runner"""
    tester = ComponentIsolationTester()
    tester.run_all_tests()
    summary = tester.save_results()
    
    # Return success if overall health is good or fair
    return summary["overall_health"] in ["good", "fair"]


if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)