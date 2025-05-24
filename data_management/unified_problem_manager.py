import os
import json
from pathlib import Path
from typing import Dict, List, Optional, Tuple
from dataclasses import dataclass
from datetime import datetime

@dataclass
class ProblemMetadata:
    """Extended metadata for problems"""
    dataset: str
    problem_id: str
    difficulty: Optional[str] = None
    tags: Optional[List[str]] = None
    source: Optional[str] = None
    created_at: Optional[str] = None
    last_modified: Optional[str] = None
    status: Optional[str] = None  # pass, fail, unknown, etc.

@dataclass
class Problem:
    """Represents a single problem with its metadata and file paths"""
    dataset: str
    problem_id: str
    header_path: str
    problem_path: str
    decomposed_dir: str
    hole_dir: str
    original_path: Optional[str] = None  # Path to original file for reference
    metadata: Optional[ProblemMetadata] = None
    
    @property
    def base_dir(self) -> str:
        return os.path.dirname(self.header_path)
    
    def exists(self) -> bool:
        """Check if the problem files exist"""
        return os.path.exists(self.header_path) and os.path.exists(self.problem_path)

class UnifiedProblemManager:
    """
    Manages all problems across different datasets with unified structure:
    
    unified_problems/
    ├── dataset_name/
    │   ├── problem_id/
    │   │   ├── header.lean
    │   │   ├── problem.lean
    │   │   ├── decomposed/
    │   │   ├── hole/
    │   │   └── metadata.json
    │   └── ...
    """
    
    def __init__(self, base_dir: str = "unified_problems"):
        self.base_dir = Path(base_dir)
        self.base_dir.mkdir(exist_ok=True)
        self._problems_cache: Dict[str, Problem] = {}
        self._load_problems()
    
    def _load_problems(self):
        """Load all existing problems from the unified directory"""
        self._problems_cache.clear()
        
        if not self.base_dir.exists():
            return
            
        for dataset_dir in self.base_dir.iterdir():
            if not dataset_dir.is_dir():
                continue
                
            dataset_name = dataset_dir.name
            for problem_dir in dataset_dir.iterdir():
                if not problem_dir.is_dir():
                    continue
                    
                problem_id = problem_dir.name
                header_path = problem_dir / "header.lean"
                problem_path = problem_dir / "problem.lean"
                decomposed_dir = problem_dir / "decomposed"
                hole_dir = problem_dir / "hole"
                metadata_path = problem_dir / "metadata.json"
                
                # Load metadata if exists
                metadata = None
                if metadata_path.exists():
                    try:
                        with open(metadata_path, 'r', encoding='utf-8') as f:
                            metadata_dict = json.load(f)
                            metadata = ProblemMetadata(**metadata_dict)
                    except Exception:
                        metadata = None
                
                # Only add if header and problem files exist
                if header_path.exists() and problem_path.exists():
                    problem = Problem(
                        dataset=dataset_name,
                        problem_id=problem_id,
                        header_path=str(header_path),
                        problem_path=str(problem_path),
                        decomposed_dir=str(decomposed_dir),
                        hole_dir=str(hole_dir),
                        metadata=metadata
                    )
                    key = f"{dataset_name}/{problem_id}"
                    self._problems_cache[key] = problem
    
    def get_problem(self, dataset: str, problem_id: str) -> Optional[Problem]:
        """Get a specific problem"""
        key = f"{dataset}/{problem_id}"
        return self._problems_cache.get(key)
    
    def get_all_problems_for_dataset(self, dataset: str) -> List[Problem]:
        """Get all problems for a specific dataset"""
        return [p for p in self._problems_cache.values() if p.dataset == dataset]
    
    def list_problems(self, dataset: Optional[str] = None) -> List[Problem]:
        """List all problems, optionally filtered by dataset"""
        problems = list(self._problems_cache.values())
        if dataset:
            problems = [p for p in problems if p.dataset == dataset]
        return problems
    
    def list_datasets(self) -> List[str]:
        """List all available datasets"""
        datasets = set(p.dataset for p in self._problems_cache.values())
        return sorted(list(datasets))
    
    def add_problem(self, dataset: str, problem_id: str, header_content: str, 
                   problem_content: str, original_path: Optional[str] = None,
                   metadata: Optional[ProblemMetadata] = None) -> Problem:
        """Add a new problem to the unified structure"""
        # Create directory structure
        problem_dir = self.base_dir / dataset / problem_id
        problem_dir.mkdir(parents=True, exist_ok=True)
        
        # Create subdirectories
        decomposed_dir = problem_dir / "decomposed"
        hole_dir = problem_dir / "hole"
        decomposed_dir.mkdir(exist_ok=True)
        hole_dir.mkdir(exist_ok=True)
        
        # Write files
        header_path = problem_dir / "header.lean"
        problem_path = problem_dir / "problem.lean"
        
        with open(header_path, 'w', encoding='utf-8') as f:
            f.write(header_content)
        
        with open(problem_path, 'w', encoding='utf-8') as f:
            f.write(problem_content)
        
        # Save metadata if provided
        if metadata:
            metadata_path = problem_dir / "metadata.json"
            with open(metadata_path, 'w', encoding='utf-8') as f:
                json.dump(metadata.__dict__, f, indent=2, ensure_ascii=False)
        
        # Create problem object
        problem = Problem(
            dataset=dataset,
            problem_id=problem_id,
            header_path=str(header_path),
            problem_path=str(problem_path),
            decomposed_dir=str(decomposed_dir),
            hole_dir=str(hole_dir),
            original_path=original_path,
            metadata=metadata
        )
        
        # Add to cache
        key = f"{dataset}/{problem_id}"
        self._problems_cache[key] = problem
        
        return problem
    
    def get_header_content(self, problem: Problem) -> str:
        """Get the header content for a problem"""
        with open(problem.header_path, 'r', encoding='utf-8') as f:
            return f.read()
    
    def get_problem_content(self, problem: Problem) -> str:
        """Get the problem content (theorem + proof)"""
        with open(problem.problem_path, 'r', encoding='utf-8') as f:
            return f.read()
    
    def get_full_content(self, problem: Problem) -> str:
        """Get header + problem content combined"""
        header = self.get_header_content(problem)
        problem_content = self.get_problem_content(problem)
        return header + "\n\n" + problem_content
    
    def update_problem_content(self, problem: Problem, new_content: str):
        """Update the problem content"""
        with open(problem.problem_path, 'w', encoding='utf-8') as f:
            f.write(new_content)
        
        # Update last modified timestamp in metadata
        if problem.metadata:
            problem.metadata.last_modified = datetime.now().isoformat()
            self.update_metadata(problem, problem.metadata)
    
    def update_metadata(self, problem: Problem, metadata: ProblemMetadata):
        """Update problem metadata"""
        problem.metadata = metadata
        problem_dir = Path(problem.base_dir)
        metadata_path = problem_dir / "metadata.json"
        
        with open(metadata_path, 'w', encoding='utf-8') as f:
            json.dump(metadata.__dict__, f, indent=2, ensure_ascii=False)
    
    def save_decomposed_file(self, problem: Problem, filename: str, content: str):
        """Save a decomposed file for a problem"""
        decomposed_path = Path(problem.decomposed_dir) / filename
        decomposed_path.parent.mkdir(parents=True, exist_ok=True)
        with open(decomposed_path, 'w', encoding='utf-8') as f:
            f.write(content)
    
    def save_hole_file(self, problem: Problem, filename: str, content: str):
        """Save a hole file for a problem"""
        hole_path = Path(problem.hole_dir) / filename
        hole_path.parent.mkdir(parents=True, exist_ok=True)
        with open(hole_path, 'w', encoding='utf-8') as f:
            f.write(content)
    
    def get_decomposed_files(self, problem: Problem) -> List[str]:
        """Get list of decomposed files for a problem"""
        decomposed_dir = Path(problem.decomposed_dir)
        if not decomposed_dir.exists():
            return []
        return [f.name for f in decomposed_dir.iterdir() if f.is_file()]
    
    def get_hole_files(self, problem: Problem) -> List[str]:
        """Get list of hole files for a problem"""
        hole_dir = Path(problem.hole_dir)
        if not hole_dir.exists():
            return []
        return [f.name for f in hole_dir.iterdir() if f.is_file()]
    
    def search_problems(self, query: str, dataset: Optional[str] = None) -> List[Problem]:
        """Search problems by problem_id or metadata"""
        results = []
        problems = self.list_problems(dataset)
        
        query_lower = query.lower()
        for problem in problems:
            # Search in problem_id
            if query_lower in problem.problem_id.lower():
                results.append(problem)
                continue
            
            # Search in metadata tags
            if problem.metadata and problem.metadata.tags:
                if any(query_lower in tag.lower() for tag in problem.metadata.tags):
                    results.append(problem)
                    continue
        
        return results
    
    def get_problems_by_status(self, status: str, dataset: Optional[str] = None) -> List[Problem]:
        """Get problems filtered by status"""
        problems = self.list_problems(dataset)
        return [p for p in problems if p.metadata and p.metadata.status == status]
    
    def export_metadata(self, filepath: str):
        """Export problem metadata to JSON"""
        metadata = {}
        for key, problem in self._problems_cache.items():
            problem_metadata = {
                'dataset': problem.dataset,
                'problem_id': problem.problem_id,
                'header_path': problem.header_path,
                'problem_path': problem.problem_path,
                'decomposed_dir': problem.decomposed_dir,
                'hole_dir': problem.hole_dir,
                'original_path': problem.original_path
            }
            
            if problem.metadata:
                problem_metadata['metadata'] = problem.metadata.__dict__
            
            metadata[key] = problem_metadata
        
        with open(filepath, 'w', encoding='utf-8') as f:
            json.dump(metadata, f, indent=2, ensure_ascii=False)
    
    def get_statistics(self) -> Dict[str, any]:
        """Get statistics about the problem collection"""
        stats = {
            'total_problems': len(self._problems_cache),
            'datasets': {},
            'status_distribution': {},
            'total_datasets': len(self.list_datasets())
        }
        
        for problem in self._problems_cache.values():
            # Dataset statistics
            if problem.dataset not in stats['datasets']:
                stats['datasets'][problem.dataset] = 0
            stats['datasets'][problem.dataset] += 1
            
            # Status distribution
            status = 'unknown'
            if problem.metadata and problem.metadata.status:
                status = problem.metadata.status
            
            if status not in stats['status_distribution']:
                stats['status_distribution'][status] = 0
            stats['status_distribution'][status] += 1
        
        return stats

# Global instance
problem_manager = UnifiedProblemManager() 