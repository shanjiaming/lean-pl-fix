theorem h4 (x : ℕ → ℝ) (hx0 : x 0 = 1) (hx : ∀ (n : ℕ), x (n + 1) = 3 * x n + ↑⌊x n * √5⌋) (h1 : x 1 = 5) (h2 : x 2 = 26) (h3 : x 3 = 136) : x 4 = 712 :=
  by
  have h4₁ : x 4 = 3 * (x 3) + ⌊(x 3) * Real.sqrt 5⌋ := by sorry
  --  rw [h4₁, h3]
  have h4₂ : ⌊(136 : ℝ) * Real.sqrt 5⌋ = 304 := by sorry
  --  --  rw [h4₂] <;> norm_num <;> nlinarith [Real.sqrt_nonneg 5, Real.sq_sqrt (show 0 ≤ 5 by norm_num)]
  hole