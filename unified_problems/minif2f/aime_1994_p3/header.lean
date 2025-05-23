import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- The function $f_{}^{}$ has the property that, for each real number $x,\,$
<center>$f(x)+f(x-1) = x^2.\,$</center>
If $f(19)=94,\,$ what is the remainder when $f(94)\,$ is divided by $1000$? Show that it is 561.-/