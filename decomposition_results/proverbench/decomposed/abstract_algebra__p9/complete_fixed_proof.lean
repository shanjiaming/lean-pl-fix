theorem positive_sum_inequality (h : x + y + z = x * y * z) :
  1 / (1 + x * y) + 1 / (1 + y * z) + 1 / (1 + z * x) ≤ 3 / 4:=
  by
  have h₁ : 0 < x * y:= by
    have h₁ : 0 < x * y := mul_pos hx hy
    --  exact h₁
    linarith
  have h₂ : 0 < y * z:= by
    have h₂ : 0 < y * z := mul_pos hy hz
    --  exact h₂
    linarith
  have h₃ : 0 < z * x:= by
    have h₃ : 0 < z * x := mul_pos hz hx
    --  exact h₃
    linarith
  have h₄ : 0 < x * y * z:=
    by
    have h₄ : 0 < x * y * z:= by
      have h₄₁ : 0 < x * y := h₁
      have h₄₂ : 0 < z := hz
      --  positivity
      linarith
    --  exact h₄
    linarith
  have h₅ : 0 < x * y * z * x:= by
    have h₅ : 0 < x * y * z * x:= by -- positivity
      nlinarith
    --  exact h₅
    linarith
  have h₆ : 0 < x * y * z * y:= by
    have h₆ : 0 < x * y * z * y:= by -- positivity
      nlinarith
    --  exact h₆
    linarith
  have h₇ : 0 < x * y * z * z:= by
    have h₇ : 0 < x * y * z * z:= by -- positivity
      nlinarith
    --  exact h₇
    linarith
  have h₈ : (1 / x) * (1 / y) + (1 / y) * (1 / z) + (1 / z) * (1 / x) = 1:=
    by
    have h₈₁ : x + y + z = x * y * z := h
    have h₈₂ : 0 < x := hx
    have h₈₃ : 0 < y := hy
    have h₈₄ : 0 < z := hz
    have h₈₅ : 0 < x * y:= by -- positivity
      linarith
    have h₈₆ : 0 < y * z:= by -- positivity
      linarith
    have h₈₇ : 0 < z * x:= by -- positivity
      linarith
    have h₈₈ : 0 < x * y * z:= by -- positivity
      linarith
    --  field_simp [h₈₂.ne', h₈₃.ne', h₈₄.ne', h₈₅.ne', h₈₆.ne', h₈₇.ne', h₈₈.ne']
    --  nlinarith [mul_pos h₈₂ h₈₃, mul_pos h₈₃ h₈₄, mul_pos h₈₄ h₈₂, mul_pos (mul_pos h₈₂ h₈₃) h₈₄]
    hole
  have h₉ : 1 / (1 + x * y) = (1 / x) * (1 / y) / (1 + (1 / x) * (1 / y)):=
    by
    have h₉₁ : 0 < x := hx
    have h₉₂ : 0 < y := hy
    have h₉₃ : 0 < x * y:= by -- positivity
      linarith
    have h₉₄ : 0 < 1 + x * y:= by -- positivity
      linarith
    have h₉₅ : 0 < 1 + (1 / x) * (1 / y):= by -- positivity
      positivity
    --  --  field_simp [h₉₁.ne', h₉₂.ne', h₉₃.ne', h₉₄.ne', h₉₅.ne'] <;> ring_nf <;>
        field_simp [h₉₁.ne', h₉₂.ne', h₉₃.ne', h₉₄.ne', h₉₅.ne'] <;>
      nlinarith
    hole
  have h₁₀ : 1 / (1 + y * z) = (1 / y) * (1 / z) / (1 + (1 / y) * (1 / z)):=
    by
    have h₁₀₁ : 0 < y := hy
    have h₁₀₂ : 0 < z := hz
    have h₁₀₃ : 0 < y * z:= by -- positivity
      linarith
    have h₁₀₄ : 0 < 1 + y * z:= by -- positivity
      linarith
    have h₁₀₅ : 0 < 1 + (1 / y) * (1 / z):= by -- positivity
      positivity
    --  --  field_simp [h₁₀₁.ne', h₁₀₂.ne', h₁₀₃.ne', h₁₀₄.ne', h₁₀₅.ne'] <;> ring_nf <;>
        field_simp [h₁₀₁.ne', h₁₀₂.ne', h₁₀₃.ne', h₁₀₄.ne', h₁₀₅.ne'] <;>
      nlinarith
    hole
  have h₁₁ : 1 / (1 + z * x) = (1 / z) * (1 / x) / (1 + (1 / z) * (1 / x)):=
    by
    have h₁₁₁ : 0 < z := hz
    have h₁₁₂ : 0 < x := hx
    have h₁₁₃ : 0 < z * x:= by -- positivity
      linarith
    have h₁₁₄ : 0 < 1 + z * x:= by -- positivity
      linarith
    have h₁₁₅ : 0 < 1 + (1 / z) * (1 / x):= by -- positivity
      positivity
    --  --  field_simp [h₁₁₁.ne', h₁₁₂.ne', h₁₁₃.ne', h₁₁₄.ne', h₁₁₅.ne'] <;> ring_nf <;>
        field_simp [h₁₁₁.ne', h₁₁₂.ne', h₁₁₃.ne', h₁₁₄.ne', h₁₁₅.ne'] <;>
      nlinarith
    hole
  have h₁₂ :
    (1 / x) * (1 / y) / (1 + (1 / x) * (1 / y)) + (1 / y) * (1 / z) / (1 + (1 / y) * (1 / z)) +
        (1 / z) * (1 / x) / (1 + (1 / z) * (1 / x)) ≤
      3 / 4 := by sorry
  have h₁₃ : 1 / (1 + x * y) + 1 / (1 + y * z) + 1 / (1 + z * x) ≤ 3 / 4:= by
    --  calc
    --    1 / (1 + x * y) + 1 / (1 + y * z) + 1 / (1 + z * x) =
    --        (1 / x) * (1 / y) / (1 + (1 / x) * (1 / y)) + (1 / y) * (1 / z) / (1 + (1 / y) * (1 / z)) +
    --          (1 / z) * (1 / x) / (1 + (1 / z) * (1 / x)) :=
    --      by rw [h₉, h₁₀, h₁₁] <;> ring_nf <;> field_simp [h₁, h₂, h₃, h₄, h₅, h₆, h₇] <;> nlinarith
    --    _ ≤ 3 / 4 := by exact h₁₂
    --    _ = 3 / 4 := by rfl
    linarith
  --  exact h₁₃
  linarith