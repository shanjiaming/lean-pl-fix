theorem h_final (x : ℝ) (h_main : ∃ δ, ∃ (_ : 0 < δ), ∀ (x : ℝ), |x - 2| < δ → f x ≤ f 2) : IsLocalMax f 2 := by
  rw [IsLocalMax]
  obtain ⟨δ, hδ, hδ'⟩ := h_main
  filter_upwards [Metric.ball_mem_nhds 2 hδ] with y hy
  have h₁ : |y - 2| < δ := by sorry
  have h₂ : f y ≤ f 2 := hδ' y h₁
  exact h₂