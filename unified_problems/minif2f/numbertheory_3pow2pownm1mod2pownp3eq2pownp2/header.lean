import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Show that for positive integer $n$, the remainder of $3^{2^n} - 1 \equiv 2^{n+2} \mod 2^{n+3}$.-/