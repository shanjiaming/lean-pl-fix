import Mathlib

open Matrix Filter Topology Set Nat

/--
Let $D_n$ be the determinant of the $n$ by $n$ matrix whose value in the $i$th row and $j$th column is $|i-j|$. Show that $D_n = (-1)^{n-1} * (n-1) * (2^{n-2}).$
-/