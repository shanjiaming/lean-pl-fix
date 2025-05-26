theorem h₃ (c : ℝ) (h : c ≥ 1 / 2) (x : ℝ) : Real.log (cosh x) ≤ x ^ 2 / 2 :=
  by
  have h₄ : Real.log (Real.cosh x) ≤ x ^ 2 / 2 := by sorry
  --  exact h₄
  linarith