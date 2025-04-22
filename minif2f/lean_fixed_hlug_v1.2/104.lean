import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- What fraction is the same as \[
\frac{2-4+6-8+10-12+14}{3-6+9-12+15-18+21}?
\] Show that it is \frac{2}{3}.-/
theorem mathd_algebra_55 (q p : ℝ) (h₀ : q = 2 - 4 + 6 - 8 + 10 - 12 + 14)
  (h₁ : p = 3 - 6 + 9 - 12 + 15 - 18 + 21) : q / p = 2 / 3 := by
  -- First, we'll simplify the numerator q by evaluating the arithmetic expression
  -- The expression is: 2 - 4 + 6 - 8 + 10 - 12 + 14
  -- We'll compute this step by step:
  -- 2 - 4 = -2
  -- -2 + 6 = 4
  -- 4 - 8 = -4
  -- -4 + 10 = 6
  -- 6 - 12 = -6
  -- -6 + 14 = 8
  -- So q should simplify to 8
  have q_simplified : q = 8 := by
    rw [h₀]  -- Unfold the definition of q
    norm_num  -- Evaluate the arithmetic expression numerically

  -- Next, we'll simplify the denominator p similarly
  -- The expression is: 3 - 6 + 9 - 12 + 15 - 18 + 21
  -- Computing step by step:
  -- 3 - 6 = -3
  -- -3 + 9 = 6
  -- 6 - 12 = -6
  -- -6 + 15 = 9
  -- 9 - 18 = -9
  -- -9 + 21 = 12
  -- So p should simplify to 12
  have p_simplified : p = 12 := by
    rw [h₁]  -- Unfold the definition of p
    norm_num  -- Evaluate the arithmetic expression numerically

  -- Now we can compute q / p using the simplified values
  -- q/p = 8/12 = 2/3
  rw [q_simplified, p_simplified]  -- Substitute simplified values
  norm_num  -- Simplify the fraction 8/12 to 2/3