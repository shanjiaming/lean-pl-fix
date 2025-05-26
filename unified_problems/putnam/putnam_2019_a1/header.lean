import Mathlib

open Topology Filter

-- {n : ℤ | n ≥ 0 ∧ ¬Int.ModEq 9 n 3 ∧ ¬Int.ModEq 9 n 6}
/--
Determine all possible values of the expression
\[
A^3+B^3+C^3-3ABC
\]
where $A, B$, and $C$ are nonnegative integers.
-/