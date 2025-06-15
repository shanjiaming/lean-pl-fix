import Mathlib

-- This file contains two simple Lean theorems with proofs that each have two branches,
-- demonstrating two common ways to create branches in proofs: `constructor` and `cases'`.

-- Example 1: Using `constructor` on an "if and only if" (↔) goal.
-- This theorem shows that equality is symmetric.
theorem eq_comm_demo (x y : ℕ) : x = y ↔ y = x := by
  constructor
  · -- First branch: prove `x = y → y = x`
    -- We assume `x = y` and need to prove `y = x`.
    intro h -- `h` is the hypothesis `x = y`.
    -- We can rewrite the goal using `h`.
    rw [h]
  · -- Second branch: prove `y = x → x = y`
    -- We assume `y = x` and need to prove `x = y`.
    intro h -- `h` is the hypothesis `y = x`.
    -- We can rewrite the goal using `h`.
    rw [h]


-- Example 2: Using `cases'` on a disjunction (`∨`, "or").
-- This theorem proves that a number is always less than or equal to the maximum of itself and another number.
theorem le_max_left_demo (x y : ℕ) : x ≤ max x y := by
  -- `le_total x y` is a proof of `x ≤ y ∨ y ≤ x`.
  -- `cases'` splits the proof into two branches, one for each side of the "or".
  cases' (le_total x y) with h_le h_ge
  · -- First branch: assumes `x ≤ y` (from `h_le`)
    -- If `x ≤ y`, then `max x y` is `y`.
    rw [max_eq_right h_le]
    -- The goal becomes `x ≤ y`, which is exactly our assumption `h_le`.
    exact h_le
  · -- Second branch: assumes `y ≤ x` (from `h_ge`)
    -- If `y ≤ x`, then `max x y` is `x`.
    rw [max_eq_left h_ge]
    -- The goal becomes `x ≤ x`, which is true by reflexivity.
    -- `rw` after `max_eq_left` simplifies `x <= x` to `True` automatically.
    -- We could also have written `exact le_refl x` here. 