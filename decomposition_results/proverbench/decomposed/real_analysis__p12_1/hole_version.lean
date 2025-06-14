macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem abs_sin_le_one (x : ℝ) : |Real.sin x| ≤ 1 := by
  have h : -1 ≤ Real.sin x ∧ Real.sin x ≤ 1 := by
    hole_2
  
  have h₁ : |Real.sin x| ≤ 1 := by
    
    hole_3
  
  hole_1