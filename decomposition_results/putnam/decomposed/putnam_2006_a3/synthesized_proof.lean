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
    admit
  
  have h2 : ∃ (i : ℕ), i > 0 ∧ ∀ j : Finset.range 2005, 2006 ∣ x (i + j) := by
    norm_cast
  norm_cast
