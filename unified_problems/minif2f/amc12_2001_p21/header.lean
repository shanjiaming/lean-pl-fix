import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Four positive integers $a$, $b$, $c$, and $d$ have a product of $8!$ and satisfy:

$
\begin{align*}
ab + a + b & = 524
\\ 
bc + b + c & = 146
\\ 
cd + c + d & = 104
\end{align*}
$

What is $a-d$?

$
\text{(A) }4
\qquad
\text{(B) }6
\qquad
\text{(C) }8
\qquad
\text{(D) }10
\qquad
\text{(E) }12
$ Show that it is 10.-/