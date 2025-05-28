theorem h₃ (a : ℕ) (h₀ : a = ∑ k ∈ divisors 500, k) (h₁ : a = 1092) : ∑ k ∈ {x ∈ divisors 1092 | Nat.Prime x}, k = 25 :=
  by
  --  rw [show (1092 : ℕ) = 2 ^ 2 * 3 * 7 * 13 by norm_num]
  --  rw [Nat.divisors_mul, Nat.divisors_mul, Nat.divisors_mul] <;>
  --      norm_num [Nat.divisors_prime_pow, Finset.sum_filter, Finset.sum_range_succ, Nat.divisors] <;>
  --    rfl
  hole