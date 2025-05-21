theorem integral_of_polynomial : ∫ x in Set.Icc 3 9, f x = 216 := by
  have h₁ : (∫ x in Set.Icc 3 9, f x) = 216 := by
    have h₂ : (∫ x in Set.Icc 3 9, f x) = (∫ x in (3:ℝ)..9, f x) := by
      simp [f, intervalIntegral.integral_of_le (by norm_num : (3:ℝ) ≤ 9)]
      <;>
      rfl
    rw [h₂]
    -- Compute the integral using the antiderivative
    have h₃ : (∫ x in (3:ℝ)..9, f x) = 216 := by
      -- Use the fundamental theorem of calculus to evaluate the integral
      have h₄ : (∫ x in (3:ℝ)..9, f x) = (∫ x in (3:ℝ)..9, (x^2 - 3 : ℝ)) := by
        simp [f]
      rw [h₄]
      -- Compute the integral using the antiderivative
      norm_num [integral_id, mul_comm, mul_assoc, mul_left_comm, sub_mul, mul_sub,
        integral_pow, integral_const, integral_sub, integral_add, integral_mul_left,
        integral_mul_right, mul_comm]
      <;>
      ring_nf
      <;>
      norm_num
      <;>
      linarith
    rw [h₃]
  exact h₁