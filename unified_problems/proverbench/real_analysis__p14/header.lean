import Mathlib

/-
Let $f: [a,b] \rightarrow \mathbb{R}$ be a function that is continuous on $[a,b]$ and differentiable on $(a,b)$. If $f(a) = f(b)$, then there exists at least one point $\xi \in (a,b)$ such that $f'(\xi) = 0$.
-/

variable {a b : ℝ}