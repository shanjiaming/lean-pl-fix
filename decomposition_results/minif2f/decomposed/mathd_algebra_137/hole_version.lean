macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)

theorem mathd_algebra_137 (x : ℕ) (h₀ : ↑x + (4 : ℝ) / (100 : ℝ) * ↑x = 598) : x = 575 := by
  have h₁ : (104 : ℝ) * (x : ℝ) = (59800 : ℝ) := by
    have h₁ : (x : ℝ) + (4 : ℝ) / (100 : ℝ) * (x : ℝ) = 598 := h₀
    hole_1
  
  have h₂ : 104 * x = 59800 := by
    hole_2
  
  have h₃ : x = 575 := by
    hole_3
  
  hole_4