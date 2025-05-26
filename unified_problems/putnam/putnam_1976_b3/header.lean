import Mathlib

open Polynomial Filter Topology ProbabilityTheory MeasureTheory

/--
Suppose that we have $n$ events $A_1, \dots, A_n$, each of which has probability at least $1 - a$ of occufring, where $a < 1/4$. Further suppose that $A_i$ and $A_j$ are mutually independent if $|i-j| > 1$, although $A_i$ and $A_{i+1}$ may be dependent. Assume as known that the recurrence $u_{k+1} = u_k - au_{k-1}$, $u_0 = 1, u_1 = 1-a$ defines positive real numbers $u_k$ for $k = 0,1,\dots$. Show that the probability of all $A_1, \dots, A_n$ occurring is at least $u_n$.
-/