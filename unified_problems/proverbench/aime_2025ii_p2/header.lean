import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Find the sum of all positive integers $n$ such that $n+2$ divides the product $3(n+3)(n^2+9)$. Show that it is 49.-/