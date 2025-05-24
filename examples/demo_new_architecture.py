#!/usr/bin/env python3
"""
Demo script for the new modular architecture of lean-pl-fix

This script demonstrates how to use the new modular components
to solve Lean proof problems.
"""

def demo_basic_usage():
    """Demonstrate basic usage of the new architecture"""
    print("=== Basic Usage Demo ===")
    
    try:
        # Import core modules
        from data.problem_manager import Problem
        from solvers.base_solver import SolverConfig
        from solvers.decompose_solver_unified import DecomposeSolver
        
        # Create a sample problem
        problem = Problem(
            problem_id="demo_001",
            dataset="demo",
            problem_statement="theorem demo_theorem : 1 + 1 = 2 := by sorry",
            header="-- Demo header"
        )
        
        print(f"Created problem: {problem.problem_id}")
        print(f"Problem statement: {problem.problem_statement}")
        
        # Create solver with configuration
        config = SolverConfig(timeout=30, max_attempts=5)
        solver = DecomposeSolver(config)
        
        print(f"Created solver: {solver.__class__.__name__}")
        
        # Solve the problem
        result = solver.solve(problem)
        
        print(f"Solver result status: {result.status}")
        print(f"Solution: {result.solution}")
        
        return True
        
    except Exception as e:
        print(f"Error in basic usage demo: {e}")
        return False


def demo_utils_usage():
    """Demonstrate utility functions"""
    print("\n=== Utils Demo ===")
    
    try:
        from utils.lean_utils import extract_theorem_name, validate_lean_syntax
        from utils.text_utils import clean_whitespace, normalize_lean_code
        from utils.file_utils import ensure_directory
        
        # Test Lean utilities
        theorem_text = "theorem my_theorem : P → Q := by sorry"
        theorem_name = extract_theorem_name(theorem_text)
        print(f"Extracted theorem name: {theorem_name}")
        
        # Test syntax validation
        is_valid = validate_lean_syntax(theorem_text)
        print(f"Syntax is valid: {is_valid}")
        
        # Test text utilities
        messy_text = "  hello   world  \n\n  test  "
        clean_text = clean_whitespace(messy_text)
        print(f"Cleaned text: '{clean_text}'")
        
        # Test file utilities
        test_dir = "temp_demo_dir"
        ensure_directory(test_dir)
        print(f"Ensured directory: {test_dir}")
        
        return True
        
    except Exception as e:
        print(f"Error in utils demo: {e}")
        return False


def demo_data_management():
    """Demonstrate data management capabilities"""
    print("\n=== Data Management Demo ===")
    
    try:
        from data.problem_manager import ProblemManager
        from data.dataset_processor import DatasetProcessor
        
        # Create problem manager
        problem_manager = ProblemManager()
        print("Created problem manager")
        
        # Create sample problems
        problems = [
            {
                "problem_id": "test_001",
                "dataset": "demo",
                "problem_statement": "theorem test1 : True := by trivial",
                "header": ""
            },
            {
                "problem_id": "test_002", 
                "dataset": "demo",
                "problem_statement": "theorem test2 : 1 = 1 := by rfl",
                "header": ""
            }
        ]
        
        for prob_data in problems:
            problem = problem_manager.create_problem(**prob_data)
            print(f"Created problem: {problem.problem_id}")
        
        # Create dataset processor
        processor = DatasetProcessor()
        print("Created dataset processor")
        
        return True
        
    except Exception as e:
        print(f"Error in data management demo: {e}")
        return False


def demo_theorem_search():
    """Demonstrate theorem search capabilities"""
    print("\n=== Theorem Search Demo ===")
    
    try:
        from theorem_search.searcher import TheoremSearcher
        from theorem_search.similarity import SimilarityCalculator
        
        # Create theorem searcher
        searcher = TheoremSearcher()
        print("Created theorem searcher")
        
        # Create similarity calculator
        similarity_calc = SimilarityCalculator()
        print("Created similarity calculator")
        
        # Demo similarity calculation
        theorem1 = "add_comm"
        theorem2 = "mul_comm"
        similarity = similarity_calc.calculate_similarity(theorem1, theorem2)
        print(f"Similarity between '{theorem1}' and '{theorem2}': {similarity}")
        
        return True
        
    except Exception as e:
        print(f"Error in theorem search demo: {e}")
        return False


def demo_logging():
    """Demonstrate logging utilities"""
    print("\n=== Logging Demo ===")
    
    try:
        from utils.logging_utils import setup_logger, log_execution_time, LogLevel
        
        # Setup logger
        logger = setup_logger("demo_logger", LogLevel.INFO)
        logger.info("Demo logger created successfully")
        
        # Demo execution time logging
        @log_execution_time(logger)
        def sample_function():
            import time
            time.sleep(0.1)  # Simulate some work
            return "Function completed"
        
        result = sample_function()
        print(f"Function result: {result}")
        
        return True
        
    except Exception as e:
        print(f"Error in logging demo: {e}")
        return False


def main():
    """Main demo function"""
    print("Lean-PL-Fix New Architecture Demo")
    print("=" * 50)
    
    demos = [
        ("Basic Usage", demo_basic_usage),
        ("Utils Usage", demo_utils_usage),
        ("Data Management", demo_data_management),
        ("Theorem Search", demo_theorem_search),
        ("Logging", demo_logging)
    ]
    
    results = {}
    
    for demo_name, demo_func in demos:
        try:
            success = demo_func()
            results[demo_name] = success
        except Exception as e:
            print(f"Demo '{demo_name}' failed with error: {e}")
            results[demo_name] = False
    
    # Summary
    print("\n" + "=" * 50)
    print("Demo Results Summary:")
    for demo_name, success in results.items():
        status = "✓ PASS" if success else "✗ FAIL"
        print(f"{demo_name}: {status}")
    
    total_passed = sum(results.values())
    total_demos = len(results)
    print(f"\nOverall: {total_passed}/{total_demos} demos passed")
    
    if total_passed == total_demos:
        print("🎉 All demos completed successfully!")
    else:
        print("⚠️  Some demos failed. Check the output above for details.")


if __name__ == "__main__":
    main() 