import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- The Fibonacci sequence is the sequence 1, 1, 2, 3, 5, $\ldots$ where each term is the sum of the previous two terms. What is the remainder when the $100^{\mathrm{th}}$ term of the sequence is divided by 4? Show that it is 3.-/