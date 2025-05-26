import Mathlib

open Metric Set EuclideanGeometry Filter Topology

/--
Let $x : \mathbb{R} \to \mathbb{R}$ be a twice differentiable function satisfying $x(1) - x(0) = 1$, $x'(0) = x'(1) = 0$, and $|x'(t)| \le \frac{3}{2}$ for all $t \in (0, 1)$. Prove that there exists some $t \in [0, 1]$ such that $|x''(t)| \ge \frac{9}{2}$.
-/