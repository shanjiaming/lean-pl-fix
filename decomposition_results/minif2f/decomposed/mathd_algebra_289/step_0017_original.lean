theorem h₅₇ (k t m n : ℕ) (h₀ : Nat.Prime m ∧ Nat.Prime n) (h₁ : t < k) (h₂ : ↑k ^ 2 - ↑m * ↑k + ↑n = 0) (h₃ : ↑t ^ 2 - ↑m * ↑t + ↑n = 0) (h₄₁ : (↑k - ↑t) * (↑k + ↑t - ↑m) = 0) (h₅₁ : ↑k ≠ ↑t) (h₅₅ : ↑k - ↑t ≠ 0) (h₅₆ : (↑k - ↑t) * (↑k + ↑t - ↑m) = 0) : ↑k + ↑t - ↑m = 0 :=
  by
  apply mul_left_cancel₀ h₅₅
  linarith