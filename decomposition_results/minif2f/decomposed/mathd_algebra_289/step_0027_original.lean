theorem h₇₄ (k t m n : ℕ) (h₀ : Nat.Prime m ∧ Nat.Prime n) (h₁ : t < k) (h₂ : ↑k ^ 2 - ↑m * ↑k + ↑n = 0) (h₃ : ↑t ^ 2 - ↑m * ↑t + ↑n = 0) (h₄ : ↑m = ↑k + ↑t) (h₅ : m = k + t) (h₆ h₇₁ : n = t * k) (h₇₂ : Nat.Prime n) (h₇₃ : t ∣ n) : t = 1 ∨ t = n := by
  have h₇₅ : Nat.Prime n := h₀.2
  exact h₇₅.eq_one_or_self_of_dvd _ h₇₃