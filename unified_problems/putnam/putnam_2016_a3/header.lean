import Mathlib

open Polynomial Filter Topology Real Set Nat

-- 3 * Real.pi / 8
/--
Suppose that $f$ is a function from $\mathbb{R}$ to $\mathbb{R}$ such that
\[
f(x) + f\left( 1 - \frac{1}{x} \right) = \arctan x
\]
for all real $x \neq 0$. (As usual, $y = \arctan x$ means $-\pi/2 < y < \pi/2$ and $\tan y = x$.) Find
\[
\int_0^1 f(x)\,dx.
\]
-/