import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Let $x,y$ and $z$ be positive real numbers that satisfy the following system of equations:
\[
\log_2\left({x \over yz}\right) = {1 \over 2}
\]
\[
\log_2\left({y \over xz}\right) = {1 \over 3}
\]
\[
\log_2\left({z \over xy}\right) = {1 \over 4}
\]
Then the value of $\left|\log_2(x^4y^3z^2)\right|$ is $\frac{m}{n}$ where $m$ and $n$ are relatively prime positive integers. Show that $m+n=33$.-/