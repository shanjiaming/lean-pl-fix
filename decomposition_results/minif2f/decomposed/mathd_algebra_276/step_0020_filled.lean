theorem h₄₁ (a b : ℤ) (h₀ : ∀ (x : ℝ), 10 * x ^ 2 - x - 24 = (↑a * x - 8) * (↑b * x + 3)) (h₁ : (a + 8) * (b - 3) = -13) (h₂ : (a - 8) * (b + 3) = -15) (h₃ : a = 5) : b = 2 := by
  have h₄₂ : (a + 8 : ℤ) * (b - 3) = -13 := h₁
  have h₄₃ : (a - 8 : ℤ) * (b + 3) = -15 := h₂
  have h₄₄ : a = 5 := h₃
  --  rw [h₄₄] at h₄₂ h₄₃
  --  --  norm_num at h₄₂ h₄₃ ⊢ <;> (try omega) <;> (try nlinarith) <;>
    (try {omega
      })
  hole