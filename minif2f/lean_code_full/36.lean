import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Show that for positive integer $n$, $\sum_{k=0}^{n-1} \frac{1}{(k+1)(k+2)} = \frac{n}{n+1}$.-/
theorem induction_sum_1oktkp1 (n : ℕ) :
    (∑ k in Finset.range n, (1 : ℝ) / ((k + 1) * (k + 2))) = n / (n + 1) := by
  -- We'll prove this by induction on n
  induction n with
  | zero =>
    -- Base case: n = 0
    -- The sum over an empty range is 0, and 0/(0+1) = 0
    simp [Finset.range_zero]  -- Simplify the empty sum
    norm_num  -- Normalize numerical expressions
  | succ m ih =>
    -- Inductive step: assume true for n = m (induction hypothesis ih), prove for n = m + 1
    -- First rewrite the sum for m+1 as the sum for m plus the new term
    rw [Finset.range_succ, Finset.sum_insert (Finset.not_mem_range_self m)]
    -- Rewrite using the induction hypothesis
    rw [ih]
    -- The new term is 1/((m+1)*(m+2))
    -- Now we need to show: m/(m+1) + 1/((m+1)*(m+2)) = (m+1)/(m+2)
    -- First find a common denominator
    have common_denom : (m + 1) * (m + 2) = (m + 1) * (m + 2) := by ring
    -- Rewrite both fractions with the common denominator
    rw [div_eq_mul_inv, div_eq_mul_inv, div_eq_mul_inv]
    -- Convert to multiplication form
    rw [← mul_inv, ← mul_inv, ← mul_inv]
    -- Factor out the inverse of the common denominator
    rw [mul_add, ← mul_assoc]
    -- Simplify the numerators
    have num1 : m * (m + 2) = m^2 + 2*m := by ring
    have num2 : 1 = 1 := by rfl
    rw [num1, num2]
    -- Combine terms in the numerator
    have combined_num : (m^2 + 2*m + 1) = (m + 1)^2 := by ring
    rw [combined_num]
    -- Now we have: (m+1)^2 / ((m+1)*(m+2)) = (m+1)/(m+2)
    -- Cancel one (m+1) factor from numerator and denominator
    have cancel_factor : (m + 1)^2 / ((m + 1) * (m + 2)) = 
        (m + 1) * (m + 1) / ((m + 1) * (m + 2)) := by ring
    rw [cancel_factor]
    rw [mul_div_mul_left]
    -- The remaining expression is exactly what we need
    -- The side condition is m + 1 ≠ 0, which holds since m is a natural number
    simp [m.succ_ne_zero]  -- Simplify using the fact that m+1 ≠ 0