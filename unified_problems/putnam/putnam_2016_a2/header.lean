import Mathlib

open Polynomial Filter Topology Real Set Nat

-- (3 + √ 5) / 2
/--
Given a positive integer $n$, let $M(n)$ be the largest integer $m$ such that
\[
\binom{m}{n-1} > \binom{m-1}{n}.
\]
Evaluate
\[
\lim_{n \to \infty} \frac{M(n)}{n}.
\]
-/