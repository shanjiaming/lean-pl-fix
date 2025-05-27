import Mathlib

open Polynomial

-- (fun r : ℝ => -1/(r + 1), fun r : ℝ => -(r + 1)/r)
/--
Let $r$ be a real root of $P(x) = x^3 + ax^2 + bx - 1$, where $a$ and $b$ are integers and $P$ is irreducible over the rationals. Suppose that $r + 1$ is a root of $x^3 + cx^2 + dx + 1$, where $c$ and $d$ are also integers. Express another root $s$ of $P$ as a function of $r$ that does not depend on the values of $a$, $b$, $c$, or $d$.
-/