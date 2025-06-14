macro "hole_2" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem rational_solutions_of_pell_equation (d : ℤ) (t : ℚ) :
  ∃ (x y : ℚ), x = (d * t^2 + 1) / (d * t^2 - 1) ∧ y = 2 * t / (d * t^2 - 1) ∧ x^2 - d * y^2 = 1 := by
  have h_main : (d * (t : ℚ)^2 - 1 : ℚ) = 0 ∨ (d * (t : ℚ)^2 - 1 : ℚ) ≠ 0 := by
    hole_2
  
  have h_case_zero : (d * (t : ℚ)^2 - 1 : ℚ) = 0 → ∃ (x y : ℚ), x = (d * t^2 + 1) / (d * t^2 - 1) ∧ y = 2 * t / (d * t^2 - 1) ∧ x^2 - d * y^2 = 1 := by
    intro h
    have h₁ : False := by
      have h₂ : (0 : ℚ) ≠ (1 : ℚ) := by hole_5
      have h₃ : (d * (t : ℚ)^2 + 1 : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ) = 0 := by
        have h₄ : (d * (t : ℚ)^2 - 1 : ℚ) = 0 := by hole_7
        have h₅ : (d * (t : ℚ)^2 + 1 : ℚ) = (d * (t : ℚ)^2 - 1 : ℚ) + 2 := by hole_8
        hole_6
      have h₄ : (2 * (t : ℚ) : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ) = 0 := by
        have h₅ : (d * (t : ℚ)^2 - 1 : ℚ) = 0 := by hole_10
        have h₆ : (2 * (t : ℚ) : ℚ) = (2 * (t : ℚ) : ℚ) := by hole_11
        hole_9
      have h₅ : ((d * (t : ℚ)^2 + 1 : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ)) ^ 2 - (d : ℚ) * ((2 * (t : ℚ) : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ)) ^ 2 = 0 := by
        hole_12
      have h₆ : ((d * (t : ℚ)^2 + 1 : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ)) ^ 2 - (d : ℚ) * ((2 * (t : ℚ) : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ)) ^ 2 = 1 := by
        have h₇ : False := by
          have h₈ : ((d * (t : ℚ)^2 + 1 : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ)) ^ 2 - (d : ℚ) * ((2 * (t : ℚ) : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ)) ^ 2 = 0 := h₅
          have h₉ : (0 : ℚ) ≠ (1 : ℚ) := by hole_15
          have h₁₀ : ((d * (t : ℚ)^2 + 1 : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ)) ^ 2 - (d : ℚ) * ((2 * (t : ℚ) : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ)) ^ 2 = 1 := by
            hole_16
          hole_14
        hole_13
      hole_4
    hole_3
  
  have h_case_nonzero : (d * (t : ℚ)^2 - 1 : ℚ) ≠ 0 → ∃ (x y : ℚ), x = (d * t^2 + 1) / (d * t^2 - 1) ∧ y = 2 * t / (d * t^2 - 1) ∧ x^2 - d * y^2 = 1 := by
    intro h₁
    have h₂ : (d * (t : ℚ)^2 - 1 : ℚ) ≠ 0 := h₁
    
    refine' ⟨(d * t^2 + 1 : ℚ) / (d * t^2 - 1 : ℚ), (2 * t : ℚ) / (d * t^2 - 1 : ℚ), by simp [h₂], by simp [h₂], _⟩
    
    have h₃ : (d * (t : ℚ)^2 - 1 : ℚ) ≠ 0 := by hole_18
    have h₄ : (d * t^2 - 1 : ℚ) ≠ 0 := by hole_19
    
    have h₅ : ((d * t^2 + 1 : ℚ) / (d * t^2 - 1 : ℚ)) ^ 2 - (d : ℚ) * ((2 * t : ℚ) / (d * t^2 - 1 : ℚ)) ^ 2 = 1 := by
      have h₅₁ : (d * t^2 - 1 : ℚ) ≠ 0 := by hole_21
      hole_20
    hole_17
  
  have h_main' : ∃ (x y : ℚ), x = (d * t^2 + 1) / (d * t^2 - 1) ∧ y = 2 * t / (d * t^2 - 1) ∧ x^2 - d * y^2 = 1 := by
    hole_22
  hole_1