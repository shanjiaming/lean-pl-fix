theorem sqrt_five_times_sqrt_thirteen : sqrt 5 * sqrt 13 = sqrt 65 :=
    by
    have h₁ : (sqrt 5 * sqrt 13) ^ 2 = 65 := by
      have h₁₁ : 0 ≤ sqrt 5 := by exact Real.sqrt_nonneg _
      have h₁₂ : 0 ≤ sqrt 13 := by exact Real.sqrt_nonneg _
      have h₁₃ : 0 ≤ sqrt 5 * sqrt 13 := by positivity
      -- Simplify the expression (sqrt 5 * sqrt 13)^2 using properties of multiplication and square roots.
      calc
        (sqrt 5 * sqrt 13) ^ 2 = (sqrt 5) ^ 2 * (sqrt 13) ^ 2 := by
          ring_nf
          <;> simp [mul_pow, pow_mul]
          <;> ring_nf
          <;> norm_num
        _ = 5 * 13 := by
          rw [Real.sq_sqrt (show 0 ≤ 5 by norm_num), Real.sq_sqrt (show 0 ≤ 13 by norm_num)]
        _ = 65 := by norm_num

    have h₂ : (sqrt 65) ^ 2 = 65 := by
      have h₂₁ : 0 ≤ sqrt 65 := by exact Real.sqrt_nonneg _
      have h₂₂ : 0 ≤ sqrt 65 := by exact Real.sqrt_nonneg _
      -- Simplify the expression (sqrt 65)^2 using properties of square roots.
      calc
        (sqrt 65) ^ 2 = 65 := by
          rw [Real.sq_sqrt (show 0 ≤ 65 by norm_num)]
        _ = 65 := by rfl

    have h₃ : sqrt 5 * sqrt 13 = sqrt 65 := by
      have h₃₁ : 0 ≤ sqrt 5 * sqrt 13 := by positivity
      have h₃₂ : 0 ≤ sqrt 65 := by positivity
      -- Use the fact that the squares of both sides are equal and the numbers are non-negative to conclude the proof.
      have h₃₃ : (sqrt 5 * sqrt 13) ^ 2 = (sqrt 65) ^ 2 := by
        rw [h₁, h₂]
      have h₃₄ : sqrt 5 * sqrt 13 = sqrt 65 := by
        nlinarith [Real.sq_sqrt (show 0 ≤ 5 by norm_num), Real.sq_sqrt (show 0 ≤ 13 by norm_num),
          Real.sq_sqrt (show 0 ≤ 65 by norm_num), Real.sqrt_nonneg 5, Real.sqrt_nonneg 13,
          Real.sqrt_nonneg 65]
      exact h₃₄
    
    exact h₃