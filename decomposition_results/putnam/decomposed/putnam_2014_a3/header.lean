import Mathlib

open Topology Filter Nat

-- 3 / 7
/--
Let \( a_0 = \frac{5}{2} \) and \( a_k = a_{k-1}^2 - 2 \) for \( k \geq 1 \). Compute \( \prod_{k=0}^{\infty} \left(1 - \frac{1}{a_k}\right) \) in closed form.
-/