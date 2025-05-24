import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- **Demo Problem 2: Simple Arithmetic**

For natural numbers $x$ and $y$, if $x \cdot y = 12$ and $x < y$, 
prove that $(x, y) \in \{(1, 12), (2, 6), (3, 4)\}$.

This is another demo problem with deep `have` nesting. -/