import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- If $a \star b = \dfrac{\left(\dfrac{1}{b} - \dfrac{1}{a}\right)}{(a - b)}$, express $3 \star 11$ as a common fraction. Show that it is \frac{1}{33}.-/