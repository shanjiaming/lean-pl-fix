from abc import ABC, abstractmethod
from typing import Callable, Dict, List, Optional, Tuple
from dataclasses import dataclass
from enum import Enum
import logging
from pathlib import Path
from datetime import datetime

from data_management.unified_problem_manager import problem_manager, Problem
from solvers.decompose_solver_unified import unified_env
from solvers.dpv2_solver import solve_with_dpv2


class RepairStatus(Enum):
    PASS = "pass"
    FAIL = "fail" 
    ERROR = "error"
    IMPROVED = "improved"  # Errors reduced but not completely fixed


@dataclass
class RepairResult:
    """Result of repairing a single proof"""
    problem_id: str
    dataset: str
    original_proof: str
    repaired_proof: str
    original_status: RepairStatus
    repaired_status: RepairStatus
    original_error_count: int
    repaired_error_count: int
    error_message: Optional[str] = None


@dataclass
class RepairReport:
    """Summary report for proof repair on a dataset"""
    dataset_name: str
    total_problems: int
    original_pass_count: int
    repaired_pass_count: int
    improved_count: int  # Problems with reduced errors
    repair_results: List[RepairResult]


class ProofRepairInterface(ABC):
    """Abstract interface for proof repair callbacks"""
    
    @abstractmethod
    def repair_proof(self, proof_content: str, problem_context: Problem) -> str:
        """
        Repair a potentially incorrect proof and return the fixed content.
        
        Args:
            proof_content: The content of the potentially incorrect proof
            problem_context: The original problem for context
            
        Returns:
            Repaired proof content
        """
        pass


class ProofRepairer:
    """Handles repair of individual proofs"""
    
    def check_proof_status(self, problem: Problem, proof_content: str) -> Tuple[RepairStatus, int, Optional[str]]:
        """Check proof status and count errors"""
        try:
            header_content = problem_manager.get_header_content(problem)
            result = unified_env.run_with_header(header_content, proof_content)
            
            error_messages = [m.data for m in getattr(result, 'messages', []) if m.severity == "error"]
            error_count = len(error_messages)
            
            if error_count == 0:
                return RepairStatus.PASS, 0, None
            else:
                return RepairStatus.FAIL, error_count, "; ".join(error_messages)
                
        except Exception as e:
            return RepairStatus.ERROR, -1, str(e)


class RepairProcessor:
    """Main processor for handling proof repair on datasets"""
    
    def __init__(self, repair_interface: ProofRepairInterface, enable_logging: bool = True):
        self.repair_interface = repair_interface
        self.repairer = ProofRepairer()
        self.enable_logging = enable_logging
        
        if enable_logging:
            self._setup_logging()
    
    def _setup_logging(self):
        """Setup detailed logging for the repair process"""
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        log_dir = Path("proof_repair_logs")
        log_dir.mkdir(exist_ok=True)
        
        # Create logger
        self.logger = logging.getLogger('ProofRepair')
        self.logger.setLevel(logging.INFO)
        
        # Clear existing handlers
        self.logger.handlers.clear()
        
        # File handler for detailed logs
        log_file = log_dir / f"proof_repair_{timestamp}.log"
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
        
        self.logger.info("Proof repair logging initialized")
    
    def repair_problem(self, problem: Problem) -> RepairResult:
        """Repair a single problem"""
        if self.enable_logging:
            self.logger.info(f"Repairing problem: {problem.dataset}/{problem.problem_id}")
        
        try:
            # Get original proof content
            original_proof = problem_manager.get_problem_content(problem)
            
            # Check original status
            original_status, original_error_count, original_error = self.repairer.check_proof_status(problem, original_proof)
            
            if self.enable_logging:
                self.logger.info(f"  Original status: {original_status.value} ({original_error_count} errors)")
            
            try:
                # Repair the proof
                repaired_proof = self.repair_interface.repair_proof(original_proof, problem)
                
                # Check repaired status
                repaired_status, repaired_error_count, repaired_error = self.repairer.check_proof_status(problem, repaired_proof)
                
                # Determine final status
                if repaired_status == RepairStatus.PASS:
                    final_status = RepairStatus.PASS
                elif original_error_count > repaired_error_count > 0:
                    final_status = RepairStatus.IMPROVED
                else:
                    final_status = repaired_status
                
                result = RepairResult(
                    problem_id=problem.problem_id,
                    dataset=problem.dataset,
                    original_proof=original_proof,
                    repaired_proof=repaired_proof,
                    original_status=original_status,
                    repaired_status=final_status,
                    original_error_count=original_error_count,
                    repaired_error_count=repaired_error_count,
                    error_message=repaired_error
                )
                
                if self.enable_logging:
                    self.logger.info(f"  Repaired status: {final_status.value} ({repaired_error_count} errors)")
                
                return result
                
            except Exception as e:
                if self.enable_logging:
                    self.logger.error(f"  Error repairing: {e}")
                
                return RepairResult(
                    problem_id=problem.problem_id,
                    dataset=problem.dataset,
                    original_proof=original_proof,
                    repaired_proof=original_proof,  # Keep original on error
                    original_status=original_status,
                    repaired_status=RepairStatus.ERROR,
                    original_error_count=original_error_count,
                    repaired_error_count=original_error_count,
                    error_message=str(e)
                )
                
        except Exception as e:
            if self.enable_logging:
                self.logger.error(f"Error processing problem {problem.problem_id}: {e}")
            
            return RepairResult(
                problem_id=problem.problem_id,
                dataset=problem.dataset,
                original_proof="",
                repaired_proof="",
                original_status=RepairStatus.ERROR,
                repaired_status=RepairStatus.ERROR,
                original_error_count=-1,
                repaired_error_count=-1,
                error_message=str(e)
            )
    
    def repair_dataset(self, dataset_name: str) -> RepairReport:
        """Repair all proofs in a dataset"""
        if self.enable_logging:
            self.logger.info(f"Starting repair of dataset: {dataset_name}")
        
        # Get all problems for this dataset
        problems = problem_manager.get_all_problems_for_dataset(dataset_name)
        
        if not problems:
            if self.enable_logging:
                self.logger.warning(f"No problems found for dataset: {dataset_name}")
            return RepairReport(
                dataset_name=dataset_name,
                total_problems=0,
                original_pass_count=0,
                repaired_pass_count=0,
                improved_count=0,
                repair_results=[]
            )
        
        if self.enable_logging:
            self.logger.info(f"Found {len(problems)} problems in {dataset_name}")
        
        # Process each problem
        results = []
        for i, problem in enumerate(problems):
            if self.enable_logging and i % 10 == 0:
                self.logger.info(f"Progress: {i}/{len(problems)} problems processed")
            
            result = self.repair_problem(problem)
            results.append(result)
        
        # Generate report
        report = self._generate_report(dataset_name, results)
        
        if self.enable_logging:
            self._log_repair_statistics(report)
        
        return report
    
    def _generate_report(self, dataset_name: str, results: List[RepairResult]) -> RepairReport:
        """Generate a comprehensive repair report"""
        total_problems = len(results)
        
        # Count original passes
        original_pass_count = sum(1 for r in results if r.original_status == RepairStatus.PASS)
        
        # Count repaired passes
        repaired_pass_count = sum(1 for r in results if r.repaired_status == RepairStatus.PASS)
        
        # Count improved (error reduction)
        improved_count = sum(1 for r in results if r.repaired_status == RepairStatus.IMPROVED)
        
        return RepairReport(
            dataset_name=dataset_name,
            total_problems=total_problems,
            original_pass_count=original_pass_count,
            repaired_pass_count=repaired_pass_count,
            improved_count=improved_count,
            repair_results=results
        )
    
    def _log_repair_statistics(self, report: RepairReport):
        """Log comprehensive repair statistics"""
        self.logger.info(f"\n=== REPAIR STATISTICS: {report.dataset_name} ===")
        self.logger.info(f"Total problems: {report.total_problems}")
        self.logger.info(f"Original pass rate: {report.original_pass_count}/{report.total_problems} ({report.original_pass_count/report.total_problems*100:.1f}%)")
        self.logger.info(f"Repaired pass rate: {report.repaired_pass_count}/{report.total_problems} ({report.repaired_pass_count/report.total_problems*100:.1f}%)")
        self.logger.info(f"Improved (error reduced): {report.improved_count}/{report.total_problems} ({report.improved_count/report.total_problems*100:.1f}%)")
        
        # Calculate improvement metrics
        newly_fixed = report.repaired_pass_count - report.original_pass_count
        if newly_fixed > 0:
            self.logger.info(f"Newly fixed problems: {newly_fixed}")
        
        # Count by status categories
        status_counts = {}
        for result in report.repair_results:
            status = result.repaired_status.value
            status_counts[status] = status_counts.get(status, 0) + 1
        
        self.logger.info("Final status distribution:")
        for status, count in status_counts.items():
            self.logger.info(f"  {status}: {count}")
        
        self.logger.info("=" * 50)


class DPV2ProofRepairer(ProofRepairInterface):
    """Proof repairer using DPV2 solver"""
    
    def __init__(self):
        # Import here to avoid circular dependencies
        from solvers.dpv2_solver import solve_with_dpv2
        self.solve_func = solve_with_dpv2
    
    def repair_proof(self, proof_content: str, problem_context: Problem) -> str:
        """Repair a proof using DPV2 solver"""
        try:
            # Use DPV2 to repair the proof
            repaired_content = self.solve_func(problem_context)
            return repaired_content
        except Exception as e:
            # Return original content if repair fails
            return proof_content


class SimpleProofRepairer(ProofRepairInterface):
    """Simple proof repairer that adds sorry to failed parts"""
    
    def repair_proof(self, proof_content: str, problem_context: Problem) -> str:
        """Simple repair by adding sorry"""
        # Simple implementation - append sorry if proof fails
        return proof_content + "\n  sorry" 