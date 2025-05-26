theorem putnam_2021_a2 (g : ℝ → ℝ) (hg : (x : ℕ) → x > 0 → sorry) : sorry :=
  by
  have h_main : Tendsto (fun x => g x / x) atTop (𝓝 (Real.exp 1)) := by sorry
  exact h_main