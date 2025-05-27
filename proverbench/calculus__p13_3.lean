theorem derivative_value_at_pi_over_3 : (2 * (1 / cos (π / 3)) ^ 2 * tan (π / 3)) = 8 * Real.sqrt 3 := by
  have h₁ : Real.cos (Real.pi / 3) = 1 / 2 := by
    norm_num [Real.cos_pi_div_three]
    <;>
    linarith [Real.pi_pos]
  
  have h₂ : Real.tan (Real.pi / 3) = Real.sqrt 3 := by
    rw [Real.tan_eq_sin_div_cos]
    have h₃ : Real.sin (Real.pi / 3) = Real.sqrt 3 / 2 := by
      norm_num [Real.sin_pi_div_three]
    rw [h₃, h₁]
    <;> ring_nf
    <;> field_simp [Real.sqrt_eq_iff_sq_eq]
    <;> ring_nf
    <;> norm_num [Real.sqrt_eq_iff_sq_eq]
    <;> linarith [Real.sqrt_nonneg 3]
  
  have h₃ : (1 / Real.cos (Real.pi / 3)) ^ 2 = 4 := by
    rw [h₁]
    <;> norm_num
    <;>
    linarith [Real.pi_pos]
  
  have h₄ : 2 * (1 / Real.cos (Real.pi / 3)) ^ 2 * Real.tan (Real.pi / 3) = 8 * Real.sqrt 3 := by
    rw [h₃, h₂]
    <;> ring_nf
    <;>
    linarith [Real.sqrt_nonneg 3]
  
  rw [h₄]
  <;>
  linarith [Real.sqrt_nonneg 3]