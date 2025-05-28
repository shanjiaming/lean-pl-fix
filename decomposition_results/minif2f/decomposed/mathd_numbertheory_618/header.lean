import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Euler discovered that the polynomial $p(n) = n^2 - n + 41$ yields prime numbers for many small positive integer values of $n$. What is the smallest positive integer $n$ for which $p(n)$ and $p(n+1)$ share a common factor greater than $1$? Show that it is 41.-/