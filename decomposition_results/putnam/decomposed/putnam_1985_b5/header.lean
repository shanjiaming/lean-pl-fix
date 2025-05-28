import Mathlib

open Set Filter Topology Real Polynomial Function

-- sqrt (Real.pi / 1985) * exp (-3970)
/--
Evaluate $\int_0^\infty t^{-1/2}e^{-1985(t+t^{-1})}\,dt$. You may assume that $\int_{-\infty}^\infty e^{-x^2}\,dx = \sqrt{\pi}$.
-/