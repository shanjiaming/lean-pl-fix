theorem h₃ (h₁ : √65 = √5 * √13) (h₂ : RHS = (2 * √13 - 5 * (√5 * √13)) / 52) : RHS = (2 - 5 * √5) * √13 / 52 :=
  by
  rw [h₂]
  have h₄ : 2 * Real.sqrt 13 - 5 * (Real.sqrt 5 * Real.sqrt 13) = (2 - 5 * Real.sqrt 5) * Real.sqrt 13 := by sorry
  rw [h₄] <;> ring_nf <;> field_simp <;> ring_nf