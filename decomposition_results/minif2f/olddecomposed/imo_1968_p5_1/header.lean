import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Let $a$ be a positive real number and $f$ be a real function such that $\forall x \in \mathbb{R}, f(x+a)=\frac{1}{2}+\sqrt{f(x)-f(x)^2}$.
Show that there exists a positive real number $b$ such that $\forall x \in \mathbb{R}, f(x+b)=f(x)$.-/