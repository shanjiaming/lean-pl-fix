theorem critical_points : f_deriv x = 0 ↔ x = 2 ∨ x = 4 := by
  have h_main : f_deriv x = 0 ↔ x = 2 ∨ x = 4 := by
    constructor
    · 
      intro h
      have h₁ : 3 * x ^ 2 - 18 * x + 24 = 0 := by
        
        admit
      have h₂ : x = 2 ∨ x = 4 := by
        
        have h₃ : x ^ 2 - 6 * x + 8 = 0 := by
          
          admit
        have h₄ : (x - 2) * (x - 4) = 0 := by
          
          admit
        
        have h₅ : x - 2 = 0 ∨ x - 4 = 0 := by
          admit
        admit
      admit
  admit