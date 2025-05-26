import Mathlib

open Polynomial Real Complex

-- fun m => ∑ j in Finset.range ((m - 1) / 2), Polynomial.X ^ (2 * j + 1)
/--
Let $n = 2m$, where $m$ is an odd integer greater than 1. Let $\theta = e^{2\pi i/n}$. Expression $(1 - \theta)^{-1}$ explicitly as a polynomial in $\theta$ \[ a_k \theta^k  + a_{k-1}\theta^{k-1} + \dots + a_1\theta + a_0\], with integer coefficients $a_i$.
-/