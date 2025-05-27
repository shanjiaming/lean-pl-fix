theorem cos_taylor_series_converges (x✝ x : ℝ) : HasSum (fun n => (-1) ^ n / ↑(2 * n).factorial * x ^ (2 * n)) (cos x) :=
  by
  have h : HasSum (λ n : ℕ => ((-1 : ℝ) ^ n / (2 * n).factorial) * x ^ (2 * n)) (Real.cos x) := by sorry
  exact h