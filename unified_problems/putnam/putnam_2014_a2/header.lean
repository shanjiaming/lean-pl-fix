import Mathlib

open Topology Filter Nat

-- (fun n : ℕ => (-1) ^ (n - 1) / ((n - 1)! * (n)!))
/--
Let $A$ be the $n \times n$ matrix whose entry in the $i$-th row and $j$-th column is $\frac{1}{\min(i,j)}$ for $1 \leq i,j \leq n$. Compute $\det(A)$.
-/