import Mathlib

open Set Topology Filter Polynomial

-- fun n ↦ (n - 1) / 2
/--
Let $F$ be a finite field with $n$ elements, and assume $n$ is odd. Suppose $x^2 + bx + c$ is an irreducible polynomial over $F$. For how many elements $d \in F$ is $x^2 + bx + c + d$ irreducible?
-/