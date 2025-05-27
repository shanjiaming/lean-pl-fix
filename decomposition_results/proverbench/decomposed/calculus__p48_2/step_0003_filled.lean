theorem h₃ (x✝ x : ℝ) (h₂ : HasSum (fun n => (-1) ^ n / ↑(2 * n).factorial * x ^ (2 * n)) (cos x)) : ∑' (n : ℕ), (-1) ^ n / ↑(2 * n).factorial * x ^ (2 * n) = cos x := by exact h₂.tsum_eq
  hole