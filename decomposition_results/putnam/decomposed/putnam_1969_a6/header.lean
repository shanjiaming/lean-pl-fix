import Mathlib

open Matrix Filter Topology Set Nat

/--
Let $(x_n)$ be a sequence, and let $y_n = x_{n-1} + 2*x_n$ for $n \geq 2$. Suppose that $(y_n)$ converges, then prove that $(x_n)$ converges.
-/