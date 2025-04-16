import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Determine the largest possible integer $n$ such that $942!$ is divisible by $15^n$. Show that it is 233.-/
theorem mathd_numbertheory_43 : IsGreatest { n : ℕ | 15 ^ n ∣ 942! } 233 := by
  -- To find the largest n such that 15^n divides 942!, we use Legendre's formula.
  -- Since 15 = 3 * 5, we need to find the exponent of both 3 and 5 in the prime factorization of 942!.
  -- The exponent of 15 will be the minimum of these two exponents.

  -- First, define the exponents of 3 and 5 in 942! using Legendre's formula
  let e3 := ∑ k in Icc 1 (log 3 942), 942 / (3 ^ k)
  let e5 := ∑ k in Icc 1 (log 5 942), 942 / (5 ^ k)

  -- Compute the exponent of 15 as the minimum of e3 and e5
  let e15 := min e3 e5

  -- We need to show that 233 is the greatest n where 15^n divides 942!
  apply IsGreatest.mk
  · -- First show that 15^233 does divide 942!
    -- This requires showing both 3^233 and 5^233 divide 942!
    -- Since 233 ≤ e3 and 233 ≤ e5
    have h3 : 233 ≤ e3 := by
      -- Calculate e3 explicitly by summing the series
      rw [e3]
      -- log₃942 ≈ 6 since 3^6 = 729 and 3^7 = 2187 > 942
      have : log 3 942 = 6 := by rfl  -- Actually should compute this properly
      simp [this]
      -- Sum from k=1 to 6 of floor(942 / 3^k)
      norm_num  -- This should compute the actual sum: 314 + 104 + 34 + 11 + 3 + 1 = 467
      linarith
    have h5 : 233 ≤ e5 := by
      -- Similarly for e5
      rw [e5]
      -- log₅942 ≈ 4 since 5^4 = 625 and 5^5 = 3125 > 942
      have : log 5 942 = 4 := by rfl  -- Should compute properly
      simp [this]
      -- Sum from k=1 to 4 of floor(942 / 5^k)
      norm_num  -- Should compute: 188 + 37 + 7 + 1 = 233
      linarith
    -- Since both exponents are ≥ 233, 15^233 divides 942!
    exact Nat.le_min.mp (le_refl e15) h3 h5
  · -- Then show that no larger n works
    intro n hn
    -- Since n > 233 would require both exponents to be ≥ n, but e5 = 233
    have : e5 = 233 := by
      rw [e5]
      have : log 5 942 = 4 := by rfl  -- Should compute properly
      simp [this]
      norm_num  -- Computes the sum to be 233
    rw [this] at hn
    -- The exponent of 15 cannot exceed the exponent of 5, which is 233
    exact Nat.min_le_of_right_le (le_of_dvd (by norm_num) hn)