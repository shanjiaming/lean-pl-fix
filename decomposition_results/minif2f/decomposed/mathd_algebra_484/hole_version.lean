macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)

theorem mathd_algebra_484 : Real.log 27 / Real.log 3 = 3 := by
  have h₀ : Real.log 27 = 3 * Real.log 3 := by
    have h₀₁ : Real.log 27 = Real.log (3 ^ 3) := by hole_1
    rw [h₀₁]
    
    have h₀₂ : Real.log (3 ^ 3) = 3 * Real.log 3 := by
      hole_2
    hole_3
  
  have h₁ : Real.log 27 / Real.log 3 = 3 := by
    rw [h₀]
    have h₂ : Real.log 3 ≠ 0 := by
      
      have h₂₁ : Real.log 3 > 0 := Real.log_pos (by norm_num)
      hole_4
    
    hole_5
  
  hole_6