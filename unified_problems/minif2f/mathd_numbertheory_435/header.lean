import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Find the smallest positive integer $k$ such that, for every positive integer $n$, $6n+k$ is relatively prime to each of $6n+3$, $6n+2$, and $6n+1$. Show that it is 5.-/