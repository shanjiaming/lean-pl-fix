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