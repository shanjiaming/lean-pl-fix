theorem h₅ (α β γ δ : ℝ) (h : ∀ (X : ℝ), originalFraction X = decomposedForm α β γ δ X) (h₂ : γ / 5 + δ / 25 = 0) (h₃ : -α / 5 + β / 25 = 0) (h₀ : -α / 2 + β / 4 + γ / 3 + δ / 9 = 1 / 2) (h₁ : -α + β + γ / 4 + δ / 16 = 11 / 4) (h₄ : γ = 3) : δ = -15 := by
  have h₅ := h (-1)
  norm_num [originalFraction, decomposedForm] at h₅ h₂ h₃ h₀ h₁ h₄ ⊢ <;> ring_nf at h₅ h₂ h₃ h₀ h₁ h₄ ⊢ <;>
    nlinarith [sq_nonneg (α - 4), sq_nonneg (β - 6), sq_nonneg (γ - 3), sq_nonneg (δ + 15)]