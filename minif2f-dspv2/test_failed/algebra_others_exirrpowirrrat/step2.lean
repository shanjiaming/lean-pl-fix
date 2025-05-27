theorem h_main  : ∃ a b, Irrational a ∧ Irrational b ∧ ¬Irrational (a ^ b) :=
  by
  by_cases h : Irrational (Real.sqrt 2 ^ Real.sqrt 2)
  ·
    have h₁ : Irrational (Real.sqrt 2 ^ Real.sqrt 2) := h
    have h₂ : Irrational (Real.sqrt 2) := by sorry
    have h₃ : (Real.sqrt 2 ^ Real.sqrt 2 : ℝ) > 0 := by sorry
    have h₄ : ((Real.sqrt 2 ^ Real.sqrt 2 : ℝ) : ℝ) ^ Real.sqrt 2 = 2 := by sorry
    have h₅ : ¬Irrational (((Real.sqrt 2 ^ Real.sqrt 2 : ℝ) : ℝ) ^ Real.sqrt 2) := by sorry
    refine' ⟨(Real.sqrt 2 ^ Real.sqrt 2 : ℝ), Real.sqrt 2, h₁, h₂, _⟩
    simpa using h₅
  ·
    have h₁ : ¬Irrational (Real.sqrt 2 ^ Real.sqrt 2) := h
    have h₂ : Irrational (Real.sqrt 2) := by sorry
    refine' ⟨Real.sqrt 2, Real.sqrt 2, h₂, h₂, _⟩
    have h₃ : ¬Irrational (Real.sqrt 2 ^ Real.sqrt 2) := h₁
    simpa using h₃