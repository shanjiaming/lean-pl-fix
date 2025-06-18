# Demo数据集测试指南

这个指南将帮助你快速测试hole生成和ProofStep集成系统。

## 🚀 快速开始

```bash
# 1. 生成holes
python decompose_hole_merge_pipeline.py dataset demo 5

# 2. 测试原始策略和unigram策略
python minimal_verification_pipeline.py dataset demo 5
```

## 📋 系统概述

系统包含两个主要流水线：

1. **分解流水线** - 生成holes和元数据
2. **最小验证流水线** - 测试原始策略和unigram策略，生成合成证明

## 📝 修改Demo问题

### 添加或修改问题

1. **直接编辑文件**：
   ```bash
   # 编辑现有问题
   vim /home/matheye/lean-pl-fix/demo/demo_complex_p4.lean
   
   # 或创建新问题
   cp demo/demo_complex_p1.lean demo/demo_complex_p8.lean
   vim demo/demo_complex_p8.lean
   ```

2. **重新加载到统一结构**：
   ```bash
   python migrate_demo.py
   ```

### 示例：创建多行hole测试用例

```lean
import Mathlib

theorem multiline_test (x y : ℕ) (h : x + 0 = y + 0) : x = y := by
  simp at h
  have h1 : x ≤ y ∨ y ≤ x := le_total x y
  cases' h1 with h_le h_ge
  · have h2 : x = y := by
      have h3 : x ≤ y := h_le
      have h4 : y ≤ x := by
        norm_num    -- 这会成为多行hole
        rw [← h]    -- 与上面一起
      omega
    exact h2
  · exact h  -- 这会成为单行hole
```

## 🔧 详细流程

### 步骤1：分解流水线

**命令**：
```bash
# 处理整个demo数据集
python decompose_hole_merge_pipeline.py dataset demo 5

# 处理单个问题
python decompose_hole_merge_pipeline.py problem demo demo_complex_p1
```

**输出**：
- `decomposition_results/demo/decomposed/<problem_id>/`
  - `header.lean` - 导入和声明
  - `problem.lean` - 原始问题
  - `hole_version.lean` - 带hole_X占位符的版本
  - `decomposition.json` - 包含原始策略信息

**关键改进**：
- ✅ **后序遍历** - hole按代码从上到下顺序编号（hole_1, hole_2, hole_3...）
- ✅ **原始策略保存** - 每个hole的原始内容保存在`decomposition.json`中

### 步骤2：最小验证流水线

**命令**：
```bash
# 处理整个数据集
python minimal_verification_pipeline.py dataset demo 5

# 处理单个问题
python minimal_verification_pipeline.py problem demo demo_complex_p1
```

**功能**：
1. **原始策略测试** - 首先测试hole的原始内容
2. **Unigram策略测试** - 如果原始策略失败，测试单个策略词
3. **合成证明生成** - 创建工作的证明文件

**输出**：
- `minimal_verification.json` - 详细结果
- `synthesized_proof.lean` - 工作的证明

## 📊 预期结果

### 原始策略测试
```
🔍 Testing original tactics on proof states
  🧪 Testing original tactic for hole_3: norm_num\nrw [← h]...
    ✅ Original tactic works for hole_3
  🧪 Testing original tactic for hole_5: rw [h]\nomega...
    ❌ Original tactic failed for hole_5: no goals to be solved
📊 Original tactics test: 4/5 succeeded
```

### 成功的合成
```
📝 Creating synthesized version by directly replacing holes with tactics...
  ✅ hole_1 -> linarith
  ✅ hole_2 -> linarith  
  ✅ hole_3 -> linarith
  ✅ hole_4 -> norm_num
  ✅ hole_5 -> norm_num
```

### JSON结果示例
```json
{
  "original_tactics_test": {
    "hole_1": {"success": true, "error_message": null},
    "hole_2": {"success": false, "error_message": "no goals to be solved"}
  },
  "complete_solve_success": true,
  "successful_tactics": {"0": "linarith", "1": "norm_num"},
  "verification_count": 1,
  "constraint_satisfied": true
}
```

## 🎯 关键功能

### 多行策略支持
- **格式**：使用括号 `(\ntactic1\ntactic2\n)` 测试多行策略
- **示例**：`norm_num\nrw [← h]` 被测试为 `(\nnorm_num\nrw [← h]\n)`

### 约束满足
- **最多3次完整验证** 每个问题
- **所有策略测试** 通过proof state操作（不是完整验证）
- **高效率**：典型8个proof state测试对1个完整验证

### 智能Fallback
- 原始策略失败 → 自动测试unigram策略
- 保持系统鲁棒性，确保最终证明成功

## 🔍 文件结构

```
decomposition_results/demo/
├── decomposed/
│   └── demo_complex_p1/
│       ├── header.lean                 # 导入声明
│       ├── problem.lean                # 原始问题
│       ├── hole_version.lean           # hole版本
│       ├── decomposition.json          # 包含原始策略
│       ├── minimal_verification.json   # 测试结果
│       └── synthesized_proof.lean      # 工作证明
├── demo_pipeline_results.json
└── demo_minimal_verification_summary.json
```

## 🎉 成功指标

当看到以下输出时，系统工作正常：

```
📊 Original tactics test: X/Y succeeded
🎯 No admits used: True
✨ Complete solve success: True
🎉 CONSTRAINT SATISFIED!
```

这表明系统成功：
- ✅ 测试了原始策略
- ✅ 找到了工作策略  
- ✅ 生成了完整解决方案
- ✅ 满足了所有约束


nohup python minimal_verification_pipeline.py dataset minif2f > minif2f_pipeline_solve.log 2>&1 &