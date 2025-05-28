theorem putnam_1974_b3 (α : ℝ) (ha : Real.cos (Real.pi * α) = 1 / 3) : Irrational α :=
  by
  have h_main : ¬(∃ (p : ℤ) (q : ℤ), q > 0 ∧ α = (p : ℝ) / q) := by sorry
  have h_final : Irrational α := by sorry
  --  exact h_final
  hole