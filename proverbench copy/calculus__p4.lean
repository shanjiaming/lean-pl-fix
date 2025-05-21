theorem limit_of_function_at_3 :
Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x^3 - 6 * x^2 + 9 * x)) (𝓝 3) (𝓝 (-2 / 3)) := by
  have h₀ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3)^2) (𝓝 3) (𝓝 (-2)) := by
    have h₀₁ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3)^2) (𝓝 3) (𝓝 (-2)) := by
      have h₀₂ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3)^2) (𝓝 3) (𝓝 (-2)) := by
        -- Use the fact that the limit of (cos(y) - 1) / y^2 as y -> 0 is -1/2
        have h₀₃ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3)^2) (𝓝[≠] 3) (𝓝 (-2)) := by
          have h₀₄ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3)^2) (𝓝[≠] 3) (𝓝 (-2)) := by
            -- Use the fact that the limit of (cos(y) - 1) / y^2 as y -> 0 is -1/2
            have h₀₅ : (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3)^2) = (fun x : ℝ => (-2 : ℝ) * ((Real.sin (x - 3)) / (x - 3))^2) := by
              funext x
              have h₁ : Real.cos (2 * x - 6) - 1 = -2 * Real.sin (x - 3) ^ 2 := by
                have h₂ : Real.cos (2 * x - 6) = Real.cos (2 * (x - 3)) := by ring
                rw [h₂]
                have h₃ : Real.cos (2 * (x - 3)) = 1 - 2 * Real.sin (x - 3) ^ 2 := by
                  rw [Real.cos_two_mul, Real.sin_sq]
                  <;> ring
                rw [h₃]
                <;> ring
              rw [h₁]
              by_cases h₂ : x - 3 = 0
              · have h₃ : x = 3 := by linarith
                simp_all
                <;> simp_all
                <;> field_simp
                <;> ring_nf
                <;> norm_num
              · have h₃ : x ≠ 3 := by intro h; apply h₂; linarith
                field_simp [h₂, sub_ne_zero.mpr h₃]
                <;> ring_nf
                <;> field_simp [h₂, sub_ne_zero.mpr h₃]
                <;> ring_nf
                <;> norm_num
                <;> linarith
            rw [h₀₅]
            have h₀₆ : Tendsto (fun x : ℝ => (-2 : ℝ) * ((Real.sin (x - 3)) / (x - 3)) ^ 2) (𝓝[≠] 3) (𝓝 (-2)) := by
              have h₀₇ : Tendsto (fun x : ℝ => (Real.sin (x - 3)) / (x - 3)) (𝓝[≠] 3) (𝓝 1) := by
                have h₀₈ : Tendsto (fun x : ℝ => (Real.sin (x - 3)) / (x - 3)) (𝓝[≠] 3) (𝓝 1) := by
                  have h₀₉ : Tendsto (fun x : ℝ => (Real.sin x) / x) (𝓝[≠] 0) (𝓝 1) := by
                    -- Use the known limit of sin(x)/x as x -> 0
                    have h₁₀ : Tendsto (fun x : ℝ => (Real.sin x) / x) (𝓝[≠] 0) (𝓝 1) := by
                      -- Use the known limit of sin(x)/x as x -> 0
                      simpa using (hasDerivAt_sin 0).tendsto_smallZero_nhds_one
                    exact h₁₀
                  have h₁₁ : Tendsto (fun x : ℝ => x - 3) (𝓝[≠] 3) (𝓝[≠] 0) := by
                    -- Show that x - 3 tends to 0 as x tends to 3
                    have h₁₂ : Tendsto (fun x : ℝ => x - 3) (𝓝[≠] 3) (𝓝 (0 : ℝ)) := by
                      -- Show that x - 3 tends to 0 as x tends to 3
                      have h₁₃ : Continuous (fun x : ℝ => x - 3) := by continuity
                      have h₁₄ : Tendsto (fun x : ℝ => x - 3) (𝓝[≠] 3) (𝓝 (0 : ℝ)) := by
                        have h₁₅ : Tendsto (fun x : ℝ => x - 3) (𝓝 3) (𝓝 (0 : ℝ)) := by
                          have h₁₆ : Tendsto (fun x : ℝ => x - 3) (𝓝 3) (𝓝 (0 : ℝ)) := by
                            norm_num [show (3 : ℝ) - 3 = 0 by norm_num]
                          exact h₁₆
                        -- Use the fact that the limit is the same in the punctured neighborhood
                        have h₁₇ : Tendsto (fun x : ℝ => x - 3) (𝓝[≠] 3) (𝓝 (0 : ℝ)) := by
                          apply Tendsto.mono_left _ nhdsWithin_le_nhds
                          exact h₁₅
                        exact h₁₇
                      exact h₁₄
                    -- Use the fact that the limit is the same in the punctured neighborhood
                    have h₁₈ : Tendsto (fun x : ℝ => x - 3) (𝓝[≠] 3) (𝓝[≠] 0) := by
                      -- Use the fact that the limit is the same in the punctured neighborhood
                      have h₁₉ : Tendsto (fun x : ℝ => x - 3) (𝓝[≠] 3) (𝓝 (0 : ℝ)) := h₁₂
                      -- Use the fact that the limit is the same in the punctured neighborhood
                      have h₂₀ : Tendsto (fun x : ℝ => x - 3) (𝓝[≠] 3) (𝓝[≠] 0) := by
                        -- Use the fact that the limit is the same in the punctured neighborhood
                        have h₂₁ : Tendsto (fun x : ℝ => x - 3) (𝓝[≠] 3) (𝓝[≠] 0) := by
                          -- Use the fact that the limit is the same in the punctured neighborhood
                          apply tendsto_nhdsWithin_of_tendsto_nhds_of_eventually_within
                          · -- Prove the limit
                            exact h₁₉
                          · -- Prove the eventually within
                            filter_upwards [self_mem_nhdsWithin] with x hx
                            -- Prove the condition for the limit
                            have h₂₂ : x ≠ 3 := hx
                            have h₂₃ : x - 3 ≠ 0 := by
                              intro h₂₄
                              apply h₂₂
                              linarith
                            exact h₂₃
                        exact h₂₁
                      exact h₂₀
                    exact h₁₈
                  have h₂₄ : Tendsto (fun x : ℝ => (Real.sin (x - 3)) / (x - 3)) (𝓝[≠] 3) (𝓝 1) := by
                    have h₂₅ : Tendsto (fun x : ℝ => (Real.sin (x - 3)) / (x - 3)) (𝓝[≠] 3) (𝓝 1) := by
                      have h₂₆ : Tendsto (fun x : ℝ => (Real.sin x) / x) (𝓝[≠] 0) (𝓝 1) := h₀₉
                      have h₂₇ : Tendsto (fun x : ℝ => x - 3) (𝓝[≠] 3) (𝓝[≠] 0) := h₁₁
                      have h₂₈ : Tendsto (fun x : ℝ => (Real.sin (x - 3)) / (x - 3)) (𝓝[≠] 3) (𝓝 1) := by
                        -- Use the fact that the limit of sin(x)/x as x -> 0 is 1
                        have h₂₉ : (fun x : ℝ => (Real.sin (x - 3)) / (x - 3)) = (fun x : ℝ => (Real.sin ((fun x : ℝ => x - 3) x)) / ((fun x : ℝ => x - 3) x)) := by
                          rfl
                        rw [h₂₉]
                        -- Use the fact that the limit of sin(x)/x as x -> 0 is 1
                        have h₃₀ : Tendsto (fun x : ℝ => (Real.sin ((fun x : ℝ => x - 3) x)) / ((fun x : ℝ => x - 3) x)) (𝓝[≠] 3) (𝓝 1) := by
                          have h₃₁ : Tendsto (fun x : ℝ => (Real.sin x) / x) (𝓝[≠] 0) (𝓝 1) := h₀₉
                          have h₃₂ : Tendsto (fun x : ℝ => x - 3) (𝓝[≠] 3) (𝓝[≠] 0) := h₁₁
                          -- Use the fact that the limit of sin(x)/x as x -> 0 is 1
                          have h₃₃ : Tendsto (fun x : ℝ => (Real.sin ((fun x : ℝ => x - 3) x)) / ((fun x : ℝ => x - 3) x)) (𝓝[≠] 3) (𝓝 1) := by
                            -- Use the fact that the limit of sin(x)/x as x -> 0 is 1
                            have h₃₄ : Tendsto (fun x : ℝ => (Real.sin x) / x) (𝓝[≠] 0) (𝓝 1) := h₀₉
                            have h₃₅ : Tendsto (fun x : ℝ => x - 3) (𝓝[≠] 3) (𝓝[≠] 0) := h₁₁
                            -- Use the fact that the limit of sin(x)/x as x -> 0 is 1
                            convert h₃₄.comp h₃₅ using 1
                            <;> simp [Function.comp]
                            <;> field_simp
                          exact h₃₃
                        exact h₃₀
                      exact h₂₈
                    exact h₂₅
                  exact h₂₄
                exact h₀₈
              have h₀₉ : Tendsto (fun x : ℝ => (-2 : ℝ) * ((Real.sin (x - 3)) / (x - 3)) ^ 2) (𝓝[≠] 3) (𝓝 (-2)) := by
                have h₁₀ : Tendsto (fun x : ℝ => (Real.sin (x - 3)) / (x - 3)) (𝓝[≠] 3) (𝓝 1) := h₀₇
                have h₁₁ : Tendsto (fun x : ℝ => (-2 : ℝ) * ((Real.sin (x - 3)) / (x - 3)) ^ 2) (𝓝[≠] 3) (𝓝 (-2)) := by
                  -- Use the fact that the limit of sin(x)/x as x -> 0 is 1
                  have h₁₂ : Tendsto (fun x : ℝ => ((Real.sin (x - 3)) / (x - 3)) ^ 2) (𝓝[≠] 3) (𝓝 1) := by
                    -- Use the fact that the limit of sin(x)/x as x -> 0 is 1
                    have h₁₃ : Tendsto (fun x : ℝ => (Real.sin (x - 3)) / (x - 3)) (𝓝[≠] 3) (𝓝 1) := h₀₇
                    -- Use the fact that the limit of sin(x)/x as x -> 0 is 1
                    have h₁₄ : Tendsto (fun x : ℝ => ((Real.sin (x - 3)) / (x - 3)) ^ 2) (𝓝[≠] 3) (𝓝 1) := by
                      have h₁₅ : Continuous (fun y : ℝ => y ^ 2) := by continuity
                      -- Use the fact that the limit of sin(x)/x as x -> 0 is 1
                      have h₁₆ : Tendsto (fun x : ℝ => ((Real.sin (x - 3)) / (x - 3)) ^ 2) (𝓝[≠] 3) (𝓝 (1 ^ 2)) := by
                        apply h₁₅.continuousAt.tendsto.comp h₁₃
                      -- Use the fact that the limit of sin(x)/x as x -> 0 is 1
                      simpa using h₁₆
                    exact h₁₄
                  -- Use the fact that the limit of sin(x)/x as x -> 0 is 1
                  have h₁₇ : Tendsto (fun x : ℝ => (-2 : ℝ) * ((Real.sin (x - 3)) / (x - 3)) ^ 2) (𝓝[≠] 3) (𝓝 ((-2 : ℝ) * 1)) := by
                    -- Use the fact that the limit of sin(x)/x as x -> 0 is 1
                    have h₁₈ : Tendsto (fun x : ℝ => (-2 : ℝ) * ((Real.sin (x - 3)) / (x - 3)) ^ 2) (𝓝[≠] 3) (𝓝 ((-2 : ℝ) * 1)) := by
                      -- Use the fact that the limit of sin(x)/x as x -> 0 is 1
                      have h₁₉ : Tendsto (fun x : ℝ => ((Real.sin (x - 3)) / (x - 3)) ^ 2) (𝓝[≠] 3) (𝓝 1) := h₁₂
                      -- Use the fact that the limit of sin(x)/x as x -> 0 is 1
                      have h₂₀ : Tendsto (fun x : ℝ => (-2 : ℝ) * ((Real.sin (x - 3)) / (x - 3)) ^ 2) (𝓝[≠] 3) (𝓝 ((-2 : ℝ) * 1)) := by
                        -- Use the fact that the limit of sin(x)/x as x -> 0 is 1
                        convert Tendsto.const_mul (-2) h₁₉ using 1 <;> simp [mul_comm]
                      exact h₂₀
                    exact h₁₈
                  -- Use the fact that the limit of sin(x)/x as x -> 0 is 1
                  simpa using h₁₇
                exact h₁₁
              exact h₀₉
            exact h₀₆
          exact h₀₄
        have h₀₅ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3)^2) (𝓝 3) (𝓝 (-2)) := by
          have h₀₆ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3)^2) (𝓝[≠] 3) (𝓝 (-2)) := h₀₃
          have h₀₇ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3)^2) (𝓝 3) (𝓝 (-2)) := by
            apply tendsto_nhds_of_eq_on_compl_singleton _ _ _ h₀₆
            -- Show that the function is equal to -2 at x = 3
            · have h₀₈ : (3 : ℝ) ∉ ({3}ᶜ : Set ℝ) := by simp
              aesop
            · intro x hx
              -- Show that the function is defined and equal to itself everywhere else
              simp at hx ⊢
              <;> aesop
          exact h₀₇
        exact h₀₅
      exact h₀₂
    exact h₀₁
  
  have h₁ : Tendsto (fun x : ℝ => (1 : ℝ) / x) (𝓝 3) (𝓝 (1 / 3)) := by
    have h₁₁ : Tendsto (fun x : ℝ => (1 : ℝ) / x) (𝓝 3) (𝓝 (1 / 3)) := by
      -- Use the fact that 3 ≠ 0 to simplify the limit
      have h₁₂ : ContinuousAt (fun x : ℝ => (1 : ℝ) / x) 3 := by
        apply ContinuousAt.div
        · exact continuousAt_const
        · exact continuousAt_id
        · norm_num
      -- Use the fact that the function is continuous at 3 to find the limit
      have h₁₃ : Tendsto (fun x : ℝ => (1 : ℝ) / x) (𝓝 3) (𝓝 ((1 : ℝ) / 3)) := by
        simpa using h₁₂.tendsto
      simpa using h₁₃
    exact h₁₁
  
  have h₂ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x^3 - 6 * x^2 + 9 * x)) (𝓝 3) (𝓝 (-2 / 3)) := by
    have h₂₁ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3)^2) (𝓝 3) (𝓝 (-2)) := h₀
    have h₂₂ : Tendsto (fun x : ℝ => (1 : ℝ) / x) (𝓝 3) (𝓝 (1 / 3)) := h₁
    have h₂₃ : (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x)) =ᶠ[𝓝 3] (fun x : ℝ => ((Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) * ((1 : ℝ) / x)) := by
      have h₂₄ : ∀ᶠ (x : ℝ) in 𝓝 3, (Real.cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x) = ((Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) * ((1 : ℝ) / x) := by
        filter_upwards [isOpen_ne.mem_nhds (by norm_num : (3 : ℝ) ≠ 0)] with x hx
        have h₂₅ : x ≠ 0 := by
          intro h₂₅
          apply hx
          simp_all
        have h₂₆ : x ≠ 3 → (Real.cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x) = ((Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) * ((1 : ℝ) / x) := by
          intro h₂₆
          have h₂₇ : x ^ 3 - 6 * x ^ 2 + 9 * x = x * (x - 3) ^ 2 := by
            ring
          rw [h₂₇]
          have h₂₈ : x ≠ 0 := by
            intro h₂₈
            apply h₂₅
            simp_all
          have h₂₉ : x - 3 ≠ 0 := by
            intro h₂₉
            apply h₂₆
            linarith
          field_simp [h₂₈, h₂₉, sub_eq_zero, h₂₅]
          <;> ring_nf
          <;> field_simp [h₂₈, h₂₉, sub_eq_zero, h₂₅]
          <;> ring_nf
          <;> field_simp [h₂₈, h₂₉, sub_eq_zero, h₂₅]
          <;> linarith
        by_cases h₂₇ : x = 3
        · simp_all
          <;>
          norm_num
        · have h₂₈ : x ≠ 3 := h₂₇
          have h₂₉ : x ≠ 0 := by
            intro h₂₉
            apply hx
            simp_all
          have h₃₀ : (Real.cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x) = ((Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) * ((1 : ℝ) / x) := by
            apply h₂₆
            exact h₂₈
          exact h₃₀
      exact h₂₄
    have h₂₅ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x)) (𝓝 3) (𝓝 (-2 / 3)) := by
      have h₂₆ : Tendsto (fun x : ℝ => ((Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) * ((1 : ℝ) / x)) (𝓝 3) (𝓝 (-2 / 3)) := by
        have h₂₇ : Tendsto (fun x : ℝ => ((Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) * ((1 : ℝ) / x)) (𝓝 3) (𝓝 ((-2 : ℝ) * (1 / 3))) := by
          have h₂₈ : Tendsto (fun x : ℝ => ((Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) * ((1 : ℝ) / x)) (𝓝 3) (𝓝 ((-2 : ℝ) * (1 / 3))) := by
            -- Use the product of the limits to get the final result
            have h₂₉ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝 3) (𝓝 (-2)) := h₂₁
            have h₃₀ : Tendsto (fun x : ℝ => (1 : ℝ) / x) (𝓝 3) (𝓝 (1 / 3)) := h₁
            have h₃₁ : Tendsto (fun x : ℝ => ((Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) * ((1 : ℝ) / x)) (𝓝 3) (𝓝 ((-2 : ℝ) * (1 / 3))) := by
              have h₃₂ : Tendsto (fun x : ℝ => ((Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) * ((1 : ℝ) / x)) (𝓝 3) (𝓝 ((-2 : ℝ) * (1 / 3))) := by
                -- Apply the product of the limits
                convert h₂₉.mul h₃₀ using 1 <;>
                norm_num
              exact h₃₂
            exact h₃₁
          exact h₂₈
        have h₃₃ : ((-2 : ℝ) * (1 / 3) : ℝ) = (-2 / 3 : ℝ) := by norm_num
        rw [h₃₃] at h₂₇
        exact h₂₇
      have h₃₄ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x)) (𝓝 3) (𝓝 (-2 / 3)) := by
        -- Use the fact that the two functions are eventually equal to get the final result
        have h₃₅ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x)) (𝓝 3) (𝓝 (-2 / 3)) := by
          apply Tendsto.congr' h₂₃
          exact h₂₆
        exact h₃₅
      exact h₃₄
    exact h₂₅
  
  exact h₂