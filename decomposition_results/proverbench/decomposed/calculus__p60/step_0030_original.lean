theorem h11 (h1 : sorry) (h2 : sorry) (h5 : sorry) (h6 : sorry) : sorry :=
  by
  have h12 : Tendsto (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2))) (𝓝[≠] 0) (𝓝 1) := h2
  have h13 : Tendsto (fun x : ℝ => ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) (𝓝[≠] 0) (𝓝 (3 / 5)) := h6
  have h14 :
    Tendsto (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) (𝓝[≠] 0)
      (𝓝 (1 * (3 / 5))) := by sorry
  exact h14