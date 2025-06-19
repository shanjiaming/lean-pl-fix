import Mathlib

/--
Let $A$ be the real $n \times n$ matrix $(a_{ij})$ where $a_{ij} = a$ for $i < j$, $b \; (\neq a)$ for $i > j$, and $c_i$ for $i = j$. Show that $\det A = \frac{b p(a) - a p(b)}{b - a}$, where $p(x) = \prod_{i=1}^n (c_i - x)$.
-/