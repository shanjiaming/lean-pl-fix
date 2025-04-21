# Task Flow Documentation

This document outlines the planned and completed tasks for improving the Lean enumerator script.

## Current Tasks

*(No current tasks)*

## Completed Tasks

### Implement Lean Have Extractor (Completed)

**Understanding:**

The goal is to create a utility that can extract theorem names that follow 'have' statements in Lean files and output them as a JSON list.

**Plan (as implemented):**

1. **Created `extract_have.py` Script:**
   * Uses regular expressions to identify and extract 'have' statements from Lean files
   * Only matches 'have' statements that appear at the beginning of a line (after possible whitespace)
   * Uses pattern `^\s*have\s+([^\s:\(\[\{]+)` to match line-starting 'have' statements
   * Extracts theorem names after 'have' statements until encountering any terminating character
   * Removes duplicate theorem names while preserving order
   * Outputs the extracted theorems as a JSON array

2. **Added Documentation:**
   * Created detailed documentation in `docs/lean_have_extractor.md`
   * Described usage, parameters, output format, and implementation details

**Status:** Completed.

### Implement `rw` Decomposition and Iterative Fixing (Completed)

**Understanding:**

The goal is to enhance the `synthesize_all_fixes` function to handle complex `rw` tactics by decomposing them and to adopt a more robust iterative fixing strategy.

**Plan (as implemented):**

1.  **Created `decompose_rw_at` Function:**
    *   Input: `line_content: str`, `indentation: str`.
    *   Logic: Uses regex to parse `rw [...] at ...` patterns. Extracts theorems list `ths` and locations list `locs`.
    *   If more than one theorem or location, generates individual `rw [thX] at locY` lines.
    *   Returns: The multi-line decomposed string, or `None`.

2.  **Refactored `synthesize_all_fixes`:**
    *   Initializes `current_code = code`, stats dictionary including `decompositions_applied`, `successful_syntheses`, `failed_syntheses = {}`.
    *   Uses a `while True:` loop for passes.
    *   **Get Errors:** Inside loop, runs `repl.execute(current_code)` to get errors, sorted by line: `current_errors`. If empty, breaks (success).
    *   **Process Errors in Pass:**
        *   Sets `made_change_this_pass = False`.
        *   Uses `attempted_synthesis_in_this_pass = set()` to track lines where synthesis failed this pass.
        *   Iterates `for error_to_process in current_errors_sorted:`
            *   Gets `target_line_num`, skips if `None` or synthesis already failed for this line.
            *   Gets `error_line_content`, `indentation`.
            *   **Attempt Decomposition:**
                *   Calls `decomposed_code_block = decompose_rw_at(...)`.
                *   If `decomposed_code_block is not None`:
                    *   Logs decomposition.
                    *   Replaces line `target_line_num` in `current_code` with `decomposed_code_block`.
                    *   Increments `stats["decompositions_applied"]`.
                    *   Sets `made_change_this_pass = True`.
                    *   Clears `failed_syntheses` entry for `target_line_num`.
                    *   `break`s inner `for` loop (starts new pass).
            *   **Attempt Synthesis (if no decomposition):**
                *   Logs attempt.
                *   Calls `fixed_code_attempt, success, message, _, _ = synthesize_fix(current_code, target_line_num)`.
                *   If `success`:
                    *   Logs success.
                    *   Updates `current_code = fixed_code_attempt`.
                    *   Increments `stats["successful_syntheses"]`.
                    *   Clears `failed_syntheses` entry for `target_line_num`.
                    *   Sets `made_change_this_pass = True`.
                    *   `break`s inner `for` loop (starts new pass).
                *   Else (`success is False`):
                    *   Logs failure.
                    *   Updates `stats["failed_syntheses"][target_line_num] = message`.
                    *   Adds `target_line_num` to `attempted_synthesis_in_this_pass`.
                    *   Continues inner `for` loop.
    *   **Check Progress:** After `for` loop: if not `made_change_this_pass`, breaks outer `while` loop (no progress).
    *   Adds safety break for excessive passes.
    *   **Final Reporting:** Includes decomposition and updated synthesis stats.

**Bugfixes:**
*   Fixed regex pattern in `decompose_rw_at` function that prevented proper matching of `rw [h1, h2]` patterns due to escaped backslashes. Changed from `r'^\\s*(rw)\\s*...'` to `r'^\s*(rw)\s*...'` to correctly match and decompose tactical rewrites.

**Status:** Completed.

## 当前任务流程

以下是当前的任务流程和状态：

### 编程语言修复 (Program Language Fix)

- 状态：✅ 完成
- 描述：这是整个系统的核心功能，即修复Lean代码中的错误。
- 关键组件：
  - `lean_enumerator.py`: 单文件错误修复
  - `lean_batch_enumerator.py`: 批量文件错误修复
  - `synthesize_all_fixes`: 尝试修复某个文件中的所有错误
  - `synthesize_fix`: 尝试修复特定的错误
  - `is_local_theorem_error`: 判断是否为本地定理错误
  - `get_spec_path`: 根据错误类型和文件路径智能选择合适的Tyrell规范文件

#### Lean错误修复流程

1. **错误提取**:
   - 使用`lean_api.py`获取Lean代码中的错误
   - 解析错误位置和错误信息
   - 通过`extract_error_type`分析错误类型

2. **错误分类**:
   - 分析错误是否涉及本地定理（使用`is_local_theorem_error`函数检查）
   - 根据错误类型和上下文信息确定需要的修复策略

3. **Tyrell规范文件选择**:
   - 通过`get_spec_path`函数判断使用哪种规范文件
   - 如果是本地定理错误，使用`have_tyrell_output`目录中的规范文件
   - 否则使用`static_tyrell_output`目录中的规范文件
   - 如果指定目录中没有相应的规范文件，回退到默认规范

4. **修复合成**:
   - 使用Tyrell框架合成可能的修复代码
   - 尝试不同的修复候选解决方案

5. **修复验证**:
   - 将修复应用到原始代码
   - 使用Lean验证修复后的代码
   - 检查修复是否解决了目标错误且没有引入新错误

6. **迭代修复**:
   - 如果当前修复失败，继续尝试下一个可能的修复
   - 如果所有修复尝试都失败，记录失败并继续处理下一个错误
   - 如果修复成功，记录成功并更新代码

7. **结果记录**:
   - 记录修复尝试的过程和结果
   - 生成详细的JSON格式日志