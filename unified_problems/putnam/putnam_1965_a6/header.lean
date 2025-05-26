import Mathlib

open EuclideanGeometry Topology Filter Complex

/--
Prove that the line $ux + vy = 1$ (where $u \ge 0$ and $v \ge 0$) will lie tangent to the curve $x^m + y^m = 1$ (where $m > 1$) if and only if $u^n + v^n = 1$ for some $n$ such that $m^{-1} + n^{-1} = 1$.
-/