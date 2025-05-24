# CompositeSolver Chain Fix Strategy

## 概述

`CompositeSolver` 的 `chain_fix` 策略是专为 Lean 证明错误修复设计的组合求解器策略。与传统的组合策略（如投票机制）不同，链式修复允许多个求解器协作工作，每个求解器的输出成为下一个求解器的输入。

## 为什么需要链式修复？

在 Lean 证明修复中：

1. **二元性质**: Lean 证明只有通过/不通过两种状态，投票机制意义不大
2. **错误类型多样**: 一个证明可能同时包含语法错误、逻辑错误和策略优化问题
3. **协作修复**: 不同的求解器可以专门处理不同类型的错误
4. **递进改进**: 每一步修复都可能解决部分问题，逐步接近完整解决方案

## 使用方法

### 基本用法

```python
from solvers.base_solver import CompositeSolver, SolverConfig

# 创建专门的修复求解器链
composite_solver = CompositeSolver(
    name="lean_error_fixer",
    solvers=[
        SyntaxFixerSolver("syntax_fixer"),    # 先修复语法错误
        LogicFixerSolver("logic_fixer"),      # 再修复逻辑错误  
        TacticFixerSolver("tactic_fixer")     # 最后优化证明策略
    ],
    strategy="chain_fix"
)

# 修复 Lean 证明代码
result = composite_solver.solve(lean_code_with_errors)
```

### 启用调试模式

```python
config = SolverConfig(debug=True)
composite_solver = CompositeSolver(
    name="lean_error_fixer",
    solvers=[...],
    strategy="chain_fix",
    config=config
)
```

## 工作原理

1. **第一个求解器**尝试修复原始问题
2. **如果成功**，将修复结果作为输入传递给下一个求解器
3. **如果失败**，下一个求解器仍然使用原始问题作为输入
4. **重复此过程**直到所有求解器都尝试过
5. **返回最后一个成功修复的结果**

## 示例场景

### 场景1：多重错误修复

```python
# 原始代码（包含多种错误）
problematic_code = """
theorem example (x y : Nat) missing : x + y = y + x := by
  rw [unknown_theorem]
  simp
"""

# 链式修复过程：
# 1. SyntaxFixer: 修复 "missing :" → 添加冒号
# 2. LogicFixer: 修复 "unknown_theorem" → 替换为 "Nat.add_comm"  
# 3. TacticOptimizer: 优化 "simp" → 添加 "ring" 策略

# 最终结果
fixed_code = """
theorem example (x y : Nat) : x + y = y + x := by
  rw [Nat.add_comm]
  simp; ring
"""
```

### 场景2：部分修复

```python
# 某些求解器可能失败，但链式修复仍然继续
# 只要有一个求解器成功，就会有改进
```

## 元数据信息

链式修复完成后，结果包含详细的元数据：

```python
result.metadata = {
    'chain_fix': True,                    # 标识使用了链式修复
    'chain_length': 3,                    # 求解器链的总长度
    'successful_fixes': 2,                # 成功修复的求解器数量
    'final_solver': 'tactic_optimizer',   # 最终成功的求解器
    'chain_details': [                    # 每个求解器的执行详情
        {'solver': 'syntax_fixer', 'status': 'success', ...},
        {'solver': 'logic_fixer', 'status': 'failure', ...},
        {'solver': 'tactic_optimizer', 'status': 'success', ...}
    ],
    'successful_solvers': ['syntax_fixer', 'tactic_optimizer']
}
```

## 与其他策略的比较

| 策略 | 适用场景 | 工作方式 |
|------|----------|----------|
| `first_success` | 快速修复 | 使用第一个成功的求解器结果 |
| `best_result` | 质量优先 | 比较所有结果，选择最佳 |
| `majority_vote` | 一致性重要 | 多数投票选择结果 |
| `chain_fix` | **错误修复** | **链式协作修复** |

## 运行演示

```bash
# 运行演示程序
python examples/composite_solver_demo.py

# 运行测试
python tests/test_composite_solver.py
```

## 最佳实践

1. **按错误类型排序**: 将处理基础错误的求解器放在前面（如语法修复）
2. **专业化求解器**: 每个求解器专注于特定类型的错误
3. **启用调试**: 在开发阶段启用调试模式以跟踪修复过程
4. **监控元数据**: 使用元数据分析修复效果和求解器性能

## 扩展

要添加新的求解器到链中：

1. 实现 `BaseSolver` 接口
2. 将其添加到求解器列表中的适当位置
3. 考虑其在修复流程中的逻辑顺序

```python
class CustomErrorFixer(BaseSolver):
    def solve(self, problem, **kwargs):
        # 实现自定义修复逻辑
        pass
    
    def get_solver_info(self):
        return {'name': self.name, 'type': 'custom_fixer'}

# 添加到链中
composite_solver = CompositeSolver(
    name="extended_fixer",
    solvers=[
        SyntaxFixerSolver("syntax_fixer"),
        CustomErrorFixer("custom_fixer"),    # 新的求解器
        LogicFixerSolver("logic_fixer"),
        TacticFixerSolver("tactic_fixer")
    ],
    strategy="chain_fix"
)
``` 