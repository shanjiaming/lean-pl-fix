import Mathlib

open Filter Topology Bornology Set

-- {n | (1 ≤ n ∧ n ≤ 4) ∨ (20 ≤ n ∧ n ≤ 24) ∨ (100 ≤ n ∧ n ≤ 104) ∨ (120 ≤ n ∧ n ≤ 124)}
/--
For each positive integer $n$, write the sum $\sum_{m=1}^n 1/m$ in the form $p_n/q_n$, where $p_n$ and $q_n$ are relatively prime positive integers.  Determine all $n$ such that 5 does not divide $q_n$.
-/