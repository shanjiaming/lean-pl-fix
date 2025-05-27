import Mathlib

open Polynomial Filter Topology

-- (4, 1)
/--
Find $$\lim_{n \to \infty} \frac{1}{n} \sum_{k=1}^{n}\left(\left\lfloor \frac{2n}{k} \right\rfloor - 2\left\lfloor \frac{n}{k} \right\rfloor\right).$$ Your answer should be in the form $\ln(a) - b$, where $a$ and $b$ are positive integers.
-/