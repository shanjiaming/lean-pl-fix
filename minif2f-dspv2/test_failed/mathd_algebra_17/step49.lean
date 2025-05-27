theorem h₄ (a : ℝ) (h₀ : √(4 + √(16 + 16 * a)) + √(1 + √(1 + a)) = 6) (h₁ : 16 + 16 * a ≥ 0) (h₂ : 1 + a ≥ 0) (h₃ : √(16 + 16 * a) = 4 * √(1 + a)) : √(4 + √(16 + 16 * a)) = 2 * √(1 + √(1 + a)) :=
  by
  rw [h₃]
  have h₄₁ : Real.sqrt (4 + (4 : ℝ) * Real.sqrt (1 + a)) = 2 * Real.sqrt (1 + Real.sqrt (1 + a)) := by sorry
  rw [h₄₁] <;> ring_nf <;> field_simp <;> ring_nf