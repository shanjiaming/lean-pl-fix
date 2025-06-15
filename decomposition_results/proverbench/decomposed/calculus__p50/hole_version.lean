macro "hole_3" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem integral_x_sin_x_pi_over_2 :
∫ x in Icc 0 (π / 2), x * sin x = 1 := by
  have h₁ : (∫ x in Icc 0 (π / 2), x * sin x) = 1 := by
    have h₂ : (∫ x in (0 : ℝ)..(π / 2 : ℝ), x * sin x) = 1 := by
      
      hole_3
    
    have h₃ : (∫ x in Icc 0 (π / 2), x * sin x) = (∫ x in (0 : ℝ)..(π / 2 : ℝ), x * sin x) := by
      hole_8
    hole_2
  hole_1