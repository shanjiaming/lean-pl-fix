import Mathlib

open Set Function Filter Topology

/--
Prove that there exists a constant $k$ such that for any sequence $a_i$ of positive numbers,
\[
\sum_{n=1}^{\infty} \frac{n}{a_1 + a_2 + \dots + a_n} \leq k \sum_{n=1}^{\infty}\frac{1}{a_n}.
\]
-/