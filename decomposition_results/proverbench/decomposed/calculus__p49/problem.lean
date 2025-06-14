theorem integral_of_rational_function_over_interval :
∫ x in Set.Icc (-1) 1, (x^2 / (1 + x^2)) = 2 - π / 2 := by
  have h_main : (∫ x in Set.Icc (-1) 1, (x^2 / (1 + x^2 : ℝ))) = 2 - π / 2 := by
    have h₁ : (∫ x in Set.Icc (-1) 1, (x^2 / (1 + x^2 : ℝ))) = ∫ x in Set.Icc (-1) 1, (1 : ℝ) - ∫ x in Set.Icc (-1) 1, (1 / (1 + x^2 : ℝ)) := by
      have h₁₁ : (∫ x in Set.Icc (-1) 1, (x^2 / (1 + x^2 : ℝ))) = ∫ x in Set.Icc (-1) 1, (1 : ℝ) - (1 / (1 + x^2 : ℝ)) := by
        congr
        ext x
        have h₁₂ : x ^ 2 / (1 + x ^ 2 : ℝ) = 1 - 1 / (1 + x ^ 2 : ℝ) := by
          by_cases h : (1 + x ^ 2 : ℝ) = 0
          · have h₂ : x ^ 2 = -1 := by
              linarith
            have h₃ : (x : ℝ) ^ 2 ≥ 0 := by positivity
            nlinarith
          · field_simp [h]
            <;> ring
            <;> field_simp [h]
            <;> ring
        rw [h₁₂]
      rw [h₁₁]
      -- Split the integral of the difference into the difference of the integrals
      have h₂ : (∫ x in Set.Icc (-1) 1, (1 : ℝ) - (1 / (1 + x ^ 2 : ℝ))) = (∫ x in Set.Icc (-1) 1, (1 : ℝ)) - ∫ x in Set.Icc (-1) 1, (1 / (1 + x ^ 2 : ℝ)) := by
        apply IntegralOn.integral_sub
        · -- Prove that the function `(1 : ℝ)` is integrable on `Set.Icc (-1) 1`
          apply Continuous.integrableOn_Icc
          exact continuous_const
        · -- Prove that the function `(1 / (1 + x ^ 2 : ℝ))` is integrable on `Set.Icc (-1) 1`
          apply Continuous.integrableOn_Icc
          exact continuous_const.div (continuous_const.add (continuous_pow 2)) (by intro x; nlinarith)
      rw [h₂]
    rw [h₁]
    -- Evaluate the integral of `(1 : ℝ)`
    have h₂ : (∫ x in Set.Icc (-1) 1, (1 : ℝ)) = 2 := by
      simp [integral_one, Real.volume_Icc, sub_neg_eq_add]
      <;> norm_num
    -- Evaluate the integral of `(1 / (1 + x ^ 2 : ℝ))`
    have h₃ : (∫ x in Set.Icc (-1) 1, (1 / (1 + x ^ 2 : ℝ))) = π / 2 := by
      have h₃₁ : (∫ x in Set.Icc (-1) 1, (1 / (1 + x ^ 2 : ℝ))) = (Real.arctan 1 - Real.arctan (-1)) := by
        -- Use the fundamental theorem of calculus to evaluate the integral
        have h₄ : (∫ x in Set.Icc (-1) 1, (1 / (1 + x ^ 2 : ℝ))) = (Real.arctan 1 - Real.arctan (-1)) := by
          -- Use the antiderivative of `1 / (1 + x ^ 2 : ℝ)`
          have h₅ : (∫ x in Set.Icc (-1) 1, (1 / (1 + x ^ 2 : ℝ))) = (Real.arctan 1 - Real.arctan (-1)) := by
            -- Use the fundamental theorem of calculus to evaluate the integral
            have h₆ : HasDerivAt Real.arctan (1 / (1 + (1 : ℝ) ^ 2)) 1 := by
              convert Real.hasDerivAt_arctan 1 using 1 <;> norm_num
            have h₇ : HasDerivAt Real.arctan (1 / (1 + (-1 : ℝ) ^ 2)) (-1) := by
              convert Real.hasDerivAt_arctan (-1) using 1 <;> norm_num
            -- Use the fundamental theorem of calculus
            have h₈ : ∫ x in Set.Icc (-1) 1, (1 / (1 + x ^ 2 : ℝ)) = Real.arctan 1 - Real.arctan (-1) := by
              -- Use the fundamental theorem of calculus
              have h₉ : ∫ x in Set.Icc (-1) 1, (1 / (1 + x ^ 2 : ℝ)) = Real.arctan 1 - Real.arctan (-1) := by
                -- Use the fundamental theorem of calculus
                exact
                  by
                    have h₁₀ : ∫ x in Set.Icc (-1 : ℝ) 1, (1 / (1 + x ^ 2 : ℝ)) = Real.arctan 1 - Real.arctan (-1) := by
                      -- Use the fundamental theorem of calculus
                      norm_num [integral_Icc_eq_integral_Ioc, Real.arctan_neg, Real.arctan_one,
                        Real.pi_pos.le]
                      <;>
                        simp_all [Real.pi_pos.le]
                      <;>
                        norm_num
                      <;>
                        linarith [Real.pi_pos]
                      <;>
                        simp_all [Real.pi_pos.le]
                      <;>
                        norm_num
                      <;>
                        linarith [Real.pi_pos]
                    exact h₁₀
              exact h₉
            exact h₈
          exact h₅
        exact h₄
      rw [h₃₁]
      -- Simplify the expression `Real.arctan 1 - Real.arctan (-1)`
      have h₄ : Real.arctan 1 - Real.arctan (-1) = π / 2 := by
        have h₅ : Real.arctan 1 = π / 4 := by
          norm_num [Real.arctan_one]
        have h₆ : Real.arctan (-1) = - (π / 4) := by
          have h₇ : Real.arctan (-1) = - Real.arctan 1 := by
            rw [← Real.arctan_neg]
            <;> norm_num
          rw [h₇, h₅]
          <;> ring
        rw [h₅, h₆]
        <;> ring
        <;> field_simp
        <;> ring
        <;> linarith [Real.pi_pos]
      rw [h₄]
    -- Combine the results to get the final answer
    rw [h₂, h₃]
    <;> ring
    <;> field_simp
    <;> ring
    <;> linarith [Real.pi_pos]
  exact h_main