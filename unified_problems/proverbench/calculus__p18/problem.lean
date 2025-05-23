theorem integral_of_function_equals_ln_plus_168 :
(∫ x in Set.Icc 2 8, (1 / x + x^2 : ℝ)) = Real.log 4 + 168 := by
  have h_main : (∫ x in Set.Icc 2 8, (1 / x + x^2 : ℝ)) = Real.log 4 + 168 := by
    have h₁ : (∫ x in Set.Icc 2 8, (1 / x + x^2 : ℝ)) = (∫ x in Set.Icc 2 8, (1 / x : ℝ)) + ∫ x in Set.Icc 2 8, (x^2 : ℝ) := by
      -- Prove that the integral of the sum is the sum of the integrals
      have h₁₁ : (∫ x in Set.Icc 2 8, (1 / x + x^2 : ℝ)) = ∫ x in Set.Icc 2 8, ((1 / x : ℝ) + (x^2 : ℝ)) := by rfl
      rw [h₁₁]
      -- Use the linearity of the integral to split it into two separate integrals
      have h₁₂ : (∫ x in Set.Icc 2 8, ((1 / x : ℝ) + (x^2 : ℝ))) = (∫ x in Set.Icc 2 8, (1 / x : ℝ)) + ∫ x in Set.Icc 2 8, (x^2 : ℝ) := by
        apply Integral.add
        · -- Prove that the function `1/x` is integrable on `[2, 8]`
          apply ContinuousOn.integrableOn_Icc
          exact ContinuousOn.div continuousOn_const continuousOn_id fun x hx => by
            norm_num at hx ⊢ <;> linarith
        · -- Prove that the function `x^2` is integrable on `[2, 8]`
          apply ContinuousOn.integrableOn_Icc
          exact continuousOn_pow 2
      rw [h₁₂]
    rw [h₁]
    -- Compute the integral of `1/x` from 2 to 8
    have h₂ : (∫ x in Set.Icc 2 8, (1 / x : ℝ)) = Real.log 8 - Real.log 2 := by
      have h₂₁ : (∫ x in Set.Icc 2 8, (1 / x : ℝ)) = Real.log 8 - Real.log 2 := by
        -- Use the fundamental theorem of calculus to evaluate the integral of `1/x`
        have h₂₂ : Real.log 8 - Real.log 2 = Real.log (8 / 2) := by
          rw [Real.log_div (by norm_num) (by norm_num)]
          <;> ring
        rw [h₂₂]
        have h₂₃ : (∫ x in Set.Icc 2 8, (1 / x : ℝ)) = Real.log (8 / 2) := by
          -- Use the fact that the integral of `1/x` is `ln x`
          have h₂₄ : ∫ x in Set.Icc 2 8, (1 / x : ℝ) = ∫ x in (2 : ℝ)..(8 : ℝ), (1 / x : ℝ) := by
            simp [intervalIntegral.integral_congr]
          rw [h₂₄]
          -- Use the fundamental theorem of calculus
          have h₂₅ : ∫ x in (2 : ℝ)..(8 : ℝ), (1 / x : ℝ) = Real.log (8 / 2) := by
            -- Use the fundamental theorem of calculus
            rw [← Real.log_div (by norm_num) (by norm_num)]
            -- Evaluate the integral
            have h₂₆ : ∫ x in (2 : ℝ)..(8 : ℝ), (1 / x : ℝ) = Real.log 8 - Real.log 2 := by
              -- Use the fundamental theorem of calculus
              have h₂₇ : ∫ x in (2 : ℝ)..(8 : ℝ), (1 / x : ℝ) = Real.log 8 - Real.log 2 := by
                norm_num [integral_one_div, Real.log_pow, Real.log_mul, Real.log_pow]
                <;>
                ring_nf
                <;>
                norm_num
                <;>
                linarith [Real.log_pos (by norm_num : (1 : ℝ) < 2), Real.log_pos (by norm_num : (1 : ℝ) < 8)]
              exact h₂₇
            rw [h₂₆]
            <;> ring_nf
            <;> norm_num
            <;> linarith [Real.log_pos (by norm_num : (1 : ℝ) < 2), Real.log_pos (by norm_num : (1 : ℝ) < 8)]
          rw [h₂₅]
          <;> ring_nf
          <;> norm_num
          <;> linarith [Real.log_pos (by norm_num : (1 : ℝ) < 2), Real.log_pos (by norm_num : (1 : ℝ) < 8)]
        rw [h₂₃]
        <;> ring_nf
        <;> norm_num
        <;> linarith [Real.log_pos (by norm_num : (1 : ℝ) < 2), Real.log_pos (by norm_num : (1 : ℝ) < 8)]
      exact h₂₁
    -- Compute the integral of `x^2` from 2 to 8
    have h₃ : (∫ x in Set.Icc 2 8, (x^2 : ℝ)) = (168 : ℝ) := by
      have h₃₁ : (∫ x in Set.Icc 2 8, (x^2 : ℝ)) = (168 : ℝ) := by
        -- Use the fundamental theorem of calculus to evaluate the integral of `x^2`
        have h₃₂ : ∫ x in Set.Icc 2 8, (x^2 : ℝ) = ∫ x in (2 : ℝ)..(8 : ℝ), (x^2 : ℝ) := by
          simp [intervalIntegral.integral_congr]
        rw [h₃₂]
        -- Evaluate the integral of `x^2`
        have h₃₃ : ∫ x in (2 : ℝ)..(8 : ℝ), (x^2 : ℝ) = (168 : ℝ) := by
          norm_num [integral_pow]
          <;>
          ring_nf
          <;>
          norm_num
          <;>
          linarith
        rw [h₃₃]
        <;> ring_nf
        <;> norm_num
        <;> linarith
      exact h₃₁
    rw [h₂, h₃]
    -- Simplify the expression to get the final result
    have h₄ : Real.log 4 = Real.log 8 - Real.log 2 := by
      have h₄₁ : Real.log 4 = Real.log (8 / 2) := by norm_num
      rw [h₄₁]
      have h₄₂ : Real.log (8 / 2) = Real.log 8 - Real.log 2 := by
        rw [Real.log_div (by norm_num) (by norm_num)]
      rw [h₄₂]
    rw [h₄]
    <;> ring_nf
    <;> norm_num
    <;> linarith
  exact h_main