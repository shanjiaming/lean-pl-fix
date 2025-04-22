import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- For each positive integer $n$, let $n!$ denote the product $1\cdot 2\cdot 3\cdot\,\cdots\,\cdot (n-1)\cdot n$.

What is the remainder when $9!$ is divided by $10$? Show that it is 0.-/
theorem mathd_numbertheory_739 : 9! % 10 = 0 := by
  -- Compute 9! explicitly
  have h9fact : 9! = 362880 := by rfl -- 9! = 362880
  -- Show that 362880 is divisible by 10
  have hdiv : 10 ∣ 362880 := by
    -- Factorize 362880 / 10 = 36288, so 362880 = 10 * 36288
    use 36288
  exact Nat.mod_eq_zero_of_dvd hdiv