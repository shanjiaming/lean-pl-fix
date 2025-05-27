theorem h₃ (x : ℝ) (h₁ : ∀ (x : ℝ), f x = 1) : f = fun x => 1 := by
  funext x
  rw [h₁ x]