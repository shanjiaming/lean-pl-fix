theorem h₃ (c : ℝ) (h : c ≥ 1 / 2) (x : ℝ) (h₂ : cosh x ≤ rexp (x ^ 2 / 2)) : rexp (x ^ 2 / 2) ≤ rexp (c * x ^ 2) :=
  by
  have h₄ : x ^ 2 / 2 ≤ c * x ^ 2 := by sorry
  --  exact Real.exp_le_exp.mpr h₄
  simpa