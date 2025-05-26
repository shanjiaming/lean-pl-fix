import Mathlib

open Metric Set EuclideanGeometry Filter Topology

-- Real.exp (2 * Real.log 5 - 4 + 2 * Real.arctan 2)
/--
Evaluate the infinite product $\lim_{n \to \infty} \frac{1}{n^4} \prod_{i = 1}^{2n} (n^2 + i^2)^{1/n}$.
-/