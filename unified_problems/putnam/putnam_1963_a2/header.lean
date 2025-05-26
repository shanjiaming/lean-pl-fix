import Mathlib

open Topology Filter

/--
Let $\{f(n)\}$ be a strictly increasing sequence of positive integers such that $f(2)=2$ and $f(mn)=f(m)f(n)$ for every relatively prime pair of positive integers $m$ and $n$ (the greatest common divisor of $m$ and $n$ is equal to $1$). Prove that $f(n)=n$ for every positive integer $n$.
-/