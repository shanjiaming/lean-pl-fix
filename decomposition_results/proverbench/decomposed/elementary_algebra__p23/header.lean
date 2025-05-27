import Mathlib

/-
The cubic polynomial \(Q\) such that \(Q(i)=2^i\) for \(i=0,1,2,3\) is \(Q(x)=\frac{x^3+5x+6}{6}\).
-/

def S : Set ℕ := {n | n < 4}

noncomputable def Q (X : ℝ) : ℝ := (X ^ 3 + 5 * X + 6) / 6