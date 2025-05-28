import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- For all integers $n \geq 9,$ the value of
$\frac{(n+2)!-(n+1)!}{n!}$is always which of the following?

$\textbf{(A) } \text{a multiple of 4} \qquad \textbf{(B) } \text{a multiple of 10} \qquad \textbf{(C) } \text{a prime number} \qquad \textbf{(D) } \text{a perfect square} \qquad \textbf{(E) } \text{a perfect cube}$ Show that it is \textbf{(D) } \text{a perfect square}.-/