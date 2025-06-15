macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem specific_example :
  h 2 5 (-6) 3 = 512 ∧ m_comp 2 5 (-6) 3 = 34 := by
  have h₁ : h 2 5 (-6) 3 = 512 := by
    have h₂ : h 2 5 (-6) 3 = (2 : ℝ) ^ (5 * 3 + (-6)) := by
      hole_3
    hole_2
  
  have h₂ : m_comp 2 5 (-6) 3 = 34 := by
    have h₃ : m_comp 2 5 (-6) 3 = 5 * (2 : ℝ) ^ 3 + (-6 : ℝ) := by
      hole_5
    hole_4
  
  have h₃ : h 2 5 (-6) 3 = 512 ∧ m_comp 2 5 (-6) 3 = 34 := by
    hole_6
  
  hole_1