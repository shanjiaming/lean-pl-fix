import Mathlib

open Nat Real

/--
Let $f(n) = n + [\sqrt n]$, where $[x]$ denotes the greatest integer less than or equal to $x$. Define the sequence $a_i$ by $a_0 = m$, $a_{n+1} = f(a_n)$. Prove that it contains at least one square.
-/
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)

theorem putnam_1983_b4_abstracted
    (f : ℕ → ℤ)
    (a : ℕ → ℕ)
    (hf : f = fun (n : ℕ) ↦ n + Int.floor (Real.sqrt n))
    (ha0 : a 0 > 0)
    (han : ∀ n : ℕ, a (n + 1) = f (a n)) :
    (∃ i : ℕ, ∃ s : ℤ, a i = s ^ 2) := by
  have hf_pos : ∀ (n : ℕ), (n : ℤ) + Int.floor (Real.sqrt (n : ℝ)) ≥ (n : ℤ) := by
    hole_1
  have h_seq_strict_mono : ∀ (n : ℕ), a (n + 1) > a n := by
    hole_2
  have h_exists_square : ∃ (i : ℕ) (s : ℤ), a i = s ^ 2 := by
    hole_3
  hole_4