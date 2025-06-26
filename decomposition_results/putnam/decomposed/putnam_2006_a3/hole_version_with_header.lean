import Mathlib

/--
Let $1, 2, 3, \dots, 2005, 2006, 2007, 2009, 2012, 2016, \dots$ be a sequence defined by $x_k = k$ for $k=1, 2, \dots, 2006$ and $x_{k+1} = x_k + x_{k-2005}$ for $k \geq 2006$. Show that the sequence has $2005$ consecutive terms each divisible by $2006$.
-/
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)

theorem putnam_2006_a3
(x : ℤ → ℤ)
(hxlo : ∀ k : ℤ, 0 ≤ k ∧ k ≤ 2006 → x k = k)
(hxhi : ∀ k : ℤ, k ≥ 2006 → x (k + 1) = x k + x (k - 2005))
: (∃ i : ℕ, i > 0 ∧ ∀ j : Finset.range 2005, 2006 ∣ x (i + j)) := by
  have h1 : False := by
    have h₁ := hxlo 1
    have h₂ := hxlo 0
    have h₃ := hxlo (-1)
    have h₄ := hxlo 2006
    have h₅ := hxhi (-2005)
    have h₆ := hxhi 2006
    have h₇ := hxhi 2005
    have h₈ := hxhi (-1)
    have h₉ := hxhi (-2)
    hole_1
  
  have h2 : ∃ (i : ℕ), i > 0 ∧ ∀ j : Finset.range 2005, 2006 ∣ x (i + j) := by
    hole_2
  hole_3