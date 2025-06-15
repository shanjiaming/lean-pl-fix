theorem exponent_simplification : exp (I * (5 * π / 2)) = exp (I * (π / 2)) := by
  have h₀ : (5 : ℂ) * (π : ℂ) / 2 = (π : ℂ) / 2 + 2 * (π : ℂ) := by
    admit
  
  have h₁ : exp (I * (5 * π / 2)) = exp (I * (π / 2 + 2 * π)) := by
    admit
  
  have h₂ : exp (I * (π / 2 + 2 * π)) = exp (I * (π / 2)) * exp (I * (2 * π)) := by
    admit
  
  have h₃ : exp (I * (2 * π)) = 1 := by
    admit
  
  have h₄ : exp (I * (π / 2 + 2 * π)) = exp (I * (π / 2)) := by
    admit
  
  have h₅ : exp (I * (5 * π / 2)) = exp (I * (π / 2)) := by
    admit
  
  admit