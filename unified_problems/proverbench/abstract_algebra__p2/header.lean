import Mathlib

/-
If a polynomial \(P\) with real coefficients satisfies for all \(x\) \[P(\cos x)=P(\sin x),\]
prove that there exists a polynomial \(Q\) such that for all \(x\), \(P(x)=Q(x^4-x^2).\)
-/

variable {P : Polynomial ℝ}