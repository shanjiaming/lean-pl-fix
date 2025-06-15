theorem exactly_one_has_integral_solution:
  (∃ (x y : ℤ), x^2 - p * y^2 = 2) ∨ (∃ (x y : ℤ), x^2 - p * y^2 = -2) ∧
  ¬((∃ (x y : ℤ), x^2 - p * y^2 = 2) ∧ (∃ (x y : ℤ), x^2 - p * y^2 = -2)) := by
  have h_main : (∃ (x y : ℤ), x^2 - p * y^2 = 2) ∨ (∃ (x y : ℤ), x^2 - p * y^2 = -2) ∧ ¬((∃ (x y : ℤ), x^2 - p * y^2 = 2) ∧ (∃ (x y : ℤ), x^2 - p * y^2 = -2)) := by
    by_cases h : ∃ (x y : ℤ), x^2 - p * y^2 = 2
    · 
      exact Or.inl h
    · 
      have h₁ : ∃ (x y : ℤ), x^2 - p * y^2 = -2 := by
        
        
        
        admit
      have h₂ : ¬((∃ (x y : ℤ), x^2 - p * y^2 = 2) ∧ (∃ (x y : ℤ), x^2 - p * y^2 = -2)) := by
        admit
      admit
  admit