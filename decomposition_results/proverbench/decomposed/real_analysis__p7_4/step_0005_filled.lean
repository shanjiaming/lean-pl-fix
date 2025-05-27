theorem h₃ (x : ℝ) (h₁ : 4 ∈ Set.Ioo 0 8) : HasDerivAt f (1 / 3 * (8 * 4 - 4 ^ 2) ^ (-2 / 3) * (8 - 2 * 4)) 4 :=
  by
  --  apply derivative_f
  exact ⟨by norm_num, by norm_num⟩
  hole