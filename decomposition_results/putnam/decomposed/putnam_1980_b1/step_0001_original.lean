theorem putnam_1980_b1 (c : ℝ) : (∀ (x : ℝ), (rexp x + rexp (-x)) / 2 ≤ rexp (c * x ^ 2)) ↔ c ∈ {c | c ≥ 1 / 2} :=
  by
  have h_main : (∀ x : ℝ, (exp x + exp (-x)) / 2 ≤ exp (c * x ^ 2)) ↔ c ≥ 1 / 2 := by sorry
  have h_final : (∀ x : ℝ, (exp x + exp (-x)) / 2 ≤ exp (c * x ^ 2)) ↔ c ∈ (({c : ℝ | c ≥ 1 / 2}) : Set ℝ) := by sorry
  exact h_final