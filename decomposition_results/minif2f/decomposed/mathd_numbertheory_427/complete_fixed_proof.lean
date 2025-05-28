theorem mathd_numbertheory_427 (a : ℕ) (h₀ : a = ∑ k in Nat.divisors 500, k) :
  (∑ k in Finset.filter (fun x => Nat.Prime x) (Nat.divisors a), k) = 25:=
  by
  have h₁ : a = 1092:= by
    --  rw [h₀]
    --  rw [show (∑ k in Nat.divisors 500, k) = 1092
    --        by
    --        rw [show (500 : ℕ) = 2 ^ 2 * 5 ^ 3 by norm_num]
    --        rw [Nat.divisors_mul, Nat.divisors_prime_pow (by decide : Nat.Prime 2),
    --            Nat.divisors_prime_pow (by decide : Nat.Prime 5)] <;>
    --          rfl] <;>
      rfl
    hole
  have h₂ : (∑ k in Finset.filter (fun x => Nat.Prime x) (Nat.divisors a), k) = 25:=
    by
    --  rw [h₁]
    have h₃ : (∑ k in Finset.filter (fun x => Nat.Prime x) (Nat.divisors 1092), k) = 25:=
      by
      --  rw [show (1092 : ℕ) = 2 ^ 2 * 3 * 7 * 13 by norm_num]
      --  rw [Nat.divisors_mul, Nat.divisors_mul, Nat.divisors_mul] <;>
      --      norm_num [Nat.divisors_prime_pow, Finset.sum_filter, Finset.sum_range_succ, Nat.divisors] <;>
      --    rfl
      hole
    --  exact h₃
    hole
  --  exact h₂
  linarith