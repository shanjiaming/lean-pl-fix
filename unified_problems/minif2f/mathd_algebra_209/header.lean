import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Suppose that $h(x)=f^{-1}(x)$. If $h(2)=10$, $h(10)=1$ and $h(1)=2$, what is $f(f(10))$? Show that it is 1.-/