import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Find $ax^5 + by^5$ if the real numbers $a,b,x,$ and $y$ satisfy the equations
$\begin{align*}
ax + by &= 3, \\
ax^2 + by^2 &= 7, \\
ax^3 + by^3 &= 16, \\
ax^4 + by^4 &= 42.
\end{align*}$ Show that it is 020.-/