theorem rolle_theorem_application : ∃! c, c ∈ Set.Ioo 0 8 ∧ HasDerivAt f 0 c ∧ c = 4:=
  by
  have h_main : ∃! c, c ∈ Set.Ioo 0 8 ∧ HasDerivAt f 0 c ∧ c = 4:=
    by
    --  use 4
    --  constructor
    ·
      have h₁ : (4 : ℝ) ∈ Set.Ioo 0 8:= by -- -- constructor <;> norm_num
        norm_num
      have h₂ : HasDerivAt f 0 (4 : ℝ):=
        by
        have h₃ : HasDerivAt f ((1 / 3 : ℝ) * (8 * (4 : ℝ) - (4 : ℝ) ^ 2) ^ (-2 / 3 : ℝ) * (8 - 2 * (4 : ℝ))) (4 : ℝ) :=
          derivative_f 4 (by norm_num)
        have h₄ : (1 / 3 : ℝ) * (8 * (4 : ℝ) - (4 : ℝ) ^ 2) ^ (-2 / 3 : ℝ) * (8 - 2 * (4 : ℝ)) = 0:= by -- norm_num
          hole
        --  --  convert h₃ using 1 <;> simp [h₄]
        hole
    --    exact ⟨h₁, h₂, rfl⟩
    --  · rintro c ⟨h₁, h₂, h₃⟩
    --    simp_all <;> aesop
    hole
  --  exact h_main
  hole