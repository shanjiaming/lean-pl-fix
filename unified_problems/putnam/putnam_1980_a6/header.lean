import Mathlib

-- Note: uses (ℝ → ℝ) instead of (Set.Icc (0 : ℝ) 1 → ℝ)
-- 1 / Real.exp 1
/--
Let $C$ be the class of all real valued continuously differentiable functions $f$ on the interval $0 \leq x \leq 1$ with $f(0)=0$ and $f(1)=1$. Determine the largest real number $u$ such that $u \leq \int_0^1|f'(x)-f(x)|\,dx$ for all $f$ in $C$.
-/