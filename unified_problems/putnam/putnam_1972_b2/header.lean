import Mathlib

open EuclideanGeometry Filter Topology Set MeasureTheory Metric

-- fun s v : ℝ ↦ 2 * s / v
/--
Let $x : \mathbb{R} \to \mathbb{R}$ be a twice differentiable function whose second derivative is nonstrictly decreasing. If $x(t) - x(0) = s$, $x'(0) = 0$, and $x'(t) = v$ for some $t > 0$, find the maximum possible value of $t$ in terms of $s$ and $v$.
-/