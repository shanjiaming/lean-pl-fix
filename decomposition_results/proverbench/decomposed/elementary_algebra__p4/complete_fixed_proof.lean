theorem solution_of_system_of_linear_equations :
  (2 * x + 3 * y = 8) ∧ (5 * x + 9 * y = -2) → (x = 26 ∧ y = -44 / 3) := by
  intro h
  have h₁ : x = 26 := by
    have h₂ : 2 * x + 3 * y = 8 := h.1
    have h₃ : 5 * x + 9 * y = -2 := h.2
    have h₄ : x = 26 := by
      
      have h₅ : 6 * x + 9 * y = 24 := by
        admit
      
      have h₆ : x = 26 := by
        admit
      admit
    admit
  
  have h₂ : y = -44 / 3 := by
    have h₃ : 2 * x + 3 * y = 8 := h.1
    have h₄ : 5 * x + 9 * y = -2 := h.2
    have h₅ : y = -44 / 3 := by
      have h₆ : x = 26 := h₁
      admit
    admit
  
  have h₃ : x = 26 ∧ y = -44 / 3 := by
    admit
  
  admit