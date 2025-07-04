#!/usr/bin/env python3
"""
LLM-based Pruning for N-gram Search

This module provides intelligent pruning capabilities for the n-gram search process
using OpenRouter's cypher-alpha:free model to make decisions about whether to continue
exploring a particular search branch.
"""

import os
from typing import Optional, Dict, Any, List
from dataclasses import dataclass
from dotenv import load_dotenv
from openai import OpenAI

# Load environment variables - force reload to override system env vars
load_dotenv(override=True)
OPENROUTER_API_KEY = os.getenv("OPENROUTER_API_KEY")

@dataclass
class PruningDecision:
    """Result of LLM pruning analysis"""
    should_prune: bool
    confidence: float
    reasoning: str
    llm_response: str

@dataclass
class PruningStats:
    """Statistics for LLM pruning operations"""
    total_queries: int = 0
    prune_decisions: int = 0
    continue_decisions: int = 0
    total_api_time: float = 0.0

class LLMPruner:
    """LLM-based pruning for n-gram search"""
    
    def __init__(self, model: str = "google/gemini-2.5-flash"):
        """
        Initialize LLM Pruner
        
        Args:
            model: OpenRouter model to use for pruning decisions
        """
        if not OPENROUTER_API_KEY:
            raise ValueError("OPENROUTER_API_KEY environment variable not set")
        self.model = model
        self.client = OpenAI(
            base_url="https://openrouter.ai/api/v1",
            api_key=OPENROUTER_API_KEY,
        )
        
        self.stats = PruningStats()
        
    def should_prune_node(self, 
                         tactic_sequence: List[str],
                         pre_state_info: Dict[str, Any],
                         post_state_info: Dict[str, Any],
                         hole_id: str) -> PruningDecision:
        """
        Decide whether to prune a search node based on proof state analysis
        
        Args:
            tactic_sequence: The sequence of tactics applied so far
            pre_state_info: Information about proof state before latest tactic
            post_state_info: Information about proof state after latest tactic
            hole_id: Identifier for the hole being processed
            
        Returns:
            PruningDecision with recommendation and reasoning
        """
        prompt = self._create_pruning_prompt(
            tactic_sequence, pre_state_info, post_state_info, hole_id
        )
        
        import time
        start_time = time.time()
        
        try:
            completion = self.client.chat.completions.create(
                model=self.model,
                messages=[
                    {
                        "role": "user",
                        "content": prompt
                    }
                ]
            )
            
            response_text = completion.choices[0].message.content
            self.stats.total_api_time += time.time() - start_time
            self.stats.total_queries += 1
            
            # Parse the LLM response
            decision = self._parse_llm_response(response_text)
            
            if decision.should_prune:
                self.stats.prune_decisions += 1
            else:
                self.stats.continue_decisions += 1
                
            return decision
            
        except Exception as e:
            # No fallback handling - let the exception propagate
            raise RuntimeError(f"LLM pruning failed: {e}")
    
    def _create_pruning_prompt(self, 
                              tactic_sequence: List[str],
                              pre_state_info: Dict[str, Any],
                              post_state_info: Dict[str, Any],
                              hole_id: str) -> str:
        """Create prompt for LLM pruning decision"""
        
        tactic_str = " ; ".join(tactic_sequence) if tactic_sequence else "none"
        
        prompt = f"""You are analyzing a Lean proof search to decide whether to continue exploring a branch or prune it.

Hole ID: {hole_id}
Tactics applied so far: {tactic_str}

Proof state before latest tactic:
- Remaining goals: {pre_state_info.get('remaining_goals', 'unknown')}
- {pre_state_info.get('goals_summary', 'not available')}

Proof state after latest tactic:
- Remaining goals: {post_state_info.get('remaining_goals', 'unknown')}  
- {post_state_info.get('goals_summary', 'not available')}

Analyze the change from BEFORE to AFTER:

1. Is the latest tactic making meaningful progress toward the goal?
2. Are the goals becoming simpler, more complex, or fundamentally different?
3. Did the goal structure change in a positive way (even if goal count stayed same)?
4. Is this search direction likely to lead to a solution?

Guidelines:
- CONTINUE if goals are simplified, normalized, or transformed positively
- CONTINUE if goal count decreased or stayed same with useful transformation
- CONTINUE if goal is decomposed into smaller goals that are easier to solve
- PRUNE if goal count increased significantly without clear benefit and not becoming easier to solve
- PRUNE if goals became more complex or moved away from solvable form
- PRUNE if tactic introduced irrelevant or unhelpful structure

**PRUNE if the tactic and state change is not helpful for the goal, and just doing random changes**

Make a precise decision based on the actual goal content changes.

Respond with exactly one of:
PRUNE - if this branch should be abandoned
CONTINUE - if this branch should be explored further
"""
# Then provide a brief reason on the next line.
        print(prompt)
        return prompt
    
    def _parse_llm_response(self, response_text: str) -> PruningDecision:
        """Parse LLM response into a pruning decision"""
        
        lines = response_text.strip().split('\n')
        if not lines:
            raise ValueError("Empty LLM response")
        
        decision_line = lines[0].strip().upper()
        reasoning = '\n'.join(lines[1:]).strip() if len(lines) > 1 else "No reasoning provided"
        
        if decision_line == "PRUNE":
            should_prune = True
            confidence = 0.8  # Default confidence
        elif decision_line == "CONTINUE":
            should_prune = False
            confidence = 0.8  # Default confidence
        else:
            # Try to extract decision from within the text
            if "PRUNE" in response_text.upper():
                should_prune = True
                confidence = 0.6  # Lower confidence for unclear response
            elif "CONTINUE" in response_text.upper():
                should_prune = False
                confidence = 0.6  # Lower confidence for unclear response
            else:
                # Default to continue if unclear
                should_prune = False
                confidence = 0.3
                reasoning = f"Unclear response, defaulting to CONTINUE. Original: {response_text}"
        
        return PruningDecision(
            should_prune=should_prune,
            confidence=confidence,
            reasoning=reasoning,
            llm_response=response_text
        )
    
    def get_pruning_stats(self) -> Dict[str, Any]:
        """Get statistics about pruning operations"""
        return {
            "total_queries": self.stats.total_queries,
            "prune_decisions": self.stats.prune_decisions,
            "continue_decisions": self.stats.continue_decisions,
            "prune_rate": self.stats.prune_decisions / max(1, self.stats.total_queries),
            "total_api_time": self.stats.total_api_time,
            "avg_api_time": self.stats.total_api_time / max(1, self.stats.total_queries)
        }
    
    def reset_stats(self):
        """Reset pruning statistics"""
        self.stats = PruningStats()


def demo_llm_pruner():
    """Demo the LLM pruner"""
    print("🤖 LLM Pruner Demo")
    print("=" * 40)
    
    try:
        pruner = LLMPruner()
        
        # Demo pruning decision
        demo_pre_state = {
            "remaining_goals": 3,
            "goals_summary": "Complex algebraic goals involving polynomials"
        }
        
        demo_post_state = {
            "remaining_goals": 2,
            "goals_summary": "Simplified goals after normalization"
        }
        
        decision = pruner.should_prune_node(
            tactic_sequence=["norm_num", "simp"],
            pre_state_info=demo_pre_state,
            post_state_info=demo_post_state,
            hole_id="hole_3"
        )
        
        print(f"✅ LLM Pruner initialized")
        print(f"   Model: {pruner.model}")
        print(f"   Demo decision: {'PRUNE' if decision.should_prune else 'CONTINUE'}")
        print(f"   Confidence: {decision.confidence:.2f}")
        print(f"   Reasoning: {decision.reasoning}")
        
        stats = pruner.get_pruning_stats()
        print(f"   API time: {stats['avg_api_time']:.3f}s")
        
    except Exception as e:
        print(f"❌ Error initializing LLM Pruner: {e}")
        print("   Make sure OPENROUTER_API_KEY is set in your environment")
        
    print(f"\n💡 Usage:")
    print(f"   pruner = LLMPruner()")
    print(f"   decision = pruner.should_prune_node(tactics, pre_state, post_state, hole_id)")
    
    print(f"\n🎯 Key Features:")
    print(f"   - OpenRouter cypher-alpha:free integration")
    print(f"   - Intelligent pruning decisions")
    print(f"   - Detailed reasoning and statistics")
    print(f"   - No fallback handling (fails fast)")


if __name__ == "__main__":
    demo_llm_pruner()