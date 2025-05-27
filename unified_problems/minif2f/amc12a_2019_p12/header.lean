import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Positive real numbers $x \neq 1$ and $y \neq 1$ satisfy $\log_2{x} = \log_y{16}$ and $xy = 64$. What is $(\log_2{\tfrac{x}{y}})^2$?

$\textbf{(A) } \frac{25}{2} \qquad\textbf{(B) } 20 \qquad\textbf{(C) } \frac{45}{2} \qquad\textbf{(D) } 25 \qquad\textbf{(E) } 32$ Show that it is \textbf{(B) } 20.-/