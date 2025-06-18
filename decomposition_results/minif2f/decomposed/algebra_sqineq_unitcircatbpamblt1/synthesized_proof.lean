theorem algebra_sqineq_unitcircatbpamblt1 (a b : ℝ) (h₀ : a ^ 2 + b ^ 2 = 1) :
    a * b + (a - b) ≤ 1 := by
  have h₁ : a ^ 2 ≤ 1 := by
    nlinarith
  
  have h₂ : b ^ 2 ≤ 1 := by
    nlinarith
  
  have h₃ : 1 - a ≥ 0 := by
    nlinarith
  
  have h₄ : 1 + b ≥ 0 := by
    nlinarith
  
  have h₅ : (1 - a) * (1 + b) ≥ 0 := by
    nlinarith
  
  have h₆ : a * b + (a - b) ≤ 1 := by
    have h₇ : (1 - a) * (1 + b) = 1 - a + b - a * b := by
      linarith
    have h₈ : 1 - a + b - a * b ≥ 0 := by
      linarith
    linarith
  
  linarith
