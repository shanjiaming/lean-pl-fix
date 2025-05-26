import Mathlib

open Nat Set

-- uses (ℕ → ℤ × ℤ) instead of (Icc 1 (3 * n) → ℤ × ℤ)
-- fun n ↦ if n = 1 then 0 else 2 ^ (n - 2)
/--
Let $\mathbf{S} = \{(a,b) | a = 1, 2, \dots,n, b = 1,2,3\}$.
A \emph{rook tour} of $\mathbf{S}$ is a polygonal path made up of line segments connecting points $p_1, p_2, \dots, p_{3n}$ in sequence such that
\begin{enumerate}
\item[(i)] $p_i \in \mathbf{S}$,
\item[(ii)] $p_i$ and $p_{i+1}$ are a unit distance apart, for
$1 \leq i <3n$,
\item[(iii)] for each $p \in \mathbf{S}$ there is a unique $i$ such that
$p_i = p$.
\end{enumerate}
How many rook tours are there that begin at $(1,1)$
and end at $(n,1)$?
-/