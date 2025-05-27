theorem h₁ (x y : ℝ) (h : y = 8 * √3 * (x - π / 3) + 4) : y - f (π / 3) = 8 * √3 * (x - π / 3) :=
  by
  rw [h]
  have h₂ : f (π / 3) = 4 := value_at_pi_over_3
  rw [h₂]
  ring