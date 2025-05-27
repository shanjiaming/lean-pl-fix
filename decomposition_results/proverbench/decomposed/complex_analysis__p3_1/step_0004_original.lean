theorem h₁ (f : ℂ → ℂ) (hf : Entire f) (h : ℂ → 1 ≤ sorry) (hf_ne_zero : ∀ (z : ℂ), f z ≠ 0) : Entire fun z => 1 / f z :=
  by
  have h₂ : AnalyticOn ℂ (fun z : ℂ => 1 / f z) Set.univ := by sorry
  exact h₂