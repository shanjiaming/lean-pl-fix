macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)

theorem mathd_algebra_270 (f : ℝ → ℝ) (h₀ : ∀ (x) (_ : x ≠ -2), f x = 1 / (x + 2)) :
    f (f 1) = 3 / 7 := by
  have h₁ : f 1 = 1 / 3 := by
    have h₁₁ : (1 : ℝ) ≠ -2 := by hole_1
    have h₁₂ : f 1 = 1 / (1 + 2 : ℝ) := h₀ 1 h₁₁
    hole_2
  
  have h₂ : f (f 1) = f (1 / 3) := by
    hole_3
  
  have h₃ : f (1 / 3) = 3 / 7 := by
    have h₃₁ : (1 / 3 : ℝ) ≠ -2 := by hole_4
    have h₃₂ : f (1 / 3 : ℝ) = 1 / ((1 / 3 : ℝ) + 2 : ℝ) := h₀ (1 / 3 : ℝ) h₃₁
    hole_5
  
  have h₄ : f (f 1) = 3 / 7 := by
    hole_6
  
  hole_7