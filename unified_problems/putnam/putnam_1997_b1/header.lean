import Mathlib

open Filter Topology

-- fun n => n
noncomputable def dist_to_int : ℝ → ℝ := fun r => |r - round r|
/--
Let $\{x\}$ denote the distance between the real number $x$ and the nearest integer.  For each positive integer $n$, evaluate \[F_n=\sum_{m=1}^{6n-1} \min(\{\frac{m}{6n}\},\{\frac{m}{3n}\}).\] (Here $\min(a,b)$ denotes the minimum of $a$ and $b$.)
-/