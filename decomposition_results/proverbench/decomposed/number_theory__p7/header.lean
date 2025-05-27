import Mathlib

/-
Exactly one of the equations \(x^2 - py^2 = \pm 2\) has an integral solution where \(p\) is a prime of the form \(4k + 3\).
-/

variable {p : ℤ} (hp :Prime p) (hpForm : p % 4 = 3)