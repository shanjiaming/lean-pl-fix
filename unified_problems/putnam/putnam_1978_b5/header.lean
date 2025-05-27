import Mathlib

open Set Real Filter Topology Polynomial

-- 4 * X ^ 4 - 4 * X ^ 2 + 1
/--
Find the real polynomial $p(x)$ of degree $4$ with largest possible coefficient of $x^4$ such that $p([-1, 1]) \subseteq [0, 1]$.
-/