import Mathlib

open Filter Topology Set

-- Note: uses (ℝ → ℝ) instead of (Ici 0 → ℝ)
/--
Let $f:[0,\infty)\to \mathbb{R}$ be a strictly decreasing continuous function
such that $\lim_{x\to\infty} f(x) = 0$. Prove that
$\int_0^\infty \frac{f(x)-f(x+1)}{f(x)}\,dx$ diverges.
-/