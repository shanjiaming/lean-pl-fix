import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Let $f(x) = 12x+7$ and $g(x) = 5x+2$ whenever $x$ is a positive integer. Define $h(x)$ to be the greatest common divisor of $f(x)$ and $g(x)$. What is the sum of all possible values of $h(x)$? Show that it is 12.-/