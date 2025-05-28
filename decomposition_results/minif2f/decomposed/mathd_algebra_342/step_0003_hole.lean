theorem h₂₁ (a d : ℝ) (h₀ : ∑ k ∈ Finset.range 5, (a + ↑k * d) = 70) (h₁ : ∑ k ∈ Finset.range 10, (a + ↑k * d) = 210) : ∑ k ∈ Finset.range 5, (a + ↑k * d) = 5 * a + 10 * d := by
  --  norm_num [Finset.sum_range_succ, Finset.sum_range_succ, Finset.sum_range_succ, Finset.sum_range_succ,
  --          Finset.sum_range_succ, Finset.sum_range_succ] <;>
  --        ring_nf <;>
      norm_num <;>
    linarith
  hole