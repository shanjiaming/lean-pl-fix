import Mathlib

open Set Function Filter Topology Polynomial Real

-- (Real.pi / 2) * log Real.pi
/--
Evaluate $\int_0^{\infty} \frac{\tan^{-1}(\pi x) - \tan^{-1} x}{x} \, dx$.
-/