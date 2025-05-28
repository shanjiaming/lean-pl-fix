theorem h4₂ (x : ℕ → ℝ) (hx0 : x 0 = 1) (hx : ∀ (n : ℕ), x (n + 1) = 3 * x n + ↑⌊x n * √5⌋) (h1 : x 1 = 5) (h2 : x 2 = 26) (h3 : x 3 = 136) (h4₁ : x 4 = 3 * x 3 + ↑⌊x 3 * √5⌋) : ⌊136 * √5⌋ = 304 := by
  rw [Int.floor_eq_iff]
  constructor
  ·
    norm_num [Real.le_sqrt, Real.sqrt_lt, Nat.cast_le] <;>
      nlinarith [Real.sqrt_nonneg 5, Real.sq_sqrt (show 0 ≤ 5 by norm_num)]
  ·
    norm_num [Real.le_sqrt, Real.sqrt_lt, Nat.cast_le] <;>
      nlinarith [Real.sqrt_nonneg 5, Real.sq_sqrt (show 0 ≤ 5 by norm_num)]