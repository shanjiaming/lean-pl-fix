theorem h₃₆ (a b : ℤ) (h₀ : ∀ (x : ℝ), 10 * x ^ 2 - x - 24 = (↑a * x - 8) * (↑b * x + 3)) (h₁ : (a + 8) * (b - 3) = -13) (h₂ : (a - 8) * (b + 3) = -15) (h₃₂ : (a + 8) * (b - 3) = -13) (h₃₃ : (a - 8) * (b + 3) = -15) : a = 5 :=
  by
  have h₃₇ : a + 8 = 13 ∨ a + 8 = -13 ∨ a + 8 = 1 ∨ a + 8 = -1 := by sorry
  --  cases' h₃₇ with h₃₇ h₃₇
  ·
    have h₃₈ : a + 8 = 13 := h₃₇
    have h₃₉ : a = 5 := by sorry
  --    exact h₃₉
  --  · cases' h₃₇ with h₃₇ h₃₇
    ·
      have h₃₈ : a + 8 = -13 := h₃₇
      have h₃₉ : a = -21 := by sorry
      have h₄₀ : (a - 8 : ℤ) * (b + 3) = -15 := h₂
      have h₄₁ : a = -21 := h₃₉
  --      rw [h₄₁] at h₄₀
  --  --      norm_num at h₄₀ <;> (try omega) <;>
          (try {
              have h₄₂ := h₁
              rw [h₄₁] at h₄₂
              norm_num at h₄₂ <;> omega
            }) <;>
        omega
  --    · cases' h₃₇ with h₃₇ h₃₇
      ·
        have h₃₈ : a + 8 = 1 := h₃₇
        have h₃₉ : a = -7 := by sorry
        have h₄₀ : (a - 8 : ℤ) * (b + 3) = -15 := h₂
        have h₄₁ : a = -7 := h₃₉
  --        rw [h₄₁] at h₄₀
  --  --        norm_num at h₄₀ <;> (try omega) <;>
  --            (try {
  --                have h₄₂ := h₁
  --                rw [h₄₁] at h₄₂
  --                norm_num at h₄₂ <;> omega
  --              }) <;>
          omega
      ·
        have h₃₈ : a + 8 = -1 := h₃₇
        have h₃₉ : a = -9 := by sorry
        have h₄₀ : (a - 8 : ℤ) * (b + 3) = -15 := h₂
        have h₄₁ : a = -9 := h₃₉
  --        rw [h₄₁] at h₄₀
  --  --        norm_num at h₄₀ <;> (try omega) <;>
            (try {
                have h₄₂ := h₁
                rw [h₄₁] at h₄₂
                norm_num at h₄₂ <;> omega
              }) <;>
          omega
  hole