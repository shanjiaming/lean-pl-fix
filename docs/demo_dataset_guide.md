# Demo数据集完整指南

这是一个针对**完全没有接触过这个代码库的用户**的详细指南，介绍如何使用demo数据集进行Lean证明自动化处理的完整流程。

## 📋 目录

1. [概述](#概述)
2. [数据集结构](#数据集结构)
3. [添加新问题](#添加新问题)
4. [运行Pipeline](#运行pipeline)
5. [理解结果](#理解结果)
6. [文件位置详解](#文件位置详解)
7. [自定义Solver](#自定义solver)
8. [故障排除](#故障排除)

## 概述

Demo数据集是一个专门设计用来展示**分解 → 填hole → 合成 → 验证**完整pipeline的测试数据集。它包含了不同复杂度的Lean证明，从简单的`simp`证明到复杂的嵌套`have`结构。

### 当前包含的问题类型

| 问题ID | 类型 | 描述 | Pipeline路径 |
|--------|------|------|-------------|
| `simple_add` | 简单证明 | `x + 0 = x` | 分解 → 直接验证 |
| `simple_mul` | 简单证明 | `x * 1 = x` | 分解 → 直接验证 |
| `simple_refl` | 简单证明 | `x = x` | 分解 → 直接验证 |
| `broken_add` | 简单证明 | 带注释的加法 | 分解 → 直接验证 |
| `nested_have` | 复杂证明 | 嵌套have结构 | 完整4阶段 |
| `complex_have` | 复杂证明 | 包含sorry的证明 | 完整4阶段 |

## 数据集结构

### 统一目录结构

所有问题都存储在统一的目录结构中：

```
lean-pl-fix/
├── unified_problems/           # 统一问题存储目录
│   ├── demo/                  # demo数据集
│   │   ├── simple_add/        # 单个问题目录
│   │   │   ├── header.lean    # import语句和通用设置
│   │   │   ├── problem.lean   # 纯粹的定理内容
│   │   │   ├── decomposed/    # 分解后的子证明文件
│   │   │   ├── hole/          # 带hole的主证明文件
│   │   │   └── metadata.json  # 问题元数据
│   │   ├── simple_mul/
│   │   ├── nested_have/
│   │   └── ...
│   ├── putnam/               # 其他数据集
│   └── minif2f/
├── demo/                     # 原始demo文件（用于创建统一格式）
├── data/
│   └── unified_problems_metadata.json  # 全局元数据
└── docs/
    └── demo_dataset_guide.md  # 本文档
```

### 单个问题的文件结构

以`simple_add`为例：

```bash
unified_problems/demo/simple_add/
├── header.lean              # 包含: import Mathlib.Tactic
├── problem.lean             # 包含: theorem simple_add_zero (x : ℕ) : x + 0 = x := by simp
├── decomposed/              # 分解阶段生成的文件
│   └── (自动生成的分解文件)
├── hole/                    # 填hole阶段生成的文件
│   └── (自动生成的hole文件)
└── metadata.json           # 问题的元数据信息
```

## 添加新问题

### 方法1: 手动添加（推荐用于单个问题）

1. **创建原始文件**

```bash
# 在demo/目录下创建新的.lean文件
echo 'import Mathlib.Tactic

theorem my_new_theorem (x : ℕ) : x + x = 2 * x := by
  rw [two_mul]' > demo/my_new_theorem.lean
```

2. **运行转换脚本**

创建脚本将其添加到统一格式：

```python
#!/usr/bin/env python3
from data_management.unified_problem_manager import problem_manager, ProblemMetadata

# 读取原始文件
with open('demo/my_new_theorem.lean', 'r') as f:
    content = f.read()

# 分离header和problem内容
lines = content.strip().split('\n')
header_lines = [line for line in lines if line.strip().startswith('import')]
problem_lines = [line for line in lines if not line.strip().startswith('import')]

header_content = '\n'.join(header_lines)
problem_content = '\n'.join(problem_lines).strip()

# 创建元数据
metadata = ProblemMetadata(
    dataset="demo",
    problem_id="my_new_theorem",
    difficulty="easy",
    tags=["arithmetic", "multiplication"],
    source="demo/my_new_theorem.lean"
)

# 添加到统一管理器
problem = problem_manager.add_problem(
    dataset="demo",
    problem_id="my_new_theorem", 
    header_content=header_content,
    problem_content=problem_content,
    metadata=metadata
)

print(f"✅ Added problem: {problem.problem_id}")
```

### 方法2: 批量添加脚本

参考现有的脚本：
- `scripts/add_demo_to_unified.py` - 添加基础demo问题
- `scripts/add_new_demo_problems.py` - 添加复杂demo问题

## 运行Pipeline

### 完整Pipeline运行

```bash
# 进入项目根目录
cd lean-pl-fix

# 运行完整pipeline
PYTHONPATH=. python examples/demo_complete_pipeline.py
```

### 预期输出

```
🚀 Complete Decomposition → Hole Filling → Synthesis → Verification Pipeline
================================================================================
📋 Found 6 problems in dataset 'demo'

============================================================
🧪 Processing: demo/simple_add
============================================================
🔧 Stage 1: Decomposition
✅ Decomposition successful
📝 Solution is complete (no holes), skipping hole filling and synthesis
✅ Direct verification PASSED - Complete pipeline successful!

[... 其他问题的处理 ...]

================================================================================
🎯 COMPLETE PIPELINE SUMMARY
================================================================================
📊 Dataset: demo
📊 Total Problems: 6
📊 Total Time: 0.12s

🔧 Stage Results:
  1️⃣ Decomposition:    6/6 (100.0%)
  2️⃣ Hole Filling:     2/2 (100.0%) [of 2 needing holes]  
  3️⃣ Synthesis:        2/2 (100.0%) [of 2 needing synthesis]
  4️⃣ Verification:     6/6 (100.0%)

🎯 Complete Pipeline Success Rate: 100.0%
```

### 单阶段运行

如果只想测试特定阶段：

```python
from data_management.unified_problem_manager import problem_manager
from solvers.decompose_solver_unified import UnifiedDecomposeSolver

# 只运行分解阶段
problems = problem_manager.list_problems("demo")
decomposer = UnifiedDecomposeSolver()

for problem in problems:
    result = decomposer.solve(problem)
    print(f"{problem.problem_id}: {'✅' if result.is_success else '❌'}")
```

## 理解结果

### Pipeline阶段说明

1. **分解阶段 (Decomposition)**
   - **作用**: 分析证明结构，提取子证明
   - **输入**: 原始证明 (`problem.lean`)
   - **输出**: 
     - 简单证明: 直接给出完整解决方案
     - 复杂证明: 生成分解文件到 `decomposed/` 目录

2. **填hole阶段 (Hole Filling)**
   - **作用**: 为分解后的hole填充具体tactics
   - **输入**: `decomposed/` 目录中的文件
   - **输出**: 每个子证明的filled版本
   - **跳过条件**: 如果解决方案不包含"hole"关键词

3. **合成阶段 (Synthesis)**
   - **作用**: 将填充后的子证明合成为完整证明
   - **输入**: 填充后的tactics
   - **输出**: 完整的可执行证明

4. **验证阶段 (Verification)**
   - **作用**: 使用Lean验证最终证明的正确性
   - **输入**: 完整证明 + header
   - **输出**: 验证结果和错误信息

### 成功率指标

- **分解成功率**: 通常应该是100%，如果失败说明解析有问题
- **填hole成功率**: 只统计需要填hole的问题，成功率取决于AI策略质量
- **合成成功率**: 如果填hole成功，合成通常也会成功
- **验证成功率**: 最终瓶颈，取决于生成证明的正确性

## 文件位置详解

### 输入文件

| 文件类型 | 位置 | 描述 | 示例 |
|---------|------|------|------|
| 原始证明 | `demo/*.lean` | 开发时的原始文件 | `demo/simple_add.lean` |
| Header | `unified_problems/demo/*/header.lean` | import语句 | `import Mathlib.Tactic` |
| Problem | `unified_problems/demo/*/problem.lean` | 纯定理内容 | `theorem simple_add_zero...` |

### 中间文件（自动生成）

| 阶段 | 目录 | 文件类型 | 示例 |
|------|------|----------|------|
| 分解 | `unified_problems/demo/*/decomposed/` | `decomposed_*.lean` | `decomposed_00_h1.lean` |
| 填hole | `unified_problems/demo/*/hole/` | `hole_*.lean` | `hole_nested_have.lean` |

### 输出文件

| 类型 | 位置 | 格式 | 描述 |
|------|------|------|------|
| 详细结果 | `demo_pipeline_logs/complete_pipeline_*.json` | JSON | 每次运行的完整结果 |
| 控制台输出 | 终端 | 文本 | 实时进度和最终总结 |

### 日志文件结构

```json
{
  "dataset": "demo",
  "total_problems": 6,
  "results": {
    "simple_add": {
      "problem_id": "simple_add",
      "stages": {
        "decomposition": {
          "success": true,
          "status": "success", 
          "solution": "theorem simple_add_zero (x : ℕ) : x + 0 = x := by\n  simp"
        },
        "verification": {
          "success": true,
          "proof_valid": true,
          "verification_time": 0.045,
          "note": "Direct verification of decomposition solution"
        }
      },
      "final_success": true
    }
  },
  "summary": {
    "total_problems": 6,
    "decomposition_success": 6,
    "verification_success": 6,
    "complete_pipeline_success_rate": 100.0
  },
  "total_time": 0.12
}
```

## 自定义Solver

### 修改分解策略

分解器位于 `solvers/decompose_solver_unified.py`：

```python
class UnifiedDecomposeSolver(BaseSolver):
    def solve(self, problem: Problem) -> SolverResult:
        # 你的自定义分解逻辑
        content = self.problem_manager.get_problem_content(problem)
        
        # 示例: 添加新的分解模式
        if "custom_pattern" in content:
            return self._handle_custom_pattern(content, problem)
        
        # 调用原有逻辑
        return self._decompose_standard(content, problem)
```

### 修改hole填充策略

在 `examples/demo_complete_pipeline.py` 中的 `HoleFiller` 类：

```python
class HoleFiller:
    def fill_hole(self, theorem_content: str, problem_context: str = "") -> List[str]:
        strategies = [
            {'strategy': 'simp', 'tactic': 'simp', 'content': f'{theorem_content.replace("hole", "simp")}'},
            {'strategy': 'custom', 'tactic': 'my_tactic', 'content': f'{theorem_content.replace("hole", "my_tactic")}'},
            # 添加你的自定义策略
        ]
        return strategies
```

### 修改验证逻辑

验证器在 `ProofVerifier` 类中：

```python
class ProofVerifier:
    def verify_proof(self, problem, proof_content: str) -> Dict[str, Any]:
        # 自定义验证逻辑
        header = self.problem_manager.get_header_content(problem)
        full_content = header + "\n\n" + proof_content
        
        # 你的验证代码
        return {
            'success': True,  # 或 False
            'errors': [],
            'verification_time': 0.0
        }
```

### 添加新的Pipeline阶段

在 `CompletePipeline.process_single_problem()` 中：

```python
def process_single_problem(self, problem) -> Dict[str, Any]:
    # ... 现有阶段 ...
    
    # Stage 5: 你的自定义阶段
    print("🔧 Stage 5: Custom Processing")
    custom_result = self.custom_processor.process(problem, previous_results)
    result['stages']['custom'] = custom_result
    
    return result
```

## 故障排除

### 常见问题

1. **找不到问题文件**
   ```
   Error: Problem simple_add not found
   ```
   **解决**: 检查 `unified_problems/demo/simple_add/` 目录是否存在，运行 `problem_manager._load_problems()` 重新加载。

2. **分解失败**
   ```
   ❌ Decomposition failed, skipping remaining stages
   ```
   **解决**: 查看具体错误信息，检查 `problem.lean` 文件的语法是否正确。

3. **验证失败**
   ```
   ❌ Verification FAILED: ['Contains unfilled holes']
   ```
   **解决**: 检查合成后的证明是否还有 `hole` 或 `sorry`，查看中间生成的文件。

4. **导入错误**
   ```
   ModuleNotFoundError: No module named 'data_management'
   ```
   **解决**: 确保使用 `PYTHONPATH=. python examples/demo_complete_pipeline.py`

### 调试技巧

1. **查看中间文件**
   ```bash
   # 查看分解后的文件
   ls unified_problems/demo/nested_have/decomposed/
   cat unified_problems/demo/nested_have/decomposed/decomposed_00_h1.lean
   
   # 查看hole文件
   cat unified_problems/demo/nested_have/hole/hole_nested_have.lean
   ```

2. **单步调试**
   ```python
   # 在代码中添加断点
   import pdb; pdb.set_trace()
   
   # 或者添加详细输出
   print(f"DEBUG: Processing {problem.problem_id}")
   print(f"DEBUG: Content = {content}")
   ```

3. **检查元数据**
   ```python
   from data_management.unified_problem_manager import problem_manager
   
   problems = problem_manager.list_problems("demo")
   for p in problems:
       print(f"{p.problem_id}: {p.problem_path}")
       print(f"  Exists: {p.exists()}")
   ```

### 性能优化

1. **并行处理**: 修改pipeline支持多进程
2. **缓存结果**: 避免重复计算已验证的证明
3. **增量更新**: 只处理修改过的问题

---

## 总结

这个demo数据集提供了一个完整的Lean证明自动化处理的示例环境。通过理解其结构和流程，你可以：

1. **添加自己的证明问题**进行测试
2. **修改各个组件**来改进处理效果  
3. **扩展pipeline**添加新的处理阶段
4. **分析结果**来优化算法性能

记住：这是一个活跃开发的系统，如果遇到问题或有改进建议，请查看相关的源代码文件或创建issue。🚀 