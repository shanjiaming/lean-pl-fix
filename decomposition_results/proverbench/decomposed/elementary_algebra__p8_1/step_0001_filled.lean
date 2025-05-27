theorem given_equality_holds  : LHS = RHS :=
  by
  have h₁ : Real.sqrt 65 = Real.sqrt 5 * Real.sqrt 13 := by sorry
  have h₂ : RHS = (2 * Real.sqrt 13 - 5 * (Real.sqrt 5 * Real.sqrt 13)) / 52 := by sorry
  have h₃ : RHS = (2 - 5 * Real.sqrt 5) * Real.sqrt 13 / 52 := by sorry
  have h₄ : LHS = (2 - 5 * Real.sqrt 5) / (4 * Real.sqrt 13) := by sorry
  have h₅ : LHS = (2 - 5 * Real.sqrt 5) * Real.sqrt 13 / 52 := by sorry
  have h₆ : LHS = RHS := by sorry
  --  rw [h₆] <;> ring_nf <;> field_simp <;> ring_nf
  linarith