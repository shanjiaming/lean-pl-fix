import Mathlib

open Filter Topology

-- Note: The formalization here differs slightly from the original problem statement, in that T is the entire triangle, not just the sides. We adopt the former interpretation because it is simpler to state and maintains the difficulty of the problem.
/--
Show that if the points of an isosceles right triangle of side length $1$ are each colored with one of four colors, then there must be two points of the same color which are at least a distance $2-\sqrt{2}$ apart.
-/