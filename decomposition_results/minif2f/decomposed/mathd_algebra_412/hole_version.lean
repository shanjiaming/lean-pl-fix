macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)

theorem mathd_algebra_412 (x y : ℝ) (h₀ : x + y = 25) (h₁ : x - y = 11) : x = 18 := by
  have h₂ : 2 * x = 36 := by
    have h₃ : (x + y) + (x - y) = 25 + 11 := by
      hole_1
    have h₄ : (x + y) + (x - y) = 2 * x := by
      hole_2
    have h₅ : 2 * x = 36 := by
      hole_3
    hole_4
  
  have h₃ : x = 18 := by
    have h₄ : x = 18 := by
      
      hole_5
    hole_6
  
  hole_7