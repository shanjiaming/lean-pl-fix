import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Let $a, b, c$ be real numbers satisfying $a \leq b \leq c$, $a+b+c=2$, and $ab+bc+ca=1$. Show that $0 \leq a \leq \frac{1}{3}$, $\frac{1}{3} \leq b \leq 1$, and $1 \leq c \leq \frac{4}{3}$.-/