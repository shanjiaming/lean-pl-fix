theorem critical_point : ∃! c, c ∈ Set.Ioo 0 8 ∧ HasDerivAt f 0 c:=
  by
  have h_main : ∃! c, c ∈ Set.Ioo 0 8 ∧ HasDerivAt f 0 c:=
    by
    --  use 4
    --  constructor
    ·
      have h₁ : (4 : ℝ) ∈ Set.Ioo 0 8:= by -- -- constructor <;> norm_num
        norm_num
      have h₂ : HasDerivAt f 0 (4 : ℝ):=
        by
        have h₃ : HasDerivAt f ((1 / 3 : ℝ) * (8 * (4 : ℝ) - (4 : ℝ) ^ 2) ^ (-2 / 3 : ℝ) * (8 - 2 * (4 : ℝ))) (4 : ℝ):=
          by
          --  apply derivative_f
          exact ⟨by norm_num, by norm_num⟩
          hole
        have h₄ : (1 / 3 : ℝ) * (8 * (4 : ℝ) - (4 : ℝ) ^ 2) ^ (-2 / 3 : ℝ) * (8 - 2 * (4 : ℝ)) = 0:= by -- norm_num
          hole
        have h₅ : HasDerivAt f 0 (4 : ℝ):= by -- convert h₃ using 1 <;> rw [h₄] <;> norm_num
          hole
        --  exact h₅
        simpa
    --    exact ⟨h₁, h₂⟩
    --  · rintro c ⟨h₁, h₂⟩
      have h₃ : c ∈ Set.Ioo 0 8 := h₁
      have h₄ : HasDerivAt f 0 c := h₂
      have h₅ : c = 4:=
        by
        have h₆ : HasDerivAt f ((1 / 3 : ℝ) * (8 * c - c ^ 2) ^ (-2 / 3 : ℝ) * (8 - 2 * c)) c:=
          by
          --  apply derivative_f
          exact ⟨h₃.1, h₃.2⟩
          hole
        have h₇ : (1 / 3 : ℝ) * (8 * c - c ^ 2) ^ (-2 / 3 : ℝ) * (8 - 2 * c) = 0:=
          by
          have h₈ : HasDerivAt f 0 c := h₄
          have h₉ : HasDerivAt f ((1 / 3 : ℝ) * (8 * c - c ^ 2) ^ (-2 / 3 : ℝ) * (8 - 2 * c)) c := h₆
          have h₁₀ : (1 / 3 : ℝ) * (8 * c - c ^ 2) ^ (-2 / 3 : ℝ) * (8 - 2 * c) = 0:= by -- apply HasDerivAt.unique h₉ h₈
            hole
          --  exact h₁₀
          hole
        have h₁₁ : (8 : ℝ) - 2 * c = 0:=
          by
          have h₁₂ : (8 * c - c ^ 2 : ℝ) > 0:= by
            have h₁₃ : c > 0 := h₃.1
            have h₁₄ : c < 8 := h₃.2
            --  nlinarith
            hole
          have h₁₅ : (8 * c - c ^ 2 : ℝ) > 0 := h₁₂
          have h₁₆ : (1 / 3 : ℝ) * (8 * c - c ^ 2) ^ (-2 / 3 : ℝ) * (8 - 2 * c) = 0 := h₇
          have h₁₇ : (8 * c - c ^ 2 : ℝ) > 0 := h₁₂
          have h₁₈ : (8 * c - c ^ 2 : ℝ) > 0 := h₁₂
          have h₁₉ : (8 - 2 * c : ℝ) = 0:= by
            --  by_contra h
            have h₂₀ : (8 - 2 * c : ℝ) ≠ 0 := h
            have h₂₁ : (1 / 3 : ℝ) * (8 * c - c ^ 2) ^ (-2 / 3 : ℝ) * (8 - 2 * c) ≠ 0:=
              by
              have h₂₂ : (8 * c - c ^ 2 : ℝ) > 0 := h₁₂
              have h₂₃ : (8 * c - c ^ 2 : ℝ) > 0 := h₁₂
              have h₂₄ : (8 * c - c ^ 2 : ℝ) > 0 := h₁₂
              have h₂₅ : (8 - 2 * c : ℝ) ≠ 0 := h₂₀
              have h₂₆ : (1 / 3 : ℝ) * (8 * c - c ^ 2) ^ (-2 / 3 : ℝ) * (8 - 2 * c) ≠ 0:=
                by
                have h₂₇ : (8 * c - c ^ 2 : ℝ) > 0 := h₁₂
                have h₂₈ : (8 * c - c ^ 2 : ℝ) > 0 := h₁₂
                have h₂₉ : (8 * c - c ^ 2 : ℝ) > 0 := h₁₂
                have h₃₀ : (8 - 2 * c : ℝ) ≠ 0 := h₂₅
                have h₃₁ : (1 / 3 : ℝ) > 0:= by -- norm_num
                  hole
                have h₃₂ : (8 * c - c ^ 2 : ℝ) > 0 := h₁₂
                have h₃₃ : (8 * c - c ^ 2 : ℝ) ^ (-2 / 3 : ℝ) > 0:= by -- positivity
                  hole
                have h₃₄ : (1 / 3 : ℝ) * (8 * c - c ^ 2) ^ (-2 / 3 : ℝ) > 0:= by -- positivity
                  hole
                have h₃₅ : (1 / 3 : ℝ) * (8 * c - c ^ 2) ^ (-2 / 3 : ℝ) * (8 - 2 * c) ≠ 0:=
                  by
                  --  intro h₃₆
                  have h₃₇ : (1 / 3 : ℝ) * (8 * c - c ^ 2) ^ (-2 / 3 : ℝ) * (8 - 2 * c) = 0 := h₃₆
                  have h₃₈ : (8 - 2 * c : ℝ) = 0:=
                    by
                    --  apply mul_left_cancel₀ (show (1 / 3 : ℝ) * (8 * c - c ^ 2) ^ (-2 / 3 : ℝ) ≠ 0 by positivity)
                    --  linarith
                    hole
                  --  contradiction
                  hole
                --  exact h₃₅
                hole
              --  exact h₂₆
              hole
            --  contradiction
            hole
          --  linarith
          hole
        have h₂₀ : c = 4:= by -- linarith
          hole
        --  exact h₂₀
        linarith
    --    rw [h₅]
    hole
  --  exact h_main
  simpa