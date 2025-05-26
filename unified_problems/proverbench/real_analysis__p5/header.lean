import Mathlib

/-
The only real number values for \(a, b, c, d\) that satisfy the condition \(a^2+b^2+c^2+d^2=a(b+c+d)\), are when \(a = b = c = d = 0\).
-/

variable (a b c d : ℝ) (h : a^2 + b^2 + c^2 + d^2 = a * (b + c + d))