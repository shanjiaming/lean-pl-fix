theorem partial_derivative_example :
  partial_t 2 π = 24 * π^2 := by
  have h1 : partial_t 2 π = deriv (fun τ => g 2 τ) π := by
    rfl
  
  have h2 : deriv (fun τ => g 2 τ) π = 24 * π^2 := by
    have h₃ : (fun τ => g 2 τ) = (fun τ => (2 : ℝ)^2 * (cos τ)^2 + (2 : ℝ)^3 * τ^3 + (2 : ℝ)^8) := by
      funext τ
      simp [g, f, x, y, z, pow_three, pow_two, mul_assoc, mul_comm, mul_left_comm]
      <;> ring_nf
      <;> norm_num
      <;> simp [cos_sq, sin_sq]
      <;> ring_nf
      <;> norm_num
    rw [h₃]
    -- Compute the derivative of the function
    have h₄ : deriv (fun τ => (2 : ℝ)^2 * (cos τ)^2 + (2 : ℝ)^3 * τ^3 + (2 : ℝ)^8) π = 24 * π^2 := by
      -- Use the chain rule and basic differentiation rules
      have h₅ : HasDerivAt (fun τ => (2 : ℝ)^2 * (cos τ)^2 + (2 : ℝ)^3 * τ^3 + (2 : ℝ)^8) ((2 : ℝ)^2 * (2 * cos π * (-sin π)) + (2 : ℝ)^3 * (3 * π^2)) π := by
        -- Differentiate each term separately
        have h₅₁ : HasDerivAt (fun τ => (2 : ℝ)^2 * (cos τ)^2) ((2 : ℝ)^2 * (2 * cos π * (-sin π))) π := by
          have h₅₂ : HasDerivAt (fun τ => cos τ) (-sin π) π := by
            simpa using (Real.hasDerivAt_cos π)
          have h₅₃ : HasDerivAt (fun τ => (cos τ)^2) (2 * cos π * (-sin π)) π := by
            have h₅₄ : HasDerivAt (fun τ => cos τ) (-sin π) π := by
              simpa using (Real.hasDerivAt_cos π)
            have h₅₅ : HasDerivAt (fun τ => (cos τ)^2) (2 * cos π * (-sin π)) π := by
              convert HasDerivAt.pow 2 h₅₄ using 1 <;> ring_nf <;> simp [sin_pi, cos_pi]
              <;> linarith [Real.cos_le_one π, Real.sin_le_one π, Real.cos_le_one π, Real.sin_le_one π]
            exact h₅₅
          have h₅₆ : HasDerivAt (fun τ => (2 : ℝ)^2 * (cos τ)^2) ((2 : ℝ)^2 * (2 * cos π * (-sin π))) π := by
            have h₅₇ : HasDerivAt (fun τ => (cos τ)^2) (2 * cos π * (-sin π)) π := h₅₃
            have h₅₈ : HasDerivAt (fun τ => (2 : ℝ)^2 * (cos τ)^2) ((2 : ℝ)^2 * (2 * cos π * (-sin π))) π := by
              convert HasDerivAt.const_mul (2 : ℝ)^2 h₅₇ using 1 <;> ring_nf <;> simp [sin_pi, cos_pi]
              <;> linarith [Real.cos_le_one π, Real.sin_le_one π, Real.cos_le_one π, Real.sin_le_one π]
            exact h₅₈
          exact h₅₆
        have h₅₂ : HasDerivAt (fun τ => (2 : ℝ)^3 * τ^3) ((2 : ℝ)^3 * (3 * π^2)) π := by
          have h₅₃ : HasDerivAt (fun τ => (τ : ℝ)^3) (3 * π^2) π := by
            simpa using (hasDerivAt_pow 3 (π : ℝ))
          have h₅₄ : HasDerivAt (fun τ => (2 : ℝ)^3 * τ^3) ((2 : ℝ)^3 * (3 * π^2)) π := by
            convert HasDerivAt.const_mul ((2 : ℝ)^3) h₅₃ using 1 <;> ring_nf <;> simp [sin_pi, cos_pi]
            <;> linarith [Real.cos_le_one π, Real.sin_le_one π, Real.cos_le_one π, Real.sin_le_one π]
          exact h₅₄
        have h₅₅ : HasDerivAt (fun τ => (2 : ℝ)^8) 0 π := by
          have h₅₆ : HasDerivAt (fun τ => (2 : ℝ)^8 : ℝ → ℝ) 0 π := by
            simpa using hasDerivAt_const π ((2 : ℝ)^8)
          exact h₅₆
        have h₅₇ : HasDerivAt (fun τ => (2 : ℝ)^2 * (cos τ)^2 + (2 : ℝ)^3 * τ^3 + (2 : ℝ)^8) ((2 : ℝ)^2 * (2 * cos π * (-sin π)) + (2 : ℝ)^3 * (3 * π^2)) π := by
          convert h₅₁.add h₅₂ |>.add h₅₅ using 1 <;> ring_nf <;> simp [sin_pi, cos_pi]
          <;> linarith [Real.cos_le_one π, Real.sin_le_one π, Real.cos_le_one π, Real.sin_le_one π]
        exact h₅₇
      have h₅₈ : deriv (fun τ => (2 : ℝ)^2 * (cos τ)^2 + (2 : ℝ)^3 * τ^3 + (2 : ℝ)^8) π = (2 : ℝ)^2 * (2 * cos π * (-sin π)) + (2 : ℝ)^3 * (3 * π^2) := by
        apply HasDerivAt.deriv
        exact h₅
      rw [h₅₈]
      have h₅₉ : cos π = -1 := by norm_num [Real.cos_pi]
      have h₅₁₀ : sin π = 0 := by norm_num [Real.sin_pi]
      rw [h₅₉, h₅₁₀]
      <;> ring_nf
      <;> norm_num
      <;> linarith [Real.cos_le_one π, Real.sin_le_one π, Real.cos_le_one π, Real.sin_le_one π]
    rw [h₄]
    <;> ring_nf
    <;> norm_num
    <;> linarith [Real.cos_le_one π, Real.sin_le_one π, Real.cos_le_one π, Real.sin_le_one π]
  
  have h3 : partial_t 2 π = 24 * π^2 := by
    rw [h1, h2]
    <;> simp_all [partial_t, g, f, x, y, z]
    <;> ring_nf at *
    <;> norm_num at *
    <;> linarith [Real.cos_le_one π, Real.sin_le_one π, Real.cos_le_one π, Real.sin_le_one π]
  
  apply h3