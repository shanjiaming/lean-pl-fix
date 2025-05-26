import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Let $\omega\neq 1$ be a 13th root of unity. Find the remainder when
\[
\prod_{k=0}^{12}(2-2\omega^k+\omega^{2k})
\]
is divided by 1000. Show that it is 321.-/