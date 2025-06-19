import Mathlib

open Topology Filter

/--
Let $p_1, p_2, \dots$ be a sequence of positive real numbers. Prove that if $\sum_{n=1}^{\infty} \frac{1}{p_n}$ converges, then $$\sum_{n=1}^{\infty} \frac {n^2 p_n}{(\sum_{i=1}^{n} p_i)^2}$$ also converges.
-/