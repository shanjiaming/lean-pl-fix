import Mathlib

/-
The natural number \(n\) satisfies the equation \(\displaystyle\binom n{k-1}= 2\binom nk+\binom n{k+1}\) for some natural number \(k <  n\)
if and only if \(n\) is an integer value derived from \(n=\frac{x_i-3}2\), where \(x_i\) is an odd solution to the equation 
\(x_i+y_i\sqrt2=(1+\sqrt2)^{2i+1}\) and \(x_i\) and \(y_i\) are always odd.
-/

variable {n k : ℕ} (hk : k < n)