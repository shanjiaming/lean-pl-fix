theorem h₃₂ (f : ℝ → ℝ) (h₀ : ∀ (x : ℝ), f x = x ^ 2 + (18 * x + 30) - 2 * √(x ^ 2 + (18 * x + 45))) (h₁ : Fintype (↑(f ⁻¹' {0}) : Type)) (h₂ : -9 + √61 ∈ f ⁻¹' {0}) : √((-9 - √61) ^ 2 + (18 * (-9 - √61) + 45)) = 5 :=
  by
  have h₃₃ : (-9 - Real.sqrt 61) ^ 2 + (18 * (-9 - Real.sqrt 61) + 45) = 25 := by sorry
  rw [h₃₃]
  rw [Real.sqrt_eq_iff_sq_eq] <;> nlinarith [Real.sqrt_nonneg 61, Real.sq_sqrt (show 0 ≤ 61 by norm_num)]