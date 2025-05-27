import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Find $3x^2 y^2$ if $x$ and $y$ are [[integer]]s such that $y^2 + 3x^2 y^2 = 30x^2 + 517$. Show that it is 588.-/