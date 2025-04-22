import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- For any real number a, show that $10a \leq 28a^2 + 1$.-/
theorem algebra_binomnegdiscrineq_10alt28asqp1 (a : ℝ) : 10 * a ≤ 28 * a ^ 2 + 1 := by
  -- First, rearrange the inequality to standard quadratic form: 28a² - 10a + 1 ≥ 0
  -- Let's consider the quadratic function f(a) = 28a² - 10a + 1
  -- To show this is always non-negative, we'll check its discriminant
  have key_inequality : 0 ≤ 28 * a ^ 2 - 10 * a + 1 := by
    -- Calculate the discriminant Δ = b² - 4ac where a=28, b=-10, c=1
    -- Here Δ = (-10)² - 4*28*1 = 100 - 112 = -12
    have discriminant : (-10)^2 - 4 * 28 * 1 = -12 := by norm_num
    -- Since the leading coefficient (28) is positive and Δ < 0,
    -- the quadratic is always positive
    have main : ∀ x, 0 ≤ 28 * x ^ 2 - 10 * x + 1 := by
      intro x
      -- The quadratic is always positive because:
      -- 1. The leading coefficient (28) is positive
      have leading_coeff_pos : 0 < 28 := by norm_num
      -- 2. The discriminant is negative
      have discr_neg : (-10)^2 - 4 * 28 * 1 < 0 := by norm_num
      -- Therefore the quadratic is always above the x-axis
      exact Quadratic.nonneg_of_discrim_neg leading_coeff_pos discr_neg x
    exact main a
  -- Now transform this back to our original inequality
  -- Starting from 28a² - 10a + 1 ≥ 0
  -- Add 10a to both sides: 28a² + 1 ≥ 10a
  -- Which is equivalent to our goal
  linarith [key_inequality]