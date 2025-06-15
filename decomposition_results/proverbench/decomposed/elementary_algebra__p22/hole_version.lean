macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem inequality_for_positive_reals (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) :
  2 * a^3 + 2 * b^3 + 2 * c^3 + a^2 * b + b^2 * c + c^2 * a ≥ 3 * a * b^2 + 3 * b * c^2 + 3 * c * a^2 := by
  have h₁ : a^3 + b^3 + c^3 ≥ a^2 * b + b^2 * c + c^2 * a := by
    hole_2
  
  have h₂ : a^3 + b^3 + c^3 ≥ a * b^2 + b * c^2 + c * a^2 := by
    hole_3
  
  have h₃ : a^2 * b + b^2 * c + c^2 * a ≥ a * b^2 + b * c^2 + c * a^2 := by
    have h₃₁ : 0 < a * b := mul_pos ha hb
    have h₃₂ : 0 < b * c := mul_pos hb hc
    have h₃₃ : 0 < c * a := mul_pos hc ha
    have h₃₄ : 0 < a * b * c := by hole_5
    have h₃₅ : 0 < a * b * c * a := by hole_6
    have h₃₆ : 0 < a * b * c * b := by hole_7
    have h₃₇ : 0 < a * b * c * c := by hole_8
    hole_4
  
  have h_main : 2 * a^3 + 2 * b^3 + 2 * c^3 + a^2 * b + b^2 * c + c^2 * a ≥ 3 * a * b^2 + 3 * b * c^2 + 3 * c * a^2 := by
    have h₄ : 2 * a^3 + 2 * b^3 + 2 * c^3 + a^2 * b + b^2 * c + c^2 * a ≥ 3 * a * b^2 + 3 * b * c^2 + 3 * c * a^2 := by
      hole_10
    hole_9
  
  hole_1