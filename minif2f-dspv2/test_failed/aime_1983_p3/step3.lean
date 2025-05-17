theorem h₂₁ (f : ℝ → ℝ) (h₀ : ∀ (x : ℝ), f x = x ^ 2 + (18 * x + 30) - 2 * √(x ^ 2 + (18 * x + 45))) (h₁ : Fintype (↑(f ⁻¹' {0}) : Type)) : f (-9 + √61) = 0 := by
  rw [h₀]
  have h₂₂ : Real.sqrt ((-9 + Real.sqrt 61) ^ 2 + (18 * (-9 + Real.sqrt 61) + 45)) = 5 := by sorry
  rw [h₂₂] <;> nlinarith [Real.sqrt_nonneg 61, Real.sq_sqrt (show 0 ≤ 61 by norm_num)]