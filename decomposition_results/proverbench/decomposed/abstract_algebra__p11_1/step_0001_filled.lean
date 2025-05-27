theorem f_one_eq_zero  : f.IsRoot 1 :=
  by
  have h₁ : Polynomial.eval 1 f = 0 := by sorry
  have h₂ : Polynomial.IsRoot f 1 := by sorry
  --  exact h₂
  simpa