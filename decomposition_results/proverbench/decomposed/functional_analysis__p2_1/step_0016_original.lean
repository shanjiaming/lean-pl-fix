theorem h_final (b✝ b : ℕ → ℝ) (h_pos : ∀ (n : ℕ), b n > 0) (h_lim : Tendsto b atTop (𝓝 (1 / 2))) (h_main : Summable fun n => b n ^ n / ↑n) : Summable fun n => |b n ^ n * cos (↑n * π) / ↑n| :=
  by
  have h₁ : (fun n => |b n ^ n * cos (n * π) / n| : ℕ → ℝ) = (fun n => (b n) ^ n / n : ℕ → ℝ) := by sorry
  rw [h₁]
  exact h_main