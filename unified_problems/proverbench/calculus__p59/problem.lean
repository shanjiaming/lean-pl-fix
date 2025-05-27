theorem integral_over_rectangle_equals_minus_168 :
  let f := fun x y => 11 - 2 * x - 3 * y^2
  let R := Icc (1 : ℝ) (3 : ℝ) ×ˢ Icc (-2 : ℝ) (5 : ℝ)
  ∫ x in Icc (1 : ℝ) (3 : ℝ), ∫ y in Icc (-2 : ℝ) (5 : ℝ), f x y = -168 := by
  intro f R
  have h_inner_integral : (∫ x in Icc (1 : ℝ) (3 : ℝ), ∫ y in Icc (-2 : ℝ) (5 : ℝ), f x y) = -168 := by
    have h1 : (∫ x in Icc (1 : ℝ) (3 : ℝ), ∫ y in Icc (-2 : ℝ) (5 : ℝ), f x y) = ∫ x in Icc (1 : ℝ) (3 : ℝ), (-14 * x - 56) := by
      apply integral_congr_ae
      filter_upwards [ae_restrict_mem measurableSet_Icc] with x hx
      have h2 : (∫ y in Icc (-2 : ℝ) (5 : ℝ), f x y) = -14 * x - 56 := by
        -- Compute the inner integral with respect to y
        have h3 : (∫ y in Icc (-2 : ℝ) (5 : ℝ), f x y) = (∫ y in Icc (-2 : ℝ) (5 : ℝ), (11 - 2 * x - 3 * y ^ 2)) := rfl
        rw [h3]
        -- Evaluate the integral using the fundamental theorem of calculus
        have h4 : (∫ y in Icc (-2 : ℝ) (5 : ℝ), (11 - 2 * x - 3 * y ^ 2)) = -14 * x - 56 := by
          -- Use the fundamental theorem of calculus to compute the integral
          have h5 : (∫ y in Icc (-2 : ℝ) (5 : ℝ), (11 - 2 * x - 3 * y ^ 2)) = (∫ y in (-2 : ℝ)..(5 : ℝ), (11 - 2 * x - 3 * y ^ 2)) := by
            simp [intervalIntegral.integral_congr]
          rw [h5]
          -- Compute the antiderivative
          have h6 : (∫ y in (-2 : ℝ)..(5 : ℝ), (11 - 2 * x - 3 * y ^ 2)) = (-14 * x - 56 : ℝ) := by
            norm_num [intervalIntegral.integral_comp_sub_left, mul_comm]
            <;>
            ring_nf
            <;>
            norm_num
            <;>
            linarith
          rw [h6]
        rw [h4]
      rw [h2]
      <;>
      ring_nf
    rw [h1]
    -- Compute the outer integral with respect to x
    have h2 : (∫ x in Icc (1 : ℝ) (3 : ℝ), (-14 * x - 56)) = -168 := by
      have h3 : (∫ x in Icc (1 : ℝ) (3 : ℝ), (-14 * x - 56)) = (∫ x in (1 : ℝ)..(3 : ℝ), (-14 * x - 56)) := by
        simp [intervalIntegral.integral_congr]
      rw [h3]
      -- Compute the antiderivative
      have h4 : (∫ x in (1 : ℝ)..(3 : ℝ), (-14 * x - 56)) = (-168 : ℝ) := by
        norm_num [intervalIntegral.integral_comp_sub_left, mul_comm]
        <;>
        ring_nf
        <;>
        norm_num
        <;>
        linarith
      rw [h4]
    rw [h2]
    <;>
    ring_nf
    <;>
    norm_num
    <;>
    linarith
  exact h_inner_integral