import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Find $A$ and $B$ such that
\[\frac{4x}{x^2-8x+15} = \frac{A}{x-3} + \frac{B}{x-5}\]for all $x$ besides 3 and 5. Express your answer as an ordered pair in the form $(A, B).$ Show that it is (-6, 10).-/
theorem mathd_algebra_13 (a b : ℝ)
  (h₀ : ∀ x, x - 3 ≠ 0 ∧ x - 5 ≠ 0 → 4 * x / (x ^ 2 - 8 * x + 15) = a / (x - 3) + b / (x - 5)) :
  a = -6 ∧ b = 10 := by
  -- Strategy: To find A and B, we'll choose specific values for x that simplify the equation
  -- First, we'll use x = 4 to get one equation, then x = 2 to get another
  
  -- Step 1: Evaluate at x = 4 (which is neither 3 nor 5)
  have h1 : 4 - 3 ≠ 0 ∧ 4 - 5 ≠ 0 := by norm_num
  -- Apply the universal quantifier hypothesis to x = 4
  omega
  -- Simplify the denominators in the equation