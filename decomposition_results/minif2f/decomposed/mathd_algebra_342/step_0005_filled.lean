theorem h₃₁ (a d : ℝ) (h₀ : ∑ k ∈ Finset.range 5, (a + ↑k * d) = 70) (h₁ : ∑ k ∈ Finset.range 10, (a + ↑k * d) = 210) (h₂ : 5 * a + 10 * d = 70) : ∑ k ∈ Finset.range 10, (a + ↑k * d) = 10 * a + 45 * d := by
  --  norm_num [Finset.sum_range_succ, Finset.sum_range_succ, Finset.sum_range_succ, Finset.sum_range_succ,
  --          Finset.sum_range_succ, Finset.sum_range_succ, Finset.sum_range_succ, Finset.sum_range_succ,
  --          Finset.sum_range_succ, Finset.sum_range_succ] <;>
  --        ring_nf <;>
      norm_num <;>
    linarith
  hole