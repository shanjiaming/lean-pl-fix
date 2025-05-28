theorem h₂ (h_main : ∀ N ≥ 2, ∏ n ∈ Finset.Icc 2 N, (↑n ^ 3 - 1) / (↑n ^ 3 + 1) = 2 * (↑N ^ 2 + ↑N + 1) / (3 * ↑N * (↑N + 1))) (h_main_limit : Tendsto (fun N => 2 * (↑N ^ 2 + ↑N + 1) / (3 * ↑N * (↑N + 1))) atTop (𝓝 (2 / 3))) : Tendsto (fun N => ∏ n ∈ Finset.Icc 2 N, (↑n ^ 3 - 1) / (↑n ^ 3 + 1)) atTop (𝓝 (2 / 3)) :=
  by
  have h₃ :
    ∀ᶠ (N : ℤ) in atTop,
      ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1) = (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1)) := by sorry
  have h₄ : Tendsto (fun N ↦ ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1)) atTop (𝓝 ((2 / 3) : ℝ)) := by sorry
  --  exact h₄
  hole