theorem h₂  : Tendsto (fun x => x ^ 3) atTop atTop :=
  by
  apply tendsto_atTop_mono _ tendsto_id
  intro x
  have h₃ : x ≤ x ^ 3 := by sorry
  linarith