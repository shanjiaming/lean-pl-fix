theorem h₆₃ (m n : ℕ) (h₀ : 0 < m ∧ 0 < n) (h₁ : m.gcd n = 8) (h₂ : m.lcm n = 112) (h₃ : m * n = 896) (h₄ : m ∣ 112) (h₅ : 8 ∣ m) (h₆₁ : m ∣ 112) (h₆₂ : 8 ∣ m) : m > 0 := by -- linarith
  linarith