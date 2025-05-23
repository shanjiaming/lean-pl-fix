axiom series_convergence' {b : ℕ → ℝ} (h_pos : ∀ n, b n > 0)
  (h_lim : Tendsto b atTop (𝓝 (1/2))): Summable (fun n => |b n^n * cos (n * π) / n|)