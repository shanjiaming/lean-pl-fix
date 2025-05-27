import Mathlib

open EuclideanGeometry Filter Topology Set

-- Note: uses (ℝ → ℝ) instead of (Set.Icc 0 1 → ℝ)
-- {f | ∃ A B : ℝ, ∀ x ∈ Set.Icc 0 1, f x = A * x + B}
/--
We call a function $f$ from $[0,1]$ to the reals to be supercontinuous on $[0,1]$ if the Cesaro-limit exists for the sequence $f(x_1), f(x_2), f(x_3), \dots$ whenever it does for the sequence $x_1, x_2, x_3 \dots$. Find all supercontinuous functions on $[0,1]$.
-/