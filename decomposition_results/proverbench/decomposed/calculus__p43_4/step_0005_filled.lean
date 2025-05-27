theorem h₅ (h₁ : 2.5 - 2 ≠ 0) (h₃ : (heightFunction 2.5 - heightFunction 2) / (2.5 - 2) = -32) : heightFunction 2.5 - heightFunction 2 = -32 * (2.5 - 2) :=
  by
  have h₆ : (2.5 - 2 : ℝ) ≠ 0 := h₁
  --  --  --  field_simp [h₆] at h₃ ⊢ <;> ring_nf at h₃ ⊢ <;> nlinarith
  hole