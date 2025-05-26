/-- If f is an entire function such that |f(z)| ≥ 1 for all z ∈ ℂ, then f is constant. -/
theorem constant_entire_function (f : ℂ → ℂ) (hf : Entire f) (h : ∀ z, 1 ≤ abs (f z)) :
  ∃ c : ℂ, ∀ z, f z = c :=