# Task Flow Documentation

This document outlines the planned and completed tasks for improving the Lean enumerator script.

## Current Tasks

### Setup OCaml SAT Solver Project (In Progress)

**Understanding:**

The user wants to run a command that builds and executes an OCaml-based SAT solver with CDCL (Conflict-Driven Clause Learning) implementation. The command is:
`dune build bin/main.exe && _build/default/bin/main.exe test/bench/ssa/unsat/ssa2670-130.cnf -s cdcl -c -v debug > debug.log 2>&1`

This suggests we need to set up an OCaml SAT solver project that uses the dune build system.

**Plan:**

1. **Install OCaml and dune:**
   * Install OCaml compiler and package manager (opam)
   * Install dune build system
   * Set up the development environment

2. **Create or Clone SAT Solver Project:**
   * Either create a new OCaml SAT solver from scratch
   * Or clone an existing CDCL SAT solver implementation
   * Set up the project structure with proper dune files

3. **Test Files Setup:**
   * Create the test directory structure (test/bench/ssa/unsat/)
   * Ensure the CNF test file (ssa2670-130.cnf) is available

4. **Build and Run:**
   * Execute the requested dune build command
   * Run the SAT solver with the specified parameters

**Status:** Not started - Need clarification on whether to create new SAT solver or clone existing one.

## Completed Tasks

### Implement Similar Theorem Repair (Completed)

**Understanding:**

The goal is to automatically repair Lean code errors by identifying and suggesting theorems that are similar to the ones referenced in the code, improving the robustness and automation of the fixing process.

**Plan (as implemented):**

1. **Theorem Similarity Matching:**
   * Developed logic to extract theorems from the code and error messages.
   * Implemented a similarity search to find theorems in the environment that closely match the missing or incorrect theorem names.
   * Integrated this matching into the main repair pipeline so that when a theorem is not found, similar candidates are suggested and tried automatically.

2. **Repair Integration:**
   * When a fix attempt fails due to a missing or incorrect theorem, the system now automatically attempts to repair the code using similar theorems.
   * The process is fully automated and integrated with the existing synthesis and validation pipeline.

3. **Data Storage:**
   * All data related to similar theorem repair attempts and results are stored under `minif2f/similar_theorem_repair/` for traceability and analysis.

**Status:** Completed.

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

### Improved Error Handling and Fix Synthesis (Completed)

**Understanding:**

The goal is to enhance the error handling and synthesis tracking in the Lean enumerator, particularly focusing on failed syntheses and synthesis attempts per line tracking.

**Plan (as implemented):**

1. **Enhanced Error Tracking:**
   * Improved the `failed_syntheses` tracking to better record synthesis failures by line number
   * Added `attempts_per_line` counter to track how many synthesis attempts were made for each line
   * This allows better analysis of which lines are problematic and might need manual intervention

2. **Fixed Local Theorem Error Detection:**
   * Improved the `is_local_theorem_error` function to correctly identify errors related to local theorems
   * Enhanced the logic for checking if an error is related to a theorem defined in the local context
   * Fixed issues with theorem name extraction and verification

3. **Improved Have Tyrell Specification Selection:**
   * Enhanced the logic for selecting the appropriate Tyrell specification file when dealing with local theorem errors
   * Made the system more robust in falling back to appropriate specifications when specific ones are not available
   * Improved logging and error reporting for specification selection

**Benefits:**
* Better tracking of synthesis attempts provides more detailed information for debugging
* Improved error analysis helps identify patterns in failures
* More accurate theorem error detection leads to better specification selection
* Overall more robust and informative synthesis process

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

## 2024-04-27

- Enhanced `extract_theorems_from_file` to support namespace tracking and prefixing theorem names (e.g., `Real.sq_sqrt`).
- Now all downstream code (auto repair, candidate theorem collection, etc.) can correctly match and suggest theorems as Lean would reference them.
- All related modules and test functions have been updated and verified.

## Error Reduction Logic Update (2024-06-13)

- Added `lean_api.error_list_net_reduced` to determine if a new error list is a strict subset of the original (no new errors, strictly fewer errors).
- Added comprehensive pytest unit tests in `tests/test_lean_api.py`, all tests passed.
- This function is now the recommended way to check for strict error reduction (no new errors) in all relevant modules.

### Batch Lean File Validation and Classification (Completed)

**Understanding:**

The goal is to automate the validation of all Lean files in the `minif2f-dspv2/test` directory by running each file through the Lean REPL (using the same API as in `replace_unknown.py`). Each file will be checked for errors. Files that pass without errors will be copied to `minif2f-dspv2/test_passed`, and those with errors will be copied to `minif2f-dspv2/test_failed` for further inspection.

**Plan (as implemented):**

1. **File Enumeration:**
   * List all `.lean` files in `minif2f-dspv2/test`.
2. **Lean Validation:**
   * For each file, read its content and use `REPLInstance.execute(..., env_mode='header')` to check for errors.
   * If there are no errors (no message with `severity == 'error'`), classify as passed; otherwise, as failed.
3. **Classification Output:**
   * Copy each file to either `minif2f-dspv2/test_passed` or `minif2f-dspv2/test_failed` based on the result.
   * Print a summary of results to the console and log file.

**Status:** Completed. All files in `minif2f-dspv2/test` have been classified and copied to the appropriate output folders.

## Task: Batch Fix Unknown Identifiers in Failed Tests

**Status:** Completed

**Description:**
Create a script to process `.lean` files from `minif2f-dspv2/test_failed`. The script will attempt to fix unknown identifiers using the `replace_unknown_with_placeholder` function from `replace_unknown.py`.

**Steps:**
1.  **Refactor `replace_unknown.py`**: Modified `replace_unknown_with_placeholder` to accept an existing `REPLInstance`.
2.  **Create `batch_fix_unknown.py` script**: This script defines source and target directories, initializes a `REPLInstance`, processes each file by attempting fixes, classifies results, saves processed code to the new location, and removes the original file.
3.  **Testing**: The script is ready for testing by running `python batch_fix_unknown.py`.
4.  **Documentation**: This task entry is updated.

**Depends on:**
*   `replace_unknown.py`
*   `lean_api.py`

**Files created/modified:**
*   `replace_unknown.py` (modified)
*   `batch_fix_unknown.py` (created)
*   `docs/taskflow.md` (updated)

## Batch Fix Lean Theorems in `minif2f-dspv2/test_failed_fixed_unknown_failed/`

**Status:** Implemented, Ready to Run

**Goal:** Implement a script (`dpv2_batch_solver`) to iterate through Lean files in a specified directory, extract theorem content, attempt to fix them using `dpv2_solver.solve_theorem_dpv2`, and update the files with fixes.

**Plan:**
1.  Create `dpv2_batch_solver.py`. (Completed)
2.  Import necessary functions: `os.listdir`, `os.path.join`, `solve_theorem_dpv2` from `dpv2_solver`. (Completed)
3.  Define the target directory: `minif2f-dspv2/test_failed_fixed_unknown_failed/`. (Completed)
4.  Implement a main function: (Completed)
    a.  Iterate through all `.lean` files in the target directory.
    b.  For each file:
        i.  Read the entire file content.
        ii. Find the start of the "theorem" or "example" keyword. If not found, skip the file with a warning.
        iii. Separate the content into `header_content` (everything before "theorem"/"example") and `theorem_statement_and_proof` (everything from "theorem"/"example" onwards).
        iv. Call `solve_theorem_dpv2(theorem_statement_and_proof)`.
        v.  If the returned content is different from the original `theorem_statement_and_proof` (indicating a fix or change):
            1.  Construct the new full file content by concatenating `header_content` and the new theorem content.
            2.  Write the new content back to the original file.
            3.  Print a success message.
        vi. If `solve_theorem_dpv2` raises an exception or the content is unchanged, print a message indicating failure or no change for that file.
5.  Add a `if __name__ == "__main__":` block to run the main function. (Completed)
6.  Run the script. (Pending)
7.  Update this document to mark the task as complete.

**File Structure:**
- `dpv2_solver.py`: Contains the core logic for fixing a single theorem.
- `dpv2_batch_solver`: The new script for batch processing.
- `minif2f-dspv2/test_failed_fixed_unknown_failed/`: Directory containing `.lean` files to be processed.

- [x] Create README for `decompose_solver.py`