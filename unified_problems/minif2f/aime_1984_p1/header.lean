import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Find the value of $a_2+a_4+a_6+a_8+\ldots+a_{98}$ if $a_1$, $a_2$, $a_3\ldots$ is an [[arithmetic progression]] with common difference 1, and $a_1+a_2+a_3+\ldots+a_{98}=137$. Show that it is 093.-/