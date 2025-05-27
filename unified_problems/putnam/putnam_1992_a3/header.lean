import Mathlib

open Topology Filter Nat

-- fun m ↦ ite (Odd m) ∅ {(m + 1, 2 ^ (m / 2), 2 ^ (m / 2))}
/--
For a given positive integer $m$, find all triples $(n, x, y)$ of positive integers, with $n$ relatively prime to $m$, which satisfy
\[
(x^2 + y^2)^m = (xy)^n.
\]
-/