theorem f_well_defined : ∀ x : ℝ, ∃! y : ℝ, y = Real.log (x ^ 2 + 1):=
  by
  --  intro x
  have h_main : ∃! (y : ℝ), y = Real.log (x ^ 2 + 1):=
    by
    --  use Real.log (x ^ 2 + 1)
    --  constructor
    --  · rfl
    --  · intro y' hy'
    --    rw [hy'] <;> simp
    norm_num
  --  exact h_main
  hole