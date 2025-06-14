theorem integral_of_power_function (p : ℝ) (hp : p ≠ -1) :
∫ x in Set.Icc 0 1, x^p = (1^(p+1) - 0^(p+1)) / (p+1) := by
  have h₀ : (∫ x in (0 : ℝ)..1, (x : ℝ) ^ p) = (1 ^ (p + 1) - 0 ^ (p + 1)) / (p + 1) := by
    
    have h₁ : (∫ x in (0 : ℝ)..1, (x : ℝ) ^ p) = (1 ^ (p + 1) - 0 ^ (p + 1)) / (p + 1) := by
      
      admit
    
    admit
  
  have h₁ : ∫ x in Set.Icc 0 1, (x : ℝ) ^ p = (∫ x in (0 : ℝ)..1, (x : ℝ) ^ p) := by
    
    admit
  
  admit