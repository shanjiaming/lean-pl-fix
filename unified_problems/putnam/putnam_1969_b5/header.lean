import Mathlib

open Matrix Filter Topology Set Nat

/--
Let $a_1 < a_2 < a_3 < \dots$ be an increasing sequence of positive integers. Assume that the sequences $\sum_{i = 1}^{\infty} 1/(a n)$ is convergent. For any number $x$, let $k(x)$ be the number of $a_n$'s which do not exceed $x$. Show that $\lim_{x \to \infty} k(x)/x = 0$.
-/