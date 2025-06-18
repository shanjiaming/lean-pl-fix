macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)

theorem mathd_algebra_263 (y : ℝ) (h₀ : 0 ≤ 19 + 3 * y) (h₁ : Real.sqrt (19 + 3 * y) = 7) :
    y = 10 := by
  have h₂ : 19 + 3 * y = 49 := by
    have h₂₁ : (Real.sqrt (19 + 3 * y)) ^ 2 = 7 ^ 2 := by
      hole_1
    
    have h₂₂ : (Real.sqrt (19 + 3 * y)) ^ 2 = 19 + 3 * y := by
      hole_2
    
    hole_3
  
  have h₃ : y = 10 := by
    have h₄ : 3 * y = 30 := by hole_4
    have h₅ : y = 10 := by hole_5
    hole_6
  
  hole_7