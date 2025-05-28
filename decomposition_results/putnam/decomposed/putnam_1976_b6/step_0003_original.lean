theorem h₂ (σ : ℕ → ℤ) (hσ : σ = fun N => ∑ d ∈ N.divisors, ↑d) (quasiperfect : ℕ → Prop) (quasiperfect_def : ∀ (N : ℕ), quasiperfect N ↔ σ N = 2 * ↑N + 1) (N : ℕ) (h_quasiperfect : quasiperfect N) : σ N = 2 * ↑N + 1 := by
  rw [quasiperfect_def] at h_quasiperfect
  exact h_quasiperfect