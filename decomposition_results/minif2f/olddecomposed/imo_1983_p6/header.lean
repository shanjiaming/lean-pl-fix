import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Let $a$, $b$ and $c$ be the lengths of the sides of a triangle. Prove that

$a^2 b(a-b) + b^2 c(b-c) + c^2 a(c-a) \geq 0$.

Determine when equality occurs.-/