import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Show that for any real number $x$, if $|x-1| + |x| + |x+1| = x + 2$, then $0 \leq x \leq 1$.-/