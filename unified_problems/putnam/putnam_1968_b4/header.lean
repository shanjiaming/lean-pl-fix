import Mathlib

open Finset Polynomial Topology Filter Metric

/--
Suppose that $f : \mathbb{R} \to \mathbb{R}$ is continuous on $(-\infty, \infty)$ and that $\int_{-\infty}^{\infty} f(x) dx$ exists. Prove that $$\int_{-\infty}^{\infty} f\left(x - \frac{1}{x}\right) dx = \int_{-\infty}^{\infty} f(x) dx.$$
-/