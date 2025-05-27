theorem h (x✝ x : ℝ) : HasSum (fun n => (-1) ^ n / ↑(2 * n).factorial * x ^ (2 * n)) (cos x) := by apply hasSum_cos
  hole