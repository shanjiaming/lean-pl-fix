macro "hole_4" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem field_is_integral_domain (a b : F) (h : a * b = 0) : a = 0 ∨ b = 0 := by
  have h_main : a = 0 ∨ b = 0 := by
    by_cases h₀ : a = 0
    · 
      exact Or.inl h₀
    · 
      have h₁ : b = 0 := by
        
        have h₂ : a * b = a * 0 := by hole_4
        
        have h₃ : b = 0 := mul_left_cancel₀ h₀ h₂
        hole_3
      hole_2
  hole_1