import Mathlib

open Set MvPolynomial

/--
Let $S$ be a set and let $\cdot$ be a binary operation on $S$ satisfying the two following laws: (1) for all $x$ in $S$, $x = x \cdot x$, (2) for all $x,y,z$ in $S$, $(x \cdot y) \cdot z) = (y \cdot z) \cdot x$. Show that $\cdot$ is associative and commutative.
-/