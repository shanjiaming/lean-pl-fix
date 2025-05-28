theorem h₁₇ (y : ℝ → ℝ) (ycontdiff : ContDiff ℝ 1 y) (limy : Tendsto (fun x => deriv y x ^ 2 + y x ^ 3) atTop (𝓝 0)) (h_y_tendsto : Tendsto y atTop (𝓝 0)) (h₂ : Tendsto (fun x => deriv y x ^ 2 + y x ^ 3) atTop (𝓝 0)) (h₃ : Tendsto (fun x => y x ^ 3) atTop (𝓝 0)) (h₅ : Tendsto (fun x => deriv y x ^ 2 + y x ^ 3) atTop (𝓝 0)) (h₆ : Tendsto (fun x => y x ^ 3) atTop (𝓝 0)) (h₈ h₁₅ : Tendsto (fun x => deriv y x ^ 2 + y x ^ 3 - y x ^ 3) atTop (𝓝 (0 - 0))) : (fun x => deriv y x ^ 2) = fun x => deriv y x ^ 2 + y x ^ 3 - y x ^ 3 :=
  by
  --  funext x
  --  ring
  norm_num