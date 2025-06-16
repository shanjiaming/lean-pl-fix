import Mathlib

open Set Nat Polynomial Filter Topology

/--
Let $y(x)$ be a continuously differentiable real-valued function of a real vairable $x$. Show that if $(y')^2 + y^3 \to 0$ as $x \to +\infty$, then $y(x)$ and $y'(x) \to 0$ as $x \to +\infty$.
-/