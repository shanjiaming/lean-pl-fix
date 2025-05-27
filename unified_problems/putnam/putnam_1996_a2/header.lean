import Mathlib

open Metric

-- (fun O1 O2 : EuclideanSpace ℝ (Fin 2) => {p : EuclideanSpace ℝ (Fin 2) | dist p (midpoint ℝ O1 O2) ≥ 1 ∧ dist p (midpoint ℝ O1 O2) ≤ 2})
/--
Let $C_1$ and $C_2$ be circles whose centers are $10$ units apart, and whose radii are $1$ and $3$. Find, with proof, the locus of all points $M$ for which there exist points $X$ on $C_1$ and $Y$ on $C_2$ such that $M$ is the midpoint of the line segment $XY$.
-/