import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Show that for any real-valued function $a$ on the natural numbers such that $\forall i \in \mathbb{N}, a_i \geq 0$, 
    if $prod_{i=0}^{n-1} a_i = 1$, then $sum_{i=0}^{n-1} a_i \geq n$.-/
theorem algebra_amgm_prod1toneq1_sum1tongeqn (a : ℕ → NNReal) (n : ℕ)
    (h₀ : Finset.prod (Finset.range n) a = 1) : Finset.sum (Finset.range n) a ≥ n := by
  -- First, we'll use the Arithmetic Mean-Geometric Mean (AM-GM) inequality
  -- The AM-GM inequality states that for non-negative real numbers, the arithmetic mean is ≥ geometric mean
  have amgm_ineq := Finset.le_geom_mean_arith_mean (Finset.range n) a (fun _ _ => NNReal.zero_le _) (fun _ _ => le_rfl)
  
  -- Simplify the arithmetic mean (left side of AM-GM inequality)
  -- The arithmetic mean is (sum a_i)/n
  have arith_mean : (Finset.sum (Finset.range n) a) / n = (Finset.sum (Finset.range n) a) * (n⁻¹ : NNReal) := by
    simp only [NNReal.div_def]
  
  -- Simplify the geometric mean (right side of AM-GM inequality)
  -- The geometric mean is (prod a_i)^(1/n)
  have geom_mean : (Finset.prod (Finset.range n) a) ^ (n⁻¹ : NNReal) = 
      (1 : NNReal) ^ (n⁻¹ : NNReal) := by
    -- Substitute h₀ which states that the product equals 1
    rw [h₀]
  
  -- Since 1 raised to any power is 1, we can further simplify the geometric mean
  have geom_mean_simplified : (1 : NNReal) ^ (n⁻¹ : NNReal) = 1 := by
    exact NNReal.one_rpow _
  
  -- Combine the geometric mean simplifications
  have geom_mean_final := Eq.trans geom_mean geom_mean_simplified
  
  -- Rewrite the AM-GM inequality using our simplified arithmetic and geometric means
  rw [arith_mean, geom_mean_final] at amgm_ineq
  
  -- Now we have: (sum a_i) * n⁻¹ ≥ 1
  -- Multiply both sides by n (which is positive since n is a natural number)
  -- Note: multiplication by n is order-preserving since n > 0
  have n_pos : n > 0 ∨ n = 0 := by
    exact Nat.eq_zero_or_pos n
  cases n_pos with
  | inl hn_pos =>
    -- Case when n > 0
    have multiply_both_sides := mul_le_mul_right' amgm_ineq (n : NNReal)
    -- Simplify: (sum a_i) * n⁻¹ * n = sum a_i
    have lhs_simplified : (Finset.sum (Finset.range n) a) * (n⁻¹ : NNReal) * n = 
        Finset.sum (Finset.range n) a := by
      rw [mul_assoc, inv_mul_cancel, mul_one]
      exact NNReal.nat_cast_ne_zero.mpr (Nat.pos_iff_ne_zero.mp hn_pos)
    -- Simplify: 1 * n = n
    have rhs_simplified : (1 : NNReal) * n = n := by
      simp only [one_mul]
    -- Rewrite the inequality with these simplifications
    rw [lhs_simplified, rhs_simplified] at multiply_both_sides
    exact multiply_both_sides
  | inr hn_zero =>
    -- Case when n = 0
    -- Both sides become 0, and 0 ≥ 0 is trivially true
    rw [hn_zero]
    simp only [Finset.range_zero, Finset.sum_empty, Finset.prod_empty, le_refl]