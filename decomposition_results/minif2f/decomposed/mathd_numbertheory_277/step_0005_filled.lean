theorem h₄₁ (m n : ℕ) (h₀ : m.gcd n = 6) (h₁ : m.lcm n = 126) (h₂ : m ≠ 0) (h₃ : n ≠ 0) : m * n = m.gcd n * m.lcm n := by -- rw [Nat.gcd_mul_lcm]
  hole