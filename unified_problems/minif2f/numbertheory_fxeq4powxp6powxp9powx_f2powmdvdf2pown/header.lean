import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Let $f(x) = 4^x + 6^x + 9^x$. Show that if $m$ and $n$ are positive integers with $m \leq n$, then $f(2^m)$ divides $f(2^n)$.-/