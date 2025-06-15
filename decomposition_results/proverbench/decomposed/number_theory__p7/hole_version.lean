macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem exactly_one_has_integral_solution:
  (∃ (x y : ℤ), x^2 - p * y^2 = 2) ∨ (∃ (x y : ℤ), x^2 - p * y^2 = -2) ∧
  ¬((∃ (x y : ℤ), x^2 - p * y^2 = 2) ∧ (∃ (x y : ℤ), x^2 - p * y^2 = -2)) := by
  have h_main : (∃ (x y : ℤ), x^2 - p * y^2 = 2) ∨ (∃ (x y : ℤ), x^2 - p * y^2 = -2) ∧ ¬((∃ (x y : ℤ), x^2 - p * y^2 = 2) ∧ (∃ (x y : ℤ), x^2 - p * y^2 = -2)) := by
    by_cases h : ∃ (x y : ℤ), x^2 - p * y^2 = 2
    · 
      exact Or.inl h
    · 
      have h₁ : ∃ (x y : ℤ), x^2 - p * y^2 = -2 := by
        
        
        
        hole_3
      have h₂ : ¬((∃ (x y : ℤ), x^2 - p * y^2 = 2) ∧ (∃ (x y : ℤ), x^2 - p * y^2 = -2)) := by
        hole_4
      hole_2
  hole_1