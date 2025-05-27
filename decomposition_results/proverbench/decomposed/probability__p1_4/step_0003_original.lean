theorem h4₁ (lambda : NNReal) (h0 : lambda = 1) (h1 : Summable fun k => ↑k * ↑k ^ 2 * poissonPMFReal lambda k) (h2 : Summable fun k => ↑k * poissonPMFReal lambda k) (h3 : Summable fun k => ↑k ^ 2 * poissonPMFReal lambda k) : ∑' (k : ℕ), ↑k * poissonPMFReal lambda k = ↑lambda :=
  by
  apply E_X
  exact h2