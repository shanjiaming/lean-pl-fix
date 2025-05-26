theorem h_f_self_zero (f : ℝ → ℝ → ℝ) (hf : ∀ (x y z : ℝ), f x y + f y z + f z x = 0) : ∀ (x : ℝ), f x x = 0 := by
  intro x
  have h₁ := hf x x x
  have h₂ : f x x + f x x + f x x = 0 := by sorry
  have h₃ : 3 * f x x = 0 := by sorry
  have h₄ : f x x = 0 := by sorry
  exact h₄