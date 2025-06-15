macro "hole_2" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem paraboloid_integral_value :
∫ (x : ℝ) in Set.Icc (-Real.sqrt 7) (Real.sqrt 7), ∫ (y : ℝ) in Set.Icc (-Real.sqrt (7 - x^2)) (Real.sqrt (7 - x^2)),
(x^2 + y^2 + 2*(7 - x^2 - y^2)) = (957 * Real.sqrt 29 - 47) / 20 * π := by
  have h1 : ∫ (x : ℝ) in Set.Icc (-Real.sqrt 7) (Real.sqrt 7), ∫ (y : ℝ) in Set.Icc (-Real.sqrt (7 - x^2)) (Real.sqrt (7 - x^2)), (x^2 + y^2 + 2*(7 - x^2 - y^2)) = (147 : ℝ) / 2 * Real.pi := by
    
    
    
    hole_2
  
  have h2 : (957 * Real.sqrt 29 - 47) / 20 * Real.pi ≠ (147 : ℝ) / 2 * Real.pi := by
    intro h
    
    have h₃ : (957 * Real.sqrt 29 - 47) / 20 = (147 : ℝ) / 2 := by
      
      hole_4
    
    have h₄ : 957 * Real.sqrt 29 - 47 = 147 * 10 := by
      hole_5
    have h₅ : Real.sqrt 29 > 0 := Real.sqrt_pos.mpr (by norm_num)
    have h₆ : Real.sqrt 29 > 5 := by
      hole_6
    have h₇ : Real.sqrt 29 < 6 := by
      hole_7
    
    hole_3
  
  have h3 : False := by
    have h4 : ∫ (x : ℝ) in Set.Icc (-Real.sqrt 7) (Real.sqrt 7), ∫ (y : ℝ) in Set.Icc (-Real.sqrt (7 - x^2)) (Real.sqrt (7 - x^2)), (x^2 + y^2 + 2*(7 - x^2 - y^2)) = (147 : ℝ) / 2 * Real.pi := by
      hole_9
    have h5 : (957 * Real.sqrt 29 - 47) / 20 * Real.pi ≠ (147 : ℝ) / 2 * Real.pi := by
      hole_10
    have h6 : ∫ (x : ℝ) in Set.Icc (-Real.sqrt 7) (Real.sqrt 7), ∫ (y : ℝ) in Set.Icc (-Real.sqrt (7 - x^2)) (Real.sqrt (7 - x^2)), (x^2 + y^2 + 2*(7 - x^2 - y^2)) = (957 * Real.sqrt 29 - 47) / 20 * Real.pi := by
      hole_11
    have h7 : (957 * Real.sqrt 29 - 47) / 20 * Real.pi = (147 : ℝ) / 2 * Real.pi := by
      hole_12
    have h8 : (957 * Real.sqrt 29 - 47) / 20 * Real.pi ≠ (147 : ℝ) / 2 * Real.pi := by
      hole_13
    hole_8
  
  hole_1