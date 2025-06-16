import Mathlib

open Polynomial Real Complex Matrix Filter Topology Multiset

/--
Let $f_0(x) = e^x$ and $f_{n+1}(x) = xf'_n(x)$ for all $n \ge 0$. Prove that $$\sum_{n=0}^{\infty} \frac{f_n(1)}{n!} = e^e.$$
-/