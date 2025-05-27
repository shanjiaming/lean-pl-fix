theorem convergent_seq_bounded {x : ℕ → ℝ} (hx : ∃ L, Tendsto x atTop (𝓝 L)) :
  ∃ M, ∀ n, |x n| ≤ M :=