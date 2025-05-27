import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- The expression $10x^2-x-24$ can be written as $(Ax-8)(Bx+3),$ where $A$ and $B$ are integers. What is $AB + B$? Show that it is 12.-/