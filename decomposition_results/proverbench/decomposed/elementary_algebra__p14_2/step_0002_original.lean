theorem h_denominator_ne_zero  : 2 * sorry ^ 3 ≠ 0 :=
  by
  have h : p ≠ 0 := Fact.out (p := p ≠ 0)
  have h₁ : p ^ 3 ≠ 0 := by sorry
  have h₂ : (2 : ℝ) * p ^ 3 ≠ 0 := by sorry
  exact h₂