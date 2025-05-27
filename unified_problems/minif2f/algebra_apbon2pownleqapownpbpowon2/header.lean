import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Let $a$ and $b$ be two positive real numbers, and $n$ be a positive integer. Show that $(\frac{a+b}{2})^n \leq \frac{a^n+b^n}{2}$.-/