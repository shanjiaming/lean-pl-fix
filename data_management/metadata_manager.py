import json
import os
from pathlib import Path
from typing import Dict, List, Optional, Set, Any
from dataclasses import dataclass, asdict
from datetime import datetime
import logging

from .unified_problem_manager import problem_manager, Problem, ProblemMetadata


@dataclass
class AnnotationEntry:
    """Single annotation entry for a problem"""
    annotator: str
    timestamp: str
    annotation_type: str  # 'difficulty', 'tag', 'note', 'status', etc.
    value: Any
    confidence: Optional[float] = None
    notes: Optional[str] = None


@dataclass
class ProblemAnnotations:
    """Collection of annotations for a single problem"""
    problem_id: str
    dataset: str
    annotations: List[AnnotationEntry]
    last_updated: str
    
    def add_annotation(self, annotation: AnnotationEntry):
        """Add a new annotation"""
        self.annotations.append(annotation)
        self.last_updated = datetime.now().isoformat()
    
    def get_annotations_by_type(self, annotation_type: str) -> List[AnnotationEntry]:
        """Get all annotations of a specific type"""
        return [a for a in self.annotations if a.annotation_type == annotation_type]
    
    def get_latest_annotation(self, annotation_type: str) -> Optional[AnnotationEntry]:
        """Get the most recent annotation of a specific type"""
        annotations = self.get_annotations_by_type(annotation_type)
        if not annotations:
            return None
        return max(annotations, key=lambda a: a.timestamp)


class MetadataManager:
    """Manages metadata and annotations for problems"""
    
    def __init__(self, annotations_file: str = "problem_annotations.json", enable_logging: bool = True):
        self.annotations_file = Path(annotations_file)
        self.enable_logging = enable_logging
        self._annotations_cache: Dict[str, ProblemAnnotations] = {}
        
        if enable_logging:
            self._setup_logging()
        
        self._load_annotations()
    
    def _setup_logging(self):
        """Setup logging for metadata management"""
        self.logger = logging.getLogger('MetadataManager')
        self.logger.setLevel(logging.INFO)
        
        # Clear existing handlers
        self.logger.handlers.clear()
        
        # Console handler
        console_handler = logging.StreamHandler()
        console_handler.setLevel(logging.INFO)
        
        formatter = logging.Formatter(
            '%(asctime)s - %(name)s - %(levelname)s - %(message)s',
            datefmt='%Y-%m-%d %H:%M:%S'
        )
        console_handler.setFormatter(formatter)
        self.logger.addHandler(console_handler)
    
    def _load_annotations(self):
        """Load annotations from file"""
        self._annotations_cache.clear()
        
        if not self.annotations_file.exists():
            if self.enable_logging:
                self.logger.info(f"Annotations file {self.annotations_file} does not exist, starting fresh")
            return
        
        try:
            with open(self.annotations_file, 'r', encoding='utf-8') as f:
                data = json.load(f)
            
            for key, annotation_data in data.items():
                annotations = []
                for ann_data in annotation_data.get('annotations', []):
                    annotation = AnnotationEntry(**ann_data)
                    annotations.append(annotation)
                
                problem_annotations = ProblemAnnotations(
                    problem_id=annotation_data['problem_id'],
                    dataset=annotation_data['dataset'],
                    annotations=annotations,
                    last_updated=annotation_data.get('last_updated', datetime.now().isoformat())
                )
                
                self._annotations_cache[key] = problem_annotations
            
            if self.enable_logging:
                self.logger.info(f"Loaded {len(self._annotations_cache)} problem annotations")
                
        except Exception as e:
            if self.enable_logging:
                self.logger.error(f"Error loading annotations: {e}")
    
    def _save_annotations(self):
        """Save annotations to file"""
        try:
            # Create backup
            if self.annotations_file.exists():
                backup_file = self.annotations_file.with_suffix('.json.backup')
                import shutil
                shutil.copy2(self.annotations_file, backup_file)
            
            # Save current annotations
            data = {}
            for key, problem_annotations in self._annotations_cache.items():
                data[key] = {
                    'problem_id': problem_annotations.problem_id,
                    'dataset': problem_annotations.dataset,
                    'last_updated': problem_annotations.last_updated,
                    'annotations': [asdict(ann) for ann in problem_annotations.annotations]
                }
            
            with open(self.annotations_file, 'w', encoding='utf-8') as f:
                json.dump(data, f, indent=2, ensure_ascii=False)
            
            if self.enable_logging:
                self.logger.info(f"Saved {len(self._annotations_cache)} problem annotations")
                
        except Exception as e:
            if self.enable_logging:
                self.logger.error(f"Error saving annotations: {e}")
    
    def get_problem_annotations(self, dataset: str, problem_id: str) -> Optional[ProblemAnnotations]:
        """Get annotations for a specific problem"""
        key = f"{dataset}/{problem_id}"
        return self._annotations_cache.get(key)
    
    def add_annotation(self, dataset: str, problem_id: str, annotation: AnnotationEntry):
        """Add an annotation to a problem"""
        key = f"{dataset}/{problem_id}"
        
        if key not in self._annotations_cache:
            self._annotations_cache[key] = ProblemAnnotations(
                problem_id=problem_id,
                dataset=dataset,
                annotations=[],
                last_updated=datetime.now().isoformat()
            )
        
        self._annotations_cache[key].add_annotation(annotation)
        self._save_annotations()
        
        if self.enable_logging:
            self.logger.info(f"Added {annotation.annotation_type} annotation to {dataset}/{problem_id}")
    
    def annotate_difficulty(self, dataset: str, problem_id: str, difficulty: str, 
                          annotator: str, confidence: Optional[float] = None, notes: Optional[str] = None):
        """Add a difficulty annotation"""
        annotation = AnnotationEntry(
            annotator=annotator,
            timestamp=datetime.now().isoformat(),
            annotation_type='difficulty',
            value=difficulty,
            confidence=confidence,
            notes=notes
        )
        self.add_annotation(dataset, problem_id, annotation)
    
    def annotate_status(self, dataset: str, problem_id: str, status: str,
                       annotator: str, confidence: Optional[float] = None, notes: Optional[str] = None):
        """Add a status annotation"""
        annotation = AnnotationEntry(
            annotator=annotator,
            timestamp=datetime.now().isoformat(),
            annotation_type='status',
            value=status,
            confidence=confidence,
            notes=notes
        )
        self.add_annotation(dataset, problem_id, annotation)
    
    def add_tag(self, dataset: str, problem_id: str, tag: str, annotator: str, notes: Optional[str] = None):
        """Add a tag annotation"""
        annotation = AnnotationEntry(
            annotator=annotator,
            timestamp=datetime.now().isoformat(),
            annotation_type='tag',
            value=tag,
            notes=notes
        )
        self.add_annotation(dataset, problem_id, annotation)
    
    def add_note(self, dataset: str, problem_id: str, note: str, annotator: str):
        """Add a general note annotation"""
        annotation = AnnotationEntry(
            annotator=annotator,
            timestamp=datetime.now().isoformat(),
            annotation_type='note',
            value=note
        )
        self.add_annotation(dataset, problem_id, annotation)
    
    def get_problems_by_difficulty(self, difficulty: str, dataset: Optional[str] = None) -> List[str]:
        """Get problems with a specific difficulty annotation"""
        results = []
        
        for key, annotations in self._annotations_cache.items():
            if dataset and not key.startswith(f"{dataset}/"):
                continue
            
            latest_difficulty = annotations.get_latest_annotation('difficulty')
            if latest_difficulty and latest_difficulty.value == difficulty:
                results.append(key)
        
        return results
    
    def get_problems_by_status(self, status: str, dataset: Optional[str] = None) -> List[str]:
        """Get problems with a specific status annotation"""
        results = []
        
        for key, annotations in self._annotations_cache.items():
            if dataset and not key.startswith(f"{dataset}/"):
                continue
            
            latest_status = annotations.get_latest_annotation('status')
            if latest_status and latest_status.value == status:
                results.append(key)
        
        return results
    
    def get_problems_with_tag(self, tag: str, dataset: Optional[str] = None) -> List[str]:
        """Get problems with a specific tag"""
        results = []
        
        for key, annotations in self._annotations_cache.items():
            if dataset and not key.startswith(f"{dataset}/"):
                continue
            
            tag_annotations = annotations.get_annotations_by_type('tag')
            if any(ann.value == tag for ann in tag_annotations):
                results.append(key)
        
        return results
    
    def get_all_tags(self, dataset: Optional[str] = None) -> Set[str]:
        """Get all unique tags"""
        tags = set()
        
        for key, annotations in self._annotations_cache.items():
            if dataset and not key.startswith(f"{dataset}/"):
                continue
            
            tag_annotations = annotations.get_annotations_by_type('tag')
            for ann in tag_annotations:
                tags.add(ann.value)
        
        return tags
    
    def get_annotation_statistics(self, dataset: Optional[str] = None) -> Dict[str, Any]:
        """Get statistics about annotations"""
        stats = {
            'total_annotated_problems': 0,
            'annotation_types': {},
            'annotators': set(),
            'difficulty_distribution': {},
            'status_distribution': {},
            'tag_count': 0
        }
        
        for key, annotations in self._annotations_cache.items():
            if dataset and not key.startswith(f"{dataset}/"):
                continue
            
            stats['total_annotated_problems'] += 1
            
            for ann in annotations.annotations:
                # Count annotation types
                ann_type = ann.annotation_type
                if ann_type not in stats['annotation_types']:
                    stats['annotation_types'][ann_type] = 0
                stats['annotation_types'][ann_type] += 1
                
                # Track annotators
                stats['annotators'].add(ann.annotator)
                
                # Track difficulty distribution
                if ann_type == 'difficulty':
                    difficulty = ann.value
                    if difficulty not in stats['difficulty_distribution']:
                        stats['difficulty_distribution'][difficulty] = 0
                    stats['difficulty_distribution'][difficulty] += 1
                
                # Track status distribution
                if ann_type == 'status':
                    status = ann.value
                    if status not in stats['status_distribution']:
                        stats['status_distribution'][status] = 0
                    stats['status_distribution'][status] += 1
                
                # Count tags
                if ann_type == 'tag':
                    stats['tag_count'] += 1
        
        # Convert set to list for JSON serialization
        stats['annotators'] = list(stats['annotators'])
        
        return stats
    
    def sync_with_problem_metadata(self, dataset: Optional[str] = None):
        """Sync annotations with problem metadata in the unified problem manager"""
        if self.enable_logging:
            self.logger.info("Syncing annotations with problem metadata")
        
        problems = problem_manager.list_problems(dataset)
        updated_count = 0
        
        for problem in problems:
            key = f"{problem.dataset}/{problem.problem_id}"
            annotations = self._annotations_cache.get(key)
            
            if not annotations:
                continue
            
            # Update metadata based on latest annotations
            metadata = problem.metadata or ProblemMetadata(
                dataset=problem.dataset,
                problem_id=problem.problem_id
            )
            
            # Update difficulty
            latest_difficulty = annotations.get_latest_annotation('difficulty')
            if latest_difficulty:
                metadata.difficulty = latest_difficulty.value
            
            # Update status
            latest_status = annotations.get_latest_annotation('status')
            if latest_status:
                metadata.status = latest_status.value
            
            # Update tags
            tag_annotations = annotations.get_annotations_by_type('tag')
            if tag_annotations:
                tags = [ann.value for ann in tag_annotations]
                metadata.tags = list(set(tags))  # Remove duplicates
            
            # Update last modified
            metadata.last_modified = annotations.last_updated
            
            # Save updated metadata
            problem_manager.update_metadata(problem, metadata)
            updated_count += 1
        
        if self.enable_logging:
            self.logger.info(f"Updated metadata for {updated_count} problems")
    
    def import_annotations_from_metadata(self, dataset: Optional[str] = None, annotator: str = "system"):
        """Import existing metadata as annotations"""
        if self.enable_logging:
            self.logger.info("Importing metadata as annotations")
        
        problems = problem_manager.list_problems(dataset)
        imported_count = 0
        
        for problem in problems:
            if not problem.metadata:
                continue
            
            key = f"{problem.dataset}/{problem.problem_id}"
            
            # Create annotations from metadata
            if problem.metadata.difficulty:
                self.annotate_difficulty(
                    problem.dataset, problem.problem_id, 
                    problem.metadata.difficulty, annotator
                )
            
            if problem.metadata.status:
                self.annotate_status(
                    problem.dataset, problem.problem_id,
                    problem.metadata.status, annotator
                )
            
            if problem.metadata.tags:
                for tag in problem.metadata.tags:
                    self.add_tag(
                        problem.dataset, problem.problem_id,
                        tag, annotator
                    )
            
            imported_count += 1
        
        if self.enable_logging:
            self.logger.info(f"Imported metadata from {imported_count} problems as annotations")
    
    def export_annotations(self, output_file: str, dataset: Optional[str] = None):
        """Export annotations to a file"""
        export_data = {}
        
        for key, annotations in self._annotations_cache.items():
            if dataset and not key.startswith(f"{dataset}/"):
                continue
            
            export_data[key] = {
                'problem_id': annotations.problem_id,
                'dataset': annotations.dataset,
                'last_updated': annotations.last_updated,
                'annotations': [asdict(ann) for ann in annotations.annotations]
            }
        
        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump(export_data, f, indent=2, ensure_ascii=False)
        
        if self.enable_logging:
            self.logger.info(f"Exported {len(export_data)} problem annotations to {output_file}")
    
    def generate_annotation_report(self, dataset: Optional[str] = None) -> str:
        """Generate a human-readable annotation report"""
        stats = self.get_annotation_statistics(dataset)
        
        report = []
        report.append("=== ANNOTATION REPORT ===")
        if dataset:
            report.append(f"Dataset: {dataset}")
        report.append(f"Total annotated problems: {stats['total_annotated_problems']}")
        report.append(f"Number of annotators: {len(stats['annotators'])}")
        report.append("")
        
        report.append("Annotation Types:")
        for ann_type, count in stats['annotation_types'].items():
            report.append(f"  {ann_type}: {count}")
        report.append("")
        
        if stats['difficulty_distribution']:
            report.append("Difficulty Distribution:")
            for difficulty, count in stats['difficulty_distribution'].items():
                report.append(f"  {difficulty}: {count}")
            report.append("")
        
        if stats['status_distribution']:
            report.append("Status Distribution:")
            for status, count in stats['status_distribution'].items():
                report.append(f"  {status}: {count}")
            report.append("")
        
        report.append(f"Total tags: {stats['tag_count']}")
        report.append("")
        
        report.append("Annotators:")
        for annotator in stats['annotators']:
            report.append(f"  {annotator}")
        
        return '\n'.join(report) 