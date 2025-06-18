theorem mathd_algebra_388 (x y z : ℝ) (h₀ : 3 * x + 4 * y - 12 * z = 10)
    (h₁ : -2 * x - 3 * y + 9 * z = -4) : x = 14 := by
  have h₂ : 9 * x + 12 * y - 36 * z = 30 := by
    have h₂₁ : 9 * x + 12 * y - 36 * z = 30 := by
      have h₂₂ : 3 * (3 * x + 4 * y - 12 * z) = 3 * 10 := by
        rw [h₀]
      ring_nf at h₂₂ ⊢
      linarith
    exact h₂₁
  
  have h₃ : -8 * x - 12 * y + 36 * z = -16 := by
    have h₃₁ : 4 * (-2 * x - 3 * y + 9 * z) = 4 * (-4) := by
      rw [h₁]
    ring_nf at h₃₁ ⊢
    linarith
  
  have h₄ : x = 14 := by
    have h₄₁ : x = 14 := by
      have h₄₂ : 9 * x + 12 * y - 36 * z + (-8 * x - 12 * y + 36 * z) = 30 + (-16) := by
        linarith
      ring_nf at h₄₂ ⊢
      linarith
    exact h₄₁
  
  exact h₄