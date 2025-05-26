import Mathlib

open Topology Filter Nat

-- Note: This problem may have multiple correct answers.
-- (Polynomial.X + 3, -Polynomial.X - 2)
/--
Let $n$ be a positive integer, and define $f(n)=1!+2!+\dots+n!$. Find polynomials $P(x)$ and $Q(x)$ such that $f(n+2)=P(n)f(n+1)+Q(n)f(n)$ for all $n \geq 1$.
-/