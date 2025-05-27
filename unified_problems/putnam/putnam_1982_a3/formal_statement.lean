theorem putnam_1982_a3 :
  Tendsto (fun t ↦ ∫ x in (0)..t, (arctan (Real.pi * x) - arctan x) / x) atTop (𝓝 (((Real.pi / 2) * log Real.pi) : ℝ )) := by