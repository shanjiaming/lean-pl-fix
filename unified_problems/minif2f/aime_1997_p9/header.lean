import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Given a [[nonnegative]] real number $x$, let $\langle x\rangle$ denote the fractional part of $x$; that is, $\langle x\rangle=x-\lfloor x\rfloor$, where $\lfloor x\rfloor$ denotes the [[greatest integer]] less than or equal to $x$. Suppose that $a$ is positive, $\langle a^{-1}\rangle=\langle a^2\rangle$, and $2<a^2<3$. Find the value of $a^{12}-144a^{-1}$. Show that it is 233.-/