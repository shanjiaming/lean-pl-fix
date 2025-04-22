import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Show that for any positive real numbers $a$ and $b$, $(a+b)^4 \leq 8(a^4 + b^4)$.-/
theorem algebra_apb4leq8ta4pb4 (a b : ℝ) (h₀ : 0 < a ∧ 0 < b) : (a + b) ^ 4 ≤ 8 * (a ^ 4 + b ^ 4) := by
  -- First, expand (a + b)^4 using the binomial theorem
  have h₁ : (a + b)^4 = a^4 + 4*a^3*b + 6*a^2*b^2 + 4*a*b^3 + b^4 := by
    ring
  -- Rewrite the goal using the expanded form
  rw [h₁]
  -- The goal now is to show that the expanded form is ≤ 8*(a^4 + b^4)
  -- We can bring all terms to one side to form a non-positivity claim
  suffices : 0 ≤ 7*a^4 + 7*b^4 - 4*a^3*b - 6*a^2*b^2 - 4*a*b^3
  · -- If we prove this non-negativity statement, the original inequality follows
    linarith
  -- Now we'll express this as a sum of manifestly non-negative terms
  -- The key is to find suitable combinations that are clearly ≥ 0
  have h₂ : 0 ≤ 3*(a^4 + b^4 - a^2*b^2) := by
    -- This term is non-negative because a⁴ + b⁴ ≥ a²b² for all real a,b
    -- This follows from 2(a⁴ + b⁴) ≥ (a² + b²)² ≥ (2ab)²/4 = a²b²
    refine mul_nonneg (by norm_num) ?_
    rw [sub_nonneg]
    exact pow_four_add_pow_four_ge_sq_mul_sq a b
  have h₃ : 0 ≤ 4*(a^4 + b^4 - a^3*b - a*b^3) := by
    -- This term is non-negative because a⁴ + b⁴ ≥ a³b + ab³ for a,b > 0
    -- This follows from rearranging a⁴ - a³b - ab³ + b⁴ = a³(a-b) - b³(a-b) = (a-b)(a³-b³) ≥ 0
    refine mul_nonneg (by norm_num) ?_
    rw [sub_nonneg]
    rw [sub_add_sub_comm]
    have : a^4 - a^3*b = a^3*(a - b) := by ring
    have : b^4 - a*b^3 = b^3*(b - a) := by ring
    rw [this, this]
    rw [← neg_sub (b^3), ← mul_neg, neg_sub]
    -- Now we have a^3*(a-b) + -b^3*(a-b) = (a^3 - b^3)*(a-b)
    rw [← sub_mul]
    -- Since (a³ - b³) and (a - b) have the same sign, their product is non-negative
    have : a^3 - b^3 = (a - b)*(a^2 + a*b + b^2) := by ring
    rw [this]
    rw [mul_assoc, mul_comm (a - b), ← mul_assoc]
    refine mul_nonneg ?_ ?_
    · exact sq_nonneg (a - b)
    · refine add_nonneg (add_nonneg (sq_nonneg a) ?_) (sq_nonneg b))
      exact mul_nonneg (le_of_lt h₀.1) (le_of_lt h₀.2)
  -- Now combine these non-negative terms to get our desired inequality
  -- The original expression 7a⁴ + 7b⁴ - 4a³b - 6a²b² - 4ab³ can be written as:
  -- (3a⁴ + 3b⁴ - 3a²b²) + (4a⁴ + 4b⁴ - 4a³b - 4ab³) = 3(a⁴ + b⁴ - a²b²) + 4(a⁴ + b⁴ - a³b - ab³)
  have h₄ : 7*a^4 + 7*b^4 - 4*a^3*b - 6*a^2*b^2 - 4*a*b^3 =
            3*(a^4 + b^4 - a^2*b^2) + 4*(a^4 + b^4 - a^3*b - a*b^3) := by
    ring
  rw [h₄]
  -- Now we can combine our non-negativity results
  exact add_nonneg h₂ h₃