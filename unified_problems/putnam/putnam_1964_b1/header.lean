import Mathlib

open Set Function Filter Topology

/--
Let $a_n$ be a sequence of positive integers such that $\sum_{n=1}^{\infty} 1/a_n$ converges. For all $n$, let $b_n$ be the number of $a_n$ which are at most $n$. Prove that $\lim_{n \to \infty} b_n/n = 0$.
-/