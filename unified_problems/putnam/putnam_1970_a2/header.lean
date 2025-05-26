import Mathlib

open Metric Set EuclideanGeometry

/--
Let $A$, $B$, $C$, $D$, $E$, $F$, and $G$ be real numbers satisfying $B^2 - 4AC < 0$. Prove that there exists some $\delta > 0$ such that no points $(x, y)$ in the punctured disk $0 < x^2 + y^2 < \delta$ satisfy $$Ax^2 + Bxy + Cy^2 + Dx^3 + Ex^2y + Fxy^2 + Gy^3 = 0.$$
-/