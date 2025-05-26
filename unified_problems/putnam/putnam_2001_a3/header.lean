import Mathlib

open Topology Filter Polynomial Set

-- {m : ℤ | ∃ k : ℤ, k^2 = m ∨ 2*k^2 = m}
/--
For each integer $m$, consider the polynomial
\[P_m(x)=x^4-(2m+4)x^2+(m-2)^2.\] For what values of $m$ is $P_m(x)$
the product of two non-constant polynomials with integer coefficients?
-/