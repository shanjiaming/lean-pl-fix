import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Find the number of distinct positive divisors of $(30)^4$ excluding 1 and $(30)^4$. Show that it is 123.-/
theorem mathd_numbertheory_543 : (∑ k in Nat.divisors (30 ^ 4), 1) - 2 = 123 := by
  -- First, we need to compute the number of positive divisors of 30^4
  -- The number of positive divisors of a number can be determined from its prime factorization
  -- Let's begin by factorizing 30 into primes
  have prime_factors_30 : 30 = 2 * 3 * 5 := by norm_num
  
  -- Now, raise both sides to the 4th power
  have prime_factors_30_pow4 : 30^4 = (2 * 3 * 5)^4 := by rw [prime_factors_30]
  
  -- Expand the right-hand side using the power of a product property
  have expanded_form : (2 * 3 * 5)^4 = 2^4 * 3^4 * 5^4 := by
    rw [mul_pow, mul_pow]
    norm_num
  
  -- The number of positive divisors of a number n = p₁^a * p₂^b * p₃^c is (a+1)(b+1)(c+1)
  -- Therefore, for 30^4 = 2^4 * 3^4 * 5^4, the number of divisors is (4+1)(4+1)(4+1)
  have num_divisors : Nat.card (Nat.divisors (30^4)) = (4+1)*(4+1)*(4+1) := by
    -- Use the divisor count formula
    rw [exp_prime_factors_eq_divisors_count (a:=4) (b:=4) (c:=4)]
    -- Simplify the exponents
    simp only [add_eq, add_zero]
    -- Verify the prime factors
    rw [exp_prime_factors_eq_divisors_count_aux]
    · norm_num
    · norm_num
    · norm_num
  
  -- Calculate the actual number of divisors
  have computed_divisors : Nat.card (Nat.divisors (30^4)) = 125 := by
    rw [num_divisors]
    norm_num
  
  -- The problem asks for the count excluding 1 and 30^4 itself, so we subtract 2
  have final_count : (∑ k in Nat.divisors (30^4), 1) - 2 = 125 - 2 := by
    -- The sum of 1 over all divisors is just the count of divisors
    rw [sum_const]
    rw [Nat.smul_one_eq_coe]
    -- Convert the cardinality to the sum
    rw [←computed_divisors]
    -- Subtract the 2 excluded divisors
    norm_cast
    
  -- Simplify the right-hand side to get 123
  have simplified : 125 - 2 = 123 := by norm_num
  
  -- Combine all the steps to prove the theorem
  rw [final_count, simplified]