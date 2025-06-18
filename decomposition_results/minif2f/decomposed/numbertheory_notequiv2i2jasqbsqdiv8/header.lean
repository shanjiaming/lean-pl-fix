import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Let $a$ and $b$ be two integer numbers. Show that the following statement is false: $a$ and $b$ are both even iff $8 \mid a^2 + b^2$.-/