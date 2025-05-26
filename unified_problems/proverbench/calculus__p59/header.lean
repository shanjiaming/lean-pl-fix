import Mathlib

/-
The integral \[\iint_{R}f(x,y)\,dxdy,\] where \(f(x,y)=11-2x-3y^2\) and \(R\) is the rectangle \([1,3]\times[-2,5]\) is equal to -168.
-/

open Set Filter MeasureTheory

variable (f : ℝ → ℝ → ℝ) (R : Set (ℝ × ℝ))