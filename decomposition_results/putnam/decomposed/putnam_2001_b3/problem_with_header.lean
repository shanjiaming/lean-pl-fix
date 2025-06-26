import Mathlib

open Topology Filter Polynomial Set

-- 3
/--
For any positive integer $n$, let $\langle n \rangle$ denote the closest integer to $\sqrt{n}$. Evaluate $\sum_{n=1}^\infty \frac{2^{\langle n \rangle}+2^{-\langle n \rangle}}{2^n}$.
-/
theorem putnam_2001_b3 : ∑' (n : ℕ), (if n ≥ 1 then ((2 : ℝ) ^ (round (Real.sqrt n)) + (2 : ℝ) ^ (-round (Real.sqrt n))) / 2 ^ n else 0) = 3 := by sorry