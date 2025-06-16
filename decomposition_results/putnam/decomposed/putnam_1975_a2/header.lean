import Mathlib

open Polynomial

-- fun (b, c) => c < 1 ∧ c - b > -1 ∧ c + b > -1
/--
For which ordered pairs $(b, c)$ of real numbers do both roots of $z^2 + bz + c$ lie strictly inside the unit disk (i.e., $\{|z| < 1\}$) in the complex plane?
-/