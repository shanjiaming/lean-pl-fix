import Mathlib

open Polynomial Filter Topology ProbabilityTheory MeasureTheory

/--
Let $\sigma(N)$ denote the sum of all positive integer divisors of $N$, including $1$ and $N$. Call a positive integer $N$ \textit{quasiperfect} if $\sigma(N) = 2N + 1$. Prove that every quasiperfect number is the square of an odd integer.
-/