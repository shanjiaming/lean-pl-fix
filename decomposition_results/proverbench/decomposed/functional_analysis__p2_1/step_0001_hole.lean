theorem series_convergence' (b✝ b : ℕ → ℝ) (h_pos : ∀ (n : ℕ), b n > 0) (h_lim : Tendsto b atTop (𝓝 (1 / 2))) : Summable fun n => |b n ^ n * cos (↑n * π) / ↑n| :=
  by
  have h_main : Summable (fun n => (b n) ^ n / n : ℕ → ℝ) := by sorry
  have h_final : Summable (fun n => |b n ^ n * cos (n * π) / n|) := by sorry
  exact h_final
  hole