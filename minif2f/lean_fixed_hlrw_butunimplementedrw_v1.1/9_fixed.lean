import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- What is the greatest common factor of $20 !$ and $200,\!000$?  (Reminder: If $n$ is a positive integer, then $n!$ stands for the product $1\cdot 2\cdot 3\cdot \cdots \cdot (n-1)\cdot n$.) Show that it is 40,\!000.-/
theorem mathd_numbertheory_169 : Nat.gcd 20! 200000 = 40000 := by
  -- Compute the prime factorizations of 200000 and 20!
  have h200000 : 200000 = 2^6 * 5^5 := by norm_num
  -- The exponent of 2 in 20! is ∑_{k=1}^∞ floor(20 / 2^k) = 10 + 5 + 2 + 1 = 18
  have h2_fact : Nat.factorization (20 !) 2 = 18 := by
    rw [Nat.prime_factorial_iff two_prime]
    simp only [Nat.prime_two, Nat.cast_ofNat, Nat.factorial_eq_prod, Nat.prod_factorization_eq_prod_pow]
    norm_num
  -- The exponent of 5 in 20! is ∑_{k=1}^∞ floor(20 / 5^k) = 4 + 0 = 4
  have h5_fact : Nat.factorization (20 !) 5 = 4 := by
    rw [Nat.prime_factorial_iff (by exact Nat.prime_five)]
    simp only [Nat.prime_five, Nat.cast_ofNat, Nat.factorial_eq_prod, Nat.prod_factorization_eq_prod_pow]
    norm_num
  -- The gcd is the product of the minimum exponents for each prime
  -- For 2: min(18, 6) = 6
  -- For 5: min(4, 5) = 4
  -- Other primes have exponent 0 in 200000, so they don't contribute to the gcd
  rw [Nat.gcd_eq_of_factorization_le (a := 20!) (b := 200000)]
  -- Simplify the factorization expression
  simp only [h200000, Nat.factorization_pow, Nat.factorization_mul, Nat.factorization_of_prime Nat.prime_two,
    Nat.factorization_of_prime (by exact Nat.prime_five), h2_fact, h5_fact]
  -- The gcd's factorization is 2^6 * 5^4
  have hgcd : 40000 = 2^6 * 5^4 := by norm_num
  -- Apply the factorization to the gcd
  rw [hgcd, Nat.factorization_mul, Nat.factorization_pow, Nat.factorization_pow,
    Nat.factorization_of_prime Nat.prime_two, Nat.factorization_of_prime (by exact Nat.prime_five)]
  -- Simplify the exponents
  simp only [Nat.prime_two, Nat.prime_five, Nat.cast_ofNat, ite_true, Finsupp.coe_add, Pi.add_apply,
    Finsupp.coe_smul, Finsupp.coe_zero, Pi.zero_apply, Pi.smul_apply, smul_eq_mul, mul_one]
  -- The exponents for 2 and 5 match
  congr
  -- No other primes contribute to the gcd
  ext p
  simp only [Finsupp.coe_zero, Pi.zero_apply]
  -- Show that for primes other than 2 and 5, the exponent is 0
  by_cases hp : p = 2 ∨ p = 5
  · cases hp with
    | inl h => simp [h]
    | inr h => simp [h]
  · simp [hp]