theorem h_main_limit (h_main : ∀ N ≥ 2, ∏ n ∈ Finset.Icc 2 N, (↑n ^ 3 - 1) / (↑n ^ 3 + 1) = 2 * (↑N ^ 2 + ↑N + 1) / (3 * ↑N * (↑N + 1))) : Tendsto (fun N => 2 * (↑N ^ 2 + ↑N + 1) / (3 * ↑N * (↑N + 1))) atTop (𝓝 (2 / 3)) :=
  by
  have h₁ : Tendsto (fun (N : ℤ) ↦ (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))) := by sorry
  --  exact h₁
  hole