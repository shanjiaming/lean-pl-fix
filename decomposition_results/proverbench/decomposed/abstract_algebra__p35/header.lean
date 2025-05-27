import Mathlib

/-
For any polynomial P(x) of degree n satisfying P(i) = 1/i for i = 1, 2, ..., n+1, P(n+2) is equal to 0
if n is odd and 2/(n+2) if n is even.
-/

open Polynomial

variable {R : Type*} [Field R] [CharZero R] (P : Polynomial R) (n : ℕ)

variable (hP : P.degree = n) (hValues : ∀ i ∈ Finset.range (n + 2), P.eval (i + 1 : R) = 1 / (i + 1 : R))