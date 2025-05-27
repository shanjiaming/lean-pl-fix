theorem h₅ (n : ℕ) (h₀ : I ^ 4 = 1) (h₁ : ∀ (k : ℕ), I ^ (4 * k) = 1) (h₄ : n % 4 < 4) : n = 4 * (n / 4) + n % 4 :=
  by
  have h₅₁ : 4 * (n / 4) + n % 4 = n := by sorry
  --  omega
  hole