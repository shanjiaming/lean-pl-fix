theorem limit_of_function_at_zero :
    Tendsto (fun x => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝 0) (𝓝 (3 / 5)) := by
  have h1 : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝 0) (𝓝 (3 / 5)) := by
    have h₁ : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := by
      have h₂ : Tendsto (fun x : ℝ => (3 + x) / (5 + 2 * x)) (𝓝 0) (𝓝 (3 / 5)) := by
        -- Prove that the limit of (3 + x) / (5 + 2 * x) as x approaches 0 is 3 / 5
        have h₃ : ContinuousAt (fun x : ℝ => (3 + x) / (5 + 2 * x)) 0 := by
          -- Prove that the function is continuous at 0
          apply ContinuousAt.div
          · exact continuousAt_const.add continuousAt_id
          · exact continuousAt_const.add (continuousAt_const.mul continuousAt_id)
          -- Prove that the denominator is not zero
          · norm_num
        -- Use the fact that the function is continuous at 0 to find the limit
        convert h₃.tendsto using 1 <;> norm_num
      -- Use the fact that the limit of (3 + x) / (5 + 2 * x) as x approaches 0 is 3 / 5 to find the limit of (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)
      have h₄ : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := by
        have h₅ : ∀ x : ℝ, x ≠ 0 → (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2) = (3 + x) / (5 + 2 * x) := by
          intro x hx
          have h₆ : x ≠ 0 := hx
          have h₇ : 5 * x + 2 * x ^ 2 = x * (5 + 2 * x) := by ring
          have h₈ : 3 * x + x ^ 2 = x * (3 + x) := by ring
          rw [h₇, h₈]
          have h₉ : x ≠ 0 := hx
          field_simp [h₉, sub_eq_zero, add_eq_zero_iff_eq_neg]
          <;> ring_nf
          <;> field_simp [h₉]
          <;> ring_nf
        have h₉ : (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) =ᶠ[𝓝[≠] 0] (fun x : ℝ => (3 + x) / (5 + 2 * x)) := by
          filter_upwards [self_mem_nhdsWithin] with x hx using h₅ x hx
        -- Use the fact that the two functions are eventually equal to find the limit
        have h₁₀ : Tendsto (fun x : ℝ => (3 + x) / (5 + 2 * x)) (𝓝[≠] 0) (𝓝 (3 / 5)) := h₂.mono_left nhdsWithin_le_nhds
        have h₁₁ : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := by
          calc
            Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := by
              apply h₁₀.congr' h₉
            _ = Tendsto (fun x : ℝ => (3 + x) / (5 + 2 * x)) (𝓝[≠] 0) (𝓝 (3 / 5)) := by rfl
            _ = Tendsto (fun x : ℝ => (3 + x) / (5 + 2 * x)) (𝓝[≠] 0) (𝓝 (3 / 5)) := by rfl
        exact h₁₁
      exact h₄
    -- Use the fact that the limit of (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2) as x approaches 0 is 3 / 5 to find the limit of (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)
    have h₂ : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝 0) (𝓝 (3 / 5)) := by
      -- Use the fact that the limit of (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2) as x approaches 0 is 3 / 5 to find the limit of (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)
      have h₃ : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := h₁
      have h₄ : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝 0) (𝓝 (3 / 5)) := by
        apply tendsto_nhds_of_eq_at_one_singleton
        <;> simp_all [Set.indicator, Set.mem_singleton_iff, sub_eq_zero]
        <;> norm_num
        <;>
          aesop
      exact h₄
    exact h₂
  
  have h2 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) (𝓝[≠] 0) (𝓝 1) := by
    -- Prove that the limit of (sin(3x + x^2)) / (3x + x^2) as x approaches 0 is 1
    have h2 : Tendsto (fun x : ℝ => 3 * x + x ^ 2) (𝓝 0) (𝓝 0) := by
      have h2 : Continuous (fun x : ℝ => 3 * x + x ^ 2) := by continuity
      exact h2.tendsto 0
    have h3 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) (𝓝[≠] 0) (𝓝 1) := by
      have h4 : Tendsto (fun x : ℝ => 3 * x + x ^ 2) (𝓝[≠] 0) (𝓝[≠] 0) := by
        have h5 : Tendsto (fun x : ℝ => 3 * x + x ^ 2) (𝓝[≠] 0) (𝓝 0) := h2.mono_left nhdsWithin_le_nhds
        have h6 : ∀ᶠ (x : ℝ) in 𝓝[≠] 0, 3 * x + x ^ 2 ≠ 0 := by
          filter_upwards [self_mem_nhdsWithin] with x hx using by
            have h7 : x ≠ 0 := hx
            have h8 : 3 * x + x ^ 2 ≠ 0 := by
              intro h9
              have h10 : x = 0 ∨ x = -3 := by
                apply or_iff_not_imp_left.mpr
                intro h11
                apply mul_left_cancel₀ (sub_ne_zero.mpr h11)
                nlinarith
              cases h10 with
              | inl h10 =>
                exact h7 (by linarith)
              | inr h10 =>
                have h11 : x = -3 := h10
                have h12 : x ≠ 0 := hx
                norm_num [h11] at h9 ⊢
                <;> linarith
            exact h8
        have h7 : Tendsto (fun x : ℝ => 3 * x + x ^ 2) (𝓝[≠] 0) (𝓝[≠] 0) := by
          refine' tendsto_inf.2 ⟨_, _⟩
          · -- Prove the first part of the infimum
            exact h5
          · -- Prove the second part of the infimum
            exact h6.mono fun x hx => by simpa using hx
        exact h7
      have h8 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) (𝓝[≠] 0) (𝓝 1) := by
        have h9 : Tendsto (fun x : ℝ => Real.sin x / x) (𝓝[≠] 0) (𝓝 1) := Real.tendsto_sin_div_self
        have h10 : Tendsto (fun x : ℝ => 3 * x + x ^ 2) (𝓝[≠] 0) (𝓝[≠] 0) := h4
        have h11 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) (𝓝[≠] 0) (𝓝 1) := by
          have h12 : (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) = (fun x : ℝ => Real.sin x / x) ∘ (fun x : ℝ => 3 * x + x ^ 2) := by
            funext x
            <;> simp [Function.comp_apply]
            <;> ring_nf
            <;> field_simp [add_assoc]
            <;> ring_nf
          rw [h12]
          -- Use the fact that the composition of the functions has the same limit
          have h13 : Tendsto (fun x : ℝ => (Real.sin x / x) ∘ (fun x : ℝ => 3 * x + x ^ 2)) (𝓝[≠] 0) (𝓝 1) := by
            -- Use the fact that the composition of the functions has the same limit
            have h14 : Tendsto (fun x : ℝ => 3 * x + x ^ 2) (𝓝[≠] 0) (𝓝[≠] 0) := h4
            have h15 : Tendsto (fun x : ℝ => Real.sin x / x) (𝓝[≠] 0) (𝓝 1) := h9
            -- Use the fact that the composition of the functions has the same limit
            have h16 : Tendsto (fun x : ℝ => (Real.sin x / x) ∘ (fun x : ℝ => 3 * x + x ^ 2)) (𝓝[≠] 0) (𝓝 1) := by
              -- Use the fact that the composition of the functions has the same limit
              have h17 : ContinuousAt (fun x : ℝ => Real.sin x / x) 0 := by
                -- Prove that the function sin(x)/x is continuous at 0
                have h18 : ContinuousAt (fun x : ℝ => Real.sin x / x) 0 := by
                  -- Prove that the function sin(x)/x is continuous at 0
                  have h19 : Tendsto (fun x : ℝ => Real.sin x / x) (𝓝[≠] 0) (𝓝 1) := h9
                  have h20 : ContinuousAt (fun x : ℝ => Real.sin x / x) 0 := by
                    -- Prove that the function sin(x)/x is continuous at 0
                    have h21 : ContinuousAt (fun x : ℝ => Real.sin x / x) 0 := by
                      -- Prove that the function sin(x)/x is continuous at 0
                      apply ContinuousAt.congr _ (by
                        filter_upwards [self_mem_nhdsWithin] with x hx
                        simp_all [Real.sin_zero, div_eq_mul_inv]
                        <;> ring_nf
                        <;> field_simp [hx]
                        <;> linarith)
                      -- Prove that the function sin(x)/x is continuous at 0
                      exact continuousAt_const.mul (Real.continuous_sin.continuousAt)
                    exact h21
                  exact h20
                exact h18
              -- Prove that the composition of the functions has the same limit
              have h18 : Tendsto (fun x : ℝ => 3 * x + x ^ 2) (𝓝[≠] 0) (𝓝[≠] 0) := h4
              -- Prove that the composition of the functions has the same limit
              have h19 : Tendsto (fun x : ℝ => (Real.sin x / x) ∘ (fun x : ℝ => 3 * x + x ^ 2)) (𝓝[≠] 0) (𝓝 1) := by
                -- Prove that the composition of the functions has the same limit
                have h20 : Tendsto (fun x : ℝ => 3 * x + x ^ 2) (𝓝[≠] 0) (𝓝[≠] 0) := h4
                have h21 : Tendsto (fun x : ℝ => Real.sin x / x) (𝓝[≠] 0) (𝓝 1) := h9
                -- Use the fact that the composition of the functions has the same limit
                have h22 : Tendsto (fun x : ℝ => (Real.sin x / x) ∘ (fun x : ℝ => 3 * x + x ^ 2)) (𝓝[≠] 0) (𝓝 1) := by
                  -- Use the fact that the composition of the functions has the same limit
                  convert h21.comp h20 using 1
                  <;> simp [Function.comp]
                  <;> field_simp
                  <;> ring_nf
                  <;> simp_all [Real.sin_zero, div_eq_mul_inv]
                  <;> field_simp
                  <;> ring_nf
                  <;> simp_all [Real.sin_zero, div_eq_mul_inv]
                exact h22
              exact h19
            exact h16
          exact h13
        exact h11
      exact h8
    exact h3
  
  have h3 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝 0) (𝓝 (3 / 5)) := by
    have h3 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := by
      have h4 : Tendsto (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) (𝓝[≠] 0) (𝓝 (1 * (3 / 5))) := by
        have h5 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) (𝓝[≠] 0) (𝓝 1) := h2
        have h6 : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := by
          have h7 : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝 0) (𝓝 (3 / 5)) := h1
          have h8 : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := h7.mono_left nhdsWithin_le_nhds
          exact h8
        have h9 : Tendsto (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) (𝓝[≠] 0) (𝓝 (1 * (3 / 5))) := by
          have h10 : Tendsto (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) (𝓝[≠] 0) (𝓝 (1 * (3 / 5))) := by
            have h11 : Tendsto (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) (𝓝[≠] 0) (𝓝 (1 * (3 / 5))) := by
              -- Use the product of the limits
              have h12 : Tendsto (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2))) (𝓝[≠] 0) (𝓝 1) := h2
              have h13 : Tendsto (fun x : ℝ => ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) (𝓝[≠] 0) (𝓝 (3 / 5)) := h6
              have h14 : Tendsto (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) (𝓝[≠] 0) (𝓝 (1 * (3 / 5))) := by
                -- Use the product of the limits
                convert h12.mul h13 using 1 <;> simp [mul_assoc] <;> ring_nf <;> norm_num
              exact h14
            exact h11
          exact h10
        exact h9
      have h10 : (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) =ᶠ[𝓝[≠] 0] (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) := by
        filter_upwards [self_mem_nhdsWithin] with x hx
        have h11 : x ≠ 0 := hx
        by_cases h12 : 3 * x + x ^ 2 = 0
        · have h13 : x = 0 ∨ x = -3 := by
            apply or_iff_not_imp_left.mpr
            intro h14
            apply mul_left_cancel₀ (sub_ne_zero.mpr h14)
            nlinarith
          cases h13 with
          | inl h13 =>
            exfalso
            apply h11
            linarith
          | inr h13 =>
            simp_all [h13]
            <;> ring_nf at *
            <;> norm_num at *
            <;>
            (try
              {
                linarith
              })
            <;>
            (try
              {
                ring_nf at *
                <;> norm_num at *
                <;>
                linarith
              })
        · have h13 : 3 * x + x ^ 2 ≠ 0 := h12
          by_cases h14 : 5 * x + 2 * x ^ 2 = 0
          · have h15 : x = 0 ∨ x = -5 / 2 := by
              apply or_iff_not_imp_left.mpr
              intro h16
              apply mul_left_cancel₀ (sub_ne_zero.mpr h16)
              nlinarith
            cases h15 with
            | inl h15 =>
              exfalso
              apply h11
              linarith
            | inr h15 =>
              simp_all [h15]
              <;> ring_nf at *
              <;> norm_num at *
              <;>
              (try
                {
                  linarith
                })
              <;>
              (try
                {
                  ring_nf at *
                  <;> norm_num at *
                  <;>
                  linarith
                })
          · have h15 : 5 * x + 2 * x ^ 2 ≠ 0 := h14
            field_simp [h13, h15]
            <;> ring_nf
            <;> field_simp [h13, h15]
            <;> ring_nf
            <;> field_simp [h13, h15]
      have h16 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := by
        have h17 : Tendsto (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) (𝓝[≠] 0) (𝓝 (1 * (3 / 5))) := h4
        have h18 : (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) =ᶠ[𝓝[≠] 0] (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) := h10
        have h19 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (1 * (3 / 5))) := h17.congr' h18
        have h20 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := by
          simpa [mul_comm] using h19
        exact h20
      exact h16
    have h17 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝 0) (𝓝 (3 / 5)) := by
      have h18 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := h3
      have h19 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝 0) (𝓝 (3 / 5)) := by
        apply tendsto_nhds_of_eq_at_one_singleton
        <;> simp_all [Set.indicator, Set.mem_singleton_iff, sub_eq_zero]
        <;> norm_num
        <;>
          aesop
      exact h19
    exact h17
  exact h3