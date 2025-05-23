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
  have h2 := h₀ 4 h1
  -- Simplify the denominators in the equation
  have h3 : 4 ^ 2 - 8 * 4 + 15 = (4 - 3) * (4 - 5) := by omega
  -- Rewrite the equation using the simplified denominators
  norm_num
  -- The equation now becomes: 4*4/((4-3)*(4-5)) = A/(4-3) + B/(4-5)
  -- Which simplifies to: 16/(-1) = A - B
  -- Or: -16 = A - B
  simp only [mul_one, mul_neg, div_one, div_neg, sub_eq_add_neg] at h2
  -- Let's name this equation (1)
  have eq1 : a - b = -16 := by omega

  -- Step 2: Evaluate at x = 2 (which is neither 3 nor 5)
  have h4 : 2 - 3 ≠ 0 ∧ 2 - 5 ≠ 0 := by omega
  -- Apply the universal quantifier hypothesis to x = 2
  have h5 := h₀ 2 h4
  -- Simplify the denominators in the equation
  have h6 : 2 ^ 2 - 8 * 2 + 15 = (2 - 3) * (2 - 5) := by omega
  -- Rewrite the equation using the simplified denominators
  norm_num
  -- The equation now becomes: 4*2/((2-3)*(2-5)) = A/(2-3) + B/(2-5)
  -- Which simplifies to: 8/3 = -A - B/3
  -- Multiply both sides by 3 to get: 8 = -3A - B
  simp only [mul_one, mul_neg, div_one, div_neg, sub_eq_add_neg] at h5
  have h7 : 8 = -3 * a - b := by omega
  -- Let's name this equation (2)
  have eq2 : -3 * a - b = 8 := by linarith [h7]

  -- Step 3: Solve the system of equations
  -- From eq1: a = b - 16
  -- Substitute into eq2: -3(b-16) - b = 8 → -3b + 48 - b = 8 → -4b = -40 → b = 10
  -- Then a = 10 - 16 = -6
  have hb : b = 10 := by
    linarith [eq1, eq2]
  have ha : a = -6 := by
    linarith [eq1, hb]
  
  -- Step 4: Return the solution
  exact ⟨ha, hb⟩