theorem h₂ (c : ℝ) (h_main : (∀ (x : ℝ), (rexp x + rexp (-x)) / 2 ≤ rexp (c * x ^ 2)) ↔ c ≥ 1 / 2) (h : c ∈ {c | c ≥ 1 / 2}) (h₁ : c ≥ 1 / 2) : ∀ (x : ℝ), (rexp x + rexp (-x)) / 2 ≤ rexp (c * x ^ 2) :=
  by
  have h₃ : (∀ x : ℝ, (exp x + exp (-x)) / 2 ≤ exp (c * x ^ 2)) := (h_main.mpr h₁)
  --  exact h₃
  simpa