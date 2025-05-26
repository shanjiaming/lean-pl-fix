theorem h₂ (c : ℝ) (h : c ≥ 1 / 2) (x : ℝ) : cosh x ≤ rexp (x ^ 2 / 2) :=
  by
  have h₃ : Real.log (Real.cosh x) ≤ x ^ 2 / 2 := by sorry
  have h₅ : Real.cosh x ≤ Real.exp (x ^ 2 / 2) := by sorry
  exact h₅