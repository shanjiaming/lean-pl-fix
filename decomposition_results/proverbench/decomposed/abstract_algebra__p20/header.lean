import Mathlib

/-
For any polynomial \(p(x)=a_0x^k+a_1x^{k-1}+\dots+ a_k\) with integer coefficients,
if \(p(x)\) is divisible by an integer \(m\) for all integers \(x\), then \(k!a_0\)
is also divisible by \(m\).
-/

variable {P : Polynomial ℤ} {m : ℤ}