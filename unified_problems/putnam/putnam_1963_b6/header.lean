import Mathlib

open Topology Filter Polynomial

/--
Let $E$ be a Euclidean space of at most three dimensions. If $A$ is a nonempty subset of $E$, define $S(A)$ to be the set of all points that lie on closed segments joining pairs of points of $A$. For a given nonempty set $A_0$, define $A_n=S(A_{n-1})$ for $n=1,2,\dots$. Prove that $A_2=A_3=\cdots$. (A one-point set should be considered to be a special case of a closed segment.)
-/