theorem h₂ (h₁ : ∏ k ∈ Finset.range 6, (2 * k + 1) = 1 * 3 * 5 * 7 * 9 * 11) : (∏ k ∈ Finset.range 6, (2 * k + 1)) % 10 = 5 := by -- rw [h₁] <;> norm_num <;> rfl
  norm_num