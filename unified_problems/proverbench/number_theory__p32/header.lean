import Mathlib

/-
The equation \(x^2-py^2=-1\) has integral solutions if and only if \(p=2\) or \(p\equiv 1\) (mod 4) for any prime \(p\).
-/

variable {p : ℕ} (hp : Nat.Prime p)