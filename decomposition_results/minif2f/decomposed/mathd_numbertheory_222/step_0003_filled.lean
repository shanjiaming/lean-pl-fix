theorem h₂₁ (b : ℕ) (h₀ : Nat.lcm 120 b = 3720) (h₁ : Nat.gcd 120 b = 8) : Nat.gcd 120 b * Nat.lcm 120 b = 120 * b := by -- rw [Nat.gcd_mul_lcm]
  hole