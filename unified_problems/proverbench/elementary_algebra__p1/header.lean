import Mathlib

/-
For a polynomial \(P\) of degree \(n\) where \(P(i)\) equals the remainder of \(i\) modulo 2 for each \(i=0,1,\dots,n\),
\(P(n+1)\) is 1 if \(n\) is even and 0 if \(n\) is odd.
-/

variable {P : Polynomial ℤ} {n : ℕ} (hP : ∀ i ∈ Finset.range (n + 1), P.eval (i : ℤ) = i % 2)