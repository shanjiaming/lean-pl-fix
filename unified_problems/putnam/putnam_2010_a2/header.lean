import Mathlib

-- {f : ℝ → ℝ | ∃ c d : ℝ, ∀ x : ℝ, f x = c*x + d}
/--
Find all differentiable functions $f:\mathbb{R} \to \mathbb{R}$ such that
\[
f'(x) = \frac{f(x+n)-f(x)}{n}
\]
for all real numbers $x$ and all positive integers $n$.
-/