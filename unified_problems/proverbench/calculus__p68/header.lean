import Mathlib

/-
The integral \[\iiint_S z\,dxdydz,\] where \(S\) is a triangular prism bounded by the planes \(x=0\), \(y=0\), \(z=0\), \(x=5\), and \(y+z=1\), is equal to \(\frac{5}{6}\).
-/

open MeasureTheory
open Real

variable {S : Set (ℝ × ℝ × ℝ)}