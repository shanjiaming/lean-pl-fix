import Mathlib

/-
The integral of \(\int_0^a \sqrt{a^2-x^2} \,dx\) is \(\frac{a^2 \pi}{4}\).
-/

open Real

variable {a : ℝ} (ha : 0 < a)