theorem h₃ (x : NNReal) (h₀ : √(60 * (↑x : ℝ)) * √(12 * (↑x : ℝ)) * √(63 * (↑x : ℝ)) = √(60 * (↑x : ℝ) * (12 * (↑x : ℝ)) * (63 * (↑x : ℝ)))) (h₁ : √(60 * (↑x : ℝ) * (12 * (↑x : ℝ)) * (63 * (↑x : ℝ))) = √(45360 * (↑x : ℝ) ^ 3)) (h₂ : √(45360 * (↑x : ℝ) ^ 3) = √(36 ^ 2 * 35 * (↑x : ℝ) ^ 3)) : √(36 ^ 2 * 35 * (↑x : ℝ) ^ 3) = 36 * √(35 * (↑x : ℝ) ^ 3) :=
  by
  have h₃₁ : 0 ≤ (36 : ℝ) := by sorry
  have h₃₂ : 0 ≤ (35 : ℝ) * (x : ℝ) ^ 3 := by sorry
  have h₃₃ : 0 ≤ (x : ℝ) := by sorry
  have h₃₄ : 0 ≤ (x : ℝ) ^ 3 := by sorry
  have h₃₅ : 0 ≤ (35 : ℝ) * (x : ℝ) ^ 3 := by sorry
  have h₃₆ : Real.sqrt ((36 : ℝ) ^ 2 * 35 * (x : ℝ) ^ 3) = 36 * Real.sqrt (35 * (x : ℝ) ^ 3) := by sorry
  rw [h₃₆] <;> simp [h₃₁, h₃₂, h₃₃, h₃₄, h₃₅] <;> ring_nf <;> norm_num <;> linarith