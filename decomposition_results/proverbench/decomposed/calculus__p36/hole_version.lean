macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem integral_of_power_function (p : ℝ) (hp : p ≠ -1) :
∫ x in Set.Icc 0 1, x^p = (1^(p+1) - 0^(p+1)) / (p+1) := by
  have h₀ : (∫ x in (0 : ℝ)..1, (x : ℝ) ^ p) = (1 ^ (p + 1) - 0 ^ (p + 1)) / (p + 1) := by
    
    have h₁ : (∫ x in (0 : ℝ)..1, (x : ℝ) ^ p) = (1 ^ (p + 1) - 0 ^ (p + 1)) / (p + 1) := by
      
      hole_3
    
    hole_2
  
  have h₁ : ∫ x in Set.Icc 0 1, (x : ℝ) ^ p = (∫ x in (0 : ℝ)..1, (x : ℝ) ^ p) := by
    
    hole_4
  
  hole_1