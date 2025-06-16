import Mathlib

-- fun f g x ↦ g x - f (x - 3) + f (x - 1) + f (x + 1) - f (x + 3)
/--
Let $f, g, h$ be functions $\mathbb{R} \to \mathbb{R}$. Find an expression for $h(x)$ in terms of $f$ and $g$ such that $f(x) = \frac{h(x + 1) + h(x - 1)}{2}$ and $g(x) = \frac{h(x + 4) + h(x - 4)}{2}$.
-/