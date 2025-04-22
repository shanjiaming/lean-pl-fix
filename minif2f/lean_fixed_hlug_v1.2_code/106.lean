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