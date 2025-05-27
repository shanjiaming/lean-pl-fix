theorem h_main  : ∀ (x : ℝ), x ∉ Dom := by
  --  intro x hx
  have h₁ : -1 - x ≥ 0 := hx.1
  have h₂ : x > 0 := hx.2
  have h₃ : -1 - x < 0 := by sorry
  --  linarith
  hole