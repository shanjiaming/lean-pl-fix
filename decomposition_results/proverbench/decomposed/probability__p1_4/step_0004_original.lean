theorem h5 (lambda : NNReal) (h0 : lambda = 1) (h1 : Summable fun k => ↑k * ↑k ^ 2 * poissonPMFReal lambda k) (h2 : Summable fun k => ↑k * poissonPMFReal lambda k) (h3 : Summable fun k => ↑k ^ 2 * poissonPMFReal lambda k) (h4 : ∑' (k : ℕ), ↑k * poissonPMFReal lambda k = 1) : ∑' (k : ℕ), ↑k ^ 2 * poissonPMFReal lambda k = 2 :=
  by
  have h5₁ : lambda = 1 := h0
  subst h5₁
  have h5₂ : (∑' k : ℕ, (k : ℝ) ^ 2 * poissonPMFReal (1 : NNReal) k) = 2 := by sorry
  simpa using h5₂