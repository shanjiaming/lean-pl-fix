import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- What is the sum of all of the positive factors of $36$? Show that it is 91.-/
theorem mathd_numbertheory_32 (S : Finset ℕ) (h₀ : ∀ n : ℕ, n ∈ S ↔ n ∣ 36) : (∑ k in S, k) = 91 := by
  -- First, we need to find all positive divisors of 36. The prime factorization of 36 is 2² × 3².
  -- The number of divisors is given by (2+1)(2+1) = 9.
  
  -- To compute the sum of divisors, we can use the multiplicative property:
  -- σ(36) = σ(2²) × σ(3²) = (1 + 2 + 4) × (1 + 3 + 9) = 7 × 13 = 91
  
  -- In Lean, we'll proceed by:
  -- 1. Showing that S must be exactly the divisors of 36
  -- 2. Computing the sum of these divisors
  
  -- First, let's prove that S contains exactly the divisors of 36
  have hS : S = Nat.divisors 36 := by
    -- Two sets are equal if they have the same elements
    apply Finset.ext
    -- For any natural number n, n ∈ S ↔ n ∈ divisors 36
    intro n
    -- We know n ∈ S ↔ n ∣ 36 from h₀
    -- And by definition, n ∈ divisors 36 ↔ n ∣ 36
    rw [h₀, Nat.mem_divisors]
    -- We need to show n ≠ 0 since 36 ≠ 0
    simp
  
  -- Now rewrite the goal using the fact that S = divisors 36
  rw [hS]
  
  -- Compute the sum of divisors of 36
  -- We'll use the fact that 36 = 4 × 9 and 4 and 9 are coprime
  have h4 : 4 = 2^2 := by norm_num
  have h9 : 9 = 3^2 := by norm_num
  have h_coprime : Nat.Coprime 4 9 := by norm_num
  
  -- The sum of divisors function is multiplicative for coprime numbers
  rw [← h4, ← h9, Nat.sum_divisors_mul_sum_divisors h_coprime]
  
  -- Now compute σ(4) = σ(2²) = 1 + 2 + 4 = 7
  have sigma4 : ∑ k in Nat.divisors 4, k = 7 := by
    -- The divisors of 4 are {1, 2, 4}
    have h_div4 : Nat.divisors 4 = {1, 2, 4} := by
      apply Finset.ext
      intro n
      rw [Nat.mem_divisors]
      simp [ne_of_gt (by norm_num : 4 > 0), Nat.dvd_prime_pow (by norm_num : Nat.Prime 2)]
      decide
    rw [h_div4]
    norm_num
  
  -- Compute σ(9) = σ(3²) = 1 + 3 + 9 = 13
  have sigma9 : ∑ k in Nat.divisors 9, k = 13 := by
    -- The divisors of 9 are {1, 3, 9}
    have h_div9 : Nat.divisors 9 = {1, 3, 9} := by
      apply Finset.ext
      intro n
      rw [Nat.mem_divisors]
      simp [ne_of_gt (by norm_num : 9 > 0), Nat.dvd_prime_pow (by norm_num : Nat.Prime 3)]
      decide
    rw [h_div9]
    norm_num
  
  -- Combine the results: σ(36) = σ(4) × σ(9) = 7 × 13 = 91
  rw [sigma4, sigma9]
  norm_num