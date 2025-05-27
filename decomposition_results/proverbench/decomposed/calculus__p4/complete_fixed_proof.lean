theorem limit_of_function_at_3 :
  Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x)) (𝓝 3) (𝓝 (-2 / 3)):=
  by
  have h₀ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝 3) (𝓝 (-2)):=
    by
    have h₀₁ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝 3) (𝓝 (-2)):=
      by
      have h₀₂ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝 3) (𝓝 (-2)):=
        by
        have h₀₃ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝[≠] 3) (𝓝 (-2)):=
          by
          have h₀₄ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝[≠] 3) (𝓝 (-2)):=
            by
            have h₀₅ :
              (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) =
                (fun x : ℝ => (-2 : ℝ) * ((Real.sin (x - 3)) / (x - 3)) ^ 2) := by sorry
            --  rw [h₀₅]
            have h₀₆ : Tendsto (fun x : ℝ => (-2 : ℝ) * ((Real.sin (x - 3)) / (x - 3)) ^ 2) (𝓝[≠] 3) (𝓝 (-2)):=
              by
              have h₀₇ : Tendsto (fun x : ℝ => (Real.sin (x - 3)) / (x - 3)) (𝓝[≠] 3) (𝓝 1):=
                by
                have h₀₈ : Tendsto (fun x : ℝ => (Real.sin (x - 3)) / (x - 3)) (𝓝[≠] 3) (𝓝 1):=
                  by
                  have h₀₉ : Tendsto (fun x : ℝ => (Real.sin x) / x) (𝓝[≠] 0) (𝓝 1):=
                    by
                    have h₁₀ : Tendsto (fun x : ℝ => (Real.sin x) / x) (𝓝[≠] 0) (𝓝 1):= by
                      --  simpa using (hasDerivAt_sin 0).tendsto_smallZero_nhds_one
                      hole
                    --  exact h₁₀
                    simpa
                  have h₁₁ : Tendsto (fun x : ℝ => x - 3) (𝓝[≠] 3) (𝓝[≠] 0):=
                    by
                    have h₁₂ : Tendsto (fun x : ℝ => x - 3) (𝓝[≠] 3) (𝓝 (0 : ℝ)):=
                      by
                      have h₁₃ : Continuous (fun x : ℝ => x - 3):= by -- continuity
                        hole
                      have h₁₄ : Tendsto (fun x : ℝ => x - 3) (𝓝[≠] 3) (𝓝 (0 : ℝ)):=
                        by
                        have h₁₅ : Tendsto (fun x : ℝ => x - 3) (𝓝 3) (𝓝 (0 : ℝ)):=
                          by
                          have h₁₆ : Tendsto (fun x : ℝ => x - 3) (𝓝 3) (𝓝 (0 : ℝ)):= by -- norm_num [show (3 : ℝ) - 3 = 0 by -- norm_num]
                            norm_num
                          --  exact h₁₆
                          norm_num
                        have h₁₇ : Tendsto (fun x : ℝ => x - 3) (𝓝[≠] 3) (𝓝 (0 : ℝ)):=
                          by
                          --  apply Tendsto.mono_left _ nhdsWithin_le_nhds
                          --  exact h₁₅
                          hole
                        --  exact h₁₇
                        hole
                      --  exact h₁₄
                      hole
                    have h₁₈ : Tendsto (fun x : ℝ => x - 3) (𝓝[≠] 3) (𝓝[≠] 0):=
                      by
                      have h₁₉ : Tendsto (fun x : ℝ => x - 3) (𝓝[≠] 3) (𝓝 (0 : ℝ)) := h₁₂
                      have h₂₀ : Tendsto (fun x : ℝ => x - 3) (𝓝[≠] 3) (𝓝[≠] 0):=
                        by
                        have h₂₁ : Tendsto (fun x : ℝ => x - 3) (𝓝[≠] 3) (𝓝[≠] 0):=
                          by
                          --  apply tendsto_nhdsWithin_of_tendsto_nhds_of_eventually_within
                          --  · exact h₁₉
                          --  · filter_upwards [self_mem_nhdsWithin] with x hx
                            have h₂₂ : x ≠ 3 := hx
                            have h₂₃ : x - 3 ≠ 0:= by
                              intro h₂₄
                              apply h₂₂
                              linarith
                              hole
                          --    exact h₂₃
                          hole
                        --  exact h₂₁
                        hole
                      --  exact h₂₀
                      hole
                    --  exact h₁₈
                    hole
                  have h₂₄ : Tendsto (fun x : ℝ => (Real.sin (x - 3)) / (x - 3)) (𝓝[≠] 3) (𝓝 1):=
                    by
                    have h₂₅ : Tendsto (fun x : ℝ => (Real.sin (x - 3)) / (x - 3)) (𝓝[≠] 3) (𝓝 1):=
                      by
                      have h₂₆ : Tendsto (fun x : ℝ => (Real.sin x) / x) (𝓝[≠] 0) (𝓝 1) := h₀₉
                      have h₂₇ : Tendsto (fun x : ℝ => x - 3) (𝓝[≠] 3) (𝓝[≠] 0) := h₁₁
                      have h₂₈ : Tendsto (fun x : ℝ => (Real.sin (x - 3)) / (x - 3)) (𝓝[≠] 3) (𝓝 1):=
                        by
                        have h₂₉ :
                          (fun x : ℝ => (Real.sin (x - 3)) / (x - 3)) =
                            (fun x : ℝ => (Real.sin ((fun x : ℝ => x - 3) x)) / ((fun x : ℝ => x - 3) x)) := by sorry
                        --  rw [h₂₉]
                        have h₃₀ : Tendsto (fun x : ℝ => (Real.sin ((fun x : ℝ => x - 3) x)) / ((fun x : ℝ => x - 3) x)) (𝓝[≠] 3) (𝓝 1):=
                          by
                          have h₃₁ : Tendsto (fun x : ℝ => (Real.sin x) / x) (𝓝[≠] 0) (𝓝 1) := h₀₉
                          have h₃₂ : Tendsto (fun x : ℝ => x - 3) (𝓝[≠] 3) (𝓝[≠] 0) := h₁₁
                          have h₃₃ : Tendsto (fun x : ℝ => (Real.sin ((fun x : ℝ => x - 3) x)) / ((fun x : ℝ => x - 3) x)) (𝓝[≠] 3) (𝓝 1):=
                            by
                            have h₃₄ : Tendsto (fun x : ℝ => (Real.sin x) / x) (𝓝[≠] 0) (𝓝 1) := h₀₉
                            have h₃₅ : Tendsto (fun x : ℝ => x - 3) (𝓝[≠] 3) (𝓝[≠] 0) := h₁₁
                            --  convert h₃₄.comp h₃₅ using 1 <;> simp [Function.comp] <;> field_simp
                            hole
                          --  exact h₃₃
                          hole
                        --  exact h₃₀
                        simpa
                      --  exact h₂₈
                      hole
                    --  exact h₂₅
                    simpa
                  --  exact h₂₄
                  simpa
                --  exact h₀₈
                simpa
              have h₀₉ : Tendsto (fun x : ℝ => (-2 : ℝ) * ((Real.sin (x - 3)) / (x - 3)) ^ 2) (𝓝[≠] 3) (𝓝 (-2)):=
                by
                have h₁₀ : Tendsto (fun x : ℝ => (Real.sin (x - 3)) / (x - 3)) (𝓝[≠] 3) (𝓝 1) := h₀₇
                have h₁₁ : Tendsto (fun x : ℝ => (-2 : ℝ) * ((Real.sin (x - 3)) / (x - 3)) ^ 2) (𝓝[≠] 3) (𝓝 (-2)):=
                  by
                  have h₁₂ : Tendsto (fun x : ℝ => ((Real.sin (x - 3)) / (x - 3)) ^ 2) (𝓝[≠] 3) (𝓝 1):=
                    by
                    have h₁₃ : Tendsto (fun x : ℝ => (Real.sin (x - 3)) / (x - 3)) (𝓝[≠] 3) (𝓝 1) := h₀₇
                    have h₁₄ : Tendsto (fun x : ℝ => ((Real.sin (x - 3)) / (x - 3)) ^ 2) (𝓝[≠] 3) (𝓝 1):=
                      by
                      have h₁₅ : Continuous (fun y : ℝ => y ^ 2):= by continuity
                        hole
                      have h₁₆ : Tendsto (fun x : ℝ => ((Real.sin (x - 3)) / (x - 3)) ^ 2) (𝓝[≠] 3) (𝓝 (1 ^ 2)):= by
                        apply h₁₅.continuousAt.tendsto.comp h₁₃
                        hole
                      --  simpa using h₁₆
                      hole
                    --  exact h₁₄
                    simpa
                  have h₁₇ : Tendsto (fun x : ℝ => (-2 : ℝ) * ((Real.sin (x - 3)) / (x - 3)) ^ 2) (𝓝[≠] 3) (𝓝 ((-2 : ℝ) * 1)):=
                    by
                    have h₁₈ : Tendsto (fun x : ℝ => (-2 : ℝ) * ((Real.sin (x - 3)) / (x - 3)) ^ 2) (𝓝[≠] 3) (𝓝 ((-2 : ℝ) * 1)):=
                      by
                      have h₁₉ : Tendsto (fun x : ℝ => ((Real.sin (x - 3)) / (x - 3)) ^ 2) (𝓝[≠] 3) (𝓝 1) := h₁₂
                      have h₂₀ : Tendsto (fun x : ℝ => (-2 : ℝ) * ((Real.sin (x - 3)) / (x - 3)) ^ 2) (𝓝[≠] 3) (𝓝 ((-2 : ℝ) * 1)):= by
                        --  convert Tendsto.const_mul (-2) h₁₉ using 1 <;> simp [mul_comm]
                        hole
                      --  exact h₂₀
                      hole
                    --  exact h₁₈
                    hole
                  --  simpa using h₁₇
                  hole
                --  exact h₁₁
                hole
              --  exact h₀₉
              hole
            --  exact h₀₆
            hole
          --  exact h₀₄
          simpa
        have h₀₅ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝 3) (𝓝 (-2)):=
          by
          have h₀₆ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝[≠] 3) (𝓝 (-2)) := h₀₃
          have h₀₇ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝 3) (𝓝 (-2)):=
            by
            --  apply tendsto_nhds_of_eq_on_compl_singleton _ _ _ h₀₆
            ·
              have h₀₈ : (3 : ℝ) ∉ ({ 3 }ᶜ : Set ℝ) := by simp
              aesop
            · intro x hx
              simp at hx ⊢ <;> aesop
            hole
          --  exact h₀₇
          simpa
        --  exact h₀₅
        simpa
      --  exact h₀₂
      simpa
    --  exact h₀₁
    simpa
  have h₁ : Tendsto (fun x : ℝ => (1 : ℝ) / x) (𝓝 3) (𝓝 (1 / 3)):=
    by
    have h₁₁ : Tendsto (fun x : ℝ => (1 : ℝ) / x) (𝓝 3) (𝓝 (1 / 3)):=
      by
      have h₁₂ : ContinuousAt (fun x : ℝ => (1 : ℝ) / x) 3:=
        by
        --  apply ContinuousAt.div
        · exact continuousAt_const
        · exact continuousAt_id
        · norm_num
        hole
      have h₁₃ : Tendsto (fun x : ℝ => (1 : ℝ) / x) (𝓝 3) (𝓝 ((1 : ℝ) / 3)):= by -- simpa using h₁₂.tendsto
        norm_num
      --  simpa using h₁₃
      norm_num
    --  exact h₁₁
    norm_num
  have h₂ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x)) (𝓝 3) (𝓝 (-2 / 3)):=
    by
    have h₂₁ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝 3) (𝓝 (-2)) := h₀
    have h₂₂ : Tendsto (fun x : ℝ => (1 : ℝ) / x) (𝓝 3) (𝓝 (1 / 3)) := h₁
    have h₂₃ :
      (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x)) =ᶠ[𝓝 3]
        (fun x : ℝ => ((Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) * ((1 : ℝ) / x)) := by sorry
    have h₂₅ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x)) (𝓝 3) (𝓝 (-2 / 3)):=
      by
      have h₂₆ : Tendsto (fun x : ℝ => ((Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) * ((1 : ℝ) / x)) (𝓝 3) (𝓝 (-2 / 3)):=
        by
        have h₂₇ :
          Tendsto (fun x : ℝ => ((Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) * ((1 : ℝ) / x)) (𝓝 3) (𝓝 ((-2 : ℝ) * (1 / 3))) := by sorry
        have h₃₃ : ((-2 : ℝ) * (1 / 3) : ℝ) = (-2 / 3 : ℝ):= by -- norm_num
          hole
        --  rw [h₃₃] at h₂₇
        --  exact h₂₇
        hole
      have h₃₄ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x)) (𝓝 3) (𝓝 (-2 / 3)):=
        by
        have h₃₅ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x)) (𝓝 3) (𝓝 (-2 / 3)):=
          by
          --  apply Tendsto.congr' h₂₃
          exact h₂₆
          hole
        --  exact h₃₅
        simpa
      --  exact h₃₄
      simpa
    --  exact h₂₅
    hole
  --  exact h₂
  simpa