theorem h₁ (lambda : NNReal) (h : Summable fun k => ↑k * poissonPMFReal lambda k) : ∑' (k : ℕ), ↑k * poissonPMFReal lambda k = ↑lambda :=
  by
  have h₂ : lambda = 1 := by sorry
  have h₅ : ∑' k, k * poissonPMFReal lambda k = lambda := by sorry
  --  exact h₅
  linarith