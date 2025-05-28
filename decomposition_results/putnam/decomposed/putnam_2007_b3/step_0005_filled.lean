theorem h2 (x : ℕ → ℝ) (hx0 : x 0 = 1) (hx : ∀ (n : ℕ), x (n + 1) = 3 * x n + ↑⌊x n * √5⌋) (h1 : x 1 = 5) : x 2 = 26 :=
  by
  have h2₁ : x 2 = 3 * (x 1) + ⌊(x 1) * Real.sqrt 5⌋ := by sorry
  --  rw [h2₁, h1]
  have h2₂ : ⌊(5 : ℝ) * Real.sqrt 5⌋ = 11 := by sorry
  --  --  rw [h2₂] <;> norm_num <;> nlinarith [Real.sqrt_nonneg 5, Real.sq_sqrt (show 0 ≤ 5 by norm_num)]
  hole