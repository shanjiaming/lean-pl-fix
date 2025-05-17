theorem h₂₁ (a b : ℂ) (h₀ : a ^ 3 - 8 = 0) (h₁ : b ^ 3 - 8 * b ^ 2 - 8 * b + 64 = 0) : a ^ 3 = 8 := by
  rw [sub_eq_zero] at h₀
  norm_num at h₀ ⊢ <;> linear_combination h₀