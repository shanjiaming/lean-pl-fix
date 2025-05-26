import Mathlib

open Topology Filter Nat Function

/--
For each positive integer $n$, let $a_n = 0$ (or $1$) if the number of $1$'s in the binary representation of $n$ is even (or odd), respectively. Show that there do not exist positive integers $k$ and $m$ such that
\[
a_{k+j} = a_{k+m+j} = a_{k+2m+j},
\]
for $0 \leq j \leq m-1$.
-/