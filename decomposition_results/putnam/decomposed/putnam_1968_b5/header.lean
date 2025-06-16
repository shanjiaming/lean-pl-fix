import Mathlib

open Finset Polynomial Topology Filter Metric

-- fun p => p^2 + p
/--
Let $p$ be a prime number. Find the number of distinct $2 \times 2$ matrices $$\begin{pmatrix} a & b \\ c & d \end{pmatrix}$$ such that $a, b, c, d \in \{0, 1, ..., p - 1\}$, $a + d \equiv 1 \pmod p$, and $ad - bc \equiv 0 \pmod p$.
-/