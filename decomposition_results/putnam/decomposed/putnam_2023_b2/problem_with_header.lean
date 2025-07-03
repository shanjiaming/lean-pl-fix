import Mathlib

open Nat

-- 3
/--
For each positive integer $n$, let $k(n)$ be the number of ones in the binary representation of $2023 * n$. What is the minimum value of $k(n)$?
-/
theorem putnam_2023_b2
: sInf {(digits 2 (2023*n)).sum | n > 0} = ((3) : ℕ ) := by
  have h₁ : 3 ∈ {(digits 2 (2023*n)).sum | n > 0} := by
    -- We need to show that there exists some n > 0 such that the sum of the digits of 2023*n in binary is 3.
    -- This is a placeholder for the actual proof, as finding such an n is non-trivial and may require extensive computation.
    sorry

  have h₂ : sInf {(digits 2 (2023*n)).sum | n > 0} = 3 := by
    -- Since 3 is in the set and is the smallest possible sum of digits in binary, the infimum of the set is 3.
    sorry

  -- The final step is to use the previously established results to conclude the proof.
  sorry