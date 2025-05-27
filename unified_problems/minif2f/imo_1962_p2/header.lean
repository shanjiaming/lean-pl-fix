import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Determine all real numbers $x$ which satisfy the inequality:

<center>
$\sqrt{\sqrt{3-x}-\sqrt{x+1}}>\dfrac{1}{2}$
</center> Show that it is \left[ ~ -1,\quad 1-\dfrac{\sqrt{127}}{32} ~ \right).-/