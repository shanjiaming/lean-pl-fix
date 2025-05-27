theorem putnam_1977_b1
: Tendsto (fun N ↦ ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1)) atTop (𝓝 ((2 / 3) : ℝ )) := by