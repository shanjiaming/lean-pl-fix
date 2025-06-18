macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)

theorem mathd_algebra_148 (c : ℝ) (f : ℝ → ℝ) (h₀ : ∀ x, f x = c * x ^ 3 - 9 * x + 3)
    (h₁ : f 2 = 9) : c = 3 := by
  have h₂ : c * (2 : ℝ) ^ 3 - 9 * (2 : ℝ) + 3 = 9 := by
    have h₂₁ : f 2 = c * (2 : ℝ) ^ 3 - 9 * (2 : ℝ) + 3 := by
      hole_1
    hole_2
  
  have h₃ : c * 8 - 18 + 3 = 9 := by
    hole_3
  
  have h₄ : c * 8 - 15 = 9 := by
    hole_4
  
  have h₅ : c * 8 = 24 := by
    have h₅₁ : c * 8 - 15 = 9 := h₄
    have h₅₂ : c * 8 = 24 := by hole_5
    hole_6
  
  have h₆ : c = 3 := by
    have h₆₁ : c * 8 = 24 := h₅
    have h₆₂ : c = 3 := by
      hole_7
    hole_8
  
  hole_9