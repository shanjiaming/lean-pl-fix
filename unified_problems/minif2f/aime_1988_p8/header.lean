import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- The function $f$, defined on the set of ordered pairs of positive integers, satisfies the following properties:
$ f(x, x) = x,\; f(x, y) = f(y, x), {\rm \ and\ } (x+y)f(x, y) = yf(x, x+y). $
Calculate $f(14,52)$. Show that it is 364.-/