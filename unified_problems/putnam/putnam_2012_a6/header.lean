import Mathlib

open Matrix Function

-- Note: this formalization differs from the original problem wording in only allowing axis-aligned rectangles. The problem is solvable given this weaker hypothesis.
-- True
/--
Let $f(x,y)$ be a continuous, real-valued function on $\mathbb{R}^2$. Suppose that, for every rectangular region $R$ of area $1$, the double integral of $f(x,y)$ over $R$ equals $0$.
Must $f(x,y)$ be identically $0$?
-/