theorem h₅ (h₁ : 2.5 - 2 ≠ 0) (h₃ : (sorry - sorry) / (2.5 - 2) = -32) : sorry - sorry = -32 * (2.5 - 2) :=
  by
  have h₆ : (2.5 - 2 : ℝ) ≠ 0 := h₁
  field_simp [h₆] at h₃ ⊢ <;> ring_nf at h₃ ⊢ <;> nlinarith