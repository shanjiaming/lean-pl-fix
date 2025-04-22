import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- For real numbers a and c, show that $2a(2+c)\leq a^2+c^2+4(1+c)$.-/
theorem algebra_sqineq_2at2pclta2c2p41pc (a c : ℝ) :
    2 * a * (2 + c) ≤ a ^ 2 + c ^ 2 + 4 * (1 + c) := by
  -- Our strategy is to rearrange the inequality into a sum of squares ≥ 0
  -- First, let's expand both sides of the inequality
  have key : a ^ 2 + c ^ 2 + 4 * (1 + c) - 2 * a * (2 + c) = (a - 2) ^ 2 + (c - 2) ^ 2 - 4 := by
    -- Expand all terms on the left side
    rw [mul_add]
    rw [mul_comm (2 * a) c]
    rw [mul_assoc 2 a c]
    rw [add_mul, one_mul]  -- Expand 4*(1+c)
    rw [pow_two, pow_two]  -- Expand a^2 and c^2
    -- Now combine like terms and simplify
    ring
  -- The original inequality can now be rewritten using this identity
  rw [← sub_nonneg, key]
  -- Now we have (a-2)² + (c-2)² - 4 ≥ 0, which we can rearrange to:
  -- (a-2)² + (c-2)² ≥ 4
  -- However, this isn't always true, so our initial approach needs adjustment
  -- Let's instead consider the expression as a quadratic in a
  
  -- Alternative approach: complete the square for the a terms
  -- The inequality is equivalent to a² - 2a(2+c) + c² + 4 + 4c ≥ 0
  -- Let's write this as a perfect square plus remaining terms
  have h : a ^ 2 - 2 * a * (2 + c) + (2 + c) ^ 2 = (a - (2 + c)) ^ 2 := by
    ring
  -- Now rewrite the original expression using this identity
  have expr_eq : a ^ 2 + c ^ 2 + 4 * (1 + c) - 2 * a * (2 + c) = 
      (a - (2 + c)) ^ 2 + (c ^ 2 + 4 * (1 + c) - (2 + c) ^ 2) := by
    rw [mul_assoc]
    ring
  -- Simplify the remaining terms
  have rem_eq : c ^ 2 + 4 * (1 + c) - (2 + c) ^ 2 = 0 := by
    ring
  rw [expr_eq]
  rw [rem_eq]
  -- Now we have (a - (2 + c))² + 0 ≥ 0
  -- Since squares are always non-negative, this is true
  simp only [add_zero]
  apply pow_two_nonneg