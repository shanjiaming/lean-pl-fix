theorem hb3 (a b : ℝ) (h₀ : a ^ 2 * b ^ 3 = 32 / 27) (h₁ : a / b ^ 3 = 27 / 4) : b ≠ 0 := by
  by_contra h
  have h₂ : b = 0 := by sorry
  rw [h₂] at h₁
  norm_num at h₁ ⊢ <;> simp_all [pow_three] <;> ring_nf at * <;> norm_num at * <;> linarith