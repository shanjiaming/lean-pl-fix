import Mathlib

open Nat Set

-- Note: uses ℕ → ℕ instead of Fin n → ℕ
-- {(n, k) : ℕ × (ℕ → ℤ) | (n = 1 ∧ k 0 = 1) ∨ (n = 3 ∧ (k '' {0, 1, 2} = {2, 3, 6})) ∨ (n = 4 ∧ (∀ i : Fin 4, k i = 4))}
/--
Find all positive integers $n,k_1,\dots,k_n$ such that $k_1+\cdots+k_n=5n-4$ and $\frac{1}{k_1}+\cdots+\frac{1}{k_n}=1$.
-/