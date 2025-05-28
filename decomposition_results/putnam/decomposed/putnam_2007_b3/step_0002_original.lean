theorem h1 (x : ℕ → ℝ) (hx0 : x 0 = 1) (hx : ∀ (n : ℕ), x (n + 1) = 3 * x n + ↑⌊x n * √5⌋) : x 1 = 5 :=
  by
  have h1₁ : x 1 = 3 * (x 0) + ⌊(x 0) * Real.sqrt 5⌋ := by sorry
  rw [h1₁, hx0]
  have h1₂ : ⌊(1 : ℝ) * Real.sqrt 5⌋ = 2 := by sorry
  rw [h1₂] <;> norm_num <;> nlinarith [Real.sqrt_nonneg 5, Real.sq_sqrt (show 0 ≤ 5 by norm_num)]