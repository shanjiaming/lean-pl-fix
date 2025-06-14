import Mathlib

open Topology Filter Set Polynomial Function

-- True
/--
Let $B(n)$ be the number of ones in the base two expression for the positive integer $n$. For example, $B(6)=B(110_2)=2$ and $B(15)=B(1111_2)=4$. Determine whether or not $\exp \left(\sum_{n=1}^\infty \frac{B(n)}{n(n+1)}\right)$ is a rational number. Here $\exp(x)$ denotes $e^x$.
-/