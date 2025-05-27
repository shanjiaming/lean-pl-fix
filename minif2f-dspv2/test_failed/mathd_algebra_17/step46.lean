theorem h₃ (a : ℝ) (h₀ : √(4 + √(16 + 16 * a)) + √(1 + √(1 + a)) = 6) (h₁ : 16 + 16 * a ≥ 0) (h₂ : 1 + a ≥ 0) : √(16 + 16 * a) = 4 * √(1 + a) :=
  by
  have h₃₁ : Real.sqrt (16 + 16 * a) = Real.sqrt (16 * (1 + a)) := by sorry
  rw [h₃₁]
  have h₃₂ : Real.sqrt (16 * (1 + a)) = 4 * Real.sqrt (1 + a) := by sorry
  rw [h₃₂] <;> ring <;> field_simp <;> ring_nf <;> linarith