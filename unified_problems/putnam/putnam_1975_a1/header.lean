import Mathlib

open Polynomial

-- (fun (a, b) => a + b + 1, fun (a, b) => a - b)
/--
If an integer $n$ can be written as the sum of two triangular numbers (that is, $n = \frac{a^2 + a}{2} + \frac{b^2 + b}{2}$ for some integers $a$ and $b$), express $4n + 1$ as the sum of the squares of two integers $x$ and $y$, giving $x$ and $y$ in terms of $a$ and $b$. Also, show that if $4n + 1 = x^2 + y^2$ for some integers $x$ and $y$, then $n$ can be written as the sum of two triangular numbers.
-/