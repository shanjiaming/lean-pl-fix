import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- For how many positive integers $m$ does there exist at least one positive integer n such that $m \cdot n \le m + n$?

$ \textbf{(A) } 4\qquad \textbf{(B) } 6\qquad \textbf{(C) } 9\qquad \textbf{(D) } 12\qquad \textbf{(E) } \text{infinitely many} $ Show that it is \textbf{(E) } \text{infinitely many}.-/