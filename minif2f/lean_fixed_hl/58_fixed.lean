import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Simplify $\left( \frac{4}{x} \right)^{-1} \left( \frac{3x^3}{x} \right)^2 \left( \frac{1}{2x} \right)^{-3}$. Show that it is 18x^8.-/
theorem mathd_algebra_245 (x : ℝ) (h₀ : x ≠ 0) :
  (4 / x)⁻¹ * (3 * x ^ 3 / x) ^ 2 * (1 / (2 * x))⁻¹ ^ 3 = 18 * x ^ 8 := by
  -- First, we'll simplify each of the three main components separately
  
  -- Simplify (4/x)⁻¹: reciprocal of (4/x) is x/4
  have h1 : (4 / x)⁻¹ = x / 4 := by
    rw [inv_div]  -- (a/b)⁻¹ = b/a
    simp only [div_eq_mul_inv]
  
  -- Simplify (3*x^3/x)^2: first simplify inside parentheses
  have h2 : (3 * x ^ 3 / x) ^ 2 = (3 * x ^ 2) ^ 2 := by
    rw [div_eq_mul_inv]  -- Convert division to multiplication by reciprocal
    rw [mul_assoc]  -- Regroup terms
    rw [← mul_assoc x^3 x⁻¹]  -- Prepare to combine x terms
    rw [← pow_succ' x 2]  -- x^3 * x⁻¹ = x^(3-1) = x^2
    simp only [succ_eq_add_one, Nat.reduceAdd, pow_add, pow_one]
  
  -- Further simplify (3*x^2)^2 to 9*x^4
  have h3 : (3 * x ^ 2) ^ 2 = 9 * x ^ 4 := by
    rw [mul_pow]  -- Distribute exponent over multiplication
    simp only [pow_two, Nat.reduceAdd]
    rw [← pow_mul]  -- (x^2)^2 = x^(2*2) = x^4
    norm_num
  
  -- Simplify (1/(2x))⁻¹^3: handle exponents carefully
  have h4 : (1 / (2 * x))⁻¹ ^ 3 = (2 * x) ^ 3 := by
    rw [inv_div]  -- (1/(2x))⁻¹ = (2x)/1 = 2x
    simp only [div_one]
    rw [pow_succ]  -- (2x)^3 = (2x)^(1+1+1)
    rw [pow_succ]
    simp only [pow_one]
  
  -- Expand (2x)^3 to 8x^3
  have h5 : (2 * x) ^ 3 = 8 * x ^ 3 := by
    rw [mul_pow]  -- Distribute exponent over multiplication
    simp only [pow_three]
    norm_num
  
  -- Now substitute all simplified forms back into the original expression
  rw [h1, h2, h3, h4, h5]
  
  -- Combine all terms: (x/4) * (9x^4) * (8x^3)
  -- First multiply coefficients: (1/4)*9*8 = 18
  -- Then combine x terms: x * x^4 * x^3 = x^(1+4+3) = x^8
  ring  -- The 'ring' tactic can handle this algebraic simplification