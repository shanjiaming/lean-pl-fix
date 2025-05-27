import Mathlib

open EuclideanGeometry Filter Topology Set MeasureTheory

/--
Let $f$ be an integrable function in $0 \leq x \leq 1$ and suppose for all $0 \leq i \leq n-1, \int_0^1 x^i f(x) dx = 0$. Further suppose that $\int_0^1 x^n f(x) dx = 1$. Show that $|f(x)| \geq 2^n(n+1)$ on a set of positive measure.
-/