import Mathlib

open Filter Topology

-- False
/--
Define $f : \mathbb{R} \to \mathbb{R} by $f(x) = x$ if $x \leq e$ and $f(x) = x * f(\ln(x))$ if $x > e$. Does $\sum_{n=1}^{\infty} 1/(f(n))$ converge?
-/