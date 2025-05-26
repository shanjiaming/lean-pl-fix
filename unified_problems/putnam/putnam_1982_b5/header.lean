import Mathlib

open Set Function Filter Topology Polynomial Real

/--
For all $x > e^e$, let $S = u_0, u_1, \dots$ be a recursively defined sequence with $u_0 = e$ and $u_{n+1} = \log_{u_n} x$ for all $n \ge 0$. Prove that $S_x$ converges to some real number $g(x)$ and that this function $g$ is continuous for $x > e^e$.
-/