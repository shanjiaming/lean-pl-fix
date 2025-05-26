theorem putnam_1979_a2
: ∀ k : ℝ, (∃ f : ℝ → ℝ, Continuous f ∧ ∀ x : ℝ, f (f x) = k*x^9) ↔ ((fun k : ℝ => k ≥ 0) : ℝ → Prop ) k := by