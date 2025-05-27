theorem real_numbers_equation_solution : a ^ 2 + b ^ 2 + c ^ 2 + d ^ 2 = a * (b + c + d) → a = 0 ∧ b = 0 ∧ c = 0 ∧ d = 0:=
  by
  --  intro h
  have h₁ : (a - (b + c + d) / 2) ^ 2 + (3 * (b ^ 2 + c ^ 2 + d ^ 2) - 2 * (b * c + b * d + c * d)) / 4 = 0:=
    by
    have h₁₁ : a ^ 2 + b ^ 2 + c ^ 2 + d ^ 2 = a * (b + c + d) := h
    have h₁₂ : (a - (b + c + d) / 2) ^ 2 + (3 * (b ^ 2 + c ^ 2 + d ^ 2) - 2 * (b * c + b * d + c * d)) / 4 = 0:= by
      --  nlinarith [sq_nonneg (a - (b + c + d) / 2), sq_nonneg (b - c), sq_nonneg (b - d), sq_nonneg (c - d)]
      linarith
    --  exact h₁₂
    linarith
  have h₂ : 3 * (b ^ 2 + c ^ 2 + d ^ 2) - 2 * (b * c + b * d + c * d) ≥ 0:= by
    --  nlinarith [sq_nonneg (b - c), sq_nonneg (b - d), sq_nonneg (c - d), sq_nonneg (b + c + d), sq_nonneg (b + c - d),
    --    sq_nonneg (b + d - c), sq_nonneg (c + d - b)]
    hole
  have h₃ : a = (b + c + d) / 2:=
    by
    have h₄ : (a - (b + c + d) / 2) ^ 2 ≥ 0:= by -- nlinarith
      nlinarith
    have h₅ : (3 * (b ^ 2 + c ^ 2 + d ^ 2) - 2 * (b * c + b * d + c * d)) / 4 ≥ 0:= by -- nlinarith
      linarith
    have h₆ : (a - (b + c + d) / 2) ^ 2 = 0:= by -- nlinarith
      linarith
    have h₇ : a - (b + c + d) / 2 = 0:= by -- nlinarith
      nlinarith
    --  linarith
    linarith
  have h₄ : 3 * (b ^ 2 + c ^ 2 + d ^ 2) - 2 * (b * c + b * d + c * d) = 0:=
    by
    have h₄₁ : (a - (b + c + d) / 2) ^ 2 = 0:= by -- nlinarith
      nlinarith
    have h₄₂ : (3 * (b ^ 2 + c ^ 2 + d ^ 2) - 2 * (b * c + b * d + c * d)) / 4 = 0:= by -- nlinarith
      linarith
    --  nlinarith
    linarith
  have h₅ : (b - c) ^ 2 + (b - d) ^ 2 + (c - d) ^ 2 + (b ^ 2 + c ^ 2 + d ^ 2) = 0:= by
    --  nlinarith [sq_nonneg (b - c), sq_nonneg (b - d), sq_nonneg (c - d), sq_nonneg (b + c + d), sq_nonneg (b + c - d),
    --    sq_nonneg (b + d - c), sq_nonneg (c + d - b)]
    linarith
  have h₆ : b = 0:=
    by
    have h₆₁ : (b - c) ^ 2 + (b - d) ^ 2 + (c - d) ^ 2 + (b ^ 2 + c ^ 2 + d ^ 2) = 0 := h₅
    have h₆₂ : (b - c) ^ 2 ≥ 0:= by -- nlinarith
      nlinarith
    have h₆₃ : (b - d) ^ 2 ≥ 0:= by -- nlinarith
      nlinarith
    have h₆₄ : (c - d) ^ 2 ≥ 0:= by -- nlinarith
      nlinarith
    have h₆₅ : b ^ 2 + c ^ 2 + d ^ 2 ≥ 0:= by -- nlinarith
      nlinarith
    have h₆₆ : (b - c) ^ 2 = 0:= by -- nlinarith
      linarith
    have h₆₇ : (b - d) ^ 2 = 0 := by nlinarith
    have h₆₈ : (c - d) ^ 2 = 0 := by nlinarith
    have h₆₉ : b ^ 2 + c ^ 2 + d ^ 2 = 0 := by nlinarith
    have h₆₁₀ : b ^ 2 = 0 := by nlinarith
    have h₆₁₁ : b = 0 := by nlinarith
    --  exact h₆₁₁
    linarith
  have h₇ : c = 0 :=
    by
    have h₇₁ : (b - c) ^ 2 + (b - d) ^ 2 + (c - d) ^ 2 + (b ^ 2 + c ^ 2 + d ^ 2) = 0 := h₅
    have h₇₂ : b = 0 := h₆
    rw [h₇₂] at h₇₁
    have h₇₃ : (0 - c) ^ 2 + (0 - d) ^ 2 + (c - d) ^ 2 + (0 ^ 2 + c ^ 2 + d ^ 2) = 0 := by ring_nf at h₇₁ ⊢ <;> linarith
    nlinarith [sq_nonneg (c - d), sq_nonneg (c + d), sq_nonneg (c - d), sq_nonneg (c + d)]
  have h₈ : d = 0 :=
    by
    have h₈₁ : (b - c) ^ 2 + (b - d) ^ 2 + (c - d) ^ 2 + (b ^ 2 + c ^ 2 + d ^ 2) = 0 := h₅
    have h₈₂ : b = 0 := h₆
    have h₈₃ : c = 0 := h₇
    rw [h₈₂, h₈₃] at h₈₁
    ring_nf at h₈₁ ⊢
    nlinarith
  have h₉ : a = 0 := by
    have h₉₁ : a = (b + c + d) / 2 := h₃
    rw [h₉₁]
    have h₉₂ : b = 0 := h₆
    have h₉₃ : c = 0 := h₇
    have h₉₄ : d = 0 := h₈
    rw [h₉₂, h₉₃, h₉₄] <;> norm_num
  --  exact ⟨h₉, h₆, h₇, h₈⟩
  hole