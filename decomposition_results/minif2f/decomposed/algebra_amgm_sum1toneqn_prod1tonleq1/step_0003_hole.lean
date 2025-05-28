theorem h₂ (a : ℕ → NNReal) (n : ℕ) (h₀ : ∑ x ∈ Finset.range n, a x = ↑n) : ∑ x ∈ Finset.range n, ↑(a x) = ↑n := by -- exact_mod_cast h₀
  hole