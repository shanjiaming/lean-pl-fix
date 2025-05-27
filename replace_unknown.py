from lean_api import REPLInstance, error_list_net_reduced
import re
from similarity_utils import rank_by_similarity
from extract_related_theorems import extract_related_theorems

def replace_with_most_similar(ident: str, candidates: list[str], topn=5) -> list[str]:
    ranked = rank_by_similarity(ident, candidates)
    return ranked[:topn] if ranked else [ident]

def replace_unknown_with_placeholder(lean_code: str, repl: REPLInstance) -> str:
    # 自动搜集相关模块的所有定理名作为candidates
    related = extract_related_theorems(lean_code=lean_code)
    candidates = []
    for theos in related.values():
        candidates.extend(theos)
    candidates = list(set(candidates))
    print(f"搜集到的候选定理名（共{len(candidates)}个）：", candidates)
    current_code = lean_code
    orig_result = repl.execute(current_code, env_mode='header')
    orig_errors = [m for m in orig_result.get('messages', []) if m.get('severity') == 'error']
    
    max_topn = 5
    progress = True
    while progress:
        progress = False
        result = repl.execute(current_code, env_mode='header')
        messages = result.get('messages', [])
        unknown_idents = set()
        for msg in messages:
            # 匹配所有包含unknown的报错，提取单引号内内容
            m = re.search(r"unknown [^']*'([^']+)'", msg.get('message', ''))
            if m:
                unknown_idents.add(m.group(1))
        if not unknown_idents:
            print('No unknown identifiers left.')
            break
        print('Current unknowns:', unknown_idents)
        for ident in list(unknown_idents):
            tried = False
            for replacement in replace_with_most_similar(ident, candidates, topn=max_topn):
                if replacement == ident:
                    continue
                # 替换所有出现的ident
                new_code = re.sub(rf'{re.escape(ident)}', replacement, current_code)
                check_result = repl.execute(new_code, env_mode='header')
                new_errors = [m for m in check_result.get('messages', []) if m.get('severity') == 'error']
                if error_list_net_reduced(orig_errors, new_errors):
                    print(f"Replaced {ident} -> {replacement}, errors reduced.")
                    current_code = new_code
                    orig_errors = new_errors
                    progress = True
                    tried = True
                    break
            if not tried:
                print(f"No valid replacement found for {ident}.")
        if not progress:
            print('No progress in this round, stopping.')
            break
    return current_code

def test_replace_unknown():
    lean_code = '''
import Mathlib.Data.Real.Basic

theorem foo (x : ℝ) : x + 0 = 1 := by rw [randomtactic, Real.sqrt_eq_iff_sq_eq]
'''
    print("Original Lean code:")
    print(lean_code)

    # For testing, we need a REPL instance
    test_repl = REPLInstance(debug=False)
    try:
        new_code = replace_unknown_with_placeholder(lean_code, test_repl)
        print("\nModified Lean code:")
        print(new_code)
    finally:
        test_repl.end()

if __name__ == "__main__":
    test_replace_unknown() 