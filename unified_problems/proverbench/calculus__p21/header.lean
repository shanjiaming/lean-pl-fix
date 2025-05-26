import Mathlib

/-
The maximal value of the function \(f(x,y,z)=xy+yz+zx\), given that \(x\), \(y\), and \(z\)
are real numbers that satisfy \(x^2+y^2+z^2=1\) is 1, which occurs when \(x=y=z=\frac1{\sqrt 3}\).
-/

variable {x y z : ℝ}

-- Define the function f
def f : ℝ × ℝ × ℝ → ℝ := λ (x, y, z) => x * y + y * z + z * x