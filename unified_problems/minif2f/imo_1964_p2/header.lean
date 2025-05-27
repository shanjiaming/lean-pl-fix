import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Suppose $a, b, c$ are the sides of a triangle. Prove that 

$a^2(b+c-a)+b^2(c+a-b)+c^2(a+b-c)\le{3abc}.$-/