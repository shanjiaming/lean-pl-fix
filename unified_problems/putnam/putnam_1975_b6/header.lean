import Mathlib

open Polynomial Real Complex Matrix Filter Topology Multiset

/--
Show that if $s_n = 1 + \frac{1}{2} + \frac{1}{3} + \dots + 1/n, then $n(n+1)^{1/n} < n + s_n$ whenever $n > 1$ and $(n-1)n^{-1/(n-1)} < n - s_n$ whenever $n > 2$.
-/