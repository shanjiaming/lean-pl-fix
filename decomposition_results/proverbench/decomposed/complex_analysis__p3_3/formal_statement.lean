/-- If g(z) = 1/f(z) is constant, then f(z) is constant. -/
lemma constant_reciprocal_function (f : ℂ → ℂ) (hf : Entire f) (h : ∀ z, 1 ≤ abs (f z)) :
  ∃ c : ℂ, ∀ z, f z = 1 / c :=