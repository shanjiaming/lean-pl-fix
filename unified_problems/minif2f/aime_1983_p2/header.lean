import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Let $f(x)=|x-p|+|x-15|+|x-p-15|$, where $0 < p < 15$. Determine the [[minimum]] value taken by $f(x)$ for $x$ in the [[interval]] $p \leq x\leq15$. Show that it is 015.-/