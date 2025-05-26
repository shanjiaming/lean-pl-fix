theorem putnam_2008_b2
(F : ℕ → ℝ → ℝ)
(hF0 : ∀ x : ℝ, F 0 x = Real.log x)
(hFn : ∀ n : ℕ, ∀ x > 0, F (n + 1) x = ∫ t in Set.Ioo 0 x, F n t)
: Tendsto (fun n : ℕ => ((n)! * F n 1) / Real.log n) atTop (𝓝 ((-1) : ℝ )) := by