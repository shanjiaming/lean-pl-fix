/-- If f is an entire function such that |f(z)| ≥ 1 for all z ∈ ℂ, then g(z) = 1/f(z) is entire and |g(z)| ≤ 1. -/
lemma bounded_reciprocal_function (f : ℂ → ℂ) (hf : Entire f) (h : ∀ z, 1 ≤ abs (f z)) :
  Entire (fun z => 1 / f z) ∧ ∀ z, abs (1 / f z) ≤ 1 :=