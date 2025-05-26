import Mathlib

open Topology Filter Set Polynomial Function

-- True
/--
Let $P(x)$ be a polynomial with real coefficients; let $$Q(x) = (x^2 + 1)P(x)P'(x) + x((P(x))^2 + (P'(x))^2).$$
Given that $P$ has $n$ distinct real roots all greater than $1$, prove or disprove that $Q$ must have at least $2n - 1$ distinct real roots.
-/