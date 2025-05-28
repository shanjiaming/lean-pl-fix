import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Let $z$ be a complex number satisfying $12|z|^2=2|z+2|^2+|z^2+1|^2+31.$ What is the value of $z+\frac 6z?$

$\textbf{(A) }-2 \qquad \textbf{(B) }-1 \qquad \textbf{(C) }\frac12\qquad \textbf{(D) }1 \qquad \textbf{(E) }4$ Show that it is \textbf{(A) }-2.-/