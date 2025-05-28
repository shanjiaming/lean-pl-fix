theorem h₈ (n : ℕ) (h₀ : 9 ≤ n) (h₂ : (n + 2)! = (n + 2) * (n + 1) * n !) (h₃ : (n + 1)! = (n + 1) * n !) (h₄ : ↑(n + 2)! = ↑(n + 2) * ↑(n + 1) * ↑n !) (h₅ : ↑(n + 1)! = ↑(n + 1) * ↑n !) (h₆ : ↑(n + 2)! - ↑(n + 1)! = ↑(n + 1) ^ 2 * ↑n !) : ↑n ! ≠ 0 := by
  --  norm_cast
  --  exact Nat.factorial_ne_zero n
  hole