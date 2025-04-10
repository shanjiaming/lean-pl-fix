import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Suppose $m$ is a two-digit positive integer such that $6^{-1}\pmod m$ exists and $6^{-1}\equiv 6^2\pmod m$. What is $m$? Show that it is 43.-/
theorem mathd_numbertheory_780 (m x : ℤ) (h₀ : 0 ≤ x) (h₁ : 10 ≤ m ∧ m ≤ 99) (h₂ : 6 * x % m = 1)
  (h₃ : (x - 6 ^ 2) % m = 0) : m = 43 := by
  -- We need to find a two-digit integer m where:
  -- 1. 6 has a multiplicative inverse modulo m (i.e., gcd(6,m) = 1)
  -- 2. The inverse x satisfies x ≡ 6² mod m
  -- From h₂, we know 6x ≡ 1 mod m, so x is the inverse of 6 mod m
  -- From h₃, we have x ≡ 36 mod m

  -- Since x is both the inverse of 6 and congruent to 36 mod m, we can substitute:
  -- 6 * 36 ≡ 1 mod m
  -- Which simplifies to:
  -- 216 ≡ 1 mod m
  -- Or equivalently:
  -- m divides (216 - 1) = 215

  -- First, let's compute the divisors of 215 in the two-digit range
  have h215 : 215 = 5 * 43 := by norm_num
  -- The positive divisors of 215 are 1, 5, 43, 215
  -- Only 43 is a two-digit number (10 ≤ m ≤ 99)

  -- Now we need to verify that m = 43 satisfies all conditions
  -- First check that gcd(6,43) = 1 (inverse exists)
  have hgcd : Nat.gcd 6 43 = 1 := by norm_num
  -- Now find x such that 6x ≡ 1 mod 43
  -- We can verify that 6 * 36 = 216 ≡ 1 mod 43 (since 216 - 1 = 215 = 5*43)
  -- Thus x = 36 is the inverse

  -- Check that x ≡ 36 ≡ 6² mod 43 (which is trivially true)
  -- Therefore m = 43 satisfies all conditions

  -- To complete the proof, we show that no other two-digit number divides 215
  -- The only possible candidates are divisors of 215 in [10,99]
  have m_pos : 0 < m := by linarith [h₁.1]
  have m_dvd : m ∣ 215 := by
    -- From 6x ≡ 1 mod m and x ≡ 36 mod m, we get 6*36 ≡ 1 mod m
    -- So 216 ≡ 1 mod m ⇒ m ∣ (216 - 1)
    rw [<- mul_inv_cancel]
    rw [Int.modEq_iff_dvd] at h₃
    rw [sub_eq_iff_eq_add] at h₃
    have h₄ := congr_arg (fun y => 6 * y) h₃
    simp at h₄
    rw [mul_add, mul_pow] at h₄
    rw [← h₂] at h₄
    have h₅ : (6 * x) % m = (1 + m * ((6 * x) / m)) % m := by
      rw [Int.emod_add_ediv]
    rw [h₅] at h₄
    simp at h₄
    have h₆ : (1 + m * ((6 * x) / m) - 1) = m * ((6 * x) / m) := by ring
    rw [h₆] at h₄
    rw [Int.modEq_zero_iff_dvd, mul_comm] at h₄
    have h₇ : 216 = 6^3 := by norm_num
    rw [h₇] at h₄
    exact h₄

  -- Now we enumerate possible two-digit divisors of 215
  have h_divisors : m = 5 ∨ m = 43 ∨ m = 215 := by
    rw [h215]
    have h_prime_5 : Prime (5 : ℤ) := by norm_num
    have h_prime_43 : Prime (43 : ℤ) := by norm_num
    exact Prime.dvd_mul h_prime_5 h_prime_43 m m_dvd
  -- Eliminate impossible cases based on two-digit constraint
  cases h_divisors with
  | inl h5 => 
    -- m = 5 is not a two-digit number
    have := h₁.1
    rw [h5] at this
    linarith
  | inr h_rest =>
    cases h_rest with
    | inl h43 => 
      -- m = 43 is valid
      exact h43
    | inr h215 => 
      -- m = 215 is not a two-digit number
      have := h₁.2
      rw [h215] at this
      linarith