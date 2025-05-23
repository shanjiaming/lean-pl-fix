import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Show that for any natural number $n$, $7$ does not divide $2^n + 1$.
-/
theorem imo_1964_p1_2 (n : ℕ) : ¬7 ∣ 2 ^ n + 1 := by
  -- We proceed by contradiction, assuming 7 divides 2^n + 1
  intro h
  -- This means there exists some k such that 7k = 2^n + 1
  rcases h with ⟨k, hk⟩
  -- Rewrite the equation as 2^n ≡ -1 mod 7
  have hmod : 2 ^ n ≡ -1 [MOD 7] := by
    rw [Nat.ModEq]
    omega
    simp [add_comm]
  
  -- We'll use Fermat's Little Theorem which tells us 2^6 ≡ 1 mod 7
  have flt : 2 ^ 6 ≡ 1 [MOD 7] := by
    have := Nat.modEq_of_dvd (Nat.modEq_sub (m := 1) (by norm_num))
    simp [show 7 ∣ 2 ^ 6 - 1 by norm_num]
  
  -- The order of 2 modulo 7 is 3, since 2^3 ≡ 1 mod 7
  have order_two : orderOf 2 (ZMod 7) = 3 := by
    apply orderOf_eq_prime
    · rw [← ZMod.natCast_eq_natCast_iff]
      simp only [Nat.cast_pow, Nat.cast_ofNat]
      norm_num
    · intro m hm
      rw [← ZMod.natCast_eq_natCast_iff] at hm
      simp only [Nat.cast_pow, Nat.cast_ofNat] at hm
      -- Check possible divisors of 3 (which is prime)
      interval_cases m
      · norm_num at hm
      · rfl
  
  -- Since the order is 3, exponents can be reduced modulo 3
  omega
  have h_periodic : ∀ m, 2 ^ m ≡ 2 ^ (m % 3) [MOD 7] := by
    intro m
    rw [← order_two, ← ZMod.natCast_eq_natCast_iff]
    simp [pow_eq_pow_mod_orderOf]
  
  -- Consider n modulo 3 (the possible remainders are 0, 1, 2)
  cases' Nat.mod_eq_zero_or_one_or_two_of_mod_lt n 3 (by norm_num) with hn0 hn12
  · -- Case when n ≡ 0 mod 3
    rw [h_periodic n, hn0] at hmod
    simp at hmod
    norm_num at hmod -- Leads to 1 ≡ -1 mod 7, which is false
    contradiction
  · cases' hn12 with hn1 hn2
    · -- Case when n ≡ 1 mod 3
      rw [h_periodic n, hn1] at hmod
      simp at hmod
      norm_num at hmod -- Leads to 2 ≡ -1 mod 7, which is false
      contradiction
    · -- Case when n ≡ 2 mod 3
      rw [h_periodic n, hn2] at hmod
      simp at hmod
      norm_num at hmod -- Leads to 4 ≡ -1 mod 7, which is false
      contradiction