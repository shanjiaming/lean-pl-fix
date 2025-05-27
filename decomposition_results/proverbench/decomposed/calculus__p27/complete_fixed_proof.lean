theorem partial_derivative_example : partial_t 2 π = 24 * π ^ 2:=
  by
  have h1 : partial_t 2 π = deriv (fun τ => g 2 τ) π:= by -- rfl
    norm_cast
  have h2 : deriv (fun τ => g 2 τ) π = 24 * π ^ 2:=
    by
    have h₃ : (fun τ => g 2 τ) = (fun τ => (2 : ℝ) ^ 2 * (cos τ) ^ 2 + (2 : ℝ) ^ 3 * τ ^ 3 + (2 : ℝ) ^ 8):=
      by
      --  funext τ
      --  --  simp [g, f, x, y, z, pow_three, pow_two, mul_assoc, mul_comm, mul_left_comm] <;> ring_nf <;> norm_num <;>
            simp [cos_sq, sin_sq] <;>
          ring_nf <;>
        norm_num
      hole
    --  rw [h₃]
    have h₄ : deriv (fun τ => (2 : ℝ) ^ 2 * (cos τ) ^ 2 + (2 : ℝ) ^ 3 * τ ^ 3 + (2 : ℝ) ^ 8) π = 24 * π ^ 2:=
      by
      have h₅ :
        HasDerivAt (fun τ => (2 : ℝ) ^ 2 * (cos τ) ^ 2 + (2 : ℝ) ^ 3 * τ ^ 3 + (2 : ℝ) ^ 8)
          ((2 : ℝ) ^ 2 * (2 * cos π * (-sin π)) + (2 : ℝ) ^ 3 * (3 * π ^ 2)) π := by sorry
      have h₅₈ :
        deriv (fun τ => (2 : ℝ) ^ 2 * (cos τ) ^ 2 + (2 : ℝ) ^ 3 * τ ^ 3 + (2 : ℝ) ^ 8) π =
          (2 : ℝ) ^ 2 * (2 * cos π * (-sin π)) + (2 : ℝ) ^ 3 * (3 * π ^ 2) := by sorry
      --  rw [h₅₈]
      have h₅ :
        HasDerivAt (fun τ => (2 : ℝ) ^ 2 * (cos τ) ^ 2 + (2 : ℝ) ^ 3 * τ ^ 3 + (2 : ℝ) ^ 8)
          ((2 : ℝ) ^ 2 * (2 * cos π * (-sin π)) + (2 : ℝ) ^ 3 * (3 * π ^ 2)) π:=
        by
        have h₅₁ : HasDerivAt (fun τ => (2 : ℝ) ^ 2 * (cos τ) ^ 2) ((2 : ℝ) ^ 2 * (2 * cos π * (-sin π))) π:=
          by
          have h₅₂ : HasDerivAt (fun τ => cos τ) (-sin π) π:= by -- simpa using (Real.hasDerivAt_cos π)
            hole
          have h₅₃ : HasDerivAt (fun τ => (cos τ) ^ 2) (2 * cos π * (-sin π)) π:=
            by
            have h₅₄ : HasDerivAt (fun τ => cos τ) (-sin π) π:= by -- simpa using (Real.hasDerivAt_cos π)
              norm_cast
            have h₅₅ : HasDerivAt (fun τ => (cos τ) ^ 2) (2 * cos π * (-sin π)) π:= by
              --  --  convert HasDerivAt.pow 2 h₅₄ using 1 <;> ring_nf <;> simp [sin_pi, cos_pi] <;>
                linarith [Real.cos_le_one π, Real.sin_le_one π, Real.cos_le_one π, Real.sin_le_one π]
              hole
            --  exact h₅₅
            norm_cast
          have h₅₆ : HasDerivAt (fun τ => (2 : ℝ) ^ 2 * (cos τ) ^ 2) ((2 : ℝ) ^ 2 * (2 * cos π * (-sin π))) π:=
            by
            have h₅₇ : HasDerivAt (fun τ => (cos τ) ^ 2) (2 * cos π * (-sin π)) π := h₅₃
            have h₅₈ : HasDerivAt (fun τ => (2 : ℝ) ^ 2 * (cos τ) ^ 2) ((2 : ℝ) ^ 2 * (2 * cos π * (-sin π))) π:= by
              --  convert HasDerivAt.const_mul (2 : ℝ) ^ 2 h₅₇ using 1 <;> ring_nf <;> simp [sin_pi, cos_pi] <;>
                linarith [Real.cos_le_one π, Real.sin_le_one π, Real.cos_le_one π, Real.sin_le_one π]
              hole
            --  exact h₅₈
            hole
          --  exact h₅₆
          hole
        have h₅₂ : HasDerivAt (fun τ => (2 : ℝ) ^ 3 * τ ^ 3) ((2 : ℝ) ^ 3 * (3 * π ^ 2)) π:=
          by
          have h₅₃ : HasDerivAt (fun τ => (τ : ℝ) ^ 3) (3 * π ^ 2) π:= by -- simpa using (hasDerivAt_pow 3 (π : ℝ))
            hole
          have h₅₄ : HasDerivAt (fun τ => (2 : ℝ) ^ 3 * τ ^ 3) ((2 : ℝ) ^ 3 * (3 * π ^ 2)) π:= by
            --  convert HasDerivAt.const_mul ((2 : ℝ) ^ 3) h₅₃ using 1 <;> ring_nf <;> simp [sin_pi, cos_pi] <;>
              linarith [Real.cos_le_one π, Real.sin_le_one π, Real.cos_le_one π, Real.sin_le_one π]
            hole
          --  exact h₅₄
          simpa
        have h₅₅ : HasDerivAt (fun τ => (2 : ℝ) ^ 8) 0 π:=
          by
          have h₅₆ : HasDerivAt (fun τ => (2 : ℝ) ^ 8 : ℝ → ℝ) 0 π:= by -- simpa using hasDerivAt_const π ((2 : ℝ) ^ 8)
            hole
          --  exact h₅₆
          hole
        have h₅₇ :
          HasDerivAt (fun τ => (2 : ℝ) ^ 2 * (cos τ) ^ 2 + (2 : ℝ) ^ 3 * τ ^ 3 + (2 : ℝ) ^ 8)
            ((2 : ℝ) ^ 2 * (2 * cos π * (-sin π)) + (2 : ℝ) ^ 3 * (3 * π ^ 2)) π := by sorry
        --  exact h₅₇
        hole
      have h₅₁₀ : sin π = 0:= by -- norm_num [Real.sin_pi]
        norm_num
      --  --  rw [h₅₉, h₅₁₀] <;> ring_nf <;> norm_num <;>
        linarith [Real.cos_le_one π, Real.sin_le_one π, Real.cos_le_one π, Real.sin_le_one π]
      hole
    --  rw [h₄] <;> ring_nf <;> norm_num <;>
      linarith [Real.cos_le_one π, Real.sin_le_one π, Real.cos_le_one π, Real.sin_le_one π]
    hole
  have h3 : partial_t 2 π = 24 * π ^ 2:= by
    --  rw [h1, h2] <;> simp_all [partial_t, g, f, x, y, z] <;> ring_nf at * <;> norm_num at * <;>
      linarith [Real.cos_le_one π, Real.sin_le_one π, Real.cos_le_one π, Real.sin_le_one π]
    hole
  --  apply h3
  linarith