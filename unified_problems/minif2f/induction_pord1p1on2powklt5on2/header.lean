import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Show that for positive integer $n$, $(\prod_{k=1}^{n} (1 + 1/2^k)) < 5/2$.-/
-- [OVERALL FIX FAILED]