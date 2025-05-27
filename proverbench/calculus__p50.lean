theorem integral_x_sin_x_pi_over_2 :
∫ x in Icc 0 (π / 2), x * sin x = 1 := by
  have h₁ : (∫ x in Icc 0 (π / 2), x * sin x) = 1 := by
    have h₂ : (∫ x in (0 : ℝ)..(π / 2 : ℝ), x * sin x) = 1 := by
      -- Use the fundamental theorem of calculus to evaluate the integral
      rw [intervalIntegral.integral_eq_sub_of_hasDerivAt (fun x _ => by
        -- Prove that the antiderivative of x * sin x is -x * cos x + sin x
        have h₃ : HasDerivAt (fun x : ℝ => x * sin x) (x * cos x + sin x) x := by
          -- Use the product rule for differentiation
          have h₄ : HasDerivAt (fun x : ℝ => x) 1 x := by simpa using (hasDerivAt_id x)
          have h₅ : HasDerivAt (fun x : ℝ => sin x) (cos x) x := by simpa using (hasDerivAt_sin x)
          have h₆ : HasDerivAt (fun x : ℝ => x * sin x) (x * cos x + sin x) x := by
            convert h₄.mul h₅ using 1 <;> ring
          exact h₆
        convert h₃ using 1 <;> ring
        ) (by
        -- Prove that the antiderivative is continuous
        apply Continuous.continuousOn
        exact by continuity
        )]
      -- Evaluate the antiderivative at the bounds
      simp [sin_zero, cos_pi_div_two, sin_pi_div_two, mul_comm]
      <;> ring_nf
      <;> field_simp [Real.pi_pos.le]
      <;> ring_nf
      <;> norm_num
      <;> linarith [Real.pi_gt_three]
    -- Relate the interval integral to the integral over Icc
    have h₃ : (∫ x in Icc 0 (π / 2), x * sin x) = (∫ x in (0 : ℝ)..(π / 2 : ℝ), x * sin x) := by
      simp [intervalIntegral.integral_of_le (by linarith [Real.pi_pos, Real.pi_gt_three] : (0 : ℝ) ≤ π / 2)]
    rw [h₃]
    rw [h₂]
  exact h₁