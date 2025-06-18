theorem imo_1959_p1 (n : ℕ) (h₀ : 0 < n) : Nat.gcd (21 * n + 4) (14 * n + 3) = 1 := by
  have h₁ : Nat.gcd (21 * n + 4) (14 * n + 3) = Nat.gcd (14 * n + 3) (7 * n + 1) := by
    have h₁₀ : Nat.gcd (21 * n + 4) (14 * n + 3) = Nat.gcd (14 * n + 3) (7 * n + 1) := by
      admit
    admit
  
  have h₂ : Nat.gcd (14 * n + 3) (7 * n + 1) = Nat.gcd (7 * n + 1) 1 := by
    have h₂₁ : Nat.gcd (14 * n + 3) (7 * n + 1) = Nat.gcd (7 * n + 1) 1 := by
      have h₂₁₁ : Nat.gcd (14 * n + 3) (7 * n + 1) = Nat.gcd (7 * n + 1) 1 := by
        admit
      admit
    admit
  
  have h₃ : Nat.gcd (7 * n + 1) 1 = 1 := by
    have h₃₁ : Nat.gcd (7 * n + 1) 1 = 1 := by
      norm_num
    norm_num
  
  have h₄ : Nat.gcd (21 * n + 4) (14 * n + 3) = 1 := by
    admit
  
  admit
