theorem f_well_defined :
  ∀ x : ℝ, ∃! y : ℝ, y = Real.log (x^2 + 1) := by
  intro x
  have h_main : ∃! (y : ℝ), y = Real.log (x^2 + 1) := by
    use Real.log (x^2 + 1)
    constructor
    · -- Prove that y = Real.log (x^2 + 1) is a solution
      rfl
    · -- Prove the uniqueness part
      intro y' hy'
      rw [hy']
      <;> simp
  exact h_main