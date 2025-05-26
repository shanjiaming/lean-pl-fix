/-- Liouville's Theorem: Any bounded entire function must be constant. -/
lemma liouville_theorem (g : ℂ → ℂ) (hg : Entire g) (hbounded : ∃ C, ∀ z, abs (g z) ≤ C) :
  ∃ c : ℂ, ∀ z, g z = c :=