theorem h₆₁ (k t m n : ℕ) (h₀ : Nat.Prime m ∧ Nat.Prime n) (h₁ : t < k) (h₂ : ↑k ^ 2 - ↑m * ↑k + ↑n = 0) (h₃ : ↑t ^ 2 - ↑m * ↑t + ↑n = 0) (h₄ : ↑m = ↑k + ↑t) (h₅ : m = k + t) : k ^ 2 + n = m * k :=
  by
  have h₆₂ : (k ^ 2 : ℤ) + (n : ℤ) = (m * k : ℤ) := by sorry
  --  norm_cast at h₆₂ ⊢ <;> linarith
  linarith