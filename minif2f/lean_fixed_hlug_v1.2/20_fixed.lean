import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- How many natural numbers less than 1000 have exactly three distinct positive integer divisors? Show that it is 11.-/
theorem mathd_numbertheory_221 (S : Finset ℕ)
  (h₀ : ∀ x : ℕ, x ∈ S ↔ 0 < x ∧ x < 1000 ∧ x.divisors.card = 3) : S.card = 11 := by
  -- The key observation is that numbers with exactly three divisors must be squares of primes.
  -- This is because:
  -- - For a number n with prime factorization n = Π p_i^e_i, the number of divisors is Π (e_i + 1)
  -- - To get exactly 3 divisors, the exponents must be (2) (since 3 is prime, there can only be one prime factor)
  -- - Therefore n must be p^2 where p is prime, giving divisors {1, p, p^2}

  -- First, we'll find all prime squares less than 1000
  -- The largest prime whose square is less than 1000 is 31, since 31^2 = 961 < 1000 and 37^2 = 1369 > 1000

  -- Define the set of primes whose squares are less than 1000
  let primes_less_than_32 := Finset.filter (fun p => p.Prime) (Finset.range 32)
  -- Note: range 32 gives numbers from 0 to 31, and we'll filter primes from these

  -- The set S should be exactly the squares of these primes
  have h₁ : S = Finset.image (fun p => p^2) primes_less_than_32 := by
    -- Prove equality by showing both inclusions
    apply Finset.ext
    intro x
    rw [h₀]
    constructor
    · -- Forward direction: if x ∈ S, then x is a prime square
      intro hx
      obtain ⟨hx_pos, hx_lt, hx_div⟩ := hx
      -- x has exactly three divisors, so must be p^2 for some prime p
      have hx_pow : ∃ p : ℕ, p.Prime ∧ x = p^2 := by
        rw [Nat.divisors_card_eq_iff] at hx_div
        cases hx_div with
        | inl ⟨p, hp⟩ => 
          -- Case where x = p^2
          exact ⟨p, hp.1, hp.2⟩
        | inr ⟨p, hp⟩ =>
          -- Case where x = p^3, but this would have 4 divisors (1,p,p²,p³)
          -- So this contradicts hx_div = 3
          have p_div : p.divisors.card = 2 := by
            rw [Nat.prime_iff] at hp
            exact hp.2
          contradiction
      -- Now we know x is a prime square
      obtain ⟨p, hp_prime, hp_sq⟩ := hx_pow
      -- Since x < 1000, p < √1000 ≈ 31.6, so p ≤ 31
      have p_le_31 : p ≤ 31 := by
        rw [hp_sq] at hx_lt
        have := Nat.sqrt_lt_sqrt hx_lt
        rw [Nat.sqrt_eq 961] at this  -- 31^2 = 961
        exact Nat.lt_succ.mp this
      -- Therefore p is in our primes_less_than_32 set
      have p_in_primes : p ∈ primes_less_than_32 := by
        simp [primes_less_than_32]
        exact ⟨Nat.mem_range.mpr (Nat.lt_succ_of_le p_le_31), hp_prime⟩
      -- And thus x = p^2 is in the image
      simp [p_in_primes, hp_sq]
      exact ⟨hx_pos, hx_lt⟩
    · -- Reverse direction: if x is a prime square less than 1000, then x ∈ S
      intro hx
      obtain ⟨p, hp_mem, hp_sq⟩ := Finset.mem_image.mp hx
      rw [hp_sq]
      -- p is a prime in primes_less_than_32, so p^2 < 1000
      have p_lt_32 : p < 32 := by
        simp [primes_less_than_32] at hp_mem
        exact hp_mem.1
      have p_sq_lt : p^2 < 1000 := by
        calc p^2 ≤ 31^2 := by apply pow_le_pow_right; linarith
              _ = 961 := by norm_num
              _ < 1000 := by norm_num
      -- p^2 has exactly three divisors since p is prime
      have p_div : (p^2).divisors.card = 3 := by
        rw [Nat.divisors_prime_pow hp_mem.2]
        simp
      -- Therefore p^2 satisfies all conditions for S
      simp [hp_mem.2, p_sq_lt, p_div]
      exact Nat.pos_of_ne_zero (fun h => Nat.not_prime_zero (hp_mem.2.trans h.symm))

  -- Now we just need to count the primes less than 32
  -- The primes less than 32 are: 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31 (11 primes)
  have h₂ : primes_less_than_32.card = 11 := by
    -- We can compute this explicitly
    rw [primes_less_than_32]
    -- Filter primes from numbers 0-31
    have : (Finset.range 32).filter Nat.Prime = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31} := by
      apply Finset.ext
      intro x
      simp [Nat.prime_iff]
      constructor
      · intro ⟨hx_range, hx_prime⟩
        simp [Finset.mem_range, Nat.lt_succ_iff] at hx_range
        -- List all primes ≤ 31
        exact hx_prime.1
      · intro hx_mem
        -- Check that all listed numbers are indeed primes ≤ 31
        simp [Nat.prime_iff]
        repeat' (first | constructor | assumption)
    rw [this]
    -- Count the elements
    simp

  -- Finally, since S is the image of primes_less_than_32 under squaring,
  -- and squaring is injective on primes, the cardinality is preserved
  have h₃ : S.card = primes_less_than_32.card := by
    rw [h₁]
    apply Finset.card_image_of_injOn
    -- Squaring is injective on positive numbers
    intro p₁ hp₁ p₂ hp₂ h
    simp at hp₁ hp₂
    exact Nat.pow_left_inj (Nat.Prime.two_le hp₁.2) (Nat.Prime.two_le hp₂.2) (by linarith) h

  -- Combine the results to get S.card = 11
  rw [h₃, h₂]