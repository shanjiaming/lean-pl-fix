theorem mathd_algebra_398 (a b c : ℝ) (h₀ : 0 < a ∧ 0 < b ∧ 0 < c) (h₁ : 9 * b = 20 * c)
    (h₂ : 7 * a = 4 * b) : 63 * a = 80 * c := by
  have h₃ : 63 * a = 36 * b := by
    have h₃₁ : 63 * a = 9 * (7 * a) := by admit
    rw [h₃₁]
    have h₃₂ : 7 * a = 4 * b := h₂
    admit
  
  have h₄ : 36 * b = 80 * c := by
    have h₄₁ : 36 * b = 4 * (9 * b) := by admit
    rw [h₄₁]
    have h₄₂ : 9 * b = 20 * c := h₁
    admit
  
  have h₅ : 63 * a = 80 * c := by
    admit
  
  admit