import Mathlib

open MeasureTheory Set

-- {f : ℝ → ℝ | ∃ a c : ℝ, a ≥ 0 ∧ f = fun x ↦ a / (1 - c * x) ^ 2}
/--
Find every real-valued function $f$ whose domain is an interval $I$ (finite or infinite) having 0 as a left-hand endpoint, such that for every positive member $x$ of $I$ the average of $f$ over the closed interval $[0, x]$ is equal to the geometric mean of the numbers $f(0)$ and $f(x)$.
-/