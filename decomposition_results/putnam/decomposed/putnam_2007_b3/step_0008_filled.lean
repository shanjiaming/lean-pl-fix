theorem h3 (x : ℕ → ℝ) (hx0 : x 0 = 1) (hx : ∀ (n : ℕ), x (n + 1) = 3 * x n + ↑⌊x n * √5⌋) (h1 : x 1 = 5) (h2 : x 2 = 26) : x 3 = 136 :=
  by
  have h3₁ : x 3 = 3 * (x 2) + ⌊(x 2) * Real.sqrt 5⌋ := by sorry
  --  rw [h3₁, h2]
  have h3₂ : ⌊(26 : ℝ) * Real.sqrt 5⌋ = 58 := by sorry
  --  --  rw [h3₂] <;> norm_num <;> nlinarith [Real.sqrt_nonneg 5, Real.sq_sqrt (show 0 ≤ 5 by norm_num)]
  hole