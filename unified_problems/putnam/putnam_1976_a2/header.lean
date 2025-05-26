import Mathlib

open MvPolynomial

/--
Let $P(x, y) = x^2y + xy^2$, $Q(x, y) = x^2 + xy + y^2$, $F_n(x, y) = (x + y)^n - x^n - y^n$, and $G_n(x, y) = (x + y)^n + x^n + y^n$. Prove that for all positive integers $n$, either $F_n$ or $G_n$ can be represented as a polynomial in $P$ and $Q$ with integer coefficients.
-/