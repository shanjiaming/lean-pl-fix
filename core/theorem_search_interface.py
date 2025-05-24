from abc import ABC, abstractmethod
from typing import Callable, Dict, List, Optional, Tuple
from dataclasses import dataclass
from enum import Enum
import re
import logging
from pathlib import Path
from datetime import datetime

from data_management.unified_problem_manager import problem_manager, Problem
from solvers.decompose_solver_unified import unified_env
from .lean_api import REPLInstance, error_list_net_reduced


class TheoremSearchStatus(Enum):
    PASS = "pass"
    FAIL = "fail"
    ERROR = "error"
    IMPROVED = "improved"  # Errors reduced through theorem replacement


@dataclass 
class TheoremSearchResult:
    """Result of theorem search and replacement for a single proof"""
    problem_id: str
    dataset: str
    original_proof: str
    fixed_proof: str
    original_status: TheoremSearchStatus
    fixed_status: TheoremSearchStatus
    original_error_count: int
    fixed_error_count: int
    replacements_made: Dict[str, str]  # original -> replacement mapping
    error_message: Optional[str] = None


@dataclass
class TheoremSearchReport:
    """Summary report for theorem search on a dataset"""
    dataset_name: str
    total_problems: int
    original_pass_count: int
    fixed_pass_count: int
    improved_count: int
    search_results: List[TheoremSearchResult]


class TheoremSearchInterface(ABC):
    """Abstract interface for theorem search and replacement"""
    
    @abstractmethod
    def extract_candidates(self, proof_content: str, problem_context: Problem) -> List[str]:
        """
        Extract candidate theorem names for replacement.
        
        Args:
            proof_content: The proof content to analyze
            problem_context: The problem context
            
        Returns:
            List of candidate theorem names
        """
        pass
    
    @abstractmethod
    def rank_candidates(self, unknown_theorem: str, candidates: List[str]) -> List[str]:
        """
        Rank candidate theorems by similarity to the unknown theorem.
        
        Args:
            unknown_theorem: The unknown theorem name
            candidates: List of candidate theorem names
            
        Returns:
            Ranked list of candidate theorems (best first)
        """
        pass


class UnknownTheoremFixer:
    """Handles fixing of unknown theorem references in proofs"""
    
    def __init__(self, search_interface: TheoremSearchInterface):
        self.search_interface = search_interface
    
    def check_proof_status(self, problem: Problem, proof_content: str, repl: REPLInstance) -> Tuple[TheoremSearchStatus, int, Optional[str]]:
        """Check proof status and count errors"""
        try:
            result = repl.execute(proof_content, env_mode='header')
            error_messages = [m for m in result.get('messages', []) if m.get('severity') == 'error']
            error_count = len(error_messages)
            
            if error_count == 0:
                return TheoremSearchStatus.PASS, 0, None
            else:
                return TheoremSearchStatus.FAIL, error_count, "; ".join([m.get('message', '') for m in error_messages])
                
        except Exception as e:
            return TheoremSearchStatus.ERROR, -1, str(e)
    
    def extract_unknown_identifiers(self, messages: List[dict]) -> set:
        """Extract unknown identifiers from error messages"""
        unknown_idents = set()
        for msg in messages:
            # Match all unknown identifier errors
            matches = re.finditer(r"unknown [^']*'([^']+)'", msg.get('message', ''))
            for match in matches:
                unknown_idents.add(match.group(1))
        return unknown_idents
    
    def fix_unknown_theorems(self, proof_content: str, problem: Problem, repl: REPLInstance, max_topn: int = 5) -> Tuple[str, Dict[str, str]]:
        """
        Fix unknown theorem references in a proof.
        
        Returns:
            Tuple of (fixed_proof_content, replacements_made)
        """
        # Extract candidate theorems
        candidates = self.search_interface.extract_candidates(proof_content, problem)
        
        current_code = proof_content
        orig_result = repl.execute(current_code, env_mode='header')
        orig_errors = [m for m in orig_result.get('messages', []) if m.get('severity') == 'error']
        
        replacements_made = {}
        progress = True
        
        while progress:
            progress = False
            result = repl.execute(current_code, env_mode='header')
            messages = result.get('messages', [])
            
            # Extract unknown identifiers
            unknown_idents = self.extract_unknown_identifiers(messages)
            
            if not unknown_idents:
                break
                
            for ident in list(unknown_idents):
                tried = False
                # Get ranked candidates for this unknown identifier
                ranked_candidates = self.search_interface.rank_candidates(ident, candidates)
                
                for replacement in ranked_candidates[:max_topn]:
                    if replacement == ident:
                        continue
                        
                    # Try replacing this identifier
                    new_code = re.sub(rf'\b{re.escape(ident)}\b', replacement, current_code)
                    check_result = repl.execute(new_code, env_mode='header')
                    new_errors = [m for m in check_result.get('messages', []) if m.get('severity') == 'error']
                    
                    if error_list_net_reduced(orig_errors, new_errors):
                        current_code = new_code
                        orig_errors = new_errors
                        replacements_made[ident] = replacement
                        progress = True
                        tried = True
                        break
                
                if not tried:
                    # No valid replacement found for this identifier
                    pass
        
        return current_code, replacements_made


class TheoremSearchProcessor:
    """Main processor for theorem search and replacement on datasets"""
    
    def __init__(self, search_interface: TheoremSearchInterface, enable_logging: bool = True):
        self.search_interface = search_interface
        self.fixer = UnknownTheoremFixer(search_interface)
        self.enable_logging = enable_logging
        
        if enable_logging:
            self._setup_logging()
    
    def _setup_logging(self):
        """Setup detailed logging for the theorem search process"""
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        log_dir = Path("theorem_search_logs")
        log_dir.mkdir(exist_ok=True)
        
        # Create logger
        self.logger = logging.getLogger('TheoremSearch')
        self.logger.setLevel(logging.INFO)
        
        # Clear existing handlers
        self.logger.handlers.clear()
        
        # File handler for detailed logs
        log_file = log_dir / f"theorem_search_{timestamp}.log"
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
        
        self.logger.info("Theorem search logging initialized")
    
    def process_problem(self, problem: Problem) -> TheoremSearchResult:
        """Process theorem search for a single problem"""
        if self.enable_logging:
            self.logger.info(f"Processing theorem search for: {problem.dataset}/{problem.problem_id}")
        
        repl = None
        try:
            # Initialize REPL
            repl = REPLInstance(debug=False)
            
            # Get original proof content
            original_proof = problem_manager.get_problem_content(problem)
            
            # Check original status
            original_status, original_error_count, original_error = self.fixer.check_proof_status(problem, original_proof, repl)
            
            if self.enable_logging:
                self.logger.info(f"  Original status: {original_status.value} ({original_error_count} errors)")
            
            try:
                # Fix unknown theorems
                fixed_proof, replacements = self.fixer.fix_unknown_theorems(original_proof, problem, repl)
                
                # Check fixed status
                fixed_status, fixed_error_count, fixed_error = self.fixer.check_proof_status(problem, fixed_proof, repl)
                
                # Determine final status
                if fixed_status == TheoremSearchStatus.PASS:
                    final_status = TheoremSearchStatus.PASS
                elif original_error_count > fixed_error_count > 0:
                    final_status = TheoremSearchStatus.IMPROVED
                else:
                    final_status = fixed_status
                
                result = TheoremSearchResult(
                    problem_id=problem.problem_id,
                    dataset=problem.dataset,
                    original_proof=original_proof,
                    fixed_proof=fixed_proof,
                    original_status=original_status,
                    fixed_status=final_status,
                    original_error_count=original_error_count,
                    fixed_error_count=fixed_error_count,
                    replacements_made=replacements,
                    error_message=fixed_error
                )
                
                if self.enable_logging:
                    self.logger.info(f"  Fixed status: {final_status.value} ({fixed_error_count} errors)")
                    if replacements:
                        self.logger.info(f"  Replacements: {replacements}")
                
                return result
                
            except Exception as e:
                if self.enable_logging:
                    self.logger.error(f"  Error fixing theorems: {e}")
                
                return TheoremSearchResult(
                    problem_id=problem.problem_id,
                    dataset=problem.dataset,
                    original_proof=original_proof,
                    fixed_proof=original_proof,
                    original_status=original_status,
                    fixed_status=TheoremSearchStatus.ERROR,
                    original_error_count=original_error_count,
                    fixed_error_count=original_error_count,
                    replacements_made={},
                    error_message=str(e)
                )
                
        except Exception as e:
            if self.enable_logging:
                self.logger.error(f"Error processing problem {problem.problem_id}: {e}")
            
            return TheoremSearchResult(
                problem_id=problem.problem_id,
                dataset=problem.dataset,
                original_proof="",
                fixed_proof="",
                original_status=TheoremSearchStatus.ERROR,
                fixed_status=TheoremSearchStatus.ERROR,
                original_error_count=-1,
                fixed_error_count=-1,
                replacements_made={},
                error_message=str(e)
            )
        finally:
            if repl:
                repl.end()
    
    def process_dataset(self, dataset_name: str) -> TheoremSearchReport:
        """Process theorem search for an entire dataset"""
        if self.enable_logging:
            self.logger.info(f"Starting theorem search for dataset: {dataset_name}")
        
        # Get all problems for this dataset
        problems = problem_manager.get_all_problems_for_dataset(dataset_name)
        
        if not problems:
            if self.enable_logging:
                self.logger.warning(f"No problems found for dataset: {dataset_name}")
            return TheoremSearchReport(
                dataset_name=dataset_name,
                total_problems=0,
                original_pass_count=0,
                fixed_pass_count=0,
                improved_count=0,
                search_results=[]
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
            self._log_search_statistics(report)
        
        return report
    
    def _generate_report(self, dataset_name: str, results: List[TheoremSearchResult]) -> TheoremSearchReport:
        """Generate a comprehensive search report"""
        total_problems = len(results)
        
        # Count original passes
        original_pass_count = sum(1 for r in results if r.original_status == TheoremSearchStatus.PASS)
        
        # Count fixed passes
        fixed_pass_count = sum(1 for r in results if r.fixed_status == TheoremSearchStatus.PASS)
        
        # Count improved (error reduction)
        improved_count = sum(1 for r in results if r.fixed_status == TheoremSearchStatus.IMPROVED)
        
        return TheoremSearchReport(
            dataset_name=dataset_name,
            total_problems=total_problems,
            original_pass_count=original_pass_count,
            fixed_pass_count=fixed_pass_count,
            improved_count=improved_count,
            search_results=results
        )
    
    def _log_search_statistics(self, report: TheoremSearchReport):
        """Log comprehensive search statistics"""
        self.logger.info(f"\n=== THEOREM SEARCH STATISTICS: {report.dataset_name} ===")
        self.logger.info(f"Total problems: {report.total_problems}")
        self.logger.info(f"Original pass rate: {report.original_pass_count}/{report.total_problems} ({report.original_pass_count/report.total_problems*100:.1f}%)")
        self.logger.info(f"Fixed pass rate: {report.fixed_pass_count}/{report.total_problems} ({report.fixed_pass_count/report.total_problems*100:.1f}%)")
        self.logger.info(f"Improved (error reduced): {report.improved_count}/{report.total_problems} ({report.improved_count/report.total_problems*100:.1f}%)")
        
        # Calculate improvement metrics
        newly_fixed = report.fixed_pass_count - report.original_pass_count
        if newly_fixed > 0:
            self.logger.info(f"Newly fixed problems: {newly_fixed}")
        
        # Count total replacements made
        total_replacements = sum(len(r.replacements_made) for r in report.search_results)
        self.logger.info(f"Total theorem replacements made: {total_replacements}")
        
        # Count by status categories
        status_counts = {}
        for result in report.search_results:
            status = result.fixed_status.value
            status_counts[status] = status_counts.get(status, 0) + 1
        
        self.logger.info("Final status distribution:")
        for status, count in status_counts.items():
            self.logger.info(f"  {status}: {count}")
        
        self.logger.info("=" * 50)


class BLEUTheoremSearcher(TheoremSearchInterface):
    """Theorem searcher using BLEU-based similarity and related theorem extraction"""
    
    def __init__(self):
        # Import here to avoid circular dependencies
        from theorem_search.extract_related_theorems import extract_related_theorems
        from theorem_search.similarity_utils import rank_by_similarity
        
        self.extract_related_theorems = extract_related_theorems
        self.rank_by_similarity = rank_by_similarity
    
    def extract_candidates(self, proof_content: str, problem_context: Problem) -> List[str]:
        """Extract candidate theorems from related modules"""
        try:
            # Extract related theorems from the proof content
            related = self.extract_related_theorems(lean_code=proof_content)
            candidates = []
            for theos in related.values():
                candidates.extend(theos)
            return list(set(candidates))  # Remove duplicates
        except Exception:
            return []  # Return empty list if extraction fails
    
    def rank_candidates(self, unknown_theorem: str, candidates: List[str]) -> List[str]:
        """Rank candidates by BLEU similarity"""
        try:
            return self.rank_by_similarity(unknown_theorem, candidates, topn=5)
        except Exception:
            return candidates[:5]  # Return first 5 candidates if ranking fails


class SimpleTheoremSearcher(TheoremSearchInterface):
    """Simple theorem searcher using string similarity"""
    
    def extract_candidates(self, proof_content: str, problem_context: Problem) -> List[str]:
        """Extract basic theorem candidates"""
        # Simple implementation - extract theorem-like identifiers from the proof
        theorem_pattern = r'\b[A-Z][a-zA-Z0-9_]*\.[a-zA-Z][a-zA-Z0-9_]*\b'
        candidates = re.findall(theorem_pattern, proof_content)
        return list(set(candidates))
    
    def rank_candidates(self, unknown_theorem: str, candidates: List[str]) -> List[str]:
        """Rank candidates by simple string similarity"""
        # Simple Levenshtein-like ranking
        def similarity_score(candidate):
            # Simple character overlap score
            common_chars = set(unknown_theorem.lower()) & set(candidate.lower())
            return len(common_chars) / max(len(unknown_theorem), len(candidate), 1)
        
        ranked = sorted(candidates, key=similarity_score, reverse=True)
        return ranked[:5] 