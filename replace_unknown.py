from lean_api import REPLInstance
import re
from similarity_utils import rank_by_similarity
from extract_related_theorems import extract_related_theorems

def replace_with_most_similar(ident: str, candidates: list[str]) -> str:
    ranked = rank_by_similarity(ident, candidates)
    return ranked[0] if ranked else ident

def replace_unknown_with_placeholder(lean_code: str) -> str:
    # 自动搜集相关模块的所有定理名作为candidates
    related = extract_related_theorems(lean_code=lean_code)
    candidates = []
    for theos in related.values():
        candidates.extend(theos)
    candidates = list(set(candidates))
    print(f"搜集到的候选定理名（共{len(candidates)}个）：", candidates)
    repl = REPLInstance(debug=False)
    result = repl.execute(lean_code, env_mode='header')
    messages = result.get('messages', [])
    print(messages)
    unknown_idents = set()
    for msg in messages:
        # 匹配所有包含unknown的报错，提取单引号内内容
        m = re.search(r"unknown [^']*'([^']+)'", msg.get('message', ''))
        if m:
            unknown_idents.add(m.group(1))
    print(unknown_idents)
    new_code = lean_code
    for ident in unknown_idents:
        replacement = replace_with_most_similar(ident, candidates)
        new_code = re.sub(rf'{re.escape(ident)}', replacement, new_code)
    # 再跑一遍替换后的代码，检查是否还有报错
    check_result = repl.execute(new_code, env_mode='header')
    if any(msg.get('severity') == 'error' for msg in check_result.get('messages', [])):
        print('After replacement, still has errors:')
        print(check_result['messages'])
    else:
        print('After replacement, code passes Lean check!')
    return new_code

def test_replace_unknown():
    lean_code = '''
import Mathlib.Data.Real.Basic

theorem foo (x : ℝ) : x + 0 = 1 := by rw [randomtactic, Real.sqrt_eq_iff_sq_eq]
'''
    print("Original Lean code:")
    print(lean_code)
    new_code = replace_unknown_with_placeholder(lean_code)
    print("\nModified Lean code:")
    print(new_code)

if __name__ == "__main__":
    test_replace_unknown() 