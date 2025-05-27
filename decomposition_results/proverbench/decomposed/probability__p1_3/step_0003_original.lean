theorem h₂ (lambda : NNReal) (h : Summable fun k => ↑k * poissonPMFReal lambda k) : lambda = 1 :=
  by
  have h₃ : (1 : ℝ) - Real.exp (-1) = (1 : ℝ) - Real.exp (-(lambda : ℝ)) := by sorry
  have h₄ := lambda_eq_1 lambda h₃
  simpa using h₄