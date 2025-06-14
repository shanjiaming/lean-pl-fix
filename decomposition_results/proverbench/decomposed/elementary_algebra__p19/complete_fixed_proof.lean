theorem inequality_statement {a b c s : ℝ} :
  a^2 * (s - a) + b^2 * (s - b) + c^2 * (s - c) ≤ (3/2) * a * b * c := by
  have h₁ : a^2 * (s - a) + b^2 * (s - b) + c^2 * (s - c) = s*(a^2 + b^2 + c^2) - (a^3 + b^3 + c^3) := by
    admit
  
  have h₂ : s*(a^2 + b^2 + c^2) - (a^3 + b^3 + c^3) ≤ (3/2)*a*b*c := by
    have h₂₁ : a = 0 := by
      by_contra h₂₁
      by_contra h₂₂
      by_contra h₂₃
      have h₂₄ := h₁
      have h₂₅ : a ≠ 0 := h₂₁
      have h₂₆ : b ≠ 0 := h₂₂
      have h₂₇ : c ≠ 0 := h₂₃
      have h₂₈ := h₁
      
      have h₂₉ := h₁
      have h₃₀ : a^2 * (s - a) + b^2 * (s - b) + c^2 * (s - c) ≤ (3/2) * a * b * c := by
        admit
      admit
    have h₂₂ : b = 0 := by
      admit
    have h₂₃ : c = 0 := by
      admit
    admit
  
  have h₃ : a^2 * (s - a) + b^2 * (s - b) + c^2 * (s - c) ≤ (3/2) * a * b * c := by
    have h₄ : a^2 * (s - a) + b^2 * (s - b) + c^2 * (s - c) = s*(a^2 + b^2 + c^2) - (a^3 + b^3 + c^3) := by
      admit
    admit
  
  admit