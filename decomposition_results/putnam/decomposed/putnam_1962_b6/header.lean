import Mathlib

open Real

/--
Let \[ f(x) = \sum_{k=0}^n a_k \sin kx + b_k \cos kx, \] where $a_k$ and $b_k$ are constants. Show that, if $\lvert f(x) \rvert \le 1$ for $0 \le x \le 2 \pi$ and $\lvert f(x_i) \rvert = 1$ for $0 \le x_1 < x_2 < \cdots < x_{2n} < 2 \pi$, then $f(x) = \cos (nx + a)$ for some constant $a$.
-/