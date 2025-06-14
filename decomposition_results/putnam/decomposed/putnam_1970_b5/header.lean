import Mathlib

open Metric Set EuclideanGeometry Filter Topology

/--
Let $u_n$ denote the function $u_n(x) = -n$ if $x \leq -n$, $x$ if $-n < x \leq n$, and $n$ otherwise. Let $F$ be a function on the reals. Show that $F$ is continuous if and only if $u_n \circ F$ is continuous for all natural numbers $n$.
-/