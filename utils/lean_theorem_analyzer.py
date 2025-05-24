#!/usr/bin/env python

import re
import os
import sys
import json
import argparse
import tempfile
import traceback
from collections import defaultdict

# 导入lean_api中的repl实例
from lean_api import repl

def extract_imports(file_content):
    """提取 Lean 文件中的所有 import 语句"""
    imports = []
    import_pattern = re.compile(r'^\s*(?:@\[[^\]]*\]\s*)?import\s+([^\n]+)', re.MULTILINE)
    
    for match in import_pattern.finditer(file_content):
        import_statement = match.group(1).strip()
        for module in import_statement.split(','):
            imports.append(module.strip())
    
    return imports

def extract_open_statements(file_content):
    """提取 Lean 文件中的所有 open 语句"""
    opens = []
    open_pattern = re.compile(r'^\s*open\s+([^\n]+)', re.MULTILINE)
    
    for match in open_pattern.finditer(file_content):
        open_statement = match.group(1).strip()
        for module in open_statement.split(','):
            opens.append(module.strip())
    
    return opens

def extract_theorem_candidates(file_content):
    """提取所有可能的定理引用"""
    candidates = set()
    
    # 匹配定理使用模式
    patterns = [
        # 策略使用 - 这些通常跟在策略名称后面的是定理引用
        r'(?:apply|rw|rewrite|simp|exact|have|use|refine|specialize|cases|induction)\s+([\w.\'\[\]]+)',
        
        # 点表示法 - 许多mathlib定理以这种方式引用
        r'(?<!\bimport\s)(?<!\bopen\s)([\w]+\.[\w.\']+)(?!\s*:=)',
        
        # #check 使用 - 这些通常是检查定理类型
        r'#check\s+([\w.\'\[\]]+)',
        
        # 使用 by 策略 - 常用于简短证明
        r'by\s+([\w.\'\[\]]+)',
        
        # 使用尖括号 ⟨ ⟩ 中的引用 - 这些通常是实例引用
        r'⟨\s*([\w.\'\[\]]+)\s*⟩',
        
        # 括号中的表达式应用 - 如 (Nat.succ_ne_zero a)
        r'\(\s*([\w]+\.[\w.\'\[\]]+)\s+',
        
        # 证明中的断言 (assert) 语句
        r'assert\s+[^:]+\s*:\s*[^:]+\s*:=\s*([\w.\'\[\]]+)',
        
        # have 语句使用 from
        r'have\s+[^:]+\s*:\s*[^:]+\s*from\s+([\w.\'\[\]]+)'
    ]
    
    for pattern in patterns:
        for match in re.finditer(pattern, file_content, re.MULTILINE):
            # 提取定理名称并去除可能的参数
            theorem = match.group(1).strip()
            # 去除参数的中括号部分
            theorem = re.sub(r'\[.*\]', '', theorem)
            candidates.add(theorem)
    
    # 从 begin..end 块中提取可能的定理
    tactic_blocks = re.findall(r'begin(.*?)end', file_content, re.DOTALL)
    for block in tactic_blocks:
        for pattern in patterns:
            for match in re.finditer(pattern, block, re.MULTILINE):
                theorem = match.group(1).strip()
                theorem = re.sub(r'\[.*\]', '', theorem)
                candidates.add(theorem)
    
    # 移除一些常见的非定理标识符
    non_theorems = {
        'end', 'begin', 'from', 'with', 'using', 'let', 'def', 'where', 'sorry',
        'match', 'if', 'then', 'else', 'fun', 'λ', 'forall', '∀', '∃',
        'false', 'true', 'not', 'or', 'and', 'iff', 'implies', 'this'
    }
    
    # 更智能地过滤候选项
    filtered_candidates = set()
    for candidate in candidates:
        # 跳过非定理标识符
        if candidate in non_theorems or any(candidate.endswith('.' + nt) for nt in non_theorems):
            continue
            
        # 跳过看起来不像定理引用的标识符
        if not re.match(r'^[A-Za-z][\w.\']*$', candidate):
            continue
        
        # 至少包含一个点，或者是全大写开头的词 (通常是定理名称)
        if '.' in candidate or candidate[0].isupper():
            filtered_candidates.add(candidate)
    
    return filtered_candidates

def extract_all_identifiers(file_content):
    """提取文件中所有可能的标识符"""
    # 匹配可能的标识符: 字母开头，可包含字母、数字、下划线和点
    identifier_pattern = re.compile(r'\b([A-Za-z][A-Za-z0-9_\.]*)\b')
    
    # Lean关键字列表
    KEYWORDS = {
        'def', 'theorem', 'lemma', 'example', 'axiom', 'axioms', 'constant', 'constants',
        'universe', 'universes', 'inductive', 'coinductive', 'structure', 'class',
        'instance', 'open', 'export', 'mutual', 'where', 'match', 'with', 'if', 'then', 'else',
        'have', 'show', 'from', 'let', 'in', 'fun', 'forall', 'exists', 'begin', 'end',
        'namespace', 'section', 'prelude', 'import', 'protected', 'private', 'noncomputable',
        'meta', 'mutual', 'initialize', 'set_option', 'attribute', 'extends', 'include', 'omit',
        'variable', 'variables', 'parameter', 'parameters', 'by', 'using', 'sorry', 'admit',
        'true', 'false', 'Type', 'Prop', 'Sort'
    }
    
    # 提取所有匹配项
    identifiers = set()
    for match in identifier_pattern.finditer(file_content):
        identifier = match.group(1)
        
        # 排除关键字和明显不是定理的标识符
        if identifier not in KEYWORDS and len(identifier) > 1:
            identifiers.add(identifier)
    
    return identifiers

def is_mathlib_path(path_or_theorem, mathlib_imports=None, opened_namespaces=None):
    """检查路径或定理是否属于 mathlib"""
    if not path_or_theorem:
        return False
        
    # 直接检查前缀
    if path_or_theorem.startswith("Mathlib.") or path_or_theorem.startswith("mathlib."):
        return True
    
    # 检查是否与任何 mathlib 导入匹配
    if mathlib_imports:
        for imp in mathlib_imports:
            # 如果定理以导入的命名空间开头
            namespace = imp.split('.')[0]  # 获取顶级命名空间
            if path_or_theorem.startswith(f"{namespace}."):
                return True
                
            # 如果定理以导入的内容精确匹配
            if path_or_theorem == imp or path_or_theorem.startswith(f"{imp}."):
                return True
    
    # 如果在打开的命名空间中，并且没有命名空间前缀
    if opened_namespaces and '.' not in path_or_theorem:
        for ns in opened_namespaces:
            if ns.startswith("Mathlib.") or ns.startswith("mathlib."):
                return True
    
    # 检查是否使用常见的 mathlib 命名空间
    common_mathlib_namespaces = [
        "Nat.", "Int.", "Rat.", "Real.", "Complex.",
        "Set.", "Finset.", "List.", "Vector.", "Option.", "Sum.",
        "Matrix.", "Topology.", "Metric.", "Order.",
        "Algebra.", "Group.", "Ring.", "Field.", "Module.", "Linear.",
        "Category.", "Logic.", "Tactic.", "Data.", "Lean.", "Array.",
        "AddGroup.", "AddCommGroup.", "AddMonoid.", "Monoid.", "SemiGroup.",
        "HasCoe.", "HasLift.", "Pi.", "Function.", "Cardinal.", "Ordinal.",
        "Eq.", "Quot.", "Subgroup.", "Subring.", "PropSet."
    ]
    
    for namespace in common_mathlib_namespaces:
        if path_or_theorem.startswith(namespace):
            return True
    
    return False

def check_theorem(theorem_name):
    """使用repl检查定理信息"""
    # 使用lean_api中的repl实例检查定理
    try:
        # 构建检查命令
        check_cmd = f'#check {theorem_name}'
        
        # 通过repl.run执行命令
        success, output = repl.run(check_cmd)
        
        if not success or "error:" in output.lower():
            return None
        
        # 解析输出，提取类型信息
        result = re.search(r'#check ([^:]+) : (.+)', output)
        if result:
            return {
                "name": result.group(1).strip(),
                "type": result.group(2).strip()
            }
        return None
    except Exception as e:
        print(f"检查定理 {theorem_name} 时出错: {e}")
        return None

def get_theorem_source(theorem_name):
    """使用repl获取定理的源代码位置"""
    try:
        # 构建where命令
        where_cmd = f'#where {theorem_name}'
        
        # 通过repl.run执行命令
        success, output = repl.run(where_cmd)
        
        if not success or "error:" in output.lower():
            return None
        
        # 解析输出以查找源代码位置
        # 格式通常是: "theorem_name defined at path:line:column"
        source_match = re.search(r'defined at ([^:]+):(\d+):(\d+)', output)
        if source_match:
            return {
                "file": source_match.group(1),
                "line": int(source_match.group(2)),
                "column": int(source_match.group(3))
            }
        return None
    except Exception as e:
        print(f"获取定理 {theorem_name} 源位置时出错: {e}")
        return None

def find_declaration_info(theorem_name):
    """获取定理的声明信息 (type, source, etc.)"""
    # 首先检查定理是否存在
    check_info = check_theorem(theorem_name)
    if not check_info:
        return None
        
    # 获取定理源位置
    source_info = get_theorem_source(theorem_name)
    
    # 获取定理类型
    info = {
        "name": theorem_name,
        "type": check_info.get("type", ""),
    }
    
    if source_info:
        info["source"] = source_info
        
    # 判断是否是定理类型（而不是函数或常量等）
    is_theorem = False
    if "Prop" in info.get("type", ""):
        is_theorem = True
    
    info["is_theorem"] = is_theorem
    return info

def analyze_lean_file(file_path):
    """分析 Lean 文件并提取 mathlib 定理引用"""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # 提取导入和打开的命名空间
        imports = extract_imports(content)
        opens = extract_open_statements(content)
        mathlib_imports = [imp for imp in imports if "Mathlib" in imp]
        
        print(f"检测到 {len(imports)} 个导入，其中 {len(mathlib_imports)} 个来自 Mathlib")
        print(f"检测到 {len(opens)} 个打开的命名空间")
        
        # 提取可能的定理使用和所有标识符
        theorem_candidates = extract_theorem_candidates(content)
        all_identifiers = extract_all_identifiers(content)
        
        print(f"检测到 {len(theorem_candidates)} 个潜在定理引用（策略模式）")
        print(f"检测到 {len(all_identifiers)} 个潜在标识符（全文模式）")
        
        # 合并两种提取方法的结果
        combined_candidates = theorem_candidates.union(all_identifiers)
        print(f"合并后共有 {len(combined_candidates)} 个潜在定理引用")
        
        # 确保repl已经启动
        if not repl.running:
            print("正在启动Lean REPL...")
            if not repl.start():
                print("无法启动Lean REPL，请确保lean_api.py中的repl配置正确")
                return {
                    "error": "无法启动Lean REPL"
                }
        
        # 使用临时文件加载导入
        with tempfile.NamedTemporaryFile(suffix='.lean', mode='w+', delete=False) as tmp:
            # 写入导入语句
            for imp in imports:
                tmp.write(f"import {imp}\n")
            
            # 写入打开命名空间语句
            for namespace in opens:
                tmp.write(f"open {namespace}\n")
            
            tmp.flush()
            tmp_path = tmp.name
        
        try:
            # 加载临时文件
            print(f"正在加载导入和命名空间: {tmp_path}")
            success, output = repl.run(r'{"path": "' + tmp_path + r'"}', raw=True)
            if not success:
                print(f"加载导入失败: {output}")
                # 继续尝试分析，即使导入可能有问题
        
            # 使用REPL验证定理并获取它们的完整路径
            verified_theorems = {}
            mathlib_theorems = []
            theorem_types = {}  # 记录每个定理的类型 (theorem, lemma, definition, etc.)
            
            # 检查每个定理
            verified_count = 0
            print("开始验证定理引用...")
            
            for theorem in combined_candidates:
                print(f"检查定理: {theorem}")
                info = find_declaration_info(theorem)
                
                if info:
                    verified_count += 1
                    verified_theorems[theorem] = info
                    
                    # 检查是否属于mathlib
                    if is_mathlib_path(theorem, mathlib_imports, opens):
                        mathlib_theorems.append(theorem)
                        # 记录定理类型
                        if info.get("is_theorem", False):
                            theorem_types[theorem] = "theorem"
                        else:
                            theorem_types[theorem] = "definition"
                        print(f"验证定理: {theorem} 成功,theorem_types: {theorem_types[theorem]}")
            
            print(f"成功验证 {verified_count} 个定理引用")
            print(f"找到 {len(mathlib_theorems)} 个 Mathlib 定理")
            
        except Exception as e:
            print(f"验证定理时出错: {e}")
            traceback.print_exc()
        finally:
            # 清理临时文件
            try:
                os.unlink(tmp_path)
            except Exception:
                pass
        
        # 按命名空间分组定理
        grouped_theorems = defaultdict(list)
        for theorem in mathlib_theorems:
            if '.' in theorem:
                namespace, _ = theorem.split('.', 1)
                grouped_theorems[namespace].append(theorem)
            else:
                grouped_theorems["ungrouped"].append(theorem)
        
        return {
            "imports": imports,
            "opens": opens,
            "mathlib_imports": mathlib_imports,
            "mathlib_theorems": sorted(mathlib_theorems),
            "grouped_theorems": {k: sorted(v) for k, v in grouped_theorems.items()},
            "theorem_types": theorem_types,
            "all_theorems": verified_theorems
        }
        
    except Exception as e:
        print(f"分析文件 {file_path} 时出错: {str(e)}")
        traceback.print_exc()
        return {
            "imports": [],
            "opens": [],
            "mathlib_imports": [],
            "mathlib_theorems": [],
            "grouped_theorems": {},
            "theorem_types": {},
            "error": str(e)
        }

def print_results(results):
    """以易读的格式打印分析结果"""
    print("\n=== Lean 环境 ===")
    print("导入:")
    for imp in results["imports"]:
        print(f"  {imp}")
    
    print("\n打开的命名空间:")
    for ns in results.get("opens", []):
        print(f"  {ns}")
    
    print("\n=== Mathlib 定理（按命名空间） ===")
    for namespace, theorems in results["grouped_theorems"].items():
        print(f"\n{namespace}:")
        for theorem in theorems:
            # 如果定理有类型信息，显示它
            if theorem in results.get("all_theorems", {}):
                theorem_info = results["all_theorems"][theorem]
                type_info = theorem_info.get("type", "")
                
                # 获取定理类型 (theorem, definition 等)
                theorem_type = results.get("theorem_types", {}).get(theorem, "")
                if theorem_type:
                    theorem_type = f"[{theorem_type}] "
                
                # 如果有源位置信息，也显示它
                source_info = ""
                if "source" in theorem_info:
                    source = theorem_info["source"]
                    source_info = f" [定义于 {source.get('file', '')}:{source.get('line', '')}]"
                
                print(f"  {theorem_type}{theorem} : {type_info}{source_info}")
            else:
                print(f"  {theorem}")
    
    print(f"\n总共检测到的 mathlib 定理数量: {len(results['mathlib_theorems'])}")

def main():
    parser = argparse.ArgumentParser(description='分析 Lean 文件使用的 mathlib 定理')
    parser.add_argument('file_path', help='要分析的 Lean 文件的路径')
    parser.add_argument('--output', '-o', help='结果输出文件（JSON 格式）')
    parser.add_argument('--verbose', '-v', action='store_true', help='启用详细输出')
    parser.add_argument('--all-identifiers', '-a', action='store_true', help='分析所有标识符，而不仅是策略后的标识符')
    
    args = parser.parse_args()
    
    if not os.path.exists(args.file_path):
        print(f"错误: 文件 '{args.file_path}' 不存在。")
        return 1
    
    try:
        # 分析文件
        results = analyze_lean_file(args.file_path)
        
        # 打印结果
        if args.verbose or not args.output:
            print_results(results)
        
        # 输出到JSON文件
        if args.output:
            with open(args.output, 'w', encoding='utf-8') as f:
                json.dump(results, f, indent=2, ensure_ascii=False)
            print(f"结果已保存到 {args.output}")
        
        return 0
    except Exception as e:
        print(f"执行过程中发生错误: {str(e)}")
        traceback.print_exc()
        return 1

if __name__ == "__main__":
    sys.exit(main()) 