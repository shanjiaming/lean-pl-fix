import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Solve the congruence $3n \equiv 2 \pmod{11}$, as a residue modulo 11.  (Give an answer between 0 and 10.) Show that it is 8.-/