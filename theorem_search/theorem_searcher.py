from typing import List, Dict, Optional, Any, Union, Tuple
from dataclasses import dataclass
from enum import Enum
import re
import time
from abc import ABC, abstractmethod

from data_management.unified_problem_manager import Problem, problem_manager


class SearchType(Enum):
    """Types of theorem search"""
    SYNTACTIC = "syntactic"
    SEMANTIC = "semantic"
    HYBRID = "hybrid"
    EXACT = "exact"


@dataclass
class SearchResult:
    """Result of a theorem search"""
    theorem_name: str
    theorem_statement: str
    theorem_proof: Optional[str] = None
    confidence_score: float = 0.0
    search_type: SearchType = SearchType.SYNTACTIC
    metadata: Optional[Dict[str, Any]] = None
    source_database: Optional[str] = None
    
    def is_high_confidence(self, threshold: float = 0.8) -> bool:
        """Check if the result has high confidence"""
        return self.confidence_score >= threshold


@dataclass
class SearchConfig:
    """Configuration for theorem search"""
    max_results: int = 10
    min_confidence: float = 0.1
    search_types: List[SearchType] = None
    timeout: Optional[float] = None
    use_cache: bool = True
    custom_params: Optional[Dict[str, Any]] = None
    
    def __post_init__(self):
        if self.search_types is None:
            self.search_types = [SearchType.SYNTACTIC, SearchType.SEMANTIC]
    
    def get_param(self, key: str, default: Any = None) -> Any:
        """Get a custom parameter with default value"""
        if self.custom_params is None:
            return default
        return self.custom_params.get(key, default)


class TheoremSearcher:
    """
    Main theorem searcher that coordinates different search strategies
    and databases to find relevant theorems.
    """
    
    def __init__(self, config: Optional[SearchConfig] = None):
        self.config = config or SearchConfig()
        self.databases = {}
        self.strategies = {}
        self.cache = {} if self.config.use_cache else None
        self._stats = {
            'total_searches': 0,
            'cache_hits': 0,
            'total_results': 0,
            'average_confidence': 0.0
        }
    
    def register_database(self, name: str, database):
        """Register a theorem database"""
        self.databases[name] = database
    
    def register_strategy(self, search_type: SearchType, strategy):
        """Register a search strategy"""
        self.strategies[search_type] = strategy
    
    def search_theorems(self, query: str, context: Optional[str] = None, 
                       config: Optional[SearchConfig] = None) -> List[SearchResult]:
        """
        Search for theorems matching the given query.
        
        Args:
            query: The search query (theorem statement, goal, etc.)
            context: Additional context for the search
            config: Search configuration (overrides default)
            
        Returns:
            List of SearchResults ordered by confidence score
        """
        effective_config = config or self.config
        start_time = time.time()
        
        # Check cache first
        cache_key = self._get_cache_key(query, context, effective_config)
        if self.cache and cache_key in self.cache:
            self._stats['cache_hits'] += 1
            return self.cache[cache_key]
        
        all_results = []
        
        # Search using each configured strategy
        for search_type in effective_config.search_types:
            if search_type in self.strategies:
                try:
                    strategy = self.strategies[search_type]
                    results = strategy.search(query, context, effective_config)
                    all_results.extend(results)
                except Exception as e:
                    print(f"Error in {search_type} search: {e}")
                    continue
        
        # Remove duplicates and sort by confidence
        unique_results = self._deduplicate_results(all_results)
        sorted_results = sorted(unique_results, 
                              key=lambda r: r.confidence_score, 
                              reverse=True)
        
        # Apply filters
        filtered_results = self._filter_results(sorted_results, effective_config)
        
        # Limit results
        final_results = filtered_results[:effective_config.max_results]
        
        # Update statistics
        self._update_stats(final_results)
        
        # Cache results
        if self.cache:
            self.cache[cache_key] = final_results
        
        return final_results
    
    def search_by_goal(self, goal: str, hypotheses: Optional[List[str]] = None,
                      config: Optional[SearchConfig] = None) -> List[SearchResult]:
        """
        Search for theorems that can help prove a specific goal.
        
        Args:
            goal: The goal to prove
            hypotheses: Available hypotheses
            config: Search configuration
            
        Returns:
            List of relevant theorems
        """
        # Construct context from hypotheses
        context = ""
        if hypotheses:
            context = "Hypotheses:\n" + "\n".join(f"- {h}" for h in hypotheses)
        
        # Format query for goal-oriented search
        query = f"Goal: {goal}"
        
        return self.search_theorems(query, context, config)
    
    def search_by_pattern(self, pattern: str, pattern_type: str = "lean",
                         config: Optional[SearchConfig] = None) -> List[SearchResult]:
        """
        Search for theorems matching a specific pattern.
        
        Args:
            pattern: The pattern to match
            pattern_type: Type of pattern ("lean", "regex", "template")
            config: Search configuration
            
        Returns:
            List of matching theorems
        """
        # Add pattern type to config
        effective_config = config or SearchConfig()
        if effective_config.custom_params is None:
            effective_config.custom_params = {}
        effective_config.custom_params['pattern_type'] = pattern_type
        
        return self.search_theorems(pattern, None, effective_config)
    
    def find_replacement_theorems(self, original_theorem: str, 
                                 target_context: str,
                                 config: Optional[SearchConfig] = None) -> List[SearchResult]:
        """
        Find theorems that can replace the original theorem in the target context.
        
        Args:
            original_theorem: The theorem to replace
            target_context: The context where replacement is needed
            config: Search configuration
            
        Returns:
            List of potential replacement theorems
        """
        # Construct query for replacement search
        query = f"Replace: {original_theorem}"
        context = f"Target context: {target_context}"
        
        # Use hybrid search for replacement
        effective_config = config or SearchConfig()
        if SearchType.HYBRID not in effective_config.search_types:
            effective_config.search_types.append(SearchType.HYBRID)
        
        return self.search_theorems(query, context, effective_config)
    
    def _get_cache_key(self, query: str, context: Optional[str], 
                      config: SearchConfig) -> str:
        """Generate cache key for the search"""
        key_parts = [
            query,
            context or "",
            str(config.max_results),
            str(config.min_confidence),
            ",".join(st.value for st in config.search_types)
        ]
        return "|".join(key_parts)
    
    def _deduplicate_results(self, results: List[SearchResult]) -> List[SearchResult]:
        """Remove duplicate results based on theorem name"""
        seen = set()
        unique_results = []
        
        for result in results:
            if result.theorem_name not in seen:
                seen.add(result.theorem_name)
                unique_results.append(result)
            else:
                # If we've seen this theorem, keep the one with higher confidence
                for i, existing in enumerate(unique_results):
                    if existing.theorem_name == result.theorem_name:
                        if result.confidence_score > existing.confidence_score:
                            unique_results[i] = result
                        break
        
        return unique_results
    
    def _filter_results(self, results: List[SearchResult], 
                       config: SearchConfig) -> List[SearchResult]:
        """Filter results based on configuration"""
        filtered = []
        
        for result in results:
            # Filter by minimum confidence
            if result.confidence_score >= config.min_confidence:
                filtered.append(result)
        
        return filtered
    
    def _update_stats(self, results: List[SearchResult]):
        """Update search statistics"""
        self._stats['total_searches'] += 1
        self._stats['total_results'] += len(results)
        
        if results:
            avg_confidence = sum(r.confidence_score for r in results) / len(results)
            total_avg = self._stats['average_confidence']
            total_searches = self._stats['total_searches']
            
            # Update running average
            self._stats['average_confidence'] = (
                (total_avg * (total_searches - 1) + avg_confidence) / total_searches
            )
    
    def get_stats(self) -> Dict[str, Any]:
        """Get search statistics"""
        stats = self._stats.copy()
        if self._stats['total_searches'] > 0:
            stats['cache_hit_rate'] = self._stats['cache_hits'] / self._stats['total_searches']
            stats['average_results_per_search'] = self._stats['total_results'] / self._stats['total_searches']
        else:
            stats['cache_hit_rate'] = 0.0
            stats['average_results_per_search'] = 0.0
        
        return stats
    
    def clear_cache(self):
        """Clear the search cache"""
        if self.cache:
            self.cache.clear()
    
    def get_available_databases(self) -> List[str]:
        """Get list of available databases"""
        return list(self.databases.keys())
    
    def get_available_strategies(self) -> List[SearchType]:
        """Get list of available search strategies"""
        return list(self.strategies.keys())


class TheoremReplacer:
    """
    Helper class for replacing theorems in proofs.
    """
    
    def __init__(self, searcher: TheoremSearcher):
        self.searcher = searcher
    
    def replace_theorem_in_proof(self, proof: str, old_theorem: str, 
                                new_theorem: str, context: Optional[str] = None) -> str:
        """
        Replace occurrences of old_theorem with new_theorem in the proof.
        
        Args:
            proof: The proof text
            old_theorem: Theorem to replace
            new_theorem: Replacement theorem
            context: Additional context for replacement
            
        Returns:
            Modified proof with replacements
        """
        # Simple text replacement for now
        # In the future, this could be more sophisticated with AST parsing
        return proof.replace(old_theorem, new_theorem)
    
    def suggest_replacements(self, proof: str, problematic_theorem: str,
                           config: Optional[SearchConfig] = None) -> List[Tuple[str, SearchResult]]:
        """
        Suggest replacement theorems for a problematic theorem in a proof.
        
        Args:
            proof: The proof containing the problematic theorem
            problematic_theorem: The theorem that needs replacement
            config: Search configuration
            
        Returns:
            List of (modified_proof, search_result) tuples
        """
        # Find replacement candidates
        candidates = self.searcher.find_replacement_theorems(
            problematic_theorem, proof, config
        )
        
        suggestions = []
        for candidate in candidates:
            modified_proof = self.replace_theorem_in_proof(
                proof, problematic_theorem, candidate.theorem_name
            )
            suggestions.append((modified_proof, candidate))
        
        return suggestions
    
    def auto_replace_theorems(self, proof: str, 
                             replacement_rules: Dict[str, str]) -> str:
        """
        Automatically replace theorems based on replacement rules.
        
        Args:
            proof: The proof text
            replacement_rules: Dictionary mapping old theorems to new theorems
            
        Returns:
            Modified proof with all replacements applied
        """
        modified_proof = proof
        
        for old_theorem, new_theorem in replacement_rules.items():
            modified_proof = self.replace_theorem_in_proof(
                modified_proof, old_theorem, new_theorem
            )
        
        return modified_proof 