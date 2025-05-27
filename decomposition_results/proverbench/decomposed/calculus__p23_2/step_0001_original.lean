theorem geometric_limit (n : ℕ) : Tendsto (fun n => (2 / 3) ^ n) Filter.atTop (nhds 0) :=
  by
  have h₁ : Tendsto (λ n : ℕ => (2 / 3 : ℝ) ^ n) Filter.atTop (nhds 0) := by sorry
  exact h₁