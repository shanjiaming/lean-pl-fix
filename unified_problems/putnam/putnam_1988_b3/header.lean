import Mathlib

open Set Filter Topology

-- (1 + Real.sqrt 3) / 2
/--
For every $n$ in the set $N=\{1,2,\dots\}$ of positive integers, let $r_n$ be the minimum value of $|c-d \sqrt{3}|$ for all nonnegative integers $c$ and $d$ with $c+d=n$. Find, with proof, the smallest positive real number $g$ with $r_n \leq g$ for all $n \in N$.
-/