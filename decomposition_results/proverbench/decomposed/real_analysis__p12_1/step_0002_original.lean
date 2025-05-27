theorem h (x✝ : ℕ → ℝ) (x : ℝ) : -1 ≤ Real.sin x ∧ Real.sin x ≤ 1 := by
  constructor
  · exact Real.neg_one_le_sin x
  · exact Real.sin_le_one x