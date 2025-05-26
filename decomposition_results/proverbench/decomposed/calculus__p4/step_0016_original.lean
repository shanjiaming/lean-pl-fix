theorem h₁₂ (h₀ : sorry) : ContinuousAt (fun x => 1 / x) 3 :=
  by
  apply ContinuousAt.div
  · exact continuousAt_const
  · exact continuousAt_id
  · norm_num