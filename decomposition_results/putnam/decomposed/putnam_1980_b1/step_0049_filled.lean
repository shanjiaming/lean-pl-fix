theorem h₄ (c : ℝ) (h : c ≥ 1 / 2) (x : ℝ) : Real.log (cosh x) ≤ x ^ 2 / 2 :=
  by
  have h₅ : Real.log (Real.cosh x) ≤ x ^ 2 / 2 := by sorry
  --  exact h₅
  linarith