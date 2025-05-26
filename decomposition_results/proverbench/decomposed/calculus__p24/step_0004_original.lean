theorem h₂  : sorry :=
  by
  apply tendsto_atTop_mono _ tendsto_id
  intro x
  have h₃ : x ≤ x ^ 3 := by nlinarith [sq_nonneg (x - 1), sq_nonneg (x + 1)]
  linarith