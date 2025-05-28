import Mathlib

open Matrix Filter Topology Set Nat

-- {{x} | x : ℝ} ∪ {Set.Ici x | x : ℝ} ∪ {Set.Iic x | x : ℝ} ∪ {Set.Iio x | x : ℝ} ∪ {Set.Ioi x | x : ℝ} ∪ {Set.univ}
/--
What are the possible ranges (across all real inputs $x$ and $y$) of a polynomial $f(x, y)$ with real coefficients?
-/