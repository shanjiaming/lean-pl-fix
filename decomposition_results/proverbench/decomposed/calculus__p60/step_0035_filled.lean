theorem h16 (h1 : sorry) (h2 : sorry) (h4 : sorry) (h10 :  (fun x => sin (3 * x + x ^ 2) / (3 * x + x ^ 2) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) =ᶠ[𝓝[≠] 0] fun x =>    sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) : sorry :=
  by
  have h17 :
    Tendsto (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)))
      (𝓝[≠] 0) (𝓝 (1 * (3 / 5))) :=
    h4
  have h18 :
    (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) =ᶠ[𝓝[≠] 0]
      (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) :=
    h10
  have h19 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (1 * (3 / 5))) :=
    h17.congr' h18
  have h20 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := by sorry
  --  exact h20
  hole