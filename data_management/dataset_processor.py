import os
import json
import shutil
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Callable
from dataclasses import dataclass
import logging
from datetime import datetime

from .unified_problem_manager import problem_manager, Problem, ProblemMetadata


@dataclass
class DatasetConfig:
    """Configuration for dataset processing"""
    name: str
    source_path: str
    file_pattern: str  # e.g., "*.lean", "**/*.lean"
    header_extractor: Optional[Callable[[str], str]] = None
    problem_extractor: Optional[Callable[[str], str]] = None
    metadata_extractor: Optional[Callable[[str, str], ProblemMetadata]] = None
    problem_id_extractor: Optional[Callable[[str], str]] = None


class DatasetProcessor:
    """Processes and imports datasets into the unified problem structure"""
    
    def __init__(self, enable_logging: bool = True):
        self.enable_logging = enable_logging
        if enable_logging:
            self._setup_logging()
    
    def _setup_logging(self):
        """Setup logging for dataset processing"""
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        log_dir = Path("dataset_processing_logs")
        log_dir.mkdir(exist_ok=True)
        
        self.logger = logging.getLogger('DatasetProcessor')
        self.logger.setLevel(logging.INFO)
        self.logger.handlers.clear()
        
        # File handler
        log_file = log_dir / f"dataset_processing_{timestamp}.log"
        file_handler = logging.FileHandler(log_file)
        file_handler.setLevel(logging.INFO)
        
        # Console handler
        console_handler = logging.StreamHandler()
        console_handler.setLevel(logging.INFO)
        
        formatter = logging.Formatter(
            '%(asctime)s - %(levelname)s - %(message)s',
            datefmt='%Y-%m-%d %H:%M:%S'
        )
        file_handler.setFormatter(formatter)
        console_handler.setFormatter(formatter)
        
        self.logger.addHandler(file_handler)
        self.logger.addHandler(console_handler)
        
        self.logger.info("Dataset processing logging initialized")
    
    def process_dataset(self, config: DatasetConfig, overwrite: bool = False) -> Dict[str, any]:
        """
        Process a dataset according to the given configuration
        
        Returns:
            Dictionary with processing statistics
        """
        if self.enable_logging:
            self.logger.info(f"Starting processing of dataset: {config.name}")
            self.logger.info(f"Source path: {config.source_path}")
        
        source_path = Path(config.source_path)
        if not source_path.exists():
            error_msg = f"Source path does not exist: {config.source_path}"
            if self.enable_logging:
                self.logger.error(error_msg)
            raise FileNotFoundError(error_msg)
        
        # Find all files matching the pattern
        if config.file_pattern.startswith("**"):
            files = list(source_path.rglob(config.file_pattern[3:]))
        else:
            files = list(source_path.glob(config.file_pattern))
        
        if self.enable_logging:
            self.logger.info(f"Found {len(files)} files matching pattern: {config.file_pattern}")
        
        stats = {
            'total_files': len(files),
            'processed': 0,
            'skipped': 0,
            'errors': 0,
            'error_details': []
        }
        
        for i, file_path in enumerate(files):
            if self.enable_logging and i % 10 == 0:
                self.logger.info(f"Progress: {i}/{len(files)} files processed")
            
            try:
                result = self._process_single_file(file_path, config, overwrite)
                if result:
                    stats['processed'] += 1
                else:
                    stats['skipped'] += 1
            except Exception as e:
                stats['errors'] += 1
                error_detail = f"Error processing {file_path}: {str(e)}"
                stats['error_details'].append(error_detail)
                if self.enable_logging:
                    self.logger.error(error_detail)
        
        if self.enable_logging:
            self._log_processing_statistics(config.name, stats)
        
        return stats
    
    def _process_single_file(self, file_path: Path, config: DatasetConfig, overwrite: bool) -> bool:
        """Process a single file according to the configuration"""
        # Read file content
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()
        except Exception as e:
            if self.enable_logging:
                self.logger.error(f"Failed to read file {file_path}: {e}")
            return False
        
        # Extract problem ID
        if config.problem_id_extractor:
            problem_id = config.problem_id_extractor(str(file_path))
        else:
            problem_id = file_path.stem
        
        # Check if problem already exists
        existing_problem = problem_manager.get_problem(config.name, problem_id)
        if existing_problem and not overwrite:
            return False  # Skip existing problems
        
        # Extract header and problem content
        if config.header_extractor:
            header_content = config.header_extractor(content)
        else:
            header_content = self._default_header_extractor(content)
        
        if config.problem_extractor:
            problem_content = config.problem_extractor(content)
        else:
            problem_content = self._default_problem_extractor(content)
        
        # Extract metadata
        metadata = None
        if config.metadata_extractor:
            metadata = config.metadata_extractor(content, str(file_path))
        else:
            metadata = self._default_metadata_extractor(config.name, problem_id, str(file_path))
        
        # Add problem to unified structure
        problem_manager.add_problem(
            dataset=config.name,
            problem_id=problem_id,
            header_content=header_content,
            problem_content=problem_content,
            original_path=str(file_path),
            metadata=metadata
        )
        
        return True
    
    def _default_header_extractor(self, content: str) -> str:
        """Default header extractor - extracts imports and namespace declarations"""
        lines = content.split('\n')
        header_lines = []
        
        for line in lines:
            stripped = line.strip()
            if (stripped.startswith('import ') or 
                stripped.startswith('namespace ') or
                stripped.startswith('open ') or
                stripped.startswith('variable ') or
                stripped.startswith('#') or
                stripped == '' or
                stripped.startswith('--')):
                header_lines.append(line)
            else:
                break
        
        return '\n'.join(header_lines)
    
    def _default_problem_extractor(self, content: str) -> str:
        """Default problem extractor - extracts everything after the header"""
        header = self._default_header_extractor(content)
        header_line_count = len(header.split('\n'))
        
        lines = content.split('\n')
        problem_lines = lines[header_line_count:]
        
        # Remove leading empty lines
        while problem_lines and problem_lines[0].strip() == '':
            problem_lines.pop(0)
        
        return '\n'.join(problem_lines)
    
    def _default_metadata_extractor(self, dataset: str, problem_id: str, file_path: str) -> ProblemMetadata:
        """Default metadata extractor"""
        return ProblemMetadata(
            dataset=dataset,
            problem_id=problem_id,
            source=file_path,
            created_at=datetime.now().isoformat(),
            status='unknown'
        )
    
    def _log_processing_statistics(self, dataset_name: str, stats: Dict[str, any]):
        """Log processing statistics"""
        self.logger.info(f"\n=== DATASET PROCESSING STATISTICS: {dataset_name} ===")
        self.logger.info(f"Total files found: {stats['total_files']}")
        self.logger.info(f"Successfully processed: {stats['processed']}")
        self.logger.info(f"Skipped (already exists): {stats['skipped']}")
        self.logger.info(f"Errors: {stats['errors']}")
        
        if stats['errors'] > 0:
            self.logger.info("Error details:")
            for error in stats['error_details'][:10]:  # Show first 10 errors
                self.logger.info(f"  {error}")
            if len(stats['error_details']) > 10:
                self.logger.info(f"  ... and {len(stats['error_details']) - 10} more errors")
        
        self.logger.info("=" * 50)
    
    def import_minif2f_dataset(self, source_path: str, overwrite: bool = False) -> Dict[str, any]:
        """Import miniF2F dataset with specific processing rules"""
        def extract_problem_id(file_path: str) -> str:
            path = Path(file_path)
            # For miniF2F, use the parent directory name as problem ID
            return path.parent.name
        
        def extract_header_and_problem(content: str) -> Tuple[str, str]:
            # Split content at the theorem declaration
            lines = content.split('\n')
            header_lines = []
            problem_lines = []
            
            theorem_found = False
            for line in lines:
                if line.strip().startswith('theorem ') or line.strip().startswith('lemma '):
                    theorem_found = True
                
                if not theorem_found:
                    header_lines.append(line)
                else:
                    problem_lines.append(line)
            
            return '\n'.join(header_lines), '\n'.join(problem_lines)
        
        def header_extractor(content: str) -> str:
            header, _ = extract_header_and_problem(content)
            return header
        
        def problem_extractor(content: str) -> str:
            _, problem = extract_header_and_problem(content)
            return problem
        
        def metadata_extractor(content: str, file_path: str) -> ProblemMetadata:
            path = Path(file_path)
            problem_id = path.parent.name
            
            # Extract difficulty from path if available
            difficulty = None
            if 'easy' in str(path).lower():
                difficulty = 'easy'
            elif 'medium' in str(path).lower():
                difficulty = 'medium'
            elif 'hard' in str(path).lower():
                difficulty = 'hard'
            
            return ProblemMetadata(
                dataset='minif2f',
                problem_id=problem_id,
                difficulty=difficulty,
                source=str(path),
                created_at=datetime.now().isoformat(),
                status='unknown',
                tags=['minif2f']
            )
        
        config = DatasetConfig(
            name='minif2f',
            source_path=source_path,
            file_pattern='**/*.lean',
            header_extractor=header_extractor,
            problem_extractor=problem_extractor,
            metadata_extractor=metadata_extractor,
            problem_id_extractor=extract_problem_id
        )
        
        return self.process_dataset(config, overwrite)
    
    def import_putnam_dataset(self, source_path: str, overwrite: bool = False) -> Dict[str, any]:
        """Import Putnam dataset with specific processing rules"""
        def metadata_extractor(content: str, file_path: str) -> ProblemMetadata:
            path = Path(file_path)
            problem_id = path.stem
            
            return ProblemMetadata(
                dataset='putnam',
                problem_id=problem_id,
                difficulty='hard',  # Putnam problems are generally hard
                source=str(path),
                created_at=datetime.now().isoformat(),
                status='unknown',
                tags=['putnam', 'competition']
            )
        
        config = DatasetConfig(
            name='putnam',
            source_path=source_path,
            file_pattern='*.lean',
            metadata_extractor=metadata_extractor
        )
        
        return self.process_dataset(config, overwrite)
    
    def export_dataset(self, dataset_name: str, output_path: str, format: str = 'unified') -> bool:
        """
        Export a dataset to a specified format
        
        Args:
            dataset_name: Name of the dataset to export
            output_path: Path to export the dataset
            format: Export format ('unified', 'flat', 'original')
        """
        if self.enable_logging:
            self.logger.info(f"Exporting dataset {dataset_name} to {output_path} in {format} format")
        
        problems = problem_manager.get_all_problems_for_dataset(dataset_name)
        if not problems:
            if self.enable_logging:
                self.logger.warning(f"No problems found for dataset: {dataset_name}")
            return False
        
        output_dir = Path(output_path)
        output_dir.mkdir(parents=True, exist_ok=True)
        
        if format == 'unified':
            return self._export_unified_format(problems, output_dir)
        elif format == 'flat':
            return self._export_flat_format(problems, output_dir)
        elif format == 'original':
            return self._export_original_format(problems, output_dir)
        else:
            raise ValueError(f"Unsupported export format: {format}")
    
    def _export_unified_format(self, problems: List[Problem], output_dir: Path) -> bool:
        """Export in unified format (same as internal structure)"""
        for problem in problems:
            problem_dir = output_dir / problem.dataset / problem.problem_id
            problem_dir.mkdir(parents=True, exist_ok=True)
            
            # Copy header and problem files
            shutil.copy2(problem.header_path, problem_dir / "header.lean")
            shutil.copy2(problem.problem_path, problem_dir / "problem.lean")
            
            # Copy metadata if exists
            metadata_path = Path(problem.base_dir) / "metadata.json"
            if metadata_path.exists():
                shutil.copy2(metadata_path, problem_dir / "metadata.json")
        
        return True
    
    def _export_flat_format(self, problems: List[Problem], output_dir: Path) -> bool:
        """Export in flat format (all files in one directory)"""
        for problem in problems:
            # Combine header and problem content
            full_content = problem_manager.get_full_content(problem)
            
            # Create filename
            filename = f"{problem.dataset}_{problem.problem_id}.lean"
            output_file = output_dir / filename
            
            with open(output_file, 'w', encoding='utf-8') as f:
                f.write(full_content)
        
        return True
    
    def _export_original_format(self, problems: List[Problem], output_dir: Path) -> bool:
        """Export in original format (if original_path is available)"""
        for problem in problems:
            if not problem.original_path or not os.path.exists(problem.original_path):
                # Fallback to combined content
                full_content = problem_manager.get_full_content(problem)
                filename = f"{problem.problem_id}.lean"
            else:
                # Copy original file
                with open(problem.original_path, 'r', encoding='utf-8') as f:
                    full_content = f.read()
                filename = os.path.basename(problem.original_path)
            
            output_file = output_dir / filename
            with open(output_file, 'w', encoding='utf-8') as f:
                f.write(full_content)
        
        return True
    
    def validate_dataset(self, dataset_name: str) -> Dict[str, any]:
        """Validate a dataset for consistency and completeness"""
        if self.enable_logging:
            self.logger.info(f"Validating dataset: {dataset_name}")
        
        problems = problem_manager.get_all_problems_for_dataset(dataset_name)
        
        validation_results = {
            'total_problems': len(problems),
            'valid_problems': 0,
            'missing_files': [],
            'invalid_syntax': [],
            'missing_metadata': 0,
            'warnings': []
        }
        
        for problem in problems:
            is_valid = True
            
            # Check file existence
            if not problem.exists():
                validation_results['missing_files'].append(f"{problem.dataset}/{problem.problem_id}")
                is_valid = False
            
            # Check metadata
            if not problem.metadata:
                validation_results['missing_metadata'] += 1
                validation_results['warnings'].append(f"Missing metadata: {problem.dataset}/{problem.problem_id}")
            
            # TODO: Add syntax validation using Lean
            
            if is_valid:
                validation_results['valid_problems'] += 1
        
        if self.enable_logging:
            self._log_validation_results(dataset_name, validation_results)
        
        return validation_results
    
    def _log_validation_results(self, dataset_name: str, results: Dict[str, any]):
        """Log validation results"""
        self.logger.info(f"\n=== DATASET VALIDATION RESULTS: {dataset_name} ===")
        self.logger.info(f"Total problems: {results['total_problems']}")
        self.logger.info(f"Valid problems: {results['valid_problems']}")
        self.logger.info(f"Missing files: {len(results['missing_files'])}")
        self.logger.info(f"Missing metadata: {results['missing_metadata']}")
        self.logger.info(f"Warnings: {len(results['warnings'])}")
        
        if results['missing_files']:
            self.logger.warning("Problems with missing files:")
            for problem in results['missing_files'][:5]:
                self.logger.warning(f"  {problem}")
            if len(results['missing_files']) > 5:
                self.logger.warning(f"  ... and {len(results['missing_files']) - 5} more")
        
        self.logger.info("=" * 50) 