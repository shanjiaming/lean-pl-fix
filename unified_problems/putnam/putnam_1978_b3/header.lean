import Mathlib

open Set Real Filter Topology Polynomial

/--
The polynomials $P_n(x)$ are defined by
\begin{align*}
P_1(x) &= 1 + x, \\
P_2(x) &= 1 + 2x, \\
P_{2n+1}(x) &= P_{2n}(x) + (n + 1) x P_{2n-1}(x), \\
P_{2n+2}(x) &= P_{2n+1}(x) + (n + 1) x P_{2n}(x).
\end{align*}
Let $a_n$ be the largest real root of $P_n(x)$. Prove that $a_n$ is strictly monotonically increasing and tends to zero.
-/