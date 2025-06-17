# Hole Generation Improvement Plan

## 背景介绍

当前的decomposition pipeline可以生成hole版本的Lean代码，但存在两个问题：
1. 无法有效配合ProofStep进行策略枚举，因为生成的多个sorry之间存在metavariable依赖关系，导致`nlinarith`等策略验证失败

重要：能不用正则字符匹配尽量不用，因为只有tactic tree parsing，start pos 和end pos是可靠的。格式都可能会随机乱掉。每次用正则和字符串匹配一定要确保是迫不得已的情况

用户提出了通过clear语句和重新定义来解决这些问题的方案。

## 任务一：生成带Clear的Hole版本（简单任务）

### 目标
修改现有的hole生成逻辑，在每个`have ... := by hole_i`结构后面自动添加clear和重新定义语句，解决metavariable干扰问题。

### 技术方案
1. **保持原有hole生成不变**：继续使用现有的`hole_i` macro
2. **添加clear逻辑**：在每个`have h := by hole_i`后面添加：
   - `clear h` - 清理掉这个have语句
   - `have h : [type] := skip_hole` - 重新定义为skip_hole

### 预期结果
**原始hole版本**：
```lean
have h₄ : m * n = 756 := by
  have h₄₁ : m * n = Nat.gcd m n * Nat.lcm m n := by
    hole_1
  hole_2
```

**新的带clear版本**：
```lean  
have h₄ : m * n = 756 := by
  have h₄₁ : m * n = Nat.gcd m n * Nat.lcm m n := by
    hole_1  -- 需要填充
  clear h₄₁
  have h₄₁ : m * n = Nat.gcd m n * Nat.lcm m n := skip_hole  -- 可跳过
  hole_2   -- 需要填充
```

### Macro定义需求
```lean
-- 保持现有的hole_i定义
macro "hole_" n:num : tactic => `(tactic| sorry)

-- 新增skip_hole定义（term模式）
macro "skip_hole" : term => `(sorry)
```

### 实现位置
修改`decompose_solver.py`中的hole生成逻辑，添加新的方法生成带clear版本。

### 验证方法
选择一个demo问题，生成带clear版本，验证：
1. Lean代码能正确编译
2. 解决了metavariable干扰问题
3. nlinarith等策略不再报错

## 任务二：ProofStep集成（复杂任务）

### 目标
让生成的hole版本能够与ProofStep有效配合进行快速策略枚举。

### 技术挑战
1. **Sorry索引问题**：ProofStep按从上到下顺序给sorry分配索引，但hole_i和skip_hole都会占用索引
2. **Server状态问题**：LeanServer重启会导致索引重新计数，影响ProofStep的状态依赖

### 解决方案
1. **使用macro区分**：
   - `hole_i` - 需要ProofStep处理的sorry
   - `skip_hole` - ProofStep应该跳过的sorry
   
2. **ProofStep逻辑修改**：
   - 解析代码识别哪些sorry来自`hole_i`
   - 只处理这些sorry，跳过来自`skip_hole`的sorry
   
3. **Server管理策略**：
   - 每个问题使用独立的LeanServer实例，或
   - 找到重置server状态的方法，或  
   - 维护sorry索引到类型的映射关系

### 实现优先级
1. 先完成任务一，验证基本概念
2. 再处理ProofStep集成的复杂问题

## 实施计划

### 第一阶段：任务一实现
1. 研究现有hole生成代码位置
2. 添加skip_hole macro定义
3. 修改hole生成逻辑，添加clear语句
4. 选择demo问题测试验证

### 第二阶段：任务二实现  
1. 研究ProofStep的sorry索引机制
2. 实现sorry类型识别逻辑
3. 解决LeanServer状态管理问题
4. 集成测试完整流程

## 测试策略

**测试用例选择**：选择一个包含多个have语句的demo问题进行测试

**验证标准**：
- 任务一：生成的代码能编译且解决metavariable问题
- 任务二：ProofStep能正确识别并处理需要的sorry

## 风险评估

**任务一风险**：相对较低，主要是代码生成逻辑的修改
**任务二风险**：较高，涉及ProofStep和LeanServer的复杂交互

建议先完成任务一，验证基本可行性后再处理任务二。