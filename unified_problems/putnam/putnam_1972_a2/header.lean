import Mathlib

open EuclideanGeometry Filter Topology Set

/--
Let $S$ be a set and $\cdot$ be a binary operation on $S$ satisfying: (1) for all $x,y$ in $S$, $x \cdot (x \cdot y) = y$ (2) for all $x,y$ in $S$, $(y \cdot x) \cdot x = y$. Show that $\cdot$ is commutative but not necessarily associative.
-/