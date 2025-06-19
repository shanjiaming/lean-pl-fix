import Mathlib

-- (fun a b : ℝ => (Real.exp (a ^ 2 * b ^ 2) - 1) / (a * b))
/--
Evaluate $\int_0^a \int_0^b e^{\max\{b^2x^2,a^2y^2\}}\,dy\,dx$ where $a$ and $b$ are positive.
-/