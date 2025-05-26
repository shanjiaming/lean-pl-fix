import Mathlib

open Nat Topology Filter

-- Note: boosted domain of f to the 2D plane and made it partially differentiable everywhere
/--
Let $f$ be a real-valued function having partial derivatives and which is defined for $x^2+y^2 \leq 1$ and is such that $|f(x,y)| \leq 1$. Show that there exists a point $(x_0,y_0)$ in the interior of the unit circle such that $\left(\frac{\partial f}{\partial x} (x_0,y_0)\right)^2+\left(\frac{\partial f}{\partial y} (x_0,y_0)\right)^2 \leq 16$.
-/