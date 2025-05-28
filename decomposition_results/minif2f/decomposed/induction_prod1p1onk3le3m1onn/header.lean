import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Show that for any positive integer $n$, we have $\prod_{k=1}^n (1 + 1/k^3) \leq 3 - 1/n$.-/