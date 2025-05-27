theorem h₆ (α β γ δ : ℝ) (h : ∀ (X : ℝ), originalFraction X = decomposedForm α β γ δ X) (h₂ : γ / 5 + δ / 25 = 0) (h₃ : -α / 5 + β / 25 = 0) (h₀ : -α / 2 + β / 4 + γ / 3 + δ / 9 = 1 / 2) (h₁ : -α + β + γ / 4 + δ / 16 = 11 / 4) (h₄ : γ = 3) (h₅ : δ = -15) : α = 4 := by
  have h₆ := h (-1)
  norm_num [originalFraction, decomposedForm, h₄, h₅] at h₆ h₂ h₃ h₀ h₁ ⊢ <;> ring_nf at h₆ h₂ h₃ h₀ h₁ ⊢ <;>
    nlinarith [sq_nonneg (α - 4), sq_nonneg (β - 6)]