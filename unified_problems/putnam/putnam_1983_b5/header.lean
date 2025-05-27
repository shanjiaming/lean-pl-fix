import Mathlib

open Nat Filter Topology Real

-- log (4 / Real.pi)
/--
Define $\left\lVert x \right\rVert$ as the distance from $x$ to the nearest integer. Find $\lim_{n \to \infty} \frac{1}{n} \int_{1}^{n} \left\lVert \frac{n}{x} \right\rVert \, dx$. You may assume that $\prod_{n=1}^{\infty} \frac{2n}{(2n-1)} \cdot \frac{2n}{(2n+1)} = \frac{\pi}{2}$.
-/