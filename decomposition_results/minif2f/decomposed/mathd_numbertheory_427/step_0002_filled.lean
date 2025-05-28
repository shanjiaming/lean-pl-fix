theorem h₁ (a : ℕ) (h₀ : a = ∑ k ∈ divisors 500, k) : a = 1092 := by
  --  rw [h₀]
  --  rw [show (∑ k in Nat.divisors 500, k) = 1092
  --        by
  --        rw [show (500 : ℕ) = 2 ^ 2 * 5 ^ 3 by norm_num]
  --        rw [Nat.divisors_mul, Nat.divisors_prime_pow (by decide : Nat.Prime 2),
  --            Nat.divisors_prime_pow (by decide : Nat.Prime 5)] <;>
  --          rfl] <;>
    rfl
  hole