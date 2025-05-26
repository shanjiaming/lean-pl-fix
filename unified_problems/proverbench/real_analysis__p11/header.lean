import Mathlib

/-
Let $f: (a,b) \rightarrow \mathbb{R}$ be a function differentiable on the open interval $(a,b)$. For any two points $x_1, x_2 \in (a,b)$, there exists a point $\xi$ between $x_1$ and $x_2$ such that $f(x_1) - f(x_2) = (x_1 - x_2)f'(\xi)$.
-/

open Set

variable {a b : ℝ} {f : ℝ → ℝ}