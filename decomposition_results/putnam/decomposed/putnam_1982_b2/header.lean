import Mathlib

open Set Function Filter Topology Polynomial Real

-- C Real.pi * (2*X - 1)^2
/--
Let $A(x, y)$ denote the number of points $(m, n)$ with integer coordinates $m$ and $n$ where $m^2 + n^2 \le x^2 + y^2$. Also, let $g = \sum_{k = 0}^{\infty} e^{-k^2}$. Express the value $$\int_{-\infty}^{\infty}\int_{-\infty}^{\infty} A(x, y)e^{-x^2 - y^2} dx dy$$ as a polynomial in $g$.
-/