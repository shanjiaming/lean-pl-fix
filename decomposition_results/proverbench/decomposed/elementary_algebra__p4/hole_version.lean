macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem solution_of_system_of_linear_equations :
  (2 * x + 3 * y = 8) ∧ (5 * x + 9 * y = -2) → (x = 26 ∧ y = -44 / 3) := by
  intro h
  have h₁ : x = 26 := by
    have h₂ : 2 * x + 3 * y = 8 := h.1
    have h₃ : 5 * x + 9 * y = -2 := h.2
    have h₄ : x = 26 := by
      
      have h₅ : 6 * x + 9 * y = 24 := by
        hole_4
      
      have h₆ : x = 26 := by
        hole_5
      hole_3
    hole_2
  
  have h₂ : y = -44 / 3 := by
    have h₃ : 2 * x + 3 * y = 8 := h.1
    have h₄ : 5 * x + 9 * y = -2 := h.2
    have h₅ : y = -44 / 3 := by
      have h₆ : x = 26 := h₁
      hole_7
    hole_6
  
  have h₃ : x = 26 ∧ y = -44 / 3 := by
    hole_8
  
  hole_1