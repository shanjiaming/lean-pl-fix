import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- The [[function]] f is defined on the [[set]] of [[integer]]s and satisfies $f(n)=\begin{cases}
n-3&\mbox{if}\ n\ge 1000\\
f(f(n+5))&\mbox{if}\ n<1000\end{cases}$

Find $f(84)$. Show that it is 997.-/