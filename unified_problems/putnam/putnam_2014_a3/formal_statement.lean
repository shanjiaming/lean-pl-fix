theorem putnam_2014_a3
(a : ℕ → ℝ)
(a0 : a 0 = 5 / 2)
(ak : ∀ k ≥ 1, a k = (a (k - 1)) ^ 2 - 2)
: Tendsto (fun n : ℕ => ∏ k in Finset.range n, (1 - 1 / a k)) atTop (𝓝 ((3 / 7) : ℝ )) := by