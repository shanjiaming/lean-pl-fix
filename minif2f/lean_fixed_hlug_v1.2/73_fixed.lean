import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Solve for $a$: $\frac15|9+2a|<1$.  Express your answer in interval notation. Show that it is (-7, -2).-/
theorem mathd_algebra_327 (a : ℝ) (h₀ : 1 / 5 * abs (9 + 2 * a) < 1) : -7 < a ∧ a < -2 := by
  -- First, we simplify the inequality (1/5)*|9 + 2a| < 1
  -- Multiply both sides by 5 to eliminate the denominator
  have h₁ : abs (9 + 2 * a) < 5 := by
    -- Original inequality is (1/5)*|9 + 2a| < 1
    -- Multiply both sides by 5 (positive, so inequality direction stays the same)
    linarith
  rw [abs_lt] at h₁
  -- Now we have h₁ : -5 < 9 + 2 * a ∧ 9 + 2 * a < 5
  
  -- We'll handle the two inequalities separately
  -- First inequality: -5 < 9 + 2a
  have left_ineq : -5 < 9 + 2 * a := h₁.left
  -- Subtract 9 from both sides: -14 < 2a
  have left_step : -14 < 2 * a := by linarith
  -- Divide both sides by 2: -7 < a
  have h_left : -7 < a := by linarith
  
  -- Second inequality: 9 + 2a < 5
  have right_ineq : 9 + 2 * a < 5 := h₁.right
  -- Subtract 9 from both sides: 2a < -4
  have right_step : 2 * a < -4 := by linarith
  -- Divide both sides by 2: a < -2
  have h_right : a < -2 := by linarith
  
  -- Combine both results
  exact ⟨h_left, h_right⟩