theorem h₁ (I : ℕ → ℝ) (hI : I = fun m => ∫ (x : ℝ) in 0 ..2 * π, ∏ k ∈ Finset.Icc 1 m, cos ((↑k : ℝ) * x)) : sorry := by
  rw [hI] <;> simp [Finset.prod_range_succ] <;> rfl