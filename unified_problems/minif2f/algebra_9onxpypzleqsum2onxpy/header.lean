import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Show that for any three positive real numbers $x$, $y$, and $z$, $9/(x+y+z)\leq 2/(x+y)+2/(y+z)+2/(z+x)$.-/