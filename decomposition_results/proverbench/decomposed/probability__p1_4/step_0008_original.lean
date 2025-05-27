theorem h6 (lambda : NNReal) (h0 : lambda = 1) (h1 : Summable fun k => ↑k * ↑k ^ 2 * poissonPMFReal lambda k) (h2 : Summable fun k => ↑k * poissonPMFReal lambda k) (h3 : Summable fun k => ↑k ^ 2 * poissonPMFReal lambda k) (h4 : ∑' (k : ℕ), ↑k * poissonPMFReal lambda k = 1) (h5 : ∑' (k : ℕ), ↑k ^ 2 * poissonPMFReal lambda k = 2) : ∑' (k : ℕ), ↑k * ↑k ^ 2 * poissonPMFReal lambda k = 5 :=
  by
  have h6₁ : lambda = 1 := h0
  subst h6₁
  have h6₂ : (∑' k : ℕ, (k : ℝ) * k ^ 2 * poissonPMFReal (1 : NNReal) k) = 5 := by sorry
  simpa using h6₂