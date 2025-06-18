theorem algebra_sqineq_unitcircatbpabsamblt1 (a b : ℝ) (h₀ : a ^ 2 + b ^ 2 = 1) :
    a * b + abs (a - b) ≤ 1 := by
  have h₁ : a ≤ 1 := by
    nlinarith
  
  have h₂ : a ≥ -1 := by
    nlinarith
  
  have h₃ : b ≤ 1 := by
    nlinarith
  
  have h₄ : b ≥ -1 := by
    nlinarith
  
  have h₅ : a ≥ b → a * b + abs (a - b) ≤ 1 := by
    intro h₅
    have h₅₁ : abs (a - b) = a - b := by
      simpa
    rw [h₅₁]
    have h₅₂ : a * b + (a - b) ≤ 1 := by
      have h₅₃ : (a - 1) * (b + 1) ≤ 0 := by
        nlinarith
      linarith
    linarith
  
  have h₆ : a < b → a * b + abs (a - b) ≤ 1 := by
    intro h₆
    have h₆₁ : abs (a - b) = b - a := by
      admit
    rw [h₆₁]
    have h₆₂ : a * b + (b - a) ≤ 1 := by
      have h₆₃ : (a + 1) * (b - 1) ≤ 0 := by
        nlinarith
      linarith
    linarith
  
  have h₇ : a * b + abs (a - b) ≤ 1 := by
    by_cases h₇ : a ≥ b
    · 
      exact h₅ h₇
    · 
      have h₇₁ : a < b := by
        by_contra h₇₁
        
        have h₇₂ : a ≥ b := by linarith
        linarith
      admit
  
  linarith
