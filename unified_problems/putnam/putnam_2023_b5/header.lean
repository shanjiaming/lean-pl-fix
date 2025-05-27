import Mathlib

open Nat Topology Filter

-- {n : ℕ | n = 1 ∨ n ≡ 2 [MOD 4]}
/--
Determine which positive integers $n$ have the following property: For all integers $m$ that are relatively prime to $n$, there exists a permutation $\pi:\{1,2,\dots,n\} \to \{1,2,\dots,n\}$ such that $\pi(\pi(k)) \equiv mk \pmod{n}$ for all $k \in \{1,2,\dots,n\}$.
-/