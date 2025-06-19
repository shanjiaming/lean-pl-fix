macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)

theorem putnam_2023_b2
: sInf {(digits 2 (2023*n)).sum | n > 0} = ((3) : ℕ ) := by
  have h₁ : 3 ∈ {(digits 2 (2023*n)).sum | n > 0} := by
    
    
    hole_1

  have h₂ : sInf {(digits 2 (2023*n)).sum | n > 0} = 3 := by
    
    hole_2

  
  hole_3