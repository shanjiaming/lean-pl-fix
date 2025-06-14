import Mathlib

open Matrix Filter Topology Set Nat

/--
Let $A$ be a $3 \times 2$ matrix and $B$ be a $2 \times 3$ matrix such that $$AB =
\begin{pmatrix}
8 & 2 & -2 \\
2 & 5 & 4 \\
-2 & 4 & 5
\end{pmatrix}.
$$ Prove that $$BA =
\begin{pmatrix}
9 & 0 \\
0 & 9
\end{pmatrix}.$$
-/