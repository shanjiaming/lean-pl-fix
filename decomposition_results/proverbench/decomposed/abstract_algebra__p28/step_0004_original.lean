theorem h₀ (α β γ δ : ℝ) (h : ∀ (X : ℝ), originalFraction X = decomposedForm α β γ δ X) (h₂ : γ / 5 + δ / 25 = 0) (h₃ : -α / 5 + β / 25 = 0) : -α / 2 + β / 4 + γ / 3 + δ / 9 = 1 / 2 := by
  have h₀ := h 0
  norm_num [originalFraction, decomposedForm, pow_two, pow_three, mul_assoc] at h₀ ⊢ <;> ring_nf at h₀ ⊢ <;> linarith