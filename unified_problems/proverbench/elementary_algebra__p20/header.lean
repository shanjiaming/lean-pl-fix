import Mathlib

/-
The function \(f:\mathbb{Q}\rightarrow\mathbb{Q}\) satisfies the conditions \(f(1)=2\) and \(f(xy)=f(x)f(y)-f(x+y)+1\)
if and only if \(f(x)=x+1\) for all \(x\in\mathbb{Q}\).
-/

variable (f : ℚ → ℚ)