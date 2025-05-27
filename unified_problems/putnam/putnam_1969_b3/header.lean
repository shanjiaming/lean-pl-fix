import Mathlib

open Matrix Filter Topology Set Nat

/--
Suppose $T$ is a sequence which satisfies $T_n * T_{n+1} = n$ whenever $n \geq 1$, and also $\lim_{n \to \infty} \frac{T_n}{T_{n+1}} = 1. Show that $\pi * T_1^2 = 2$.
-/