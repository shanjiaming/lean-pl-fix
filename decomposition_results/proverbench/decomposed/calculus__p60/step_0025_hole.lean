theorem h3 (h1 : sorry) (h2 : sorry) : sorry :=
  by
  have h4 :
    Tendsto (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) (𝓝[≠] 0)
      (𝓝 (1 * (3 / 5))) := by sorry
  have h10 :
    (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) =ᶠ[𝓝[≠] 0]
      (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) := by sorry
  have h16 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := by sorry
  --  exact h16
  hole