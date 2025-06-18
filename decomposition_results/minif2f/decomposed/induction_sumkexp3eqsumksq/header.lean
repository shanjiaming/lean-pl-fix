import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Show that for all natural numbers $n$, we have $\sum_{k=0}^{n-1}k^3 = \left(\sum_{k=0}^{n-1}k\right)^2$.-/