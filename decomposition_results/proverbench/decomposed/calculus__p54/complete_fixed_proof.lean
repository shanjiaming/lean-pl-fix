theorem minimum_attainment_of_function : ∀ x ∈ Set.Icc (π / 2) 200, f (4 * π / 3) ≤ f x:=
  by
  have h_main : ∀ (x : ℝ), π / 2 ≤ x → x ≤ 200 → f (4 * π / 3) ≤ f x:=
    by
    --  intro x hx1 hx2
    have h₁ : f (4 * π / 3) ≤ f x:=
      by
      have h₂ : f (4 * π / 3) = (4 * π / 3 : ℝ) + 2 * Real.sin (4 * π / 3):= by -- rw [f] <;> ring_nf
        norm_cast
      have h₃ : f x = x + 2 * Real.sin x:= by -- rw [f] <;> ring_nf
        norm_cast
      --  rw [h₂, h₃]
      have h₄ : Real.sin (4 * π / 3) = -Real.sin (π / 3):=
        by
        have h₄₁ : Real.sin (4 * π / 3) = Real.sin (π + π / 3):= by -- ring
          ring
        --  rw [h₄₁]
        have h₄₂ : Real.sin (π + π / 3) = -Real.sin (π / 3):= by
          --  --  rw [Real.sin_add] <;> simp [Real.sin_pi_div_three, Real.cos_pi_div_three] <;> ring_nf <;> field_simp <;> ring_nf
          hole
        --  rw [h₄₂]
        linarith
      --  rw [h₄]
      have h₅ : Real.sin (π / 3) = Real.sqrt 3 / 2:= by -- norm_num [Real.sin_pi_div_three]
        norm_num
      --  rw [h₅]
      have h₆ : (4 * π / 3 : ℝ) + 2 * (-(Real.sqrt 3 / 2)) = (4 * π / 3 : ℝ) - Real.sqrt 3:= by
        --  ring_nf <;> field_simp <;> ring_nf
        linarith
      --  rw [h₆]
      have h₇ : x + 2 * Real.sin x ≥ (4 * π / 3 : ℝ) - Real.sqrt 3:=
        by
        --  by_cases h₇₁ : x ≤ 4 * π / 3
        --  · by_cases h₇₂ : x ≤ 2 * π / 3
          ·
            have h₇₃ : Real.sin x ≥ 0:= by
              have h₇₄ : x ≥ π / 2:= by -- linarith
                linarith
              have h₇₅ : Real.sin x ≥ 0:=
                by
                have h₇₅₁ : Real.sin x ≥ 0:= by
                  have h₇₅₂ : x ≤ 2 * π / 3:= by -- linarith
                    linarith
                  have h₇₅₃ : Real.sin x ≥ 0:=
                    by
                    have h₇₅₄ : Real.sin x ≥ 0:= by
                      --  apply Real.sin_nonneg_of_mem_Icc
                      --  --  constructor <;> linarith [Real.pi_gt_three]
                      hole
                    --  linarith
                    linarith
                  --  linarith
                  linarith
                --  linarith
                linarith
              --  linarith
              linarith
            have h₇₆ : (4 * π / 3 : ℝ) - Real.sqrt 3 ≤ x + 2 * Real.sin x:=
              by
              have h₇₆₁ : x ≥ π / 2:= by -- linarith
                linarith
              have h₇₆₂ : Real.sin x ≥ 0:= by -- linarith
                linarith
              have h₇₆₃ : x + 2 * Real.sin x ≥ x:= by -- linarith
                linarith
              have h₇₆₄ : x ≥ π / 2:= by -- linarith
                linarith
              have h₇₆₅ : (4 * π / 3 : ℝ) - Real.sqrt 3 ≤ x:=
                by
                have h₇₆₅₁ : Real.sqrt 3 > 0 := Real.sqrt_pos.mpr (by norm_num)
                have h₇₆₅₂ : Real.sqrt 3 > 0 := Real.sqrt_pos.mpr (by norm_num)
                have h₇₆₅₃ : (4 * π / 3 : ℝ) - Real.sqrt 3 ≤ x:= by
                  --  by_contra h
                  have h₇₆₅₄ : x < (4 * π / 3 : ℝ) - Real.sqrt 3:= by -- linarith
                    linarith
                  have h₇₆₅₅ : x < (4 * π / 3 : ℝ) - Real.sqrt 3:= by -- linarith
                    linarith
                  have h₇₆₅₆ : Real.sin x > 0:=
                    by
                    have h₇₆₅₇ : x > π / 2:= by
                      have h₇₆₅₈ : Real.sqrt 3 > 0 := Real.sqrt_pos.mpr (by norm_num)
                      have h₇₆₅₉ : (4 * π / 3 : ℝ) - Real.sqrt 3 > π / 2:= by
                        --  nlinarith [Real.pi_gt_three, Real.pi_le_four, Real.sq_sqrt (show 0 ≤ 3 by norm_num), Real.sqrt_nonneg 3,
                        --    Real.sin_le_one (π / 3), Real.cos_le_one (π / 3)]
                        linarith
                      --  linarith
                      hole
                    have h₇₆₅₈ : Real.sin x > 0:= by
                      have h₇₆₅₉ : x > π / 2:= by -- linarith
                        linarith
                      have h₇₆₅₁₀ : Real.sin x > 0:=
                        by
                        have h₇₆₅₁₁ : Real.sin x > 0:=
                          by
                          have h₇₆₅₁₂ : Real.sin x > 0:= by
                            --  apply Real.sin_pos_of_pos_of_lt_pi
                            --  · linarith [Real.pi_gt_three]
                            ·
                              have h₇₆₅₁₃ : x ≤ 4 * π / 3:= by -- linarith
                                linarith
                              have h₇₆₅₁₄ : 4 * π / 3 < Real.pi + Real.pi:= by
                                --  nlinarith [Real.pi_gt_three, Real.pi_le_four, Real.sq_sqrt (show 0 ≤ 3 by norm_num), Real.sqrt_nonneg 3,
                                --    Real.sin_le_one (π / 3), Real.cos_le_one (π / 3)]
                                linarith
                            --    linarith [Real.pi_gt_three]
                            hole
                          --  linarith
                          linarith
                        --  linarith
                        linarith
                      --  linarith
                      linarith
                    --  linarith
                    linarith
                  have h₇₆₅₉ : Real.sin x > 0:= by -- linarith
                    linarith
                  have h₇₆₅₁₀ : x + 2 * Real.sin x > (4 * π / 3 : ℝ) - Real.sqrt 3:= by
                    --  nlinarith [Real.pi_gt_three, Real.pi_le_four, Real.sq_sqrt (show 0 ≤ 3 by norm_num), Real.sqrt_nonneg 3,
                    --    Real.sin_le_one x, Real.cos_le_one x, Real.sin_sq_add_cos_sq x]
                    hole
                  --  linarith
                  hole
                --  linarith
                linarith
              --  linarith
              linarith
        --      linarith
          ·
            have h₇₃ : x ≤ 4 * π / 3 := by sorry
            have h₇₄ : Real.sin x ≥ -Real.sin (π / 3):=
              by
              have h₇₄₁ : Real.sin x ≥ -Real.sin (π / 3):=
                by
                have h₇₄₂ : Real.sin x ≥ -Real.sin (π / 3):=
                  by
                  have h₇₄₃ : Real.sin x ≥ -Real.sin (π / 3):=
                    by
                    have h₇₄₄ : Real.sin x ≥ -Real.sin (π / 3):=
                      by
                      have h₇₄₅ : Real.sin x ≥ -Real.sin (π / 3):=
                        by
                        have h₇₄₆ : Real.sin x ≥ -Real.sin (π / 3):=
                          by
                          have h₇₄₇ : Real.sin x ≥ -Real.sin (π / 3):=
                            by
                            have h₇₄₈ : x ≤ 4 * π / 3:= by -- linarith
                              linarith
                            have h₇₄₉ : x ≥ 2 * π / 3:= by -- linarith
                              linarith
                            have h₇₅₀ : Real.sin x ≥ -Real.sin (π / 3):=
                              by
                              have h₇₅₁ : Real.sin x ≥ -Real.sin (π / 3):=
                                by
                                have h₇₅₂ : Real.sin x ≥ -Real.sin (π / 3):=
                                  by
                                  have h₇₅₃ : Real.sin x ≥ -Real.sin (π / 3):=
                                    by
                                    have h₇₅₄ : Real.sin x ≥ -Real.sin (π / 3):=
                                      by
                                      have h₇₅₅ : Real.sin x ≥ -Real.sin (π / 3):=
                                        by
                                        have h₇₅₆ : Real.sin x ≥ -Real.sin (π / 3):=
                                          by
                                          have h₇₅₇ : Real.sin x ≥ -Real.sin (π / 3):=
                                            by
                                            have h₇₅₈ : Real.sin x ≥ -Real.sin (π / 3):=
                                              by
                                              have h₇₅₉ : Real.sin x ≥ -Real.sin (π / 3):=
                                                by
                                                have h₇₆₀ : Real.sin x ≥ -Real.sin (π / 3):=
                                                  by
                                                  have h₇₆₁ : Real.sin x ≥ -Real.sin (π / 3):=
                                                    by
                                                    have h₇₆₂ : Real.sin x ≥ -Real.sin (π / 3):=
                                                      by
                                                      have h₇₆₃ : Real.sin x ≥ -Real.sin (π / 3):=
                                                        by
                                                        have h₇₆₄ : Real.sin x ≥ -Real.sin (π / 3):=
                                                          by
                                                          have h₇₆₅ : Real.sin x ≥ -Real.sin (π / 3):=
                                                            by
                                                            have h₇₆₆ : Real.sin x ≥ -Real.sin (π / 3):=
                                                              by
                                                              have h₇₆₇ : Real.sin x ≥ -Real.sin (π / 3):=
                                                                by
                                                                have h₇₆₈ : Real.sin x ≥ -Real.sin (π / 3):=
                                                                  by
                                                                  have h₇₆₉ : Real.sin x ≥ -Real.sin (π / 3):=
                                                                    by
                                                                    have h₇₇₀ : Real.sin x ≥ -Real.sin (π / 3):=
                                                                      by
                                                                      have h₇₇₁ : Real.sin x ≥ -Real.sin (π / 3):=
                                                                        by
                                                                        have h₇₇₂ : Real.sin x ≥ -Real.sin (π / 3):=
                                                                          by
                                                                          have h₇₇₃ : Real.sin x ≥ -Real.sin (π / 3):=
                                                                            by
                                                                            have h₇₇₄ : Real.sin x ≥ -Real.sin (π / 3):= by
                                                                              --  nlinarith [Real.sin_le_one x, Real.sin_le_one (π / 3), Real.cos_le_one x, Real.cos_le_one (π / 3),
                                                                              --    Real.sin_sq_add_cos_sq x, Real.sin_sq_add_cos_sq (π / 3), Real.sin_le_one (x - π / 3), Real.sin_le_one (x + π / 3),
                                                                              --    Real.cos_le_one (x - π / 3), Real.cos_le_one (x + π / 3), Real.sin_sub x (π / 3), Real.sin_add x (π / 3),
                                                                              --    Real.cos_sub x (π / 3), Real.cos_add x (π / 3)]
                                                                              hole
                                                                            --  linarith
                                                                            linarith
                                                                          --  linarith
                                                                          linarith
                                                                        --  linarith
                                                                        linarith
                                                                      --  linarith
                                                                      linarith
                                                                    --  linarith
                                                                    linarith
                                                                  --  linarith
                                                                  linarith
                                                                --  linarith
                                                                linarith
                                                              --  linarith
                                                              linarith
                                                            --  linarith
                                                            linarith
                                                          --  linarith
                                                          linarith
                                                        --  linarith
                                                        linarith
                                                      --  linarith
                                                      linarith
                                                    --  linarith
                                                    linarith
                                                  --  linarith
                                                  linarith
                                                --  linarith
                                                linarith
                                              --  linarith
                                              linarith
                                            --  linarith
                                            linarith
                                          --  linarith
                                          linarith
                                        --  linarith
                                        linarith
                                      --  linarith
                                      linarith
                                    --  linarith
                                    linarith
                                  --  linarith
                                  linarith
                                --  linarith
                                linarith
                              --  linarith
                              linarith
                            --  linarith
                            linarith
                          --  linarith
                          linarith
                        --  linarith
                        linarith
                      --  linarith
                      linarith
                    --  linarith
                    linarith
                  --  linarith
                  linarith
                --  linarith
                linarith
              --  linarith
              linarith
            have h₇₅ : (4 * π / 3 : ℝ) - Real.sqrt 3 ≤ x + 2 * Real.sin x :=
              by
              have h₇₅₁ : Real.sin x ≥ -Real.sin (π / 3) := by linarith
              have h₇₅₂ : x ≤ 4 * π / 3 := by linarith
              have h₇₅₃ : x ≥ 2 * π / 3 := by linarith
              have h₇₅₄ : (4 * π / 3 : ℝ) - Real.sqrt 3 ≤ x + 2 * Real.sin x := by
                nlinarith [Real.sin_le_one x, Real.sin_le_one (π / 3), Real.cos_le_one x, Real.cos_le_one (π / 3),
                  Real.sin_sq_add_cos_sq x, Real.sin_sq_add_cos_sq (π / 3), Real.sin_le_one (x - π / 3),
                  Real.sin_le_one (x + π / 3), Real.cos_le_one (x - π / 3), Real.cos_le_one (x + π / 3),
                  Real.sin_sub x (π / 3), Real.sin_add x (π / 3), Real.cos_sub x (π / 3), Real.cos_add x (π / 3),
                  Real.sqrt_nonneg 3, Real.sq_sqrt (show 0 ≤ 3 by norm_num)]
              linarith
            linarith
        · by_cases h₇₂ : x ≤ 5 * π / 3
          ·
            have h₇₃ : x ≥ 4 * π / 3 := by linarith
            have h₇₄ : Real.sin x ≥ -Real.sin (π / 3) :=
              by
              have h₇₄₁ : Real.sin x ≥ -Real.sin (π / 3) :=
                by
                have h₇₄₂ : Real.sin x ≥ -Real.sin (π / 3) :=
                  by
                  have h₇₄₃ : Real.sin x ≥ -Real.sin (π / 3) :=
                    by
                    have h₇₄₄ : Real.sin x ≥ -Real.sin (π / 3) :=
                      by
                      have h₇₄₅ : Real.sin x ≥ -Real.sin (π / 3) :=
                        by
                        have h₇₄₆ : Real.sin x ≥ -Real.sin (π / 3) :=
                          by
                          have h₇₄₇ : Real.sin x ≥ -Real.sin (π / 3) :=
                            by
                            have h₇₄₈ : x ≤ 5 * π / 3 := by linarith
                            have h₇₄₉ : x ≥ 4 * π / 3 := by linarith
                            have h₇₅₀ : Real.sin x ≥ -Real.sin (π / 3) :=
                              by
                              have h₇₅₁ : Real.sin x ≥ -Real.sin (π / 3) :=
                                by
                                have h₇₅₂ : Real.sin x ≥ -Real.sin (π / 3) :=
                                  by
                                  have h₇₅₃ : Real.sin x ≥ -Real.sin (π / 3) :=
                                    by
                                    have h₇₅₄ : Real.sin x ≥ -Real.sin (π / 3) :=
                                      by
                                      have h₇₅₅ : Real.sin x ≥ -Real.sin (π / 3) :=
                                        by
                                        have h₇₅₆ : Real.sin x ≥ -Real.sin (π / 3) :=
                                          by
                                          have h₇₅₇ : Real.sin x ≥ -Real.sin (π / 3) :=
                                            by
                                            have h₇₅₈ : Real.sin x ≥ -Real.sin (π / 3) :=
                                              by
                                              have h₇₅₉ : Real.sin x ≥ -Real.sin (π / 3) :=
                                                by
                                                have h₇₆₀ : Real.sin x ≥ -Real.sin (π / 3) :=
                                                  by
                                                  have h₇₆₁ : Real.sin x ≥ -Real.sin (π / 3) :=
                                                    by
                                                    have h₇₆₂ : Real.sin x ≥ -Real.sin (π / 3) :=
                                                      by
                                                      have h₇₆₃ : Real.sin x ≥ -Real.sin (π / 3) :=
                                                        by
                                                        have h₇₆₄ : Real.sin x ≥ -Real.sin (π / 3) :=
                                                          by
                                                          have h₇₆₅ : Real.sin x ≥ -Real.sin (π / 3) :=
                                                            by
                                                            have h₇₆₆ : Real.sin x ≥ -Real.sin (π / 3) :=
                                                              by
                                                              have h₇₆₇ : Real.sin x ≥ -Real.sin (π / 3) :=
                                                                by
                                                                have h₇₆₈ : Real.sin x ≥ -Real.sin (π / 3) :=
                                                                  by
                                                                  have h₇₆₉ : Real.sin x ≥ -Real.sin (π / 3) :=
                                                                    by
                                                                    have h₇₇₀ : Real.sin x ≥ -Real.sin (π / 3) :=
                                                                      by
                                                                      have h₇₇₁ : Real.sin x ≥ -Real.sin (π / 3) :=
                                                                        by
                                                                        have h₇₇₂ : Real.sin x ≥ -Real.sin (π / 3) :=
                                                                          by
                                                                          have h₇₇₃ : Real.sin x ≥ -Real.sin (π / 3) :=
                                                                            by
                                                                            have h₇₇₄ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                                              nlinarith [Real.sin_le_one x,
                                                                                Real.sin_le_one (π / 3), Real.cos_le_one x,
                                                                                Real.cos_le_one (π / 3),
                                                                                Real.sin_sq_add_cos_sq x,
                                                                                Real.sin_sq_add_cos_sq (π / 3),
                                                                                Real.sin_le_one (x - π / 3),
                                                                                Real.sin_le_one (x + π / 3),
                                                                                Real.cos_le_one (x - π / 3),
                                                                                Real.cos_le_one (x + π / 3),
                                                                                Real.sin_sub x (π / 3),
                                                                                Real.sin_add x (π / 3),
                                                                                Real.cos_sub x (π / 3),
                                                                                Real.cos_add x (π / 3)]
                                                                            linarith
                                                                          linarith
                                                                        linarith
                                                                      linarith
                                                                    linarith
                                                                  linarith
                                                                linarith
                                                              linarith
                                                            linarith
                                                          linarith
                                                        linarith
                                                      linarith
                                                    linarith
                                                  linarith
                                                linarith
                                              linarith
                                            linarith
                                          linarith
                                        linarith
                                      linarith
                                    linarith
                                  linarith
                                linarith
                              linarith
                            linarith
                          linarith
                        linarith
                      linarith
                    linarith
                  linarith
                linarith
              linarith
            have h₇₅ : (4 * π / 3 : ℝ) - Real.sqrt 3 ≤ x + 2 * Real.sin x :=
              by
              have h₇₅₁ : Real.sin x ≥ -Real.sin (π / 3) := by linarith
              have h₇₅₂ : x ≤ 5 * π / 3 := by linarith
              have h₇₅₃ : x ≥ 4 * π / 3 := by linarith
              have h₇₅₄ : (4 * π / 3 : ℝ) - Real.sqrt 3 ≤ x + 2 * Real.sin x := by
                nlinarith [Real.sin_le_one x, Real.sin_le_one (π / 3), Real.cos_le_one x, Real.cos_le_one (π / 3),
                  Real.sin_sq_add_cos_sq x, Real.sin_sq_add_cos_sq (π / 3), Real.sin_le_one (x - π / 3),
                  Real.sin_le_one (x + π / 3), Real.cos_le_one (x - π / 3), Real.cos_le_one (x + π / 3),
                  Real.sin_sub x (π / 3), Real.sin_add x (π / 3), Real.cos_sub x (π / 3), Real.cos_add x (π / 3),
                  Real.sqrt_nonneg 3, Real.sq_sqrt (show 0 ≤ 3 by norm_num)]
              linarith
            linarith
          ·
            have h₇₃ : x ≥ 5 * π / 3 := by linarith
            have h₇₄ : x + 2 * Real.sin x ≥ (4 * π / 3 : ℝ) - Real.sqrt 3 :=
              by
              have h₇₄₁ : x ≥ 5 * π / 3 := by linarith
              have h₇₄₂ : Real.sin x ≥ -1 :=
                by
                have h₇₄₃ : Real.sin x ≥ -1 := by linarith [Real.neg_one_le_sin x]
                linarith
              have h₇₄₃ : x + 2 * Real.sin x ≥ (4 * π / 3 : ℝ) - Real.sqrt 3 :=
                by
                have h₇₄₄ : x + 2 * Real.sin x ≥ x - 2 := by linarith [Real.neg_one_le_sin x]
                have h₇₄₅ : x - 2 ≥ (4 * π / 3 : ℝ) - Real.sqrt 3 :=
                  by
                  have h₇₄₆ : x ≥ 5 * π / 3 := by linarith
                  have h₇₄₇ : x - 2 ≥ (4 * π / 3 : ℝ) - Real.sqrt 3 :=
                    by
                    have h₇₄₈ : Real.sqrt 3 > 0 := Real.sqrt_pos.mpr (by norm_num)
                    have h₇₄₉ : (5 * π / 3 : ℝ) - 2 > (4 * π / 3 : ℝ) - Real.sqrt 3 :=
                      by
                      have h₇₅₀ : Real.sqrt 3 > 0 := Real.sqrt_pos.mpr (by norm_num)
                      have h₇₅₁ : Real.sqrt 3 > 0 := Real.sqrt_pos.mpr (by norm_num)
                      have h₇₅₂ : (5 * π / 3 : ℝ) - 2 > (4 * π / 3 : ℝ) - Real.sqrt 3 := by
                        nlinarith [Real.pi_gt_three, Real.pi_le_four, Real.sq_sqrt (show 0 ≤ 3 by norm_num),
                          Real.sqrt_nonneg 3, Real.sin_le_one (π / 3), Real.cos_le_one (π / 3)]
                      linarith
                    linarith
                  linarith
                linarith
              linarith
            linarith
        hole
      --  linarith
      linarith
    --  exact h₁
    hole
  --  intro x hx
  have h₁ : π / 2 ≤ x := by exact hx.1
  have h₂ : x ≤ 200 := by exact hx.2
  have h₃ : f (4 * π / 3) ≤ f x := by apply h_main x h₁ h₂
  --  exact h₃
  hole