theorem h₂₆ (x c : ℝ) (h₁ : c ∈ Set.Ioo 0 8) (h₂ : HasDerivAt f 0 c) (h₃ : c ∈ Set.Ioo 0 8) (h₄ : HasDerivAt f 0 c) (h₆ : HasDerivAt f (1 / 3 * (8 * c - c ^ 2) ^ (-2 / 3) * (8 - 2 * c)) c) (h₇ : 1 / 3 * (8 * c - c ^ 2) ^ (-2 / 3) * (8 - 2 * c) = 0) (h₁₂ h₁₅ : 8 * c - c ^ 2 > 0) (h₁₆ : 1 / 3 * (8 * c - c ^ 2) ^ (-2 / 3) * (8 - 2 * c) = 0) (h₁₇ h₁₈ : 8 * c - c ^ 2 > 0) (h : ¬8 - 2 * c = 0) (h₂₀ : 8 - 2 * c ≠ 0) (h₂₂ h₂₃ h₂₄ : 8 * c - c ^ 2 > 0) (h₂₅ : 8 - 2 * c ≠ 0) : 1 / 3 * (8 * c - c ^ 2) ^ (-2 / 3) * (8 - 2 * c) ≠ 0 :=
  by
  have h₂₇ : (8 * c - c ^ 2 : ℝ) > 0 := h₁₂
  have h₂₈ : (8 * c - c ^ 2 : ℝ) > 0 := h₁₂
  have h₂₉ : (8 * c - c ^ 2 : ℝ) > 0 := h₁₂
  have h₃₀ : (8 - 2 * c : ℝ) ≠ 0 := h₂₅
  have h₃₁ : (1 / 3 : ℝ) > 0 := by sorry
  have h₃₂ : (8 * c - c ^ 2 : ℝ) > 0 := h₁₂
  have h₃₃ : (8 * c - c ^ 2 : ℝ) ^ (-2 / 3 : ℝ) > 0 := by sorry
  have h₃₄ : (1 / 3 : ℝ) * (8 * c - c ^ 2) ^ (-2 / 3 : ℝ) > 0 := by sorry
  have h₃₅ : (1 / 3 : ℝ) * (8 * c - c ^ 2) ^ (-2 / 3 : ℝ) * (8 - 2 * c) ≠ 0 := by sorry
  exact h₃₅