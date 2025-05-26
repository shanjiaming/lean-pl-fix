import Mathlib

/-
The points (x,y) on the curve \(x^2+y^2=1\) for which the quantity \(f(x,y)=xy\) is maximal are
\((x,y)\in\left\{\left(\frac1{\sqrt 2},\frac1{\sqrt2}\right),
\left(-\frac1{\sqrt 2},-\frac1{\sqrt 2}\right)\right\}\) and the maximum of \(f\) is \(\frac12\).
-/

open Real

variable (x y : ℝ)