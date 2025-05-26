theorem h_main' (h : sorry ≠ 1) (h_main :  sorry ^ 2 - sorry * sorry ^ 2 = 1 →    ∃ t, sorry = (sorry * t ^ 2 + 1) / (sorry * t ^ 2 - 1) ∧ sorry = 2 * t / (sorry * t ^ 2 - 1)) : (∃ t, sorry = (sorry * t ^ 2 + 1) / (sorry * t ^ 2 - 1) ∧ sorry = 2 * t / (sorry * t ^ 2 - 1)) →
    sorry ^ 2 - sorry * sorry ^ 2 = 1 :=
  by
  rintro ⟨t, ht1, ht2⟩
  have h₁ : x = (d * t ^ 2 + 1) / (d * t ^ 2 - 1) := ht1
  have h₂ : y = 2 * t / (d * t ^ 2 - 1) := ht2
  rw [h₁, h₂]
  by_cases h₃ : (d : ℚ) * t ^ 2 - 1 = 0
  ·
    have h₄ : (d : ℚ) * t ^ 2 - 1 = 0 := h₃
    have h₅ : (d : ℚ) * t ^ 2 = 1 := by linarith
    have h₆ : ((d : ℚ) * t ^ 2 + 1 : ℚ) / ((d : ℚ) * t ^ 2 - 1 : ℚ) = 0 := by
      rw [h₄] <;> simp [div_eq_mul_inv] <;> ring_nf <;> norm_num
    have h₇ : (2 : ℚ) * t / ((d : ℚ) * t ^ 2 - 1 : ℚ) = 0 := by
      rw [h₄] <;> simp [div_eq_mul_inv] <;> ring_nf <;> norm_num
    rw [h₆, h₇] <;> simp_all [sub_eq_add_neg] <;> ring_nf at * <;> norm_num at * <;> simp_all [sub_eq_add_neg] <;>
      nlinarith
  ·
    have h₄ : (d : ℚ) * t ^ 2 - 1 ≠ 0 := h₃
    have h₅ : (d : ℚ) * t ^ 2 - 1 ≠ 0 := h₄
    field_simp [h₄, h₅, sub_eq_zero, add_eq_zero_iff_eq_neg] at * <;> ring_nf at * <;>
      nlinarith [sq_nonneg (t : ℚ), sq_nonneg (t ^ 2 : ℚ), sq_nonneg (d * t ^ 2 : ℚ)]