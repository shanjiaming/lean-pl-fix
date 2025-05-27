theorem E_X (lambda : NNReal) (h : Summable fun k => ↑k * poissonPMFReal lambda k) : ∑' (k : ℕ), ↑k * poissonPMFReal lambda k = ↑lambda :=
  by
  have h₁ : ∑' k, k * poissonPMFReal lambda k = lambda := by sorry
  exact h₁