import Mathlib

open Set Polynomial

-- 2
/--
Let $p(x) = 2(x^6 + 1) + 4(x^5 + x) + 3(x^4 + x^2) + 5x^3$. For $k$ with $0 < k < 5$, let
\[
I_k = \int_0^{\infty} \frac{x^k}{p(x)} \, dx.
\]
For which $k$ is $I_k$ smallest?
-/