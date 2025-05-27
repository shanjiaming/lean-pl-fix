import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Solve for $a$: $\frac15|9+2a|<1$.  Express your answer in interval notation. Show that it is (-7, -2).-/
theorem mathd_algebra_327 (a : ℝ) (h₀ : 1 / 5 * abs (9 + 2 * a) < 1) : -7 < a ∧ a < -2 := by
  -- Multiply both sides by 5 to eliminate the fraction
  have : abs (9 + 2 * a) < 5 := by
    nlinarith
  -- Break down the absolute value inequality into two parts
  have : -5 < 9 + 2 * a ∧ 9 + 2 * a < 5 := by
    rw [abs_lt] at this
    exact this
  -- Solve for 'a' in each part
  have : -7 < a ∧ a < -2 := by
    constructor <;> linarith
  exact this

