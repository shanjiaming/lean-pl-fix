import Mathlib

open Nat Topology Filter

/--
Suppose that $f(x,y)$ is a continuous real-valued function on the unit square $0 \leq x \leq 1,0 \leq y \leq 1$. Show that $\int_0^1 \left(\int_0^1 f(x,y)dx\right)^2dy+\int_0^1 \left(\int_0^1 f(x,y)dy\right)^2dx \leq \left(\int_0^1 \int_0^1 f(x,y)dx\,dy\right)^2+\int_0^1 \int_0^1 [f(x,y)]^2dx\,dy$.
-/