import Mathlib

/-
The surface integral \[\iint_G (x^2+y^2+2z)\,dS,\] where \(G\) is the part of the paraboloid \(z=7-x^2-y^2\) that lies above the \(xy\)-plane is equal to \[\frac{957\sqrt{29}-47}{20}\pi.\]
-/

variable {G : Set (ℝ × ℝ × ℝ)} (hG : G = {p : ℝ × ℝ × ℝ | p.2.2 = 7 - p.1^2 - p.2.1^2 ∧ p.2.2 ≥ 0})