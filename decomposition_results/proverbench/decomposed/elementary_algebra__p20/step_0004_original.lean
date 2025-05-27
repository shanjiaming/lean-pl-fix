theorem h₄ (f : ℚ → ℚ) (h : f 1 = 2 ∧ ∀ (x y : ℚ), f (x * y) = f x * f y - f (x + y) + 1) (h₁ : f 1 = 2) (h₂ : ∀ (x y : ℚ), f (x * y) = f x * f y - f (x + y) + 1) (h₃ : f 0 = 1) : ∀ (x : ℚ), f (x + 1) = f x + 1 := by
  intro x
  have h₅ := h₂ x 1
  have h₆ := h₂ 1 x
  have h₇ := h₂ x 0
  have h₈ := h₂ 0 x
  have h₉ := h₂ (x + 1) 0
  have h₁₀ := h₂ 0 (x + 1)
  have h₁₁ := h₂ (x + 1) 1
  have h₁₂ := h₂ 1 (x + 1)
  norm_num [h₁, h₃] at h₅ h₆ h₇ h₈ h₉ h₁₀ h₁₁ h₁₂ ⊢ <;> (try ring_nf at * <;> nlinarith) <;> (try linarith) <;>
    (try nlinarith)