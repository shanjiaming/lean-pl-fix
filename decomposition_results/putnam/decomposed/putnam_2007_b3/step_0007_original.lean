theorem h2₂ (x : ℕ → ℝ) (hx0 : x 0 = 1) (hx : ∀ (n : ℕ), x (n + 1) = 3 * x n + ↑⌊x n * √5⌋) (h1 : x 1 = 5) (h2₁ : x 2 = 3 * x 1 + ↑⌊x 1 * √5⌋) : ⌊5 * √5⌋ = 11 := by
  rw [Int.floor_eq_iff]
  constructor
  ·
    norm_num [Real.le_sqrt, Real.sqrt_lt, Nat.cast_le] <;>
      nlinarith [Real.sqrt_nonneg 5, Real.sq_sqrt (show 0 ≤ 5 by norm_num)]
  ·
    norm_num [Real.le_sqrt, Real.sqrt_lt, Nat.cast_le] <;>
      nlinarith [Real.sqrt_nonneg 5, Real.sq_sqrt (show 0 ≤ 5 by norm_num)]