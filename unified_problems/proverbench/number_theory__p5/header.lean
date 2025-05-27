import Mathlib

/-
Let \(n\geq 3\) be an odd integer. Every integer \(l\) satisfying \(1\leq l\leq n\) can be represented as a sum or difference of two integers each of which is less than \(n\) and relatively prime to \(n\).
-/

variable {n : ℤ} (hn : n ≥ 3 ∧ n % 2 = 1)