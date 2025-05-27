theorem real_zeros_of_polynomial_f  : ∃ s, s.card = 4 ∧ (∀ x ∈ s, eval x f = 0) ∧ ∀ (x : ℝ), eval x f = 0 → x ∈ s :=
  by
  have h₁ :
    f.eval (-3.5 + Real.sqrt (16 + Real.sqrt 151) / 2) = 0 ∧
      f.eval (-3.5 - Real.sqrt (16 + Real.sqrt 151) / 2) = 0 ∧
        f.eval (-3.5 + Real.sqrt (16 - Real.sqrt 151) / 2) = 0 ∧ f.eval (-3.5 - Real.sqrt (16 - Real.sqrt 151) / 2) = 0 := by sorry
  --  sorry
  hole