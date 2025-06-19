theorem imo_1983_p6 (a b c : ℝ) (h₀ : 0 < a ∧ 0 < b ∧ 0 < c) (h₁ : c < a + b) (h₂ : b < a + c)
    (h₃ : a < b + c) : 0 ≤ a ^ 2 * b * (a - b) + b ^ 2 * c * (b - c) + c ^ 2 * a * (c - a) := by
  have h₄ : 0 < b + c - a := by
    linarith
  
  have h₅ : 0 < c + a - b := by
    linarith
  
  have h₆ : 0 < a + b - c := by
    linarith
  
  have h₇ : 0 ≤ a ^ 2 * b * (a - b) + b ^ 2 * c * (b - c) + c ^ 2 * a * (c - a) := by
    have h₇₁ : 0 < a := by linarith
    have h₇₂ : 0 < b := by linarith
    have h₇₃ : 0 < c := by linarith
    have h₇₄ : 0 < a * b := by nlinarith
    have h₇₅ : 0 < b * c := by nlinarith
    have h₇₆ : 0 < c * a := by nlinarith
    
    admit
  
  linarith
