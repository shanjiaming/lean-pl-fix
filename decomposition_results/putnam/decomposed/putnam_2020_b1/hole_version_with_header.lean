import Mathlib

open Filter Topology Set

-- 1990
/--
For a positive integer $n$, define $d(n)$ to be the sum of the digits of $n$ when written in binary (for example, $d(13) = 1+1+0+1=3)$. Let
\[
S = \sum_{k=1}^{2020} (-1)^{d(k)} k^3.
\]
Determine $S$ modulo 2020.
-/
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)

theorem putnam_2020_b1
(d : ℕ → ℕ)
(S : ℤ)
(hd : d = fun n : ℕ => ∑ i : Fin (Nat.digits 2 n).length, (Nat.digits 2 n)[i]!)
(hS : S = ∑ k : Icc 1 2020, ((-1 : ℤ)^(d k))*(k : ℤ)^3)
: S % 2020 = ((1990) : ℕ) := by
  have h₁ : S % 2020 = ((1990) : ℕ) := by
    have h₂ : False := by
      have h₃ := hd
      simp [Function.funext_iff] at h₃
      have h₄ := h₃ 0
      have h₅ := h₃ 1
      have h₆ := h₃ 2
      have h₇ := h₃ 3
      hole_1
    hole_2
  hole_3