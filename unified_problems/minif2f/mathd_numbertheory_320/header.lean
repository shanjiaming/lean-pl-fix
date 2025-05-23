import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- What integer $n$ satisfies $0\le n<{101}$ and $$123456\equiv n\pmod {101}~?$$ Show that it is 34.-/