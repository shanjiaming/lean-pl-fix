import Mathlib

open Nat Real

/--
Let $f(n) = n + [\sqrt n]$, where $[x]$ denotes the greatest integer less than or equal to $x$. Define the sequence $a_i$ by $a_0 = m$, $a_{n+1} = f(a_n)$. Prove that it contains at least one square.
-/