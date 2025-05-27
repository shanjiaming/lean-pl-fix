theorem h₂ (h₁ : √65 = √5 * √13) : RHS = (2 * √13 - 5 * (√5 * √13)) / 52 :=
  by
  rw [RHS]
  rw [h₁] <;> ring <;> field_simp <;> ring