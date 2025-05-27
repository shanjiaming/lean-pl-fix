import Mathlib

open Finset Polynomial

-- {X - 1, -(X - 1), X + 1, -(X + 1), X^2 + X - 1, -(X^2 + X - 1), X^2 - X - 1, -(X^2 - X - 1), X^3 + X^2 - X - 1, -(X^3 + X^2 - X - 1), X^3 - X^2 - X + 1, -(X^3 - X^2 - X + 1)}
/--
Find all polynomials of the form $\sum_{0}^{n} a_{i} x^{n-i}$ with $n \ge 1$ and $a_i = \pm 1$ for all $0 \le i \le n$ whose roots are all real.
-/