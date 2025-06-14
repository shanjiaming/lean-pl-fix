import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Show that for any real numbers $a$ and $b$, $\frac{|a+b|}{1+|a+b|}\leq \frac{|a|}{1+|a|}+\frac{|b|}{1+|b|}$.-/