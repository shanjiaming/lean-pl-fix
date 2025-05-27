import Mathlib

open Metric Set EuclideanGeometry Filter Topology

/--
Suppose $(x_n)$ is a sequence such that $\lim_{n \to \infty} (x_n - x_{n-2} = 0$. Prove that $\lim_{n \to \infty} \frac{x_n - x_{n-1}}{n} = 0$.
-/