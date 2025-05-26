import Mathlib

/-
The local maximum of the function f(x)=x^4/4 - x^3/3 - 2x^2 + 4x + 5 on the interval
[-3,3] is 41 / 4  and is attained at x=3, and
the local minimum is -13/3 and it is attained for x=-2.
-/

noncomputable def f (x : ℝ) : ℝ := x^4 / 4 - x^3 / 3 - 2 * x^2 + 4 * x + 5