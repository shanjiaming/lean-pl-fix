theorem putnam_1979_a2  : ∀ (k : ℝ), (∃ f, Continuous f ∧ ∀ (x : ℝ), f (f x) = k * x ^ 9) ↔ (fun k => k ≥ 0) k :=
  by
  intro k
  have h_main : (∃ f : ℝ → ℝ, Continuous f ∧ ∀ x : ℝ, f (f x) = k * x ^ 9) ↔ k ≥ 0 := by sorry
  simpa using h_main