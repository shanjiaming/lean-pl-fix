theorem h₄ (s : ℕ) (h₀ : s = ∑ k ∈ Finset.Icc 2010 4018, k) (h₂ : ∑ k ∈ Finset.Icc 2010 4018, k = ∑ t ∈ Finset.range 2009, (t + 2010)) (h₃ : ∑ t ∈ Finset.range 2009, (t + 2010) = ∑ t ∈ Finset.range 2009, t + ∑ t ∈ Finset.range 2009, 2010) : ∑ t ∈ Finset.range 2009, t = 2009 * 1004 := by
  --  rw [Finset.sum_range_id] <;> norm_num <;> ring_nf <;> norm_num
  hole