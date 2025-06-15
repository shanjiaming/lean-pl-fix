theorem inequality_for_positive_reals (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) :
  2 * a^3 + 2 * b^3 + 2 * c^3 + a^2 * b + b^2 * c + c^2 * a ≥ 3 * a * b^2 + 3 * b * c^2 + 3 * c * a^2 := by
  have h₁ : a^3 + b^3 + c^3 ≥ a^2 * b + b^2 * c + c^2 * a := by
    admit
  
  have h₂ : a^3 + b^3 + c^3 ≥ a * b^2 + b * c^2 + c * a^2 := by
    admit
  
  have h₃ : a^2 * b + b^2 * c + c^2 * a ≥ a * b^2 + b * c^2 + c * a^2 := by
    have h₃₁ : 0 < a * b := mul_pos ha hb
    have h₃₂ : 0 < b * c := mul_pos hb hc
    have h₃₃ : 0 < c * a := mul_pos hc ha
    have h₃₄ : 0 < a * b * c := by admit
    have h₃₅ : 0 < a * b * c * a := by admit
    have h₃₆ : 0 < a * b * c * b := by admit
    have h₃₇ : 0 < a * b * c * c := by admit
    admit
  
  have h_main : 2 * a^3 + 2 * b^3 + 2 * c^3 + a^2 * b + b^2 * c + c^2 * a ≥ 3 * a * b^2 + 3 * b * c^2 + 3 * c * a^2 := by
    have h₄ : 2 * a^3 + 2 * b^3 + 2 * c^3 + a^2 * b + b^2 * c + c^2 * a ≥ 3 * a * b^2 + 3 * b * c^2 + 3 * c * a^2 := by
      admit
    admit
  
  admit