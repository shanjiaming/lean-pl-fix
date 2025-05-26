import Mathlib

/--
Let $a_n$ denote the sequence $0, 1, 1, 2, 2, 3, \dots$, where $a_n = \frac{n}{2}$ if $n$ is even and $\frac{n - 1}{2}$ if n is odd. Furthermore, let $f(n)$ denote the sum of the first $n$ terms of $a_n$. Prove that all positive integers $x$ and $y$ with $x > y$ satisfy $xy = f(x + y) - f(x - y)$.
-/