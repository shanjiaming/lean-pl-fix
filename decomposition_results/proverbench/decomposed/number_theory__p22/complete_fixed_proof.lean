theorem cos_pi_rational_values (p q : ℤ) (h : ∃ r : ℚ, cos (p * π / q) = r) : ∃ r : ℚ, r ∈ ({0, 1, -1, 1/2, -1/2} : Set ℚ) ∧ cos (p * π / q) = r := by
  by_cases hq : q = 0
  · 
    have h₁ : cos (p * π / q) = (1 : ℝ) := by
      have h₂ : (q : ℝ) = 0 := by admit
      have h₃ : (p * π / q : ℝ) = 0 := by
        admit
      admit
    
    have h₂ : ∃ r : ℚ, r ∈ ({0, 1, -1, 1/2, -1/2} : Set ℚ) ∧ cos (p * π / q) = r := by
      admit
      
    exact h₂
  · 
    have h₃ : ∃ (r : ℚ), r ∈ ({0, 1, -1, 1/2, -1/2} : Set ℚ) ∧ cos (p * π / q) = r := by
      obtain ⟨r, hr⟩ := h
      refine' ⟨r, _⟩
      constructor
      · 
        have h₄ : (r : ℝ) = Real.cos (p * Real.pi / q) := by
          admit
        have h₅ : r = 0 ∨ r = 1 ∨ r = -1 ∨ r = 1 / 2 ∨ r = -1 / 2 := by
          admit
        
        have h₆ : r ∈ ({0, 1, -1, 1 / 2, -1 / 2} : Set ℚ) := by
          admit
        admit
    admit