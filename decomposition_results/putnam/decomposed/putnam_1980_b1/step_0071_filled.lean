theorem h₁ (c : ℝ) (h_main : (∀ (x : ℝ), (rexp x + rexp (-x)) / 2 ≤ rexp (c * x ^ 2)) ↔ c ≥ 1 / 2) (h : ∀ (x : ℝ), (rexp x + rexp (-x)) / 2 ≤ rexp (c * x ^ 2)) : c ≥ 1 / 2 := by
  have h₂ : (∀ x : ℝ, (exp x + exp (-x)) / 2 ≤ exp (c * x ^ 2)) := h
  have h₃ : c ≥ 1 / 2 := (h_main.mp h₂)
  --  exact h₃
  linarith