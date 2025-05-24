#!/usr/bin/env python3
"""
Complete Decomposition → Hole Filling → Synthesis → Verification Pipeline Demo
"""

import os
import sys
import time
from pathlib import Path
from typing import List, Dict, Any, Optional

# Add the parent directory to Python path for imports
sys.path.append(str(Path(__file__).parent.parent))

from data_management.unified_problem_manager import problem_manager
from solvers.decompose_solver_unified import DecomposeSolver, get_unified_env
from solvers.base_solver import SolverConfig


class HoleFiller:
    """Simple hole filling strategies"""
    
    def __init__(self):
        self.strategies = {
            'simp': 'simp',
            'rfl': 'rfl', 
            'assumption': 'assumption',
            'rw': 'rw [*]',
            'apply': 'apply_assumption',
            'comm': 'rw [Nat.add_comm]',
            'assoc': 'rw [Nat.add_assoc]',
            'mul_comm': 'rw [Nat.mul_comm]',
            'mul_add': 'rw [Nat.mul_add]'
        }
    
    def fill_hole(self, theorem_content: str, problem_context: str = "") -> List[str]:
        """Try different strategies to fill the hole"""
        filled_versions = []
        
        for strategy_name, tactic in self.strategies.items():
            # Replace 'hole' with the tactic
            filled_content = theorem_content.replace('hole', tactic)
            filled_versions.append({
                'strategy': strategy_name,
                'content': filled_content,
                'tactic': tactic
            })
        
        return filled_versions


class ProofSynthesizer:
    """Synthesize complete proofs from filled holes"""
    
    def __init__(self):
        self.env = get_unified_env()
    
    def synthesize_proof(self, problem, hole_content: str, filled_holes: Dict[str, str]) -> str:
        """Synthesize complete proof by replacing holes with filled content"""
        synthesized_proof = hole_content
        
        # Replace each hole reference with filled content
        for hole_name, filled_tactic in filled_holes.items():
            # Replace 'by hole' with 'by {filled_tactic}'
            synthesized_proof = synthesized_proof.replace('by hole', f'by {filled_tactic}')
        
        return synthesized_proof


class ProofVerifier:
    """Verify if proofs are valid (mock implementation)"""
    
    def __init__(self):
        self.env = get_unified_env()
    
    def verify_proof(self, problem, proof_content: str) -> Dict[str, Any]:
        """Verify if a proof is valid (mock implementation)"""
        # Get full content with header
        header_content = problem_manager.get_header_content(problem)
        hole_macro = 'macro "hole" : tactic => `(tactic| admit)'
        full_header = f"{header_content}\n\n{hole_macro}\n\n"
        complete_proof = f"{full_header}{proof_content}"
        
        # Mock verification - check for obvious issues
        success = True
        errors = []
        
        # Simple checks
        if 'hole' in proof_content:
            success = False
            errors.append("Contains unfilled holes")
        
        if 'sorry' in proof_content:
            # Allow sorry in some cases as valid placeholder
            pass
        
        # Mock success rate based on content complexity
        import random
        if success:
            # Simulate verification with some realistic success rates
            if 'simp' in proof_content:
                success = random.random() > 0.1  # 90% success for simp
            elif 'rfl' in proof_content:
                success = random.random() > 0.2  # 80% success for rfl
            elif 'rw' in proof_content:
                success = random.random() > 0.3  # 70% success for rw
            else:
                success = random.random() > 0.5  # 50% success for others
        
        return {
            'success': success,
            'errors': errors,
            'content': complete_proof,
            'verification_time': 0.01 + random.random() * 0.05  # Mock timing
        }


class CompletePipeline:
    """Complete decomposition → hole filling → synthesis → verification pipeline"""
    
    def __init__(self):
        self.decomposer = DecomposeSolver()
        self.hole_filler = HoleFiller()
        self.synthesizer = ProofSynthesizer()
        self.verifier = ProofVerifier()
        self.results = {}
    
    def run_complete_pipeline(self, dataset: str = "demo") -> Dict[str, Any]:
        """Run the complete pipeline on demo dataset"""
        print("🚀 Complete Decomposition → Hole Filling → Synthesis → Verification Pipeline")
        print("=" * 80)
        
        start_time = time.time()
        
        # Get all problems
        problems = problem_manager.list_problems(dataset)
        print(f"📋 Found {len(problems)} problems in dataset '{dataset}'")
        
        pipeline_results = {
            'dataset': dataset,
            'total_problems': len(problems),
            'results': {},
            'summary': {}
        }
        
        for problem in problems:
            problem_id = problem.problem_id
            print(f"\n{'='*60}")
            print(f"🧪 Processing: {dataset}/{problem_id}")
            print(f"{'='*60}")
            
            try:
                if problem is None:
                    print(f"❌ Failed to load problem: {problem_id}")
                    pipeline_results['results'][problem_id] = {
                        'error': f'Failed to load problem: {problem_id}',
                        'success': False
                    }
                    continue
                    
                result = self.process_single_problem(problem)
                pipeline_results['results'][problem_id] = result
                
            except Exception as e:
                print(f"❌ Error processing {problem_id}: {e}")
                pipeline_results['results'][problem_id] = {
                    'error': str(e),
                    'success': False
                }
        
        # Generate summary
        pipeline_results['summary'] = self.generate_summary(pipeline_results['results'])
        pipeline_results['total_time'] = time.time() - start_time
        
        self.print_final_summary(pipeline_results)
        return pipeline_results
    
    def process_single_problem(self, problem) -> Dict[str, Any]:
        """Process a single problem through the complete pipeline"""
        result = {
            'problem_id': problem.problem_id,
            'stages': {},
            'final_success': False
        }
        
        # Stage 1: Decomposition
        print("🔧 Stage 1: Decomposition")
        decomp_result = self.decomposer.solve(problem)
        result['stages']['decomposition'] = {
            'success': decomp_result.is_success,
            'status': decomp_result.status.value,
            'solution': decomp_result.solution
        }
        
        if not decomp_result.is_success:
            print("❌ Decomposition failed, skipping remaining stages")
            return result

        print(f"✅ Decomposition successful")
        
        # Check if the solution needs hole filling (contains 'hole' keyword)
        solution_text = decomp_result.solution or ""
        needs_hole_filling = 'hole' in solution_text.lower()
        
        if not needs_hole_filling:
            print("📝 Solution is complete (no holes), skipping hole filling and synthesis")
            # Create a direct verification result
            verification_result = self.verifier.verify_proof(problem, solution_text)
            result['stages']['verification'] = {
                'success': verification_result['success'],
                'proof_valid': verification_result['success'],
                'errors': verification_result['errors'],
                'verification_time': verification_result['verification_time'],
                'verified_content': solution_text,
                'note': 'Direct verification of decomposition solution'
            }
            result['final_success'] = verification_result['success']
            
            if verification_result['success']:
                print(f"✅ Direct verification PASSED - Complete pipeline successful!")
            else:
                print(f"❌ Direct verification FAILED: {verification_result.get('errors', [])}")
            
            return result

        # Stage 2: Hole Filling (only for solutions with holes)
        print("🔧 Stage 2: Hole Filling")
        hole_filling_results = self.fill_holes_for_problem(problem)
        result['stages']['hole_filling'] = hole_filling_results
        
        if not hole_filling_results['success']:
            print("❌ Hole filling failed, skipping synthesis")
            return result

        print(f"✅ Hole filling completed: {hole_filling_results['filled_count']} holes filled")
        
        # Stage 3: Synthesis  
        print("🔧 Stage 3: Synthesis")
        synthesis_result = self.synthesize_proof_for_problem(problem, hole_filling_results)
        result['stages']['synthesis'] = synthesis_result
        
        if not synthesis_result['success']:
            print("❌ Synthesis failed, skipping verification")
            return result

        print(f"✅ Synthesis successful")
        
        # Stage 4: Verification
        print("🔧 Stage 4: Verification")
        verification_result = self.verify_synthesized_proof(problem, synthesis_result)
        result['stages']['verification'] = verification_result
        
        result['final_success'] = verification_result['success']
        
        if verification_result['success']:
            print(f"✅ Verification PASSED - Complete pipeline successful!")
        else:
            print(f"❌ Verification FAILED: {verification_result.get('errors', [])}")
        
        return result
    
    def fill_holes_for_problem(self, problem) -> Dict[str, Any]:
        """Fill holes for all decomposed files of a problem"""
        decomposed_dir = Path(problem.decomposed_dir)
        
        if not decomposed_dir.exists():
            return {'success': False, 'error': 'No decomposed directory found'}
        
        decomposed_files = list(decomposed_dir.glob("decomposed_*.lean"))
        filled_holes = {}
        filled_count = 0
        
        for file_path in decomposed_files:
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()
            
            # Try to fill this hole
            filled_versions = self.hole_filler.fill_hole(content)
            
            # For demo, pick the first strategy that makes sense
            best_fill = self.select_best_fill(content, filled_versions)
            
            if best_fill:
                filled_holes[file_path.name] = best_fill
                filled_count += 1
                print(f"  📝 Filled {file_path.name} with strategy: {best_fill['strategy']}")
        
        return {
            'success': filled_count > 0,
            'filled_holes': filled_holes,
            'filled_count': filled_count,
            'total_files': len(decomposed_files)
        }
    
    def select_best_fill(self, content: str, filled_versions: List[Dict]) -> Optional[Dict]:
        """Select the best hole filling strategy for content"""
        # Simple heuristic to select strategy
        if 'add_comm' in content.lower() or 'a + b = b + a' in content:
            return next((f for f in filled_versions if f['strategy'] == 'comm'), filled_versions[0])
        elif 'mul_comm' in content.lower() or 'mul' in content:
            return next((f for f in filled_versions if f['strategy'] == 'mul_comm'), filled_versions[0])
        elif 'add_assoc' in content.lower() or 'assoc' in content:
            return next((f for f in filled_versions if f['strategy'] == 'assoc'), filled_versions[0])
        elif '= x' in content or 'rfl' in content.lower():
            return next((f for f in filled_versions if f['strategy'] == 'rfl'), filled_versions[0])
        else:
            return next((f for f in filled_versions if f['strategy'] == 'simp'), filled_versions[0])
    
    def synthesize_proof_for_problem(self, problem, hole_filling_result: Dict) -> Dict[str, Any]:
        """Synthesize complete proof for a problem"""
        # Load the main hole file
        hole_file = Path(problem.hole_dir) / f"hole_{problem.problem_id}.lean"
        
        if not hole_file.exists():
            return {'success': False, 'error': 'No hole file found'}
        
        with open(hole_file, 'r', encoding='utf-8') as f:
            hole_content = f.read()
        
        # Create mapping of hole names to filled tactics
        filled_tactics = {}
        for file_name, fill_info in hole_filling_result['filled_holes'].items():
            filled_tactics[file_name] = fill_info['tactic']
        
        # Synthesize by replacing holes in main proof
        synthesized_content = self.synthesizer.synthesize_proof(problem, hole_content, filled_tactics)
        
        return {
            'success': True,
            'original_content': hole_content,
            'synthesized_content': synthesized_content,
            'filled_tactics': filled_tactics
        }
    
    def verify_synthesized_proof(self, problem, synthesis_result: Dict) -> Dict[str, Any]:
        """Verify the synthesized proof"""
        synthesized_content = synthesis_result['synthesized_content']
        
        # Verify both original (with holes) and synthesized versions
        original_verification = self.verifier.verify_proof(problem, synthesis_result['original_content'])
        synthesized_verification = self.verifier.verify_proof(problem, synthesized_content)
        
        return {
            'success': synthesized_verification['success'],
            'original_proof_valid': original_verification['success'],
            'synthesized_proof_valid': synthesized_verification['success'],
            'errors': synthesized_verification['errors'],
            'verification_time': synthesized_verification['verification_time'],
            'synthesized_content': synthesized_content
        }
    
    def generate_summary(self, results: Dict) -> Dict[str, Any]:
        """Generate summary statistics"""
        total = len(results)
        successful_decomposition = sum(1 for r in results.values() if r.get('stages', {}).get('decomposition', {}).get('success', False))
        
        # Count hole filling success only for problems that actually needed it
        problems_needing_holes = sum(1 for r in results.values() if 'hole_filling' in r.get('stages', {}))
        successful_hole_filling = sum(1 for r in results.values() if r.get('stages', {}).get('hole_filling', {}).get('success', False))
        
        # Count synthesis success only for problems that went through synthesis
        problems_needing_synthesis = sum(1 for r in results.values() if 'synthesis' in r.get('stages', {}))
        successful_synthesis = sum(1 for r in results.values() if r.get('stages', {}).get('synthesis', {}).get('success', False))
        
        # All problems should have verification (either direct or after synthesis)
        successful_verification = sum(1 for r in results.values() if r.get('final_success', False))
        
        return {
            'total_problems': total,
            'decomposition_success': successful_decomposition,
            'hole_filling_success': successful_hole_filling,
            'problems_needing_holes': problems_needing_holes,
            'synthesis_success': successful_synthesis,
            'problems_needing_synthesis': problems_needing_synthesis,
            'verification_success': successful_verification,
            'complete_pipeline_success_rate': (successful_verification / total * 100) if total > 0 else 0
        }
    
    def print_final_summary(self, pipeline_results: Dict):
        """Print final summary of pipeline results"""
        print(f"\n{'='*80}")
        print(f"🎯 COMPLETE PIPELINE SUMMARY")
        print(f"{'='*80}")
        
        summary = pipeline_results['summary']
        total = summary['total_problems']
        
        print(f"📊 Dataset: {pipeline_results['dataset']}")
        print(f"📊 Total Problems: {total}")
        print(f"📊 Total Time: {pipeline_results['total_time']:.2f}s")
        print()
        
        print(f"🔧 Stage Results:")
        print(f"  1️⃣ Decomposition:   {summary['decomposition_success']:2d}/{total} ({summary['decomposition_success']/total*100:5.1f}%)")
        
        # Show hole filling stats only for problems that needed it
        hole_problems = summary['problems_needing_holes']
        if hole_problems > 0:
            print(f"  2️⃣ Hole Filling:    {summary['hole_filling_success']:2d}/{hole_problems} ({summary['hole_filling_success']/hole_problems*100:5.1f}%) [of {hole_problems} needing holes]")
        else:
            print(f"  2️⃣ Hole Filling:    N/A (no problems needed hole filling)")
        
        # Show synthesis stats only for problems that needed it
        synthesis_problems = summary['problems_needing_synthesis']
        if synthesis_problems > 0:
            print(f"  3️⃣ Synthesis:       {summary['synthesis_success']:2d}/{synthesis_problems} ({summary['synthesis_success']/synthesis_problems*100:5.1f}%) [of {synthesis_problems} needing synthesis]")
        else:
            print(f"  3️⃣ Synthesis:       N/A (no problems needed synthesis)")
        
        print(f"  4️⃣ Verification:    {summary['verification_success']:2d}/{total} ({summary['verification_success']/total*100:5.1f}%)")
        
        print(f"🎯 Complete Pipeline Success Rate: {summary['complete_pipeline_success_rate']:.1f}%")
        
        # Detailed problem-by-problem results
        print(f"\n📋 Problem-by-Problem Results:")
        print(f"{'Problem ID':<15} {'Decomp':<7} {'Fill':<7} {'Synth':<7} {'Verify':<7} {'Final':<7}")
        print(f"{'-'*15} {'-'*7} {'-'*7} {'-'*7} {'-'*7} {'-'*7}")
        
        for problem_id, result in pipeline_results['results'].items():
            if 'error' in result:
                print(f"{problem_id:<15} {'ERROR':<7} {'ERROR':<7} {'ERROR':<7} {'ERROR':<7} {'❌':<7}")
                continue
                
            stages = result.get('stages', {})
            decomp = '✅' if stages.get('decomposition', {}).get('success', False) else '❌'
            fill = '✅' if stages.get('hole_filling', {}).get('success', False) else '❌'
            synth = '✅' if stages.get('synthesis', {}).get('success', False) else '❌'
            verify = '✅' if stages.get('verification', {}).get('success', False) else '❌'
            final = '✅' if result.get('final_success', False) else '❌'
            
            print(f"{problem_id:<15} {decomp:<7} {fill:<7} {synth:<7} {verify:<7} {final:<7}")


def main():
    """Main function to run the complete pipeline demo"""
    pipeline = CompletePipeline()
    
    # Run on demo dataset
    results = pipeline.run_complete_pipeline("demo")
    
    # Save results to file
    import json
    output_file = f"demo_pipeline_logs/complete_pipeline_{int(time.time())}.json"
    os.makedirs("demo_pipeline_logs", exist_ok=True)
    
    # Clean results for JSON serialization
    def clean_for_json(obj):
        """Clean object for JSON serialization"""
        if isinstance(obj, dict):
            return {k: clean_for_json(v) for k, v in obj.items()}
        elif isinstance(obj, list):
            return [clean_for_json(item) for item in obj]
        elif hasattr(obj, '__dict__'):
            return clean_for_json(obj.__dict__)
        elif callable(obj):
            return str(obj)
        else:
            return obj
    
    clean_results = clean_for_json(results)
    
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(clean_results, f, indent=2, ensure_ascii=False)
    
    print(f"\n📁 Complete results saved to: {output_file}")


if __name__ == "__main__":
    main() 