theorem h5₂ (h0 : 1 = 1) (h1 : Summable fun k => ↑k * ↑k ^ 2 * poissonPMFReal 1 k) (h2 : Summable fun k => ↑k * poissonPMFReal 1 k) (h3 : Summable fun k => ↑k ^ 2 * poissonPMFReal 1 k) (h4 : ∑' (k : ℕ), ↑k * poissonPMFReal 1 k = 1) : ∑' (k : ℕ), ↑k ^ 2 * poissonPMFReal 1 k = 2 :=
  by
  have h5₃ : (∑' k : ℕ, (k : ℝ) ^ 2 * poissonPMFReal (1 : NNReal) k) = 2 := by sorry
  --  exact h5₃
  linarith