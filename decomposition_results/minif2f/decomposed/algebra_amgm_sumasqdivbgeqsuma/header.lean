import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Let $a, b, c, d$ be positive real numbers. Show that $a^2 / b + b^2 / c + c^2 / d + d^2 / a \geq a + b + c + d$.-/