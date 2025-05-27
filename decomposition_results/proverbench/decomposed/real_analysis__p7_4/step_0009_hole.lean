theorem h₆ (x c : ℝ) (h₁ : c ∈ Set.Ioo 0 8) (h₂ : HasDerivAt f 0 c) (h₃ : c ∈ Set.Ioo 0 8) (h₄ : HasDerivAt f 0 c) : HasDerivAt f (1 / 3 * (8 * c - c ^ 2) ^ (-2 / 3) * (8 - 2 * c)) c :=
  by
  --  apply derivative_f
  exact ⟨h₃.1, h₃.2⟩
  hole