theorem h₁  : √65 = √5 * √13 :=
  by
  have h₁₁ : Real.sqrt 65 = Real.sqrt (5 * 13) := by sorry
  rw [h₁₁]
  have h₁₂ : Real.sqrt (5 * 13) = Real.sqrt 5 * Real.sqrt 13 := by sorry
  rw [h₁₂] <;> ring_nf <;> field_simp <;> ring_nf