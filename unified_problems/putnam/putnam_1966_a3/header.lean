import Mathlib

open Topology Filter

/--
If $0 < x_1 < 1$ and $x_{n+1} = x_n(1 - x_n)$ for all $n \ge 1$, prove that $\lim_{n \to \infty} nx_n = 1$.
-/