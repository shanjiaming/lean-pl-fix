theorem h₃₁ (m n : ℕ) (h₀ : 0 < m ∧ 0 < n) (h₁ : m.gcd n = 8) (h₂ : m.lcm n = 112) : m.gcd n * m.lcm n = m * n := by -- rw [Nat.gcd_mul_lcm]
  hole