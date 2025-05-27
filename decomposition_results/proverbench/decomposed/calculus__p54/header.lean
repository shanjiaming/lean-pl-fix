import Mathlib

/-
The function \(f(x) = x + 2\sin x\) attains its minimum at \( x = \frac{4\pi}{3} \) on the interval \(\left[\frac{\pi}{2}, 200\right]\).
-/

open Real

/-- The function f(x) = x + 2sin(x) -/
noncomputable def f (x : ℝ) : ℝ := x + 2 * sin x