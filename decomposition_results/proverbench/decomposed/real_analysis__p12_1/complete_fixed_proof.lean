theorem abs_sin_le_one (x : ℝ) : |Real.sin x| ≤ 1:=
  by
  have h : -1 ≤ Real.sin x ∧ Real.sin x ≤ 1:= by
    --  constructor
    --  · exact Real.neg_one_le_sin x
    --  · exact Real.sin_le_one x
    hole
  have h₁ : |Real.sin x| ≤ 1:= by
    --  apply abs_le.mpr
    --  exact ⟨h.1, h.2⟩
    hole
  --  exact h₁
  linarith