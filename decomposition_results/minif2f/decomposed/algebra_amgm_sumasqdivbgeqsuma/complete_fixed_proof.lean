theorem algebra_amgm_sumasqdivbgeqsuma (a b c d : ℝ) (h₀ : 0 < a ∧ 0 < b ∧ 0 < c ∧ 0 < d) :
  a ^ 2 / b + b ^ 2 / c + c ^ 2 / d + d ^ 2 / a ≥ a + b + c + d:=
  by
  have h₁ : a ^ 2 / b + b ≥ 2 * a:= by
    have h₁₁ : 0 < b:= by -- linarith
      linarith
    have h₁₂ : 0 < a:= by -- linarith
      linarith
    have h₁₃ : 0 < a ^ 2 / b:= by -- positivity
      positivity
    have h₁₄ : a ^ 2 / b * b = a ^ 2:= by -- field_simp [h₁₁.ne']
      field_simp
    have h₁₅ : a ^ 2 / b + b ≥ 2 * a:= by
      have h₁₅₁ : 0 < a ^ 2 / b:= by -- positivity
        linarith
      have h₁₅₂ : 0 < b:= by -- linarith
        linarith
      have h₁₅₃ : 0 < a ^ 2 / b * b:= by -- positivity
        nlinarith
      --  nlinarith [sq_nonneg (a - b), sq_nonneg (a ^ 2 / b - b), sq_nonneg (a ^ 2 / b - a), sq_nonneg (b - a)]
      hole
    --  exact h₁₅
    linarith
  have h₂ : b ^ 2 / c + c ≥ 2 * b:= by
    have h₂₁ : 0 < c:= by -- linarith
      linarith
    have h₂₂ : 0 < b:= by -- linarith
      linarith
    have h₂₃ : 0 < b ^ 2 / c:= by -- positivity
      positivity
    have h₂₄ : b ^ 2 / c * c = b ^ 2:= by -- field_simp [h₂₁.ne']
      field_simp
    have h₂₅ : b ^ 2 / c + c ≥ 2 * b:= by
      have h₂₅₁ : 0 < b ^ 2 / c:= by -- positivity
        linarith
      have h₂₅₂ : 0 < c:= by -- linarith
        linarith
      have h₂₅₃ : 0 < b ^ 2 / c * c:= by -- positivity
        nlinarith
      --  nlinarith [sq_nonneg (b - c), sq_nonneg (b ^ 2 / c - c), sq_nonneg (b ^ 2 / c - b), sq_nonneg (c - b)]
      hole
    --  exact h₂₅
    linarith
  have h₃ : c ^ 2 / d + d ≥ 2 * c:= by
    have h₃₁ : 0 < d:= by -- linarith
      linarith
    have h₃₂ : 0 < c:= by -- linarith
      linarith
    have h₃₃ : 0 < c ^ 2 / d:= by -- positivity
      positivity
    have h₃₄ : c ^ 2 / d * d = c ^ 2:= by -- field_simp [h₃₁.ne']
      field_simp
    have h₃₅ : c ^ 2 / d + d ≥ 2 * c:= by
      have h₃₅₁ : 0 < c ^ 2 / d:= by -- positivity
        linarith
      have h₃₅₂ : 0 < d:= by -- linarith
        linarith
      have h₃₅₃ : 0 < c ^ 2 / d * d:= by -- positivity
        nlinarith
      --  nlinarith [sq_nonneg (c - d), sq_nonneg (c ^ 2 / d - d), sq_nonneg (c ^ 2 / d - c), sq_nonneg (d - c)]
      hole
    --  exact h₃₅
    linarith
  have h₄ : d ^ 2 / a + a ≥ 2 * d:= by
    have h₄₁ : 0 < a:= by -- linarith
      linarith
    have h₄₂ : 0 < d:= by -- linarith
      linarith
    have h₄₃ : 0 < d ^ 2 / a:= by -- positivity
      positivity
    have h₄₄ : d ^ 2 / a * a = d ^ 2:= by -- field_simp [h₄₁.ne']
      field_simp
    have h₄₅ : d ^ 2 / a + a ≥ 2 * d:= by
      have h₄₅₁ : 0 < d ^ 2 / a:= by -- positivity
        linarith
      have h₄₅₂ : 0 < a:= by -- linarith
        linarith
      have h₄₅₃ : 0 < d ^ 2 / a * a:= by -- positivity
        nlinarith
      --  nlinarith [sq_nonneg (d - a), sq_nonneg (d ^ 2 / a - a), sq_nonneg (d ^ 2 / a - d), sq_nonneg (a - d)]
      hole
    --  exact h₄₅
    linarith
  have h₅ : a ^ 2 / b + b ^ 2 / c + c ^ 2 / d + d ^ 2 / a + (a + b + c + d) ≥ 2 * a + 2 * b + 2 * c + 2 * d:=
    by
    have h₅₁ : a ^ 2 / b + b ≥ 2 * a := h₁
    have h₅₂ : b ^ 2 / c + c ≥ 2 * b := h₂
    have h₅₃ : c ^ 2 / d + d ≥ 2 * c := h₃
    have h₅₄ : d ^ 2 / a + a ≥ 2 * d := h₄
    have h₅₅ :
      a ^ 2 / b + b ^ 2 / c + c ^ 2 / d + d ^ 2 / a + (a + b + c + d) =
        (a ^ 2 / b + b) + (b ^ 2 / c + c) + (c ^ 2 / d + d) + (d ^ 2 / a + a) := by sorry
    --  rw [h₅₅]
    --  linarith
    linarith
  have h₆ : a ^ 2 / b + b ^ 2 / c + c ^ 2 / d + d ^ 2 / a ≥ a + b + c + d:=
    by
    have h₆₁ : a ^ 2 / b + b ^ 2 / c + c ^ 2 / d + d ^ 2 / a + (a + b + c + d) ≥ 2 * a + 2 * b + 2 * c + 2 * d := h₅
    have h₆₂ : a ^ 2 / b + b ^ 2 / c + c ^ 2 / d + d ^ 2 / a ≥ a + b + c + d:= by -- linarith
      linarith
    --  exact h₆₂
    linarith
  --  exact h₆
  linarith