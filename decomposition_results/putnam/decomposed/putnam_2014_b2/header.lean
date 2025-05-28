import Mathlib

open Topology Filter Nat

-- Note: uses (ℝ → ℝ) instead of (Set.Icc (1 : ℝ) 3 → ℝ)
-- Real.log (4 / 3)
/--
Suppose that \( f \) is a function on the interval \([1,3]\) such that \(-1 \leq f(x) \leq 1\) for all \( x \) and \( \int_{1}^{3} f(x) \, dx = 0 \). How large can \(\int_{1}^{3} \frac{f(x)}{x} \, dx \) be?
-/