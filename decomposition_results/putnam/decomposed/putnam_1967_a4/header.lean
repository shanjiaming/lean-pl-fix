import Mathlib

open Nat Topology Filter

/--
Show that if $\lambda > \frac{1}{2}$ there does not exist a real-valued function $u$ such that for all $x$ in the closed interval $0 \leq x \leq 1$, $u(x)=1+\lambda\int_x^1 u(y)u(y-x)\,dy$.
-/