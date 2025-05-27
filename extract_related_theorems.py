import os
from pathlib import Path
from static_theorem_filter import extract_theorems_from_file, module_to_path, MATHLIB_BASE_PATH
from typing import Dict, Set, List
import re

def extract_used_theorem_names(lean_code: str) -> Set[str]:
    """
    粗略提取lean代码中用到的定理名，包括rw/apply等tactic参数、by后面、:=后面等。
    """
    names = set()
    # rw [foo, bar], apply foo, by foo, := foo, exact foo, etc.
    # 1. rw [foo, bar]
    for m in re.finditer(r"rw \[([^\]]+)\]", lean_code):
        for n in re.split(r",|\s", m.group(1)):
            n = n.strip()
            if n:
                names.add(n)
    # 2. apply foo, exact foo, by foo, := foo
    for m in re.finditer(r"(?:apply|exact|by|:=)\s+([a-zA-Z0-9_'.]+)", lean_code):
        names.add(m.group(1))
    return names

def extract_related_theorems(lean_code: str = None, lean_file_path: str = None) -> Dict[str, List[str]]:
    """
    提取lean代码或文件中所有用到的定理名，查找这些定理所在的mathlib4模块，并返回这些模块中所有定理名。
    返回格式: {module_name: [theorem1, theorem2, ...], ...}
    """
    if lean_code is None and lean_file_path is None:
        raise ValueError("Either lean_code or lean_file_path must be provided.")
    if lean_code is None:
        with open(lean_file_path, 'r', encoding='utf-8') as f:
            lean_code = f.read()
    # 1. 提取所有用到的定理名
    used_theorems: Set[str] = extract_used_theorem_names(lean_code)
    print("提取到的用到的定理名：", used_theorems)
    # 2. 遍历mathlib4所有模块，找到包含这些定理的模块
    module_theorems: Dict[str, List[str]] = {}
    found_modules = set()
    for lean_file in Path(MATHLIB_BASE_PATH).rglob('*.lean'):
        module_name = '.'.join(lean_file.relative_to(MATHLIB_BASE_PATH).with_suffix('').parts)
        theorems_in_module = extract_theorems_from_file(lean_file)
        if not theorems_in_module:
            continue
        # 如果该模块包含输入定理名中的任何一个
        hit = used_theorems & theorems_in_module
        if hit:
            print(f"模块 {module_name} 命中定理：{hit}")
            module_theorems[module_name] = sorted(list(theorems_in_module))
            found_modules.add(module_name)
    return module_theorems

# 测试用例
def test_extract_related_theorems():
    code = '''
import Mathlib.Data.Real.Basic

theorem add_zero_comm (x : ℝ) : x + 0 = 0 + x := by rw [add_zero, zero_add]
lemma nat_succ_pos (n : ℕ) : 0 < n.succ := Nat.succ_pos _
example (x : ℝ) : x + 0 = x := by apply add_zero
'''
    result = extract_related_theorems(lean_code=code)
    print("相关模块及其所有定理：")
    for mod, theos in result.items():
        print(f"{mod}: {theos[:5]} ... (共{len(theos)}个)")

# 新增专门测试 Real.sq_sqrt 的函数
def test_real_sq_sqrt():
    code = '''
import Mathlib.Data.Real.Basic
example : 0 ≤ Real.sq_sqrt 0 := by rw [Real.sq_sqrt]
'''
    print("测试 Real.sq_sqrt 关联模块：")
    result = extract_related_theorems(lean_code=code)
    for mod, theos in result.items():
        if 'Real.sq_sqrt' in theos:
            print(f"模块 {mod} 包含 Real.sq_sqrt，定理列表：")
            print(theos)
        else:
            print(f"模块 {mod} 不包含 Real.sq_sqrt")

if __name__ == "__main__":
    test_extract_related_theorems()
    test_real_sq_sqrt() 