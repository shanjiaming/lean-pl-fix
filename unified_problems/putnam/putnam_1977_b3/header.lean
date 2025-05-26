import Mathlib

open RingHom Set Nat Filter Topology

-- False
/--
An ordered triple $(a, b, c)$ of positive irrational numbers with $a + b + c = 1$ is considered $\textit{balanced}$ if all three elements are less than $\frac{1}{2}$. If a triple is not balanced, we can perform a ``balancing act'' $B$ defined by $B(a, b, c) = (f(a), f(b), f(c))$, where $f(x) = 2x - 1$ if $x > 1/2$ and $f(x) = 2x$ otherwise. Will finitely many iterations of this balancing act always eventually produce a balanced triple?
-/