import Mathlib

open Function Filter Topology

/--
Assume that the system of simultaneous differentiable equations \[y' = -z^3, z' = y^3\] with the initial conditions $y(0) = 1, z(0) = 0$ has a unique solution $y = f(x), z = g(x)$ defined for all real $x$. Prove that there exists a positive constant $L$ such that for all real $x$, \[f(x) + L = f(x), g(x + L) = g(x).\]
-/