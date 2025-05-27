import Mathlib

open Topology Filter Nat Function

-- fun k ↦ ite (Even k) ((-1) ^ (k / 2) * factorial k) 0
/--
Let $f$ be an infinitely differentiable real-valued function defined on the real numbers. If
\[
f\left( \frac{1}{n} \right) = \frac{n^2}{n^2 + 1}, \qquad n = 1, 2, 3, \dots,
\]
compute the values of the derivatives $f^{(k)}(0), k = 1, 2, 3, \dots$.
-/