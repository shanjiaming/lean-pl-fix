import Mathlib

open Set

-- Note: uses (ℝ → ℝ) instead of (Icc 0 1 → ℝ)
-- fun _ ↦ ∅
/--
Let $\alpha$ be a real number. Find all continuous real-valued functions $f : [0, 1] \to (0, \infty)$ such that
\begin{align*}
\int_0^1 f(x) dx &= 1, \\
\int_0^1 x f(x) dx &= \alpha, \\
\int_0^1 x^2 f(x) dx &= \alpha^2. \\
\end{align*}
-/