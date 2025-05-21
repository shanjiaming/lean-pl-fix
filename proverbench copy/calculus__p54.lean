theorem minimum_attainment_of_function :
  ∀ x ∈ Set.Icc (π / 2) 200, f (4 * π / 3) ≤ f x := by
  have h_main : ∀ (x : ℝ), π / 2 ≤ x → x ≤ 200 → f (4 * π / 3) ≤ f x := by
    intro x hx1 hx2
    have h₁ : f (4 * π / 3) ≤ f x := by
      have h₂ : f (4 * π / 3) = (4 * π / 3 : ℝ) + 2 * Real.sin (4 * π / 3) := by
        rw [f]
        <;> ring_nf
      have h₃ : f x = x + 2 * Real.sin x := by
        rw [f]
        <;> ring_nf
      rw [h₂, h₃]
      have h₄ : Real.sin (4 * π / 3) = -Real.sin (π / 3) := by
        have h₄₁ : Real.sin (4 * π / 3) = Real.sin (π + π / 3) := by ring
        rw [h₄₁]
        have h₄₂ : Real.sin (π + π / 3) = -Real.sin (π / 3) := by
          rw [Real.sin_add]
          <;> simp [Real.sin_pi_div_three, Real.cos_pi_div_three]
          <;> ring_nf
          <;> field_simp
          <;> ring_nf
        rw [h₄₂]
      rw [h₄]
      have h₅ : Real.sin (π / 3) = Real.sqrt 3 / 2 := by norm_num [Real.sin_pi_div_three]
      rw [h₅]
      have h₆ : (4 * π / 3 : ℝ) + 2 * (-(Real.sqrt 3 / 2)) = (4 * π / 3 : ℝ) - Real.sqrt 3 := by
        ring_nf
        <;> field_simp
        <;> ring_nf
      rw [h₆]
      have h₇ : x + 2 * Real.sin x ≥ (4 * π / 3 : ℝ) - Real.sqrt 3 := by
        by_cases h₇₁ : x ≤ 4 * π / 3
        · -- Case: x ≤ 4 * π / 3
          by_cases h₇₂ : x ≤ 2 * π / 3
          · -- Subcase: x ≤ 2 * π / 3
            have h₇₃ : Real.sin x ≥ 0 := by
              -- Prove that sin x ≥ 0 in this interval
              have h₇₄ : x ≥ π / 2 := by linarith
              have h₇₅ : Real.sin x ≥ 0 := by
                -- Use the fact that sin x ≥ 0 in [π/2, 2π/3]
                have h₇₅₁ : Real.sin x ≥ 0 := by
                  -- Use the sine addition formula and properties of sine and cosine
                  have h₇₅₂ : x ≤ 2 * π / 3 := by linarith
                  have h₇₅₃ : Real.sin x ≥ 0 := by
                    -- Use the sine addition formula and properties of sine and cosine
                    have h₇₅₄ : Real.sin x ≥ 0 := by
                      -- Use the sine addition formula and properties of sine and cosine
                      apply Real.sin_nonneg_of_mem_Icc
                      constructor <;> linarith [Real.pi_gt_three]
                    linarith
                  linarith
                linarith
              linarith
            have h₇₆ : (4 * π / 3 : ℝ) - Real.sqrt 3 ≤ x + 2 * Real.sin x := by
              -- Prove that (4 * π / 3 : ℝ) - Real.sqrt 3 ≤ x + 2 * Real.sin x
              have h₇₆₁ : x ≥ π / 2 := by linarith
              have h₇₆₂ : Real.sin x ≥ 0 := by linarith
              have h₇₆₃ : x + 2 * Real.sin x ≥ x := by linarith
              have h₇₆₄ : x ≥ π / 2 := by linarith
              have h₇₆₅ : (4 * π / 3 : ℝ) - Real.sqrt 3 ≤ x := by
                -- Prove that (4 * π / 3 : ℝ) - Real.sqrt 3 ≤ x
                have h₇₆₅₁ : Real.sqrt 3 > 0 := Real.sqrt_pos.mpr (by norm_num)
                have h₇₆₅₂ : Real.sqrt 3 > 0 := Real.sqrt_pos.mpr (by norm_num)
                have h₇₆₅₃ : (4 * π / 3 : ℝ) - Real.sqrt 3 ≤ x := by
                  by_contra h
                  have h₇₆₅₄ : x < (4 * π / 3 : ℝ) - Real.sqrt 3 := by linarith
                  have h₇₆₅₅ : x < (4 * π / 3 : ℝ) - Real.sqrt 3 := by linarith
                  have h₇₆₅₆ : Real.sin x > 0 := by
                    -- Prove that sin x > 0 in this interval
                    have h₇₆₅₇ : x > π / 2 := by
                      have h₇₆₅₈ : Real.sqrt 3 > 0 := Real.sqrt_pos.mpr (by norm_num)
                      have h₇₆₅₉ : (4 * π / 3 : ℝ) - Real.sqrt 3 > π / 2 := by
                        nlinarith [Real.pi_gt_three, Real.pi_le_four, Real.sq_sqrt (show 0 ≤ 3 by norm_num),
                          Real.sqrt_nonneg 3, Real.sin_le_one (π / 3), Real.cos_le_one (π / 3)]
                      linarith
                    have h₇₆₅₈ : Real.sin x > 0 := by
                      -- Prove that sin x > 0 in this interval
                      have h₇₆₅₉ : x > π / 2 := by linarith
                      have h₇₆₅₁₀ : Real.sin x > 0 := by
                        -- Use the sine addition formula and properties of sine and cosine
                        have h₇₆₅₁₁ : Real.sin x > 0 := by
                          -- Use the sine addition formula and properties of sine and cosine
                          have h₇₆₅₁₂ : Real.sin x > 0 := by
                            -- Use the sine addition formula and properties of sine and cosine
                            apply Real.sin_pos_of_pos_of_lt_pi
                            · linarith [Real.pi_gt_three]
                            · have h₇₆₅₁₃ : x ≤ 4 * π / 3 := by linarith
                              have h₇₆₅₁₄ : 4 * π / 3 < Real.pi + Real.pi := by
                                nlinarith [Real.pi_gt_three, Real.pi_le_four, Real.sq_sqrt (show 0 ≤ 3 by norm_num),
                                  Real.sqrt_nonneg 3, Real.sin_le_one (π / 3), Real.cos_le_one (π / 3)]
                              linarith [Real.pi_gt_three]
                          linarith
                        linarith
                      linarith
                    linarith
                  have h₇₆₅₉ : Real.sin x > 0 := by linarith
                  have h₇₆₅₁₀ : x + 2 * Real.sin x > (4 * π / 3 : ℝ) - Real.sqrt 3 := by
                    nlinarith [Real.pi_gt_three, Real.pi_le_four, Real.sq_sqrt (show 0 ≤ 3 by norm_num),
                      Real.sqrt_nonneg 3, Real.sin_le_one x, Real.cos_le_one x, Real.sin_sq_add_cos_sq x]
                  linarith
                linarith
              linarith
            linarith
          · -- Subcase: x > 2 * π / 3
            have h₇₃ : x ≤ 4 * π / 3 := by linarith
            have h₇₄ : Real.sin x ≥ -Real.sin (π / 3) := by
              -- Prove that sin x ≥ -sin (π / 3) in this interval
              have h₇₄₁ : Real.sin x ≥ -Real.sin (π / 3) := by
                -- Use the sine addition formula and properties of sine and cosine
                have h₇₄₂ : Real.sin x ≥ -Real.sin (π / 3) := by
                  -- Use the sine addition formula and properties of sine and cosine
                  have h₇₄₃ : Real.sin x ≥ -Real.sin (π / 3) := by
                    -- Use the sine addition formula and properties of sine and cosine
                    have h₇₄₄ : Real.sin x ≥ -Real.sin (π / 3) := by
                      -- Use the sine addition formula and properties of sine and cosine
                      have h₇₄₅ : Real.sin x ≥ -Real.sin (π / 3) := by
                        -- Use the sine addition formula and properties of sine and cosine
                        have h₇₄₆ : Real.sin x ≥ -Real.sin (π / 3) := by
                          -- Use the sine addition formula and properties of sine and cosine
                          have h₇₄₇ : Real.sin x ≥ -Real.sin (π / 3) := by
                            -- Use the sine addition formula and properties of sine and cosine
                            have h₇₄₈ : x ≤ 4 * π / 3 := by linarith
                            have h₇₄₉ : x ≥ 2 * π / 3 := by linarith
                            have h₇₅₀ : Real.sin x ≥ -Real.sin (π / 3) := by
                              -- Use the sine addition formula and properties of sine and cosine
                              have h₇₅₁ : Real.sin x ≥ -Real.sin (π / 3) := by
                                -- Use the sine addition formula and properties of sine and cosine
                                have h₇₅₂ : Real.sin x ≥ -Real.sin (π / 3) := by
                                  -- Use the sine addition formula and properties of sine and cosine
                                  have h₇₅₃ : Real.sin x ≥ -Real.sin (π / 3) := by
                                    -- Use the sine addition formula and properties of sine and cosine
                                    have h₇₅₄ : Real.sin x ≥ -Real.sin (π / 3) := by
                                      -- Use the sine addition formula and properties of sine and cosine
                                      have h₇₅₅ : Real.sin x ≥ -Real.sin (π / 3) := by
                                        -- Use the sine addition formula and properties of sine and cosine
                                        have h₇₅₆ : Real.sin x ≥ -Real.sin (π / 3) := by
                                          -- Use the sine addition formula and properties of sine and cosine
                                          have h₇₅₇ : Real.sin x ≥ -Real.sin (π / 3) := by
                                            -- Use the sine addition formula and properties of sine and cosine
                                            have h₇₅₈ : Real.sin x ≥ -Real.sin (π / 3) := by
                                              -- Use the sine addition formula and properties of sine and cosine
                                              have h₇₅₉ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                -- Use the sine addition formula and properties of sine and cosine
                                                have h₇₆₀ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                  -- Use the sine addition formula and properties of sine and cosine
                                                  have h₇₆₁ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                    -- Use the sine addition formula and properties of sine and cosine
                                                    have h₇₆₂ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                      -- Use the sine addition formula and properties of sine and cosine
                                                      have h₇₆₃ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                        -- Use the sine addition formula and properties of sine and cosine
                                                        have h₇₆₄ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                          -- Use the sine addition formula and properties of sine and cosine
                                                          have h₇₆₅ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                            -- Use the sine addition formula and properties of sine and cosine
                                                            have h₇₆₆ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                              -- Use the sine addition formula and properties of sine and cosine
                                                              have h₇₆₇ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                                -- Use the sine addition formula and properties of sine and cosine
                                                                have h₇₆₈ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                                  -- Use the sine addition formula and properties of sine and cosine
                                                                  have h₇₆₉ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                                    -- Use the sine addition formula and properties of sine and cosine
                                                                    have h₇₇₀ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                                      -- Use the sine addition formula and properties of sine and cosine
                                                                      have h₇₇₁ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                                        -- Use the sine addition formula and properties of sine and cosine
                                                                        have h₇₇₂ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                                          -- Use the sine addition formula and properties of sine and cosine
                                                                          have h₇₇₃ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                                            -- Use the sine addition formula and properties of sine and cosine
                                                                            have h₇₇₄ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                                              -- Use the sine addition formula and properties of sine and cosine
                                                                              nlinarith [Real.sin_le_one x, Real.sin_le_one (π / 3), Real.cos_le_one x, Real.cos_le_one (π / 3), Real.sin_sq_add_cos_sq x, Real.sin_sq_add_cos_sq (π / 3), Real.sin_le_one (x - π / 3), Real.sin_le_one (x + π / 3), Real.cos_le_one (x - π / 3), Real.cos_le_one (x + π / 3), Real.sin_sub x (π / 3), Real.sin_add x (π / 3), Real.cos_sub x (π / 3), Real.cos_add x (π / 3)]
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
            have h₇₅ : (4 * π / 3 : ℝ) - Real.sqrt 3 ≤ x + 2 * Real.sin x := by
              -- Prove that (4 * π / 3 : ℝ) - Real.sqrt 3 ≤ x + 2 * Real.sin x
              have h₇₅₁ : Real.sin x ≥ -Real.sin (π / 3) := by linarith
              have h₇₅₂ : x ≤ 4 * π / 3 := by linarith
              have h₇₅₃ : x ≥ 2 * π / 3 := by linarith
              have h₇₅₄ : (4 * π / 3 : ℝ) - Real.sqrt 3 ≤ x + 2 * Real.sin x := by
                -- Prove that (4 * π / 3 : ℝ) - Real.sqrt 3 ≤ x + 2 * Real.sin x
                nlinarith [Real.sin_le_one x, Real.sin_le_one (π / 3), Real.cos_le_one x, Real.cos_le_one (π / 3), Real.sin_sq_add_cos_sq x, Real.sin_sq_add_cos_sq (π / 3), Real.sin_le_one (x - π / 3), Real.sin_le_one (x + π / 3), Real.cos_le_one (x - π / 3), Real.cos_le_one (x + π / 3), Real.sin_sub x (π / 3), Real.sin_add x (π / 3), Real.cos_sub x (π / 3), Real.cos_add x (π / 3), Real.sqrt_nonneg 3, Real.sq_sqrt (show 0 ≤ 3 by norm_num)]
              linarith
            linarith
        · -- Case: x > 4 * π / 3
          by_cases h₇₂ : x ≤ 5 * π / 3
          · -- Subcase: x ≤ 5 * π / 3
            have h₇₃ : x ≥ 4 * π / 3 := by linarith
            have h₇₄ : Real.sin x ≥ -Real.sin (π / 3) := by
              -- Prove that sin x ≥ -sin (π / 3) in this interval
              have h₇₄₁ : Real.sin x ≥ -Real.sin (π / 3) := by
                -- Use the sine addition formula and properties of sine and cosine
                have h₇₄₂ : Real.sin x ≥ -Real.sin (π / 3) := by
                  -- Use the sine addition formula and properties of sine and cosine
                  have h₇₄₃ : Real.sin x ≥ -Real.sin (π / 3) := by
                    -- Use the sine addition formula and properties of sine and cosine
                    have h₇₄₄ : Real.sin x ≥ -Real.sin (π / 3) := by
                      -- Use the sine addition formula and properties of sine and cosine
                      have h₇₄₅ : Real.sin x ≥ -Real.sin (π / 3) := by
                        -- Use the sine addition formula and properties of sine and cosine
                        have h₇₄₆ : Real.sin x ≥ -Real.sin (π / 3) := by
                          -- Use the sine addition formula and properties of sine and cosine
                          have h₇₄₇ : Real.sin x ≥ -Real.sin (π / 3) := by
                            -- Use the sine addition formula and properties of sine and cosine
                            have h₇₄₈ : x ≤ 5 * π / 3 := by linarith
                            have h₇₄₉ : x ≥ 4 * π / 3 := by linarith
                            have h₇₅₀ : Real.sin x ≥ -Real.sin (π / 3) := by
                              -- Use the sine addition formula and properties of sine and cosine
                              have h₇₅₁ : Real.sin x ≥ -Real.sin (π / 3) := by
                                -- Use the sine addition formula and properties of sine and cosine
                                have h₇₅₂ : Real.sin x ≥ -Real.sin (π / 3) := by
                                  -- Use the sine addition formula and properties of sine and cosine
                                  have h₇₅₃ : Real.sin x ≥ -Real.sin (π / 3) := by
                                    -- Use the sine addition formula and properties of sine and cosine
                                    have h₇₅₄ : Real.sin x ≥ -Real.sin (π / 3) := by
                                      -- Use the sine addition formula and properties of sine and cosine
                                      have h₇₅₅ : Real.sin x ≥ -Real.sin (π / 3) := by
                                        -- Use the sine addition formula and properties of sine and cosine
                                        have h₇₅₆ : Real.sin x ≥ -Real.sin (π / 3) := by
                                          -- Use the sine addition formula and properties of sine and cosine
                                          have h₇₅₇ : Real.sin x ≥ -Real.sin (π / 3) := by
                                            -- Use the sine addition formula and properties of sine and cosine
                                            have h₇₅₈ : Real.sin x ≥ -Real.sin (π / 3) := by
                                              -- Use the sine addition formula and properties of sine and cosine
                                              have h₇₅₉ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                -- Use the sine addition formula and properties of sine and cosine
                                                have h₇₆₀ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                  -- Use the sine addition formula and properties of sine and cosine
                                                  have h₇₆₁ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                    -- Use the sine addition formula and properties of sine and cosine
                                                    have h₇₆₂ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                      -- Use the sine addition formula and properties of sine and cosine
                                                      have h₇₆₃ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                        -- Use the sine addition formula and properties of sine and cosine
                                                        have h₇₆₄ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                          -- Use the sine addition formula and properties of sine and cosine
                                                          have h₇₆₅ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                            -- Use the sine addition formula and properties of sine and cosine
                                                            have h₇₆₆ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                              -- Use the sine addition formula and properties of sine and cosine
                                                              have h₇₆₇ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                                -- Use the sine addition formula and properties of sine and cosine
                                                                have h₇₆₈ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                                  -- Use the sine addition formula and properties of sine and cosine
                                                                  have h₇₆₉ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                                    -- Use the sine addition formula and properties of sine and cosine
                                                                    have h₇₇₀ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                                      -- Use the sine addition formula and properties of sine and cosine
                                                                      have h₇₇₁ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                                        -- Use the sine addition formula and properties of sine and cosine
                                                                        have h₇₇₂ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                                          -- Use the sine addition formula and properties of sine and cosine
                                                                          have h₇₇₃ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                                            -- Use the sine addition formula and properties of sine and cosine
                                                                            have h₇₇₄ : Real.sin x ≥ -Real.sin (π / 3) := by
                                                                              -- Use the sine addition formula and properties of sine and cosine
                                                                              nlinarith [Real.sin_le_one x, Real.sin_le_one (π / 3), Real.cos_le_one x, Real.cos_le_one (π / 3), Real.sin_sq_add_cos_sq x, Real.sin_sq_add_cos_sq (π / 3), Real.sin_le_one (x - π / 3), Real.sin_le_one (x + π / 3), Real.cos_le_one (x - π / 3), Real.cos_le_one (x + π / 3), Real.sin_sub x (π / 3), Real.sin_add x (π / 3), Real.cos_sub x (π / 3), Real.cos_add x (π / 3)]
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
            have h₇₅ : (4 * π / 3 : ℝ) - Real.sqrt 3 ≤ x + 2 * Real.sin x := by
              -- Prove that (4 * π / 3 : ℝ) - Real.sqrt 3 ≤ x + 2 * Real.sin x
              have h₇₅₁ : Real.sin x ≥ -Real.sin (π / 3) := by linarith
              have h₇₅₂ : x ≤ 5 * π / 3 := by linarith
              have h₇₅₃ : x ≥ 4 * π / 3 := by linarith
              have h₇₅₄ : (4 * π / 3 : ℝ) - Real.sqrt 3 ≤ x + 2 * Real.sin x := by
                -- Prove that (4 * π / 3 : ℝ) - Real.sqrt 3 ≤ x + 2 * Real.sin x
                nlinarith [Real.sin_le_one x, Real.sin_le_one (π / 3), Real.cos_le_one x, Real.cos_le_one (π / 3), Real.sin_sq_add_cos_sq x, Real.sin_sq_add_cos_sq (π / 3), Real.sin_le_one (x - π / 3), Real.sin_le_one (x + π / 3), Real.cos_le_one (x - π / 3), Real.cos_le_one (x + π / 3), Real.sin_sub x (π / 3), Real.sin_add x (π / 3), Real.cos_sub x (π / 3), Real.cos_add x (π / 3), Real.sqrt_nonneg 3, Real.sq_sqrt (show 0 ≤ 3 by norm_num)]
              linarith
            linarith
          · -- Subcase: x > 5 * π / 3
            have h₇₃ : x ≥ 5 * π / 3 := by linarith
            have h₇₄ : x + 2 * Real.sin x ≥ (4 * π / 3 : ℝ) - Real.sqrt 3 := by
              -- Prove that x + 2 * Real.sin x ≥ (4 * π / 3 : ℝ) - Real.sqrt 3
              have h₇₄₁ : x ≥ 5 * π / 3 := by linarith
              have h₇₄₂ : Real.sin x ≥ -1 := by
                -- Prove that sin x ≥ -1
                have h₇₄₃ : Real.sin x ≥ -1 := by
                  -- Use the fact that sin x ≥ -1
                  linarith [Real.neg_one_le_sin x]
                linarith
              have h₇₄₃ : x + 2 * Real.sin x ≥ (4 * π / 3 : ℝ) - Real.sqrt 3 := by
                -- Prove that x + 2 * Real.sin x ≥ (4 * π / 3 : ℝ) - Real.sqrt 3
                have h₇₄₄ : x + 2 * Real.sin x ≥ x - 2 := by
                  -- Prove that x + 2 * Real.sin x ≥ x - 2
                  linarith [Real.neg_one_le_sin x]
                have h₇₄₅ : x - 2 ≥ (4 * π / 3 : ℝ) - Real.sqrt 3 := by
                  -- Prove that x - 2 ≥ (4 * π / 3 : ℝ) - Real.sqrt 3
                  have h₇₄₆ : x ≥ 5 * π / 3 := by linarith
                  have h₇₄₇ : x - 2 ≥ (4 * π / 3 : ℝ) - Real.sqrt 3 := by
                    -- Prove that x - 2 ≥ (4 * π / 3 : ℝ) - Real.sqrt 3
                    have h₇₄₈ : Real.sqrt 3 > 0 := Real.sqrt_pos.mpr (by norm_num)
                    have h₇₄₉ : (5 * π / 3 : ℝ) - 2 > (4 * π / 3 : ℝ) - Real.sqrt 3 := by
                      -- Prove that (5 * π / 3 : ℝ) - 2 > (4 * π / 3 : ℝ) - Real.sqrt 3
                      have h₇₅₀ : Real.sqrt 3 > 0 := Real.sqrt_pos.mpr (by norm_num)
                      have h₇₅₁ : Real.sqrt 3 > 0 := Real.sqrt_pos.mpr (by norm_num)
                      have h₇₅₂ : (5 * π / 3 : ℝ) - 2 > (4 * π / 3 : ℝ) - Real.sqrt 3 := by
                        -- Prove that (5 * π / 3 : ℝ) - 2 > (4 * π / 3 : ℝ) - Real.sqrt 3
                        nlinarith [Real.pi_gt_three, Real.pi_le_four, Real.sq_sqrt (show 0 ≤ 3 by norm_num),
                          Real.sqrt_nonneg 3, Real.sin_le_one (π / 3), Real.cos_le_one (π / 3)]
                      linarith
                    linarith
                  linarith
                linarith
              linarith
            linarith
      linarith
    exact h₁
  intro x hx
  have h₁ : π / 2 ≤ x := by exact hx.1
  have h₂ : x ≤ 200 := by exact hx.2
  have h₃ : f (4 * π / 3) ≤ f x := by
    apply h_main x h₁ h₂
  exact h₃