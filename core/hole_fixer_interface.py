from abc import ABC, abstractmethod
from typing import Callable, Dict, List, Optional, Tuple, Union, Any
from dataclasses import dataclass
from enum import Enum
import os
import json
import logging
from pathlib import Path
from datetime import datetime
import re

from data_management.unified_problem_manager import problem_manager, Problem
from solvers.decompose_solver_unified import unified_env
from utils.substep_saver_hole import process_lean_file_holeformat


class ProofStatus(Enum):
    PASS = "pass"
    FAIL = "fail"
    ERROR = "error"
    UNKNOWN = "unknown"


@dataclass
class HoleResult:
    """Result of fixing a single hole"""
    hole_id: str
    original_content: str
    fixed_content: str
    original_status: ProofStatus
    fixed_status: ProofStatus
    error_message: Optional[str] = None


@dataclass
class ProofSynthesisResult:
    """Result of synthesizing a complete proof from holes"""
    problem_id: str
    dataset: str
    original_proof_status: ProofStatus
    hole_results: List[HoleResult]
    synthesized_proof: str
    synthesized_status: ProofStatus
    partial_fix_status: ProofStatus  # Only fixing originally failed holes
    error_message: Optional[str] = None


@dataclass
class DatasetReport:
    """Summary report for a dataset"""
    dataset_name: str
    total_problems: int
    original_pass_count: int
    hole_pass_rates: Dict[str, float]  # hole_id -> pass_rate
    synthesis_pass_count: int
    partial_fix_pass_count: int
    problem_results: List[ProofSynthesisResult]


class HoleFixerInterface(ABC):
    """Abstract interface for hole fixing callbacks"""
    
    @abstractmethod
    def fix_hole(self, hole_content: str, problem_context: Problem) -> str:
        """
        Fix a single hole file and return the fixed content.
        
        Args:
            hole_content: The content of the hole file
            problem_context: The original problem for context
            
        Returns:
            Fixed hole content
        """
        pass


class ProofSynthesizer:
    """Handles synthesis of complete proofs from fixed holes"""
    
    def __init__(self):
        self.temp_dir = Path("temp_synthesis")
        self.temp_dir.mkdir(exist_ok=True)
    
    def check_proof_status(self, problem: Problem, proof_content: str) -> Tuple[ProofStatus, Optional[str]]:
        """Check if a proof passes in Lean"""
        try:
            header_content = problem_manager.get_header_content(problem)
            result = unified_env.run_with_header(header_content, proof_content)
            
            error_messages = [m.data for m in getattr(result, 'messages', []) if m.severity == "error"]
            if error_messages:
                return ProofStatus.FAIL, "; ".join(error_messages)
            else:
                return ProofStatus.PASS, None
                
        except Exception as e:
            return ProofStatus.ERROR, str(e)
    
    def extract_holes_from_problem(self, problem: Problem) -> List[str]:
        """Extract individual holes from a problem"""
        # First generate the hole version
        hole_filename = f"{problem.problem_id.replace('/', '_')}_hole.lean"
        hole_filepath = os.path.join(problem.hole_dir, hole_filename)
        
        os.makedirs(os.path.dirname(hole_filepath), exist_ok=True)
        
        # Generate hole file if it doesn't exist
        if not os.path.exists(hole_filepath):
            process_lean_file_holeformat(problem, hole_filepath)
        
        # Read the hole file and extract individual holes
        with open(hole_filepath, 'r') as f:
            hole_content = f.read()
        
        # Split into logical holes based on 'have' statements
        # This is a simplified version - could be made more sophisticated
        holes = []
        lines = hole_content.split('\n')
        current_hole = []
        
        for line in lines:
            if line.strip().startswith('have ') and current_hole:
                # Found start of new hole, save previous
                holes.append('\n'.join(current_hole))
                current_hole = [line]
            else:
                current_hole.append(line)
        
        if current_hole:
            holes.append('\n'.join(current_hole))
        
        return holes
    
    def synthesize_proof(self, problem: Problem, hole_results: List[HoleResult]) -> Tuple[str, ProofStatus, Optional[str]]:
        """Synthesize complete proof from fixed holes"""
        try:
            # Get original problem content
            original_content = problem_manager.get_problem_content(problem)
            
            # Replace holes with fixed content
            synthesized_content = original_content
            
            for hole_result in hole_results:
                # Simple replacement - in practice, this would be more sophisticated
                # involving proper parsing and reconstruction
                if hole_result.fixed_status == ProofStatus.PASS:
                    # Use the fixed content
                    synthesized_content = synthesized_content.replace(
                        "hole", hole_result.fixed_content, 1
                    )
            
            # Check the synthesized proof
            status, error = self.check_proof_status(problem, synthesized_content)
            return synthesized_content, status, error
            
        except Exception as e:
            return "", ProofStatus.ERROR, str(e)


class DatasetProcessor:
    """Main processor for handling datasets with hole fixing"""
    
    def __init__(self, hole_fixer: HoleFixerInterface, enable_logging: bool = True):
        self.hole_fixer = hole_fixer
        self.synthesizer = ProofSynthesizer()
        self.enable_logging = enable_logging
        
        if enable_logging:
            self._setup_logging()
    
    def _setup_logging(self):
        """Setup detailed logging for the hole fixing process"""
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        log_dir = Path("hole_fixing_logs")
        log_dir.mkdir(exist_ok=True)
        
        # Create logger
        self.logger = logging.getLogger('HoleFixing')
        self.logger.setLevel(logging.INFO)
        
        # Clear existing handlers
        self.logger.handlers.clear()
        
        # File handler for detailed logs
        log_file = log_dir / f"hole_fixing_{timestamp}.log"
        file_handler = logging.FileHandler(log_file)
        file_handler.setLevel(logging.INFO)
        
        # Console handler for important info
        console_handler = logging.StreamHandler()
        console_handler.setLevel(logging.INFO)
        
        # Formatter
        formatter = logging.Formatter(
            '%(asctime)s - %(levelname)s - %(message)s',
            datefmt='%Y-%m-%d %H:%M:%S'
        )
        file_handler.setFormatter(formatter)
        console_handler.setFormatter(formatter)
        
        self.logger.addHandler(file_handler)
        self.logger.addHandler(console_handler)
        
        self.logger.info("Hole fixing logging initialized")
    
    def process_problem(self, problem: Problem) -> ProofSynthesisResult:
        """Process a single problem with hole fixing"""
        if self.enable_logging:
            self.logger.info(f"Processing problem: {problem.dataset}/{problem.problem_id}")
        
        try:
            # Extract holes from the problem
            holes = self.synthesizer.extract_holes_from_problem(problem)
            hole_results = []
            
            for i, hole_content in enumerate(holes):
                hole_id = f"hole_{i}"
                
                if self.enable_logging:
                    self.logger.info(f"  Processing hole {hole_id}")
                
                # Check original hole status
                original_status, original_error = self.synthesizer.check_proof_status(problem, hole_content)
                
                try:
                    # Fix the hole using the provided fixer
                    fixed_content = self.hole_fixer.fix_hole(hole_content, problem)
                    
                    # Check fixed hole status
                    fixed_status, fixed_error = self.synthesizer.check_proof_status(problem, fixed_content)
                    
                    hole_result = HoleResult(
                        hole_id=hole_id,
                        original_content=hole_content,
                        fixed_content=fixed_content,
                        original_status=original_status,
                        fixed_status=fixed_status,
                        error_message=fixed_error
                    )
                    
                    if self.enable_logging:
                        self.logger.info(f"    Original: {original_status.value}, Fixed: {fixed_status.value}")
                    
                except Exception as e:
                    hole_result = HoleResult(
                        hole_id=hole_id,
                        original_content=hole_content,
                        fixed_content=hole_content,  # Keep original on error
                        original_status=original_status,
                        fixed_status=ProofStatus.ERROR,
                        error_message=str(e)
                    )
                    
                    if self.enable_logging:
                        self.logger.error(f"    Error fixing hole {hole_id}: {e}")
                
                hole_results.append(hole_result)
            
            # Check original proof status
            original_proof_content = problem_manager.get_problem_content(problem)
            original_proof_status, _ = self.synthesizer.check_proof_status(problem, original_proof_content)
            
            # Synthesize complete proof
            synthesized_content, synthesized_status, synthesis_error = self.synthesizer.synthesize_proof(problem, hole_results)
            
            # Calculate partial fix status (only fixing originally failed holes)
            partial_fix_holes = [hr for hr in hole_results if hr.original_status == ProofStatus.FAIL]
            if partial_fix_holes:
                partial_synthesized_content, partial_fix_status, _ = self.synthesizer.synthesize_proof(problem, partial_fix_holes)
            else:
                partial_fix_status = original_proof_status
            
            result = ProofSynthesisResult(
                problem_id=problem.problem_id,
                dataset=problem.dataset,
                original_proof_status=original_proof_status,
                hole_results=hole_results,
                synthesized_proof=synthesized_content,
                synthesized_status=synthesized_status,
                partial_fix_status=partial_fix_status,
                error_message=synthesis_error
            )
            
            if self.enable_logging:
                self.logger.info(f"  Complete - Original: {original_proof_status.value}, "
                               f"Synthesized: {synthesized_status.value}, "
                               f"Partial fix: {partial_fix_status.value}")
            
            return result
            
        except Exception as e:
            if self.enable_logging:
                self.logger.error(f"Error processing problem {problem.problem_id}: {e}")
            
            return ProofSynthesisResult(
                problem_id=problem.problem_id,
                dataset=problem.dataset,
                original_proof_status=ProofStatus.ERROR,
                hole_results=[],
                synthesized_proof="",
                synthesized_status=ProofStatus.ERROR,
                partial_fix_status=ProofStatus.ERROR,
                error_message=str(e)
            )
    
    def process_dataset(self, dataset_name: str) -> DatasetReport:
        """Process an entire dataset"""
        if self.enable_logging:
            self.logger.info(f"Starting processing of dataset: {dataset_name}")
        
        # Get all problems for this dataset
        problems = problem_manager.get_all_problems_for_dataset(dataset_name)
        
        if not problems:
            if self.enable_logging:
                self.logger.warning(f"No problems found for dataset: {dataset_name}")
            return DatasetReport(
                dataset_name=dataset_name,
                total_problems=0,
                original_pass_count=0,
                hole_pass_rates={},
                synthesis_pass_count=0,
                partial_fix_pass_count=0,
                problem_results=[]
            )
        
        if self.enable_logging:
            self.logger.info(f"Found {len(problems)} problems in {dataset_name}")
        
        # Process each problem
        results = []
        for i, problem in enumerate(problems):
            if self.enable_logging and i % 10 == 0:
                self.logger.info(f"Progress: {i}/{len(problems)} problems processed")
            
            result = self.process_problem(problem)
            results.append(result)
        
        # Generate report
        report = self._generate_report(dataset_name, results)
        
        if self.enable_logging:
            self._log_dataset_statistics(report)
        
        return report
    
    def _log_dataset_statistics(self, report: DatasetReport):
        """Log comprehensive statistics for the dataset"""
        self.logger.info(f"\n=== DATASET STATISTICS: {report.dataset_name} ===")
        self.logger.info(f"Total problems: {report.total_problems}")
        self.logger.info(f"Original pass rate: {report.original_pass_count}/{report.total_problems} ({report.original_pass_count/report.total_problems*100:.1f}%)")
        self.logger.info(f"Synthesis pass rate: {report.synthesis_pass_count}/{report.total_problems} ({report.synthesis_pass_count/report.total_problems*100:.1f}%)")
        self.logger.info(f"Partial fix pass rate: {report.partial_fix_pass_count}/{report.total_problems} ({report.partial_fix_pass_count/report.total_problems*100:.1f}%)")
        
        if report.hole_pass_rates:
            self.logger.info("Hole-specific pass rates:")
            for hole_id, pass_rate in report.hole_pass_rates.items():
                self.logger.info(f"  {hole_id}: {pass_rate:.1f}%")
        
        # Count by status categories
        status_counts = {}
        for result in report.problem_results:
            status = result.synthesized_status.value
            status_counts[status] = status_counts.get(status, 0) + 1
        
        self.logger.info("Final status distribution:")
        for status, count in status_counts.items():
            self.logger.info(f"  {status}: {count}")
        
        self.logger.info("=" * 50)
    
    def _generate_report(self, dataset_name: str, results: List[ProofSynthesisResult]) -> DatasetReport:
        """Generate a comprehensive report from results"""
        total_problems = len(results)
        
        # Count original passes
        original_pass_count = sum(1 for r in results if r.original_proof_status == ProofStatus.PASS)
        
        # Count synthesis passes
        synthesis_pass_count = sum(1 for r in results if r.synthesized_status == ProofStatus.PASS)
        
        # Count partial fix passes
        partial_fix_pass_count = sum(1 for r in results if r.partial_fix_status == ProofStatus.PASS)
        
        # Calculate hole-specific pass rates
        hole_stats = {}
        for result in results:
            for hole_result in result.hole_results:
                hole_id = hole_result.hole_id
                if hole_id not in hole_stats:
                    hole_stats[hole_id] = {'total': 0, 'passed': 0}
                
                hole_stats[hole_id]['total'] += 1
                if hole_result.fixed_status == ProofStatus.PASS:
                    hole_stats[hole_id]['passed'] += 1
        
        hole_pass_rates = {
            hole_id: (stats['passed'] / stats['total'] * 100) if stats['total'] > 0 else 0
            for hole_id, stats in hole_stats.items()
        }
        
        return DatasetReport(
            dataset_name=dataset_name,
            total_problems=total_problems,
            original_pass_count=original_pass_count,
            hole_pass_rates=hole_pass_rates,
            synthesis_pass_count=synthesis_pass_count,
            partial_fix_pass_count=partial_fix_pass_count,
            problem_results=results
        )
    
    def save_report(self, reports: Dict[str, DatasetReport], output_file: str):
        """Save reports to JSON file"""
        # Convert reports to serializable format
        serializable_reports = {}
        for dataset_name, report in reports.items():
            serializable_reports[dataset_name] = {
                'dataset_name': report.dataset_name,
                'total_problems': report.total_problems,
                'original_pass_count': report.original_pass_count,
                'hole_pass_rates': report.hole_pass_rates,
                'synthesis_pass_count': report.synthesis_pass_count,
                'partial_fix_pass_count': report.partial_fix_pass_count,
                'problem_results': [
                    {
                        'problem_id': result.problem_id,
                        'dataset': result.dataset,
                        'original_proof_status': result.original_proof_status.value,
                        'synthesized_status': result.synthesized_status.value,
                        'partial_fix_status': result.partial_fix_status.value,
                        'hole_count': len(result.hole_results),
                        'holes_fixed': sum(1 for hr in result.hole_results if hr.fixed_status == ProofStatus.PASS),
                        'error_message': result.error_message
                    }
                    for result in report.problem_results
                ]
            }
        
        with open(output_file, 'w') as f:
            json.dump(serializable_reports, f, indent=2)
        
        if self.enable_logging:
            self.logger.info(f"Reports saved to {output_file}")


class SimpleHoleFixer(HoleFixerInterface):
    """Simple hole fixer that just adds sorry"""
    
    def fix_hole(self, hole_content: str, problem_context: Problem) -> str:
        # Simple implementation - just add sorry
        return hole_content.replace("hole", "sorry")


class DPV2HoleFixer(HoleFixerInterface):
    """Hole fixer using DPV2 solver"""
    
    def __init__(self):
        # Import here to avoid circular dependencies
        from solvers.dpv2_solver import solve_with_dpv2
        self.solve_func = solve_with_dpv2
    
    def fix_hole(self, hole_content: str, problem_context: Problem) -> str:
        try:
            # Use DPV2 to fix the hole
            fixed_content = self.solve_func(problem_context, lambda x: x + "\nsorry")
            return fixed_content
        except Exception as e:
            # Fallback to simple sorry
            return hole_content.replace("hole", "sorry") 