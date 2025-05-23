import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Assume that $x_1,x_2,\ldots,x_7$ are real numbers such that
$\begin{align*}
x_1 + 4x_2 + 9x_3 + 16x_4 + 25x_5 + 36x_6 + 49x_7 &= 1, \\
4x_1 + 9x_2 + 16x_3 + 25x_4 + 36x_5 + 49x_6 + 64x_7 &= 12, \\
9x_1 + 16x_2 + 25x_3 + 36x_4 + 49x_5 + 64x_6 + 81x_7 &= 123.
\end{align*}$
Find the value of $16x_1+25x_2+36x_3+49x_4+64x_5+81x_6+100x_7$. Show that it is 334.-/