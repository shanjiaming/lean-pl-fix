import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- What is the remainder when $1 + 2 + 3 + 4 + \dots + 9 + 10$ is divided by 9? Show that it is 1.-/
theorem mathd_numbertheory_466 : (∑ k in Finset.range 11, k) % 9 = 1 := by
  -- First, let's compute the sum of numbers from 0 to 10 (Finset.range 11 includes numbers from 0 to 10)
  -- The sum can be computed using the formula for the sum of the first n natural numbers: n(n+1)/2
  -- Here n = 10, so the sum should be 10*11/2 = 55

  -- We'll start by rewriting the sum using the known formula
  rw [Finset.sum_range_id]  -- This converts ∑ k in Finset.range 11, k to 10 * (10 + 1) / 2

  -- Now we need to compute 10 * 11 / 2
  -- First compute numerator: 10 * 11 = 110
  -- Then divide by 2: 110 / 2 = 55
  -- So we have the sum equals 55

  -- Now we need to compute 55 % 9
  -- Let's compute how many full 9's are in 55: 9 * 6 = 54
  -- The remainder is 55 - 54 = 1
  -- Therefore 55 % 9 = 1

  -- In Lean, we can use norm_num to compute this numerically
  norm_num  -- This simplifies 10 * (10 + 1) / 2 % 9 to 1

  -- The proof is now complete, showing the remainder is indeed 1