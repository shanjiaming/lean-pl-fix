import Mathlib

/-
Prove that there are no positive integers \(a,b,c\) for which \[\frac{a^2+b^2+c^2}{3(ab+bc+ca)}\] is an integer.
-/

variable (a b c : ℕ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c)