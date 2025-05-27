theorem h6₃ (h0 : 1 = 1) (h1 : Summable fun k => ↑k * ↑k ^ 2 * poissonPMFReal 1 k) (h2 : Summable fun k => ↑k * poissonPMFReal 1 k) (h3 : Summable fun k => ↑k ^ 2 * poissonPMFReal 1 k) (h4 : ∑' (k : ℕ), ↑k * poissonPMFReal 1 k = 1) (h5 : ∑' (k : ℕ), ↑k ^ 2 * poissonPMFReal 1 k = 2) : ∑' (k : ℕ), ↑k * ↑k ^ 2 * poissonPMFReal 1 k = 5 :=
  by
  have h6₄ : (∑' k : ℕ, (k : ℝ) * k ^ 2 * poissonPMFReal (1 : NNReal) k) = 5 := by sorry
  --  exact h6₄
  hole