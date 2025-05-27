import Mathlib

open Set Function Filter Topology

/--
Suppose $f : \mathbb{R} \to \mathbb{R}$ is continuous and for every $\alpha > 0$, $\lim_{n \to \infty} f(n\alpha) = 0$. Prove that $\lim_{x \to \infty} f(x) = 0$.
-/