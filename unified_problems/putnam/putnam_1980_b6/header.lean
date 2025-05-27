import Mathlib

open Set

/--
For integers $d, n$ with $1 \le d \le n$, let $G(1, n) = \frac{1}{n}$ and $G(d, n) = \frac{d}{n}\sum_{i=d}^{n}G(d - 1, i - 1)$ for all $d > 1$. If $1 < d \le p$ for some prime $p$, prove that the reduced denominator of $G(d, p)$ is not divisible by $p$.
-/