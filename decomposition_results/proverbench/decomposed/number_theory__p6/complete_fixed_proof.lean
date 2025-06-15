theorem rational_solutions_of_pell_equation (d : ℤ) (t : ℚ) :
  ∃ (x y : ℚ), x = (d * t^2 + 1) / (d * t^2 - 1) ∧ y = 2 * t / (d * t^2 - 1) ∧ x^2 - d * y^2 = 1 := by
  have h_main : (d * (t : ℚ)^2 - 1 : ℚ) = 0 ∨ (d * (t : ℚ)^2 - 1 : ℚ) ≠ 0 := by
    admit
  
  have h_case_zero : (d * (t : ℚ)^2 - 1 : ℚ) = 0 → ∃ (x y : ℚ), x = (d * t^2 + 1) / (d * t^2 - 1) ∧ y = 2 * t / (d * t^2 - 1) ∧ x^2 - d * y^2 = 1 := by
    intro h
    have h₁ : False := by
      have h₂ : (0 : ℚ) ≠ (1 : ℚ) := by admit
      have h₃ : (d * (t : ℚ)^2 + 1 : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ) = 0 := by
        have h₄ : (d * (t : ℚ)^2 - 1 : ℚ) = 0 := by admit
        have h₅ : (d * (t : ℚ)^2 + 1 : ℚ) = (d * (t : ℚ)^2 - 1 : ℚ) + 2 := by admit
        admit
      have h₄ : (2 * (t : ℚ) : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ) = 0 := by
        have h₅ : (d * (t : ℚ)^2 - 1 : ℚ) = 0 := by admit
        have h₆ : (2 * (t : ℚ) : ℚ) = (2 * (t : ℚ) : ℚ) := by admit
        admit
      have h₅ : ((d * (t : ℚ)^2 + 1 : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ)) ^ 2 - (d : ℚ) * ((2 * (t : ℚ) : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ)) ^ 2 = 0 := by
        admit
      have h₆ : ((d * (t : ℚ)^2 + 1 : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ)) ^ 2 - (d : ℚ) * ((2 * (t : ℚ) : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ)) ^ 2 = 1 := by
        have h₇ : False := by
          have h₈ : ((d * (t : ℚ)^2 + 1 : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ)) ^ 2 - (d : ℚ) * ((2 * (t : ℚ) : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ)) ^ 2 = 0 := h₅
          have h₉ : (0 : ℚ) ≠ (1 : ℚ) := by admit
          have h₁₀ : ((d * (t : ℚ)^2 + 1 : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ)) ^ 2 - (d : ℚ) * ((2 * (t : ℚ) : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ)) ^ 2 = 1 := by
            admit
          admit
        admit
      admit
    admit
  
  have h_case_nonzero : (d * (t : ℚ)^2 - 1 : ℚ) ≠ 0 → ∃ (x y : ℚ), x = (d * t^2 + 1) / (d * t^2 - 1) ∧ y = 2 * t / (d * t^2 - 1) ∧ x^2 - d * y^2 = 1 := by
    intro h₁
    have h₂ : (d * (t : ℚ)^2 - 1 : ℚ) ≠ 0 := h₁
    
    refine' ⟨(d * t^2 + 1 : ℚ) / (d * t^2 - 1 : ℚ), (2 * t : ℚ) / (d * t^2 - 1 : ℚ), by simp [h₂], by simp [h₂], _⟩
    
    have h₃ : (d * (t : ℚ)^2 - 1 : ℚ) ≠ 0 := by admit
    have h₄ : (d * t^2 - 1 : ℚ) ≠ 0 := by admit
    
    have h₅ : ((d * t^2 + 1 : ℚ) / (d * t^2 - 1 : ℚ)) ^ 2 - (d : ℚ) * ((2 * t : ℚ) / (d * t^2 - 1 : ℚ)) ^ 2 = 1 := by
      have h₅₁ : (d * t^2 - 1 : ℚ) ≠ 0 := by admit
      admit
    admit
  
  have h_main' : ∃ (x y : ℚ), x = (d * t^2 + 1) / (d * t^2 - 1) ∧ y = 2 * t / (d * t^2 - 1) ∧ x^2 - d * y^2 = 1 := by
    admit
  admit