import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Let $x$, $y$ and $z$ all exceed $1$ and let $w$ be a positive number such that $\log_x w = 24$, $\log_y w = 40$ and $\log_{xyz} w = 12$. Find $\log_z w$. Show that it is 060.-/