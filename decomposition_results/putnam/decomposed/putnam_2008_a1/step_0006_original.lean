theorem h_f_symmetric_zero (f : ℝ → ℝ → ℝ) (hf : ∀ (x y z : ℝ), f x y + f y z + f z x = 0) (h_f_self_zero : ∀ (x : ℝ), f x x = 0) : ∀ (x : ℝ), f x 0 + f 0 x = 0 := by
  intro x
  have h₁ := hf x x 0
  have h₂ : f x x + f x 0 + f 0 x = 0 := by sorry
  have h₃ : f x x = 0 := h_f_self_zero x
  linarith