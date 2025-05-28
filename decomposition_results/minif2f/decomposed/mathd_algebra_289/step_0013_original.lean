theorem h₅₁ (k t m n : ℕ) (h₀ : Nat.Prime m ∧ Nat.Prime n) (h₁ : t < k) (h₂ : ↑k ^ 2 - ↑m * ↑k + ↑n = 0) (h₃ : ↑t ^ 2 - ↑m * ↑t + ↑n = 0) (h₄₁ : (↑k - ↑t) * (↑k + ↑t - ↑m) = 0) : ↑k ≠ ↑t := by
  intro h
  have h₅₂ : k = t := by sorry
  have h₅₃ : t < k := h₁
  linarith