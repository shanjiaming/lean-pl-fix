theorem h₆₁ (m n : ℕ) (h₀ : m.gcd n = 6) (h₁ : m.lcm n = 126) (h₂ : m ≠ 0) (h₃ : n ≠ 0) (h₄ : m * n = 756) (h₅ : 6 ∣ m) : 6 ∣ m.gcd n := by -- norm_num [h₀]
  omega