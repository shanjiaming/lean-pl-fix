theorem h_denominator_ne_zero (p q r : ℝ) (inst✝² : Fact (p ≠ 0)) (inst✝¹ : Fact (q ≠ 0)) (inst✝ : Fact (r ≠ 0)) : 2 * p ^ 3 ≠ 0 :=
  by
  have h : p ≠ 0 := Fact.out (p := p ≠ 0)
  have h₁ : p ^ 3 ≠ 0 := by sorry
  have h₂ : (2 : ℝ) * p ^ 3 ≠ 0 := by sorry
  exact h₂
  hole