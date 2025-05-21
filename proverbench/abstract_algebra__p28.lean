theorem sum_of_coefficients_equals_thirteen
    (h : ∀ X, originalFraction X = decomposedForm α β γ δ X) :
    α + β + γ + δ = 13 := by
  have h₂ : γ / 5 + δ / 25 = 0 := by
    have h₂ := h 2
    norm_num [originalFraction, decomposedForm, div_eq_mul_inv, add_assoc] at h₂ ⊢
    <;> ring_nf at h₂ ⊢ <;> linarith
  
  have h₃ : -α / 5 + β / 25 = 0 := by
    have h₃ := h (-3)
    norm_num [originalFraction, decomposedForm, pow_two, pow_three, mul_assoc] at h₃ ⊢
    <;> ring_nf at h₃ ⊢ <;> linarith
  
  have h₀ : -α / 2 + β / 4 + γ / 3 + δ / 9 = 1 / 2 := by
    have h₀ := h 0
    norm_num [originalFraction, decomposedForm, pow_two, pow_three, mul_assoc] at h₀ ⊢
    <;> ring_nf at h₀ ⊢ <;> linarith
  
  have h₁ : -α + β + γ / 4 + δ / 16 = 11 / 4 := by
    have h₁ := h 1
    norm_num [originalFraction, decomposedForm, pow_two, pow_three, mul_assoc] at h₁ ⊢
    <;> ring_nf at h₁ ⊢ <;> linarith
  
  have h₄ : γ = 3 := by
    have h₄ := h (-1)
    norm_num [originalFraction, decomposedForm] at h₄ h₂ h₃ h₀ h₁ ⊢
    <;> ring_nf at h₄ h₂ h₃ h₀ h₁ ⊢
    <;> nlinarith [sq_nonneg (α - 4), sq_nonneg (β - 6), sq_nonneg (γ - 3), sq_nonneg (δ + 15)]
  
  have h₅ : δ = -15 := by
    have h₅ := h (-1)
    norm_num [originalFraction, decomposedForm] at h₅ h₂ h₃ h₀ h₁ h₄ ⊢
    <;> ring_nf at h₅ h₂ h₃ h₀ h₁ h₄ ⊢
    <;> nlinarith [sq_nonneg (α - 4), sq_nonneg (β - 6), sq_nonneg (γ - 3), sq_nonneg (δ + 15)]
  
  have h₆ : α = 4 := by
    have h₆ := h (-1)
    norm_num [originalFraction, decomposedForm, h₄, h₅] at h₆ h₂ h₃ h₀ h₁ ⊢
    <;> ring_nf at h₆ h₂ h₃ h₀ h₁ ⊢
    <;> nlinarith [sq_nonneg (α - 4), sq_nonneg (β - 6)]
  
  have h₇ : β = 6 := by
    have h₇ := h (-1)
    norm_num [originalFraction, decomposedForm, h₄, h₅, h₆] at h₇ h₂ h₃ h₀ h₁ ⊢
    <;> ring_nf at h₇ h₂ h₃ h₀ h₁ ⊢
    <;> nlinarith [sq_nonneg (β - 6)]
  
  norm_num [h₄, h₅, h₆, h₇]