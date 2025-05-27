import Mathlib

open Set Function

/--
The sequence of integers $u_n$ is bounded and satisfies
\[
u_n = \frac{u_{n-1} + u_{n-2} + u_{n-3}u_{n-4}}{u_{n-1}u_{n-2} + u_{n-3} + u_{n-4}}.
\]
Show that it is periodic for sufficiently large $n$.
-/