import Mathlib

open Topology Filter Nat Function Polynomial

-- 3984
/--
Let $p(x)$ be a nonzero polynomial of degree less than $1992$ having no nonconstant factor in common with $x^3 - x$. Let
\[
\frac{d^{1992}}{dx^{1992}} \left( \frac{p(x)}{x^3 - x} \right) = \frac{f(x)}{g(x)}
\]
for polynomials $f(x)$ and $g(x)$. Find the smallest possible degree of $f(x)$.
-/