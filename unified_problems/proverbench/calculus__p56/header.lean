import Mathlib

/-
The maximum value of \[\int_0^1 \left(x^2f(x)-xf^2(x)\right)\,dx\] over all continuous functions \(f:[0,1]\to\mathbb R\) is \(\frac{1}{16}\).
-/

open Filter Topology

variable {f : ℝ → ℝ} (hf : Continuous f)