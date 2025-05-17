# `decompose_solver.py`

This script is designed to work with Lean proofs, specifically for decomposing complex proofs into smaller, manageable parts and then reconstructing them. It leverages the `lean_interact` library to communicate with a Lean server and process tactic information.

## Overview

The core functionality revolves around the `TacticNode` class, which represents a tactic in a Lean proof. These nodes can be structured into a tree to represent the hierarchy of a proof, especially for `have` statements that introduce sub-proofs.

The script provides functionalities to:
- Convert Lean theorems to `example` blocks and vice-versa.
- Parse `have` statements to extract their name, type, and body.
- Create self-contained versions of `have` statements by incorporating necessary dependencies from their context.
- Extract a proof "framework" where sub-proofs (child `have` statements) are replaced with `sorry`.
- Reconstruct a full proof from a framework and a set of (potentially fixed) child proofs.
- Recursively "fix" a proof by applying a user-provided fixing function to each component of the proof, from the leaves of the proof tree up to the root.

## Key Components

### `TacticNode` Class
- Wraps a tactic from `lean_interact` and adds attributes like `subhaves` (for nested `have` statements) and `by_block_goals`.
- `is_have()`: Checks if the tactic is a `have` statement with a `by` block.
- `parse_have_structure()`: Parses a `have` statement into its name, type, and other components. Handles anonymous `have`s by defaulting their name to "this".
- `get_simplified_representation()`: Returns a string like `have name : type := by sorry`.
- `create_self_contained_proof()`: Generates a version of the `have` statement that includes its dependencies in the signature, making it independent of its original context.
- `extract_dependencies_from_goals()`: Extracts dependencies from the tactic's goals.

### Core Functions
- `throw_head(input_str: str) -> str`: Removes lines starting with `import`, `set_option`, or `open`.
- `convert_theorem_to_example_cmd(input_str: str) -> str`: Converts a Lean `theorem` string into an `example := by have ...` command for processing.
- `convert_have_to_theorem(proof_string: str) -> str`: Converts a `have` statement to a `theorem`.
- `convert_theorem_to_have(proof_string: str) -> str`: Converts a `theorem` back to a `have` statement.
- `extract_proof_framework_from_tree(node: TacticNode)`: Extracts the main proof structure with subproofs replaced by `sorry`, and a dictionary of the original subproofs.
- `extract_self_contained_proofs_from_tree(node: TacticNode)`: Similar to the above, but creates self-contained versions of the child proofs.
- `reconstruct_proof(parent_framework: str, child_proofs: dict)`: Rebuilds a complete proof by inserting child proofs back into the parent framework.
- `_fix_leaf_tactic(leaf_node: TacticNode, original_tactic_text: str, fix_single_proof_func: callable) -> str`: Helper to fix a leaf tactic node (no sub-proofs).
- `fix_complete_proof(root_node: TacticNode, fix_single_proof_func: callable)`: Recursively fixes an entire proof. It first extracts the framework and original child proofs. Then, it fixes the self-contained version of the root's framework (with children as `sorry`). After that, it recursively calls itself or `_fix_leaf_tactic` on each child proof. Finally, it reconstructs the main proof using the root's original signature but its fixed body (with `sorry` placeholders for children), and the fixed child proofs (which also have their original signatures and fixed bodies).
- `solve_theorem(input_content: str, fix_single_proof_func: callable)`: The main entry point function. It takes a string containing a Lean theorem and a function `fix_single_proof_func`. It processes the theorem, builds a tactic tree, and then uses `fix_complete_proof` to apply the fixing logic.

## Usage

1.  **Initialization**:
    The script initializes a `LeanServer` instance. A common header with imports (`Mathlib`, `Aesop`, etc.) is defined and loaded into the server's environment.

    ```python
    config = LeanREPLConfig(verbose=True, project=TempRequireProject("mathlib"))
    server = LeanServer(config)
    header = """import Mathlib
    import Aesop
    set_option maxHeartbeats 0
    open BigOperators Real Nat Topology Rat
    """
    header_env = server.run(Command(cmd=header)).env
    ```

2.  **Defining `fix_single_proof_func`**:
    The user needs to provide a callable `fix_single_proof_func`. This function takes a single string argument (a self-contained Lean proof snippet, typically a `theorem` statement) and should return a string representing the "fixed" version of that proof snippet. The script uses this function to repair or modify individual components of the larger proof.

    Example (conceptual):
    ```python
    def my_fixer(lean_code_snippet: str) -> str:
        # ... logic to analyze and fix the snippet ...
        # For instance, it might try to find a proof using a tactic like `aesop`
        # or replace `sorry` with an actual proof step.
        if "sorry" in lean_code_snippet:
            return lean_code_snippet.replace("sorry", "aesop") # Simplistic example
        return lean_code_snippet
    ```

3.  **Calling `solve_theorem`**:
    Pass the Lean theorem content (as a string) and your `fix_single_proof_func` to `solve_theorem`.

    ```python
    example_input_content = """theorem my_theorem (n : ℕ) : n + 0 = n := by
      -- ... proof steps, possibly with nested have statements ...
      sorry
    """
    fixed_theorem_code = solve_theorem(example_input_content, my_fixer)
    print(f"Final fixed theorem:\n{fixed_theorem_code}")
    ```

The `solve_theorem` function will:
- Preprocess the input.
- Run it through the Lean server to get tactic information.
- Build a tree of `TacticNode` objects.
- Populate `by_block_goals` for `have` nodes (which captures the goal state *inside* the `by` block of a `have`).
- Call `fix_complete_proof` to recursively fix the proof from the bottom up, ensuring that each part is fixed in a self-contained manner before being integrated back with its original signature.
- Return the fully reconstructed and fixed theorem as a string.

## How Proof Fixing Works (`fix_complete_proof`)

The `fix_complete_proof` function is central to the script's logic. It operates recursively:

1.  **Decomposition**:
    - For a given `TacticNode` (representing a proof or sub-proof), it first calls `extract_proof_framework_from_tree`. This separates the node's immediate proof steps (its "own code") from its child `have` statements. The child `have`s are replaced by `sorry` in this framework, and their original texts are stored.

2.  **Self-Contained Root Fixing**:
    - A self-contained version of the current node's framework is created. This means the signature of the current `have` (or `theorem`) is augmented with all necessary hypotheses from its context, but its body still contains `sorry` for its children.
    - This self-contained framework (e.g., `theorem self_contained_sig_root := by <root_code>; have child_self_cont_sig := by sorry; done`) is passed to the user-provided `fix_single_proof_func`. This function is expected to fix the `<root_code>` part.

3.  **Recursive Child Fixing**:
    - For each child `have` statement identified in step 1:
        - If the child itself has further nested `have`s, `fix_complete_proof` is called recursively on that child.
        - If the child is a "leaf" (no nested `have`s), `_fix_leaf_tactic` is called. This helper also creates a self-contained version of the leaf, passes it to `fix_single_proof_func`, and then ensures the fixed body is combined with the leaf's *original* signature.
    - The result of fixing each child is a proof string with the child's *original signature* but its *fixed body*.

4.  **Reconstruction**:
    - The framework obtained in step 2 (which now has its "own code" fixed and a self-contained signature, e.g., `have self_contained_sig_root := by <fixed_root_code>; have child_self_cont_sig := by sorry; ...`) needs to be combined with the root node's *original* signature. This is done using `revert_to_original_signature_with_fixed_body`. The result is a framework with the *original root signature*, *fixed root body*, and `sorry` placeholders for children.
    - Finally, `reconstruct_proof` is called. It takes this final framework and the map of fixed child proofs (from step 3, all having original signatures and fixed bodies) and substitutes the `sorry` placeholders with the corresponding fixed child proofs.

This hierarchical fixing process ensures that each part of the proof is fixed in isolation with all its dependencies made explicit, and then reintegrated into the larger proof structure while preserving the original statement signatures. 