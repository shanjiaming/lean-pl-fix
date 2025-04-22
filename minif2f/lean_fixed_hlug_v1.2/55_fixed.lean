import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- What is the result when the greatest common factor of 6432 and 132 is increased by 11? Show that it is 23.-/
theorem mathd_numbertheory_45 : Nat.gcd 6432 132 + 11 = 23 := by
  -- To prove this, we need to compute gcd(6432, 132) and show it equals 12
  -- Then adding 11 gives us 23 as required

  -- First, simplify both numbers by factoring out common powers of 2
  -- 6432 ÷ 4 = 1608, 132 ÷ 4 = 33, so gcd(6432,132) = 4 × gcd(1608,33)
  have h₁ : Nat.gcd 6432 132 = 4 * Nat.gcd 1608 33 := by
    simp
  have h₂ : Nat.gcd 1608 33 = 3 := by
    rw [Nat.gcd_rec]  -- Apply Euclidean algorithm step
    simp
  rw [h₁, h₂]
  -- Now compute 12 + 11 = 23