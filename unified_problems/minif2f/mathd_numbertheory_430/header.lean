import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- If $A$, $B$, and $C$ represent three distinct digits from 1 to 9 and they satisfy the following equations, what is the value of the sum $A+B+C$? (In the equation below, $AA$ represents a two-digit number both of whose digits are $A$.) $$A+B=C$$$$AA-B=2\times C$$$$C\times B=AA+A$$ Show that it is 8.-/