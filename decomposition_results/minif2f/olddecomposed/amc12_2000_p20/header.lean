import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- If $x,y,$ and $z$ are positive numbers satisfying

$x + \frac{1}{y} = 4,\qquad y + \frac{1}{z} = 1, \qquad \text{and} \qquad z + \frac{1}{x} = \frac{7}{3}$

Then what is the value of $xyz$ ?

$\text {(A)}\ \frac{2}{3} \qquad \text {(B)}\ 1 \qquad \text {(C)}\ \frac{4}{3} \qquad \text {(D)}\ 2 \qquad \text {(E)}\ \frac{7}{3}$ Show that it is xyz = 1 \rightarrow B.-/