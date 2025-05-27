import Mathlib

/-
The polynomial \(P\) of \(n\)-th degree is such that, for each \(i=0,1,\dots,n\),
\(P(i)\) equals the remainder of \(i\) modulo 2. Moreover, \(P(n+1)\) equals \(2^n\) if \(n\) is odd,
and \(1-2^n\) if \(n\) is even.
-/

variable {P : Polynomial ℤ} {n : ℕ} (hn : P.natDegree = n)