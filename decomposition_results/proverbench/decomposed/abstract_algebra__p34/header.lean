import Mathlib

/-
The sum \(\sum_k \binom{n}{\left\lfloor \frac{k}{2} \right\rfloor} x^k\) is equivalent to \((1 + x)(1 + x^2)^n\).
-/

open BigOperators Finset Nat