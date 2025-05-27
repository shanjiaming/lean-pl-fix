theorem h₁ (x : NNReal) (h₀ : √(60 * (↑x : ℝ)) * √(12 * (↑x : ℝ)) * √(63 * (↑x : ℝ)) = √(60 * (↑x : ℝ) * (12 * (↑x : ℝ)) * (63 * (↑x : ℝ)))) : √(60 * (↑x : ℝ) * (12 * (↑x : ℝ)) * (63 * (↑x : ℝ))) = √(45360 * (↑x : ℝ) ^ 3) :=
  by
  have h₁₀ : (60 : ℝ) * (x : ℝ) * (12 * (x : ℝ)) * (63 * (x : ℝ)) = 45360 * (x : ℝ) ^ 3 := by sorry
  rw [h₁₀] <;> simp [Real.sqrt_eq_iff_sq_eq] <;> ring_nf <;> norm_num <;> linarith