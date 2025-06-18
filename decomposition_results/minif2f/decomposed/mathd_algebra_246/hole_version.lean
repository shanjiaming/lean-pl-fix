macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)

theorem mathd_algebra_246 (a b : ℝ) (f : ℝ → ℝ) (h₀ : ∀ x, f x = a * x ^ 4 - b * x ^ 2 + x + 5)
    (h₂ : f (-3) = 2) : f 3 = 8 := by
  have h₃ : 81 * a - 9 * b = 0 := by
    have h₃₁ : f (-3) = a * (-3 : ℝ) ^ 4 - b * (-3 : ℝ) ^ 2 + (-3 : ℝ) + 5 := by
      hole_1
    hole_2
  
  have h₄ : b = 9 * a := by
    have h₄₁ : 81 * a - 9 * b = 0 := h₃
    have h₄₂ : 9 * a - b = 0 := by hole_3
    have h₄₃ : b = 9 * a := by hole_4
    hole_5
  
  have h₅ : f 3 = 8 := by
    have h₅₁ : f 3 = a * (3 : ℝ) ^ 4 - b * (3 : ℝ) ^ 2 + (3 : ℝ) + 5 := by
      hole_6
    hole_7
  
  hole_8