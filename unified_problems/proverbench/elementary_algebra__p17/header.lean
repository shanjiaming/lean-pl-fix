import Mathlib

/-
A monic polynomial of fourth degree satisfies \(f(1)=10\), \(f(2)=20\) and \(f(3)=30\). The sum of \(f(12)\) and \(f(-8)\) for this polynomial is 19840.
-/

variable (f : Polynomial ℤ) (hf_monic : f.Monic) (hf_degree : f.degree = 4)