import Mathlib

open Nat Set MeasureTheory Topology Filter

/--
Let $p > 1$ be an integer with the property that $x^2 - x + p$ is prime for all $x$ in the range $0 < x < p$. Show there exists exactly one triple of integers $a,b,c$ satisfying $b^2 - 4ac = 1 - 4p$, $0 < a \leq c$, and $-a \leq b < a$.
-/