import Mathlib

open Set Function Filter Topology

/--
Let $S$ be a finite set of collinear points. Let $k$ be the maximum distance between any two points of $S$. Given a pair of points of $S$ a distance $d < k$ apart, we can find another pair of points of $S$ also a distance $d$ apart. Prove that if two pairs of points of $S$ are distances $a$ and $b$ apart, then $\frac{a}{b}$ is rational.
-/