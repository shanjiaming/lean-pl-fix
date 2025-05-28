theorem h1₂ (x : ℕ → ℝ) (hx0 : x 0 = 1) (hx : ∀ (n : ℕ), x (n + 1) = 3 * x n + ↑⌊x n * √5⌋) (h1₁ : x 1 = 3 * x 0 + ↑⌊x 0 * √5⌋) : ⌊1 * √5⌋ = 2 := by
  norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt, Nat.cast_le] <;> (try norm_num) <;>
      (try {nlinarith [Real.sqrt_nonneg 5, Real.sq_sqrt (show 0 ≤ 5 by norm_num)]
        }) <;>
    (try {constructor <;> nlinarith [Real.sqrt_nonneg 5, Real.sq_sqrt (show 0 ≤ 5 by norm_num)]
      })