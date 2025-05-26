import Mathlib

open Matrix Filter Topology Set Nat

/--
Consider the system of differential equations $$\frac{dx}{dt} = -2y + u(t), \frac{dy}{dt} = -2x + u(t)$$ for some continuous function $u(t)$. Prove that, if $x(0) \ne y(0)$, the solution will never pass through $(0, 0)$ regardless of the choice of $u(t)$, and if $x(0) = y(0)$, a suitable $u(t)$ can be chosen for any $T > 0$ so that $(x(T), y(T)) = (0, 0)$.
-/