theorem integral_of_one_over_x_squared_plus_one (x : ℝ) :
∫ y in Set.Icc 0 x, (1 : ℝ) / (y^2 + 1) = arctan x - arctan 0 := by
  have h_main : ∫ y in Set.Icc 0 x, (1 : ℝ) / (y^2 + 1) = arctan x - arctan 0 := by
    have h₁ : (∫ y in Set.Icc 0 x, (1 : ℝ) / (y ^ 2 + 1)) = arctan x - arctan 0 := by
      -- Use the second fundamental theorem of calculus to evaluate the integral
      have h₂ : ∫ y in Set.Icc 0 x, (1 : ℝ) / (y ^ 2 + 1) = ∫ y in 0..x, (1 : ℝ) / (y ^ 2 + 1) := by
        -- Convert the integral over the interval [0, x] to the interval 0..x
        simp [intervalIntegral.integral_cases, Set.Icc_eq_empty]
        <;>
        (try cases' le_total 0 x with h h <;> simp [h, Set.Icc_eq_empty, intervalIntegral.integral_symm]) <;>
        (try ring_nf) <;>
        (try norm_num) <;>
        (try linarith)
      rw [h₂]
      -- Use the fact that the integral of 1 / (y ^ 2 + 1) is arctan y
      have h₃ : ∫ y in 0..x, (1 : ℝ) / (y ^ 2 + 1) = arctan x - arctan 0 := by
        -- Use the fundamental theorem of calculus to evaluate the integral
        simp [integral_one_div_one_add_sq]
        <;>
        (try ring_nf) <;>
        (try norm_num) <;>
        (try linarith)
      rw [h₃]
    exact h₁
  exact h_main