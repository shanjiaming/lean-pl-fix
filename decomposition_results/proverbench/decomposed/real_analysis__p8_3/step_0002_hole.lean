theorem h_main (x : ℝ) : ∃! y, y = Real.log (x ^ 2 + 1) :=
  by
  --  use Real.log (x ^ 2 + 1)
  --  constructor
  --  · rfl
  --  · intro y' hy'
  --    rw [hy'] <;> simp
  hole