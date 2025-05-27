import Mathlib

open Set Function Filter Topology Polynomial Real

-- True
/--
Let $B_n(x) = 1^x + 2^x + \dots + n^x$ and let $f(n) = \frac{B_n(\log_n 2)}{(n \log_2 n)^2}$. Does $f(2) + f(3) + f(4) + \dots$ converge?
-/