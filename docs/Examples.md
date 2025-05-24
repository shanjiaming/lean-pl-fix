# Lean Enumerator 使用示例

本文档提供了 Lean Enumerator 的详细使用示例，展示如何在不同场景下使用该工具修复 Lean 代码错误。

## 基本使用示例

### 示例 1：修复简单的类型错误

假设我们有一个包含类型错误的 Lean 文件 `example.lean`：

```lean
theorem simple_example : ℕ → ℕ := by
  intro n
  exact n + "hello"  -- 类型错误：字符串不能与自然数相加
```

使用 Lean Enumerator 修复：

```bash
python lean_enumerator.py example.lean
```

输出：

```
Original code contains 1 errors:
Error 1: line 1, type: type_mismatch, message: type mismatch...

Starting multi-error continuous repair process...

Fixed error 1/1: Successfully fixed error at line 1 «type_mismatch» (in 3.42s)

=== Fix statistics ===
Original error count: 1
Fixed errors: 1 (Fix rate: 1.0000)
Failed errors: 0
Remaining errors: 0
Total time: 3.45 seconds

Fixed code saved to: ../lean_fixed/example_fixed.lean
JSON log saved to: ../lean_fixed/example_fix_log.json
```

修复后的代码：

```lean
import Mathlib
import Aesop
set_option maxHeartbeats 0
open BigOperators Real Nat Topology Rat

theorem mathd_algebra_182 (y : ℂ) : 7 * (3 * y + 2) = 21 * y + 14 := by
  rw [mul_add]
  rw [mul_assoc]  -- 错误：这应该是 <- mul_assoc
  norm_num
```

### 示例 2：详细输出模式

如果您想查看详细的修复过程，可以使用文本输出模式：

```bash
python lean_enumerator.py example.lean --text-output
```

### 示例 3：JSON 输出模式

对于程序化处理，您可以使用 JSON 输出：

```bash
python lean_enumerator.py example.lean --json-output --no-log
```

### 示例 4：处理多个错误

Lean Enumerator 可以处理文件中的多个错误。考虑以下包含多个错误的文件：

```lean
theorem multiple_errors : ℕ → ℕ := by
  intro n
  have h1 : ℕ := n + "error1"  -- 错误1
  have h2 : ℕ := h1 * true     -- 错误2
  exact h2
```

运行修复：

```bash
python lean_enumerator.py multiple_errors.lean
```

输出摘要：

```
Original code contains 2 errors:
Error 1: line 1, type: type_mismatch, message: type mismatch...
Error 2: line 2, type: type_mismatch, message: type mismatch...

Starting multi-error continuous repair process...

Fixed error 1/2: Successfully fixed error at line 1 «type_mismatch» (in 3.42s)
Fixed error 2/2: Successfully fixed error at line 2 «type_mismatch» (in 3.42s)

=== Fix statistics ===
Original error count: 2
Fixed errors: 2 (Fix rate: 1.0000)
Failed errors: 0
Remaining errors: 0
Total time: 3.45 seconds

Fixed code saved to: ../lean_fixed/multiple_errors_fixed.lean
JSON log saved to: ../lean_fixed/multiple_errors_fix_log.json
```

修复后的代码：

```lean
import Mathlib
import Aesop
set_option maxHeartbeats 0
open BigOperators Real Nat Topology Rat

theorem mathd_algebra_182 (y : ℂ) : 7 * (3 * y + 2) = 21 * y + 14 := by
  rw [mul_add]
  rw [mul_assoc]  -- 错误：这应该是 <- mul_assoc
  norm_num
```

## 批量处理示例

### 示例 5：批量修复多个文件

当您有多个需要修复的 Lean 文件时，可以使用批量处理功能：

```bash
python lean_batch_enumerator.py --input_dir path/to/lean/files --max_workers 40
```

输出示例：

```
开始扫描目录: path/to/lean/files
找到 120 个Lean文件需要处理
使用 40 个并行任务

开始处理: example1.lean
开始处理: example2.lean
...
✅ example1.lean 处理完成
进度: 1/120 - 完成 example1.lean
...
❌ example5.lean 处理失败
进度: 5/120 - 完成 example5.lean
...

所有文件处理完成! 总用时: 253.78秒
```

### 示例 6：分析修复结果

修复后，你可以使用日志分析器分析修复结果：

```bash
python utils/log_analyzer.py --input-dir path/to/lean_fixed
```

这将生成详细的修复效果统计报告和可视化图表，输出示例：

```
Analyzing fix logs in path/to/lean_fixed...
Found 120 log files
Successfully parsed 120 log files

===== Error Fix Statistics Report =====
Total files: 120
Files with no errors: 15
Fully fixed files: 85
Partially fixed files: 12
Unfixed files: 8
Total original errors: 253
Fixed errors: 215
Failed to fix errors: 38
Remaining errors: 38
Overall fix rate: 84.98%

===== Fix Snippet Distribution =====
+------------------+-------+
| Fix Snippet      | Count |
+------------------+-------+
| rw [<- mul_assoc]|  45   |
| rw [add_zero]    |  32   |
| ...              |  ...  |
+------------------+-------+

===== Error Type Statistics =====
...

Charts saved to path/to/lean_fixed_analysis directory
Analysis report saved to path/to/lean_fixed_analysis/analysis_report.txt
JSON report saved to path/to/lean_fixed_analysis/analysis_report.json
```

生成的可视化图表包括：

1. **文件修复状态分布饼图** - 显示完全修复、部分修复、未修复和无错误文件的比例
2. **错误类型修复状态柱状图** - 显示每种错误类型的修复成功和失败数量
3. **修复时间分布直方图** - 显示修复时间的分布情况
4. **常见修复片段分布图** - 显示最常用的修复片段分布

### 示例 7：自定义分析输出目录

您也可以指定自定义的分析输出目录：

```bash
python utils/log_analyzer.py --input-dir path/to/lean_fixed --output-dir custom_analysis_dir
```

## 高级配置示例

### 示例 8：自定义 JSON 输出文件

```bash
python lean_enumerator.py example.lean --json-file custom_output.json
```

### 示例 9：禁用日志记录

```bash
python lean_enumerator.py example.lean --no-log
```

## 常见错误类型修复示例

### 类型不匹配错误

原代码：

```lean
import Mathlib

example : ∀ (x : ℕ), x + 0 = x := by
  intro x
  exact add_zero (x : ℤ)  -- 错误：类型不匹配，x 是 ℕ 但用作 ℤ
```

修复后：

```lean
import Mathlib

example : ∀ (x : ℕ), x + 0 = x := by
  intro x
  exact add_zero x  -- 修复：移除了错误的类型转换
```

### 重写策略错误

原代码：

```lean
import Mathlib

example (a b c : ℕ) : a + (b + c) = (a + b) + c := by
  rw [add_assoc]  -- 错误：需要指定方向 <-
```

修复后：

```lean
import Mathlib

example (a b c : ℕ) : a + (b + c) = (a + b) + c := by
  rw [← add_assoc]  -- 修复：添加了正确的方向
```

### 未知常量错误

原代码：

```lean
import Mathlib

example (x : ℝ) : 2 * x = x + x := by
  rw [double]  -- 错误：未知常量 double
```

修复后：

```lean
import Mathlib

example (x : ℝ) : 2 * x = x + x := by
  rw [two_mul]  -- 修复：使用正确的定理名
```

## 故障排除

### 修复失败

如果修复失败，请尝试：

1. 使用 `--text-output` 来获取更详细的输出
2. 检查具体的错误类型和位置
3. 检查日志文件看有什么错误信息

### 表现不如预期

对于复杂的证明，可能需要手动调整。Lean Enumerator最适合修复简单的语法和常见策略错误。

### 系统要求问题

确保：
- 安装了Lean 4.x和Lake
- 设置了正确的工作目录
- 安装了所有需要的Python依赖 