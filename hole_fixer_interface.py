from abc import ABC, abstractmethod
from typing import Callable, Dict, List, Optional, Tuple
from dataclasses import dataclass
from enum import Enum
import os
import json
import logging
from pathlib import Path
from datetime import datetime

from unified_problem_manager import problem_manager, Problem
from decompose_solver import unified_env
from substep_saver_hole import process_lean_file_holeformat


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
        
        self.logger.info(f"=== Hole Fixing Session Started ===")
        self.logger.info(f"Fixer: {type(self.hole_fixer).__name__}")
        self.logger.info(f"Log file: {log_file}")
    
    def process_problem(self, problem: Problem) -> ProofSynthesisResult:
        """Process a single problem with detailed logging"""
        
        if self.enable_logging:
            self.logger.info(f"\n--- Processing Problem: {problem.dataset}/{problem.problem_id} ---")
        
        # Check original proof status
        original_content = problem_manager.get_problem_content(problem)
        original_status, original_error = self.synthesizer.check_proof_status(problem, original_content)
        
        if self.enable_logging:
            self.logger.info(f"Original proof status: {original_status.value}")
            if original_error:
                self.logger.info(f"Original error: {original_error}")
        
        # Extract holes
        holes = self.synthesizer.extract_holes_from_problem(problem)
        
        if self.enable_logging:
            self.logger.info(f"Extracted {len(holes)} holes from problem")
        
        # Process each hole
        hole_results = []
        for i, hole_content in enumerate(holes):
            hole_id = f"hole_{i}"
            
            if self.enable_logging:
                self.logger.info(f"\n  --> Processing {hole_id}")
                self.logger.info(f"  Input: {hole_content.strip()}")
            
            # Check original hole status
            orig_status, orig_error = self.synthesizer.check_proof_status(problem, hole_content)
            
            if self.enable_logging:
                self.logger.info(f"  Original hole status: {orig_status.value}")
            
            # Attempt to fix the hole
            try:
                if self.enable_logging:
                    self.logger.info(f"  Attempting repair with {type(self.hole_fixer).__name__}...")
                
                fixed_content = self.hole_fixer.fix_hole(hole_content, problem)
                
                if self.enable_logging:
                    self.logger.info(f"  Fixed content: {fixed_content.strip()}")
                
                fixed_status, fixed_error = self.synthesizer.check_proof_status(problem, fixed_content)
                
                if self.enable_logging:
                    success_indicator = "✓" if fixed_status == ProofStatus.PASS else "✗"
                    self.logger.info(f"  Repair result: {fixed_status.value} {success_indicator}")
                    if fixed_error:
                        self.logger.info(f"  Repair error: {fixed_error}")
                
            except Exception as e:
                fixed_content = hole_content
                fixed_status = ProofStatus.ERROR
                fixed_error = str(e)
                
                if self.enable_logging:
                    self.logger.error(f"  Repair failed with exception: {e}")
            
            hole_results.append(HoleResult(
                hole_id=hole_id,
                original_content=hole_content,
                fixed_content=fixed_content,
                original_status=orig_status,
                fixed_status=fixed_status,
                error_message=fixed_error
            ))
        
        # Log hole processing summary
        if self.enable_logging:
            successful_fixes = sum(1 for h in hole_results if h.fixed_status == ProofStatus.PASS)
            improved_holes = sum(1 for h in hole_results 
                               if h.original_status == ProofStatus.FAIL and h.fixed_status == ProofStatus.PASS)
            self.logger.info(f"\nHole processing summary:")
            self.logger.info(f"  Total holes: {len(hole_results)}")
            self.logger.info(f"  Successful fixes: {successful_fixes}")
            self.logger.info(f"  Improved holes: {improved_holes}")
        
        # Synthesize complete proof
        if self.enable_logging:
            self.logger.info(f"Synthesizing complete proof...")
        
        synthesized_proof, synthesis_status, synthesis_error = self.synthesizer.synthesize_proof(
            problem, hole_results
        )
        
        if self.enable_logging:
            synthesis_indicator = "✓" if synthesis_status == ProofStatus.PASS else "✗"
            self.logger.info(f"Synthesis result: {synthesis_status.value} {synthesis_indicator}")
        
        # Try partial fix (only originally failed holes)
        partial_hole_results = []
        for hole_result in hole_results:
            if hole_result.original_status == ProofStatus.FAIL:
                partial_hole_results.append(hole_result)
            else:
                # Keep original for passing holes
                partial_hole_results.append(HoleResult(
                    hole_id=hole_result.hole_id,
                    original_content=hole_result.original_content,
                    fixed_content=hole_result.original_content,
                    original_status=hole_result.original_status,
                    fixed_status=hole_result.original_status
                ))
        
        partial_proof, partial_status, _ = self.synthesizer.synthesize_proof(
            problem, partial_hole_results
        )
        
        if self.enable_logging:
            partial_indicator = "✓" if partial_status == ProofStatus.PASS else "✗"
            self.logger.info(f"Partial fix result: {partial_status.value} {partial_indicator}")
            
            # Final summary for this problem
            self.logger.info(f"Problem {problem.problem_id} summary:")
            self.logger.info(f"  Original: {original_status.value}")
            self.logger.info(f"  Full synthesis: {synthesis_status.value}")
            self.logger.info(f"  Partial fix: {partial_status.value}")
        
        return ProofSynthesisResult(
            problem_id=problem.problem_id,
            dataset=problem.dataset,
            original_proof_status=original_status,
            hole_results=hole_results,
            synthesized_proof=synthesized_proof,
            synthesized_status=synthesis_status,
            partial_fix_status=partial_status,
            error_message=synthesis_error
        )
    
    def process_dataset(self, dataset_name: str) -> DatasetReport:
        """Process an entire dataset with detailed logging"""
        problems = problem_manager.list_problems(dataset_name)
        results = []
        
        if self.enable_logging:
            self.logger.info(f"\n{'='*60}")
            self.logger.info(f"PROCESSING DATASET: {dataset_name}")
            self.logger.info(f"{'='*60}")
            self.logger.info(f"Total problems to process: {len(problems)}")
        
        for i, problem in enumerate(problems):
            if self.enable_logging:
                self.logger.info(f"\n[{i+1}/{len(problems)}] Starting problem {problem.problem_id}")
            
            try:
                result = self.process_problem(problem)
                results.append(result)
                
                if self.enable_logging:
                    self.logger.info(f"[{i+1}/{len(problems)}] Completed problem {problem.problem_id}")
                    
            except Exception as e:
                if self.enable_logging:
                    self.logger.error(f"[{i+1}/{len(problems)}] Error processing {problem.problem_id}: {e}")
                
                # Add error result
                results.append(ProofSynthesisResult(
                    problem_id=problem.problem_id,
                    dataset=dataset_name,
                    original_proof_status=ProofStatus.ERROR,
                    hole_results=[],
                    synthesized_proof="",
                    synthesized_status=ProofStatus.ERROR,
                    partial_fix_status=ProofStatus.ERROR,
                    error_message=str(e)
                ))
        
        # Generate report with detailed logging
        report = self._generate_report(dataset_name, results)
        
        if self.enable_logging:
            self._log_dataset_statistics(report)
        
        return report
    
    def _log_dataset_statistics(self, report: DatasetReport):
        """Log detailed dataset statistics"""
        self.logger.info(f"\n{'='*60}")
        self.logger.info(f"DATASET STATISTICS: {report.dataset_name}")
        self.logger.info(f"{'='*60}")
        
        # Basic statistics
        self.logger.info(f"Total problems: {report.total_problems}")
        self.logger.info(f"Original pass count: {report.original_pass_count}")
        self.logger.info(f"Original pass rate: {report.original_pass_count/report.total_problems*100:.1f}%")
        
        self.logger.info(f"Synthesis pass count: {report.synthesis_pass_count}")
        self.logger.info(f"Synthesis pass rate: {report.synthesis_pass_count/report.total_problems*100:.1f}%")
        
        self.logger.info(f"Partial fix pass count: {report.partial_fix_pass_count}")
        self.logger.info(f"Partial fix pass rate: {report.partial_fix_pass_count/report.total_problems*100:.1f}%")
        
        # Improvement metrics
        synthesis_improvement = report.synthesis_pass_count - report.original_pass_count
        partial_improvement = report.partial_fix_pass_count - report.original_pass_count
        
        self.logger.info(f"\nImprovement metrics:")
        self.logger.info(f"Full synthesis improvement: +{synthesis_improvement} problems")
        self.logger.info(f"Partial fix improvement: +{partial_improvement} problems")
        
        # Hole-level statistics
        if report.hole_pass_rates:
            avg_hole_pass_rate = sum(report.hole_pass_rates.values()) / len(report.hole_pass_rates)
            self.logger.info(f"Average hole fix rate: {avg_hole_pass_rate*100:.1f}%")
            self.logger.info(f"Total unique holes tracked: {len(report.hole_pass_rates)}")
        
        # Error analysis
        error_count = sum(1 for r in report.problem_results if r.synthesized_status == ProofStatus.ERROR)
        if error_count > 0:
            self.logger.info(f"\nErrors encountered: {error_count} problems")
        
        self.logger.info(f"{'='*60}")
    
    def _generate_report(self, dataset_name: str, results: List[ProofSynthesisResult]) -> DatasetReport:
        """Generate summary report for a dataset"""
        total_problems = len(results)
        original_pass_count = sum(1 for r in results if r.original_proof_status == ProofStatus.PASS)
        synthesis_pass_count = sum(1 for r in results if r.synthesized_status == ProofStatus.PASS)
        partial_fix_pass_count = sum(1 for r in results if r.partial_fix_status == ProofStatus.PASS)
        
        # Calculate hole pass rates
        hole_pass_rates = {}
        for result in results:
            for hole_result in result.hole_results:
                hole_id = hole_result.hole_id
                if hole_id not in hole_pass_rates:
                    hole_pass_rates[hole_id] = []
                hole_pass_rates[hole_id].append(hole_result.fixed_status == ProofStatus.PASS)
        
        # Convert to percentages
        for hole_id in hole_pass_rates:
            hole_pass_rates[hole_id] = sum(hole_pass_rates[hole_id]) / len(hole_pass_rates[hole_id])
        
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
        # Convert to serializable format
        serializable_reports = {}
        for dataset, report in reports.items():
            serializable_reports[dataset] = {
                'dataset_name': report.dataset_name,
                'total_problems': report.total_problems,
                'original_pass_count': report.original_pass_count,
                'original_pass_rate': report.original_pass_count / report.total_problems,
                'hole_pass_rates': report.hole_pass_rates,
                'synthesis_pass_count': report.synthesis_pass_count,
                'synthesis_pass_rate': report.synthesis_pass_count / report.total_problems,
                'partial_fix_pass_count': report.partial_fix_pass_count,
                'partial_fix_pass_rate': report.partial_fix_pass_count / report.total_problems,
                'problem_results': [
                    {
                        'problem_id': r.problem_id,
                        'original_proof_status': r.original_proof_status.value,
                        'synthesized_status': r.synthesized_status.value,
                        'partial_fix_status': r.partial_fix_status.value,
                        'hole_count': len(r.hole_results),
                        'holes_fixed': sum(1 for h in r.hole_results if h.fixed_status == ProofStatus.PASS),
                        'error_message': r.error_message
                    }
                    for r in report.problem_results
                ]
            }
        
        with open(output_file, 'w') as f:
            json.dump(serializable_reports, f, indent=2)
        
        print(f"Report saved to {output_file}")


# Example hole fixer implementations
class SimpleHoleFixer(HoleFixerInterface):
    """Simple hole fixer that adds 'sorry' to holes"""
    
    def fix_hole(self, hole_content: str, problem_context: Problem) -> str:
        # Simple implementation - just add sorry
        if "hole" in hole_content:
            return hole_content.replace("hole", "sorry")
        return hole_content + "\n  sorry"


class DPV2HoleFixer(HoleFixerInterface):
    """Hole fixer using DPV2 solver"""
    
    def __init__(self):
        from dpv2_solver import dpv2_fix_unified
        self.dpv2_fix = dpv2_fix_unified
    
    def fix_hole(self, hole_content: str, problem_context: Problem) -> str:
        try:
            # Convert hole to theorem format for DPV2
            if "hole" in hole_content:
                theorem_content = hole_content.replace("hole", "sorry")
            else:
                theorem_content = hole_content
            
            # Use DPV2 to fix
            fixed_content = self.dpv2_fix(problem_context, theorem_content, "hole needs fixing")
            return fixed_content
        except Exception as e:
            print(f"DPV2 fixing failed: {e}")
            return hole_content.replace("hole", "sorry") 