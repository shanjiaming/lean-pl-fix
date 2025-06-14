import Mathlib

open Nat Set

/--
Let $P(x_1,\dots,x_n)$ denote a polynomial with real coefficients in the variables $x_1, \dots, x_n$, and suppose that
\[
\left( \frac{\partial^2}{\partial x_1^2} + \cdots + \frac{\partial^2}{\partial x_n^2}\right) P(x_1, \dots,x_n) = 0 \quad \mbox{(identically)}
\]
and that
\[
x_1^2 + \cdots + x_n^2 \mbox{ divides } P(x_1, \dots, x_n).
\]
Show that $P=0$ identically.
-/