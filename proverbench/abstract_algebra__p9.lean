theorem positive_sum_inequality (h : x + y + z = x * y * z) :
 1 / (1 + x * y) + 1 / (1 + y * z) + 1 / (1 + z * x) ≤ 3 / 4 := by
  have h₁ : 0 < x * y := by
    have h₁ : 0 < x * y := mul_pos hx hy
    exact h₁

  have h₂ : 0 < y * z := by
    have h₂ : 0 < y * z := mul_pos hy hz
    exact h₂

  have h₃ : 0 < z * x := by
    have h₃ : 0 < z * x := mul_pos hz hx
    exact h₃

  have h₄ : 0 < x * y * z := by
    have h₄ : 0 < x * y * z := by
      have h₄₁ : 0 < x * y := h₁
      have h₄₂ : 0 < z := hz
      positivity
    exact h₄

  have h₅ : 0 < x * y * z * x := by
    have h₅ : 0 < x * y * z * x := by positivity
    exact h₅

  have h₆ : 0 < x * y * z * y := by
    have h₆ : 0 < x * y * z * y := by positivity
    exact h₆

  have h₇ : 0 < x * y * z * z := by
    have h₇ : 0 < x * y * z * z := by positivity
    exact h₇

  have h₈ : (1 / x) * (1 / y) + (1 / y) * (1 / z) + (1 / z) * (1 / x) = 1 := by
    have h₈₁ : x + y + z = x * y * z := h
    have h₈₂ : 0 < x := hx
    have h₈₃ : 0 < y := hy
    have h₈₄ : 0 < z := hz
    have h₈₅ : 0 < x * y := by positivity
    have h₈₆ : 0 < y * z := by positivity
    have h₈₇ : 0 < z * x := by positivity
    have h₈₈ : 0 < x * y * z := by positivity
    field_simp [h₈₂.ne', h₈₃.ne', h₈₄.ne', h₈₅.ne', h₈₆.ne', h₈₇.ne', h₈₈.ne']
    nlinarith [mul_pos h₈₂ h₈₃, mul_pos h₈₃ h₈₄, mul_pos h₈₄ h₈₂,
      mul_pos (mul_pos h₈₂ h₈₃) h₈₄]

  have h₉ : 1 / (1 + x * y) = (1 / x) * (1 / y) / (1 + (1 / x) * (1 / y)) := by
    have h₉₁ : 0 < x := hx
    have h₉₂ : 0 < y := hy
    have h₉₃ : 0 < x * y := by positivity
    have h₉₄ : 0 < 1 + x * y := by positivity
    have h₉₅ : 0 < 1 + (1 / x) * (1 / y) := by positivity
    field_simp [h₉₁.ne', h₉₂.ne', h₉₃.ne', h₉₄.ne', h₉₅.ne']
    <;> ring_nf
    <;> field_simp [h₉₁.ne', h₉₂.ne', h₉₃.ne', h₉₄.ne', h₉₅.ne']
    <;> nlinarith

  have h₁₀ : 1 / (1 + y * z) = (1 / y) * (1 / z) / (1 + (1 / y) * (1 / z)) := by
    have h₁₀₁ : 0 < y := hy
    have h₁₀₂ : 0 < z := hz
    have h₁₀₃ : 0 < y * z := by positivity
    have h₁₀₄ : 0 < 1 + y * z := by positivity
    have h₁₀₅ : 0 < 1 + (1 / y) * (1 / z) := by positivity
    field_simp [h₁₀₁.ne', h₁₀₂.ne', h₁₀₃.ne', h₁₀₄.ne', h₁₀₅.ne']
    <;> ring_nf
    <;> field_simp [h₁₀₁.ne', h₁₀₂.ne', h₁₀₃.ne', h₁₀₄.ne', h₁₀₅.ne']
    <;> nlinarith

  have h₁₁ : 1 / (1 + z * x) = (1 / z) * (1 / x) / (1 + (1 / z) * (1 / x)) := by
    have h₁₁₁ : 0 < z := hz
    have h₁₁₂ : 0 < x := hx
    have h₁₁₃ : 0 < z * x := by positivity
    have h₁₁₄ : 0 < 1 + z * x := by positivity
    have h₁₁₅ : 0 < 1 + (1 / z) * (1 / x) := by positivity
    field_simp [h₁₁₁.ne', h₁₁₂.ne', h₁₁₃.ne', h₁₁₄.ne', h₁₁₅.ne']
    <;> ring_nf
    <;> field_simp [h₁₁₁.ne', h₁₁₂.ne', h₁₁₃.ne', h₁₁₄.ne', h₁₁₅.ne']
    <;> nlinarith

  have h₁₂ : (1 / x) * (1 / y) / (1 + (1 / x) * (1 / y)) + (1 / y) * (1 / z) / (1 + (1 / y) * (1 / z)) + (1 / z) * (1 / x) / (1 + (1 / z) * (1 / x)) ≤ 3 / 4 := by
    have h₁₂₁ : 0 < (1 / x) * (1 / y) := by positivity
    have h₁₂₂ : 0 < (1 / y) * (1 / z) := by positivity
    have h₁₂₃ : 0 < (1 / z) * (1 / x) := by positivity
    have h₁₂₄ : (1 / x) * (1 / y) + (1 / y) * (1 / z) + (1 / z) * (1 / x) = 1 := h₈
    have h₁₂₅ : (1 / x) * (1 / y) / (1 + (1 / x) * (1 / y)) ≤ (9 / 16) * ((1 / x) * (1 / y)) + 1 / 16 := by
      have h₁₂₅₁ : 0 < (1 / x) * (1 / y) := by positivity
      have h₁₂₅₂ : (1 / x) * (1 / y) / (1 + (1 / x) * (1 / y)) ≤ (9 / 16) * ((1 / x) * (1 / y)) + 1 / 16 := by
        -- Use the inequality derived from the tangent line method
        have h₁₂₅₃ : 0 < 1 + (1 / x) * (1 / y) := by positivity
        have h₁₂₅₄ : (1 / x) * (1 / y) / (1 + (1 / x) * (1 / y)) ≤ (9 / 16) * ((1 / x) * (1 / y)) + 1 / 16 := by
          rw [div_le_iff (by positivity)]
          nlinarith [sq_nonneg (3 * ((1 / x) * (1 / y)) - 1)]
        exact h₁₂₅₄
      exact h₁₂₅₂
    have h₁₂₆ : (1 / y) * (1 / z) / (1 + (1 / y) * (1 / z)) ≤ (9 / 16) * ((1 / y) * (1 / z)) + 1 / 16 := by
      have h₁₂₆₁ : 0 < (1 / y) * (1 / z) := by positivity
      have h₁₂₆₂ : (1 / y) * (1 / z) / (1 + (1 / y) * (1 / z)) ≤ (9 / 16) * ((1 / y) * (1 / z)) + 1 / 16 := by
        -- Use the inequality derived from the tangent line method
        have h₁₂₆₃ : 0 < 1 + (1 / y) * (1 / z) := by positivity
        have h₁₂₆₄ : (1 / y) * (1 / z) / (1 + (1 / y) * (1 / z)) ≤ (9 / 16) * ((1 / y) * (1 / z)) + 1 / 16 := by
          rw [div_le_iff (by positivity)]
          nlinarith [sq_nonneg (3 * ((1 / y) * (1 / z)) - 1)]
        exact h₁₂₆₄
      exact h₁₂₆₂
    have h₁₂₇ : (1 / z) * (1 / x) / (1 + (1 / z) * (1 / x)) ≤ (9 / 16) * ((1 / z) * (1 / x)) + 1 / 16 := by
      have h₁₂₇₁ : 0 < (1 / z) * (1 / x) := by positivity
      have h₁₂₇₂ : (1 / z) * (1 / x) / (1 + (1 / z) * (1 / x)) ≤ (9 / 16) * ((1 / z) * (1 / x)) + 1 / 16 := by
        -- Use the inequality derived from the tangent line method
        have h₁₂₇₃ : 0 < 1 + (1 / z) * (1 / x) := by positivity
        have h₁₂₇₄ : (1 / z) * (1 / x) / (1 + (1 / z) * (1 / x)) ≤ (9 / 16) * ((1 / z) * (1 / x)) + 1 / 16 := by
          rw [div_le_iff (by positivity)]
          nlinarith [sq_nonneg (3 * ((1 / z) * (1 / x)) - 1)]
        exact h₁₂₇₄
      exact h₁₂₇₂
    -- Sum the inequalities and use the given condition to get the final result
    have h₁₂₈ : (1 / x) * (1 / y) / (1 + (1 / x) * (1 / y)) + (1 / y) * (1 / z) / (1 + (1 / y) * (1 / z)) + (1 / z) * (1 / x) / (1 + (1 / z) * (1 / x)) ≤ (9 / 16) * ((1 / x) * (1 / y) + (1 / y) * (1 / z) + (1 / z) * (1 / x)) + 3 / 16 := by
      linarith
    have h₁₂₉ : (9 / 16) * ((1 / x) * (1 / y) + (1 / y) * (1 / z) + (1 / z) * (1 / x)) + 3 / 16 ≤ 3 / 4 := by
      rw [h₁₂₄]
      <;> norm_num
    linarith

  have h₁₃ : 1 / (1 + x * y) + 1 / (1 + y * z) + 1 / (1 + z * x) ≤ 3 / 4 := by
    calc
      1 / (1 + x * y) + 1 / (1 + y * z) + 1 / (1 + z * x) = (1 / x) * (1 / y) / (1 + (1 / x) * (1 / y)) + (1 / y) * (1 / z) / (1 + (1 / y) * (1 / z)) + (1 / z) * (1 / x) / (1 + (1 / z) * (1 / x)) := by
        rw [h₉, h₁₀, h₁₁]
        <;>
        ring_nf
        <;>
        field_simp [h₁, h₂, h₃, h₄, h₅, h₆, h₇]
        <;>
        nlinarith
      _ ≤ 3 / 4 := by
        exact h₁₂
      _ = 3 / 4 := by rfl

  exact h₁₃