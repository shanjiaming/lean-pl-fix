theorem hf_pos (f : ℕ → ℤ) (a : ℕ → ℕ) (hf : f = fun n => ↑n + ⌊√↑n⌋) (ha0 : a 0 > 0) (han : ∀ (n : ℕ), ↑(a (n + 1)) = f (a n)) : ∀ (n : ℕ), ↑n + ⌊√↑n⌋ ≥ ↑n := by -- sorry
  hole