import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Real numbers $x$ and $y$ with $x,y>1$ satisfy $\log_x(y^x)=\log_y(x^{4y})=10.$ Show that the value of $xy$ is 25.-/