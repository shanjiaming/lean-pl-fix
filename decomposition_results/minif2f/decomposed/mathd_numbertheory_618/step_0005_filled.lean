theorem h₄ (n : ℕ) (hn : n > 0) (p : ℕ → ℕ) (h₀ : ∀ (x : ℕ), p x = x ^ 2 - x + 41) (h₁ : 1 < (p n).gcd (p (n + 1))) (h₂ : p (n + 1) = p n + 2 * n) : (p n).gcd (p n + 2 * n) = (p n).gcd (2 * n) := by
  --  --  rw [← Nat.add_zero (p n), Nat.gcd_comm] <;> simp [Nat.gcd_add_mul_right_right, Nat.gcd_comm]
  norm_num