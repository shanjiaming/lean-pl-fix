theorem h₃ (α β γ δ : ℝ) (h : ∀ (X : ℝ), originalFraction X = decomposedForm α β γ δ X) (h₂ : γ / 5 + δ / 25 = 0) : -α / 5 + β / 25 = 0 := by
  have h₃ := h (-3)
  --  --  --  norm_num [originalFraction, decomposedForm, pow_two, pow_three, mul_assoc] at h₃ ⊢ <;> ring_nf at h₃ ⊢ <;> linarith
  hole