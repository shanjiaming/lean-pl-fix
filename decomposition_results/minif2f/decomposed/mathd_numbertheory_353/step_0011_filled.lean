theorem h₂ (s : ℕ) (h₀ : s = ∑ k ∈ Finset.Icc 2010 4018, k) (h₁ : s = 2009 * 3014) : s % 2009 = 0 := by -- rw [h₁] <;> norm_num <;> rfl
  omega