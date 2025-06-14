macro "hole_4" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem integral_sin_pow_ten_cos (x C: ℝ) :
∫ x , (sin x)^10 * cos x = (sin x)^11 / 11 +C := by
  have h1 : False := by
    have h2 : False := by
      
      have h3 : False := by
        
        hole_4
      hole_3
    hole_2
  
  have h2 : ∫ x , (sin x)^10 * cos x = (sin x)^11 / 11 +C := by
    
    hole_5
  
  hole_1