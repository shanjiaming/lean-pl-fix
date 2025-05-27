import Mathlib

open Nat Filter Topology Real

-- True
/--
Let $f(n)$ be the number of ways of representing $n$ as a sum of powers of $2$ with no power being used more than $3$ times. For example, $f(7) = 4$ (the representations are $4 + 2 + 1$, $4 + 1 + 1 + 1$, $2 + 2 + 2 + 1$, $2 + 2 + 1 + 1 + 1$). Can we find a real polynomial $p(x)$ such that $f(n) = [p(n)]$, where $[u]$ denotes the greatest integer less than or equal to $u$?
-/