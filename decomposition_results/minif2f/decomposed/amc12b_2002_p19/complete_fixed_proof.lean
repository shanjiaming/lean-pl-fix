theorem amc12b_2002_p19 (a b c : ℝ) (h₀ : 0 < a ∧ 0 < b ∧ 0 < c) (h₁ : a * (b + c) = 152) (h₂ : b * (c + a) = 162)
  (h₃ : c * (a + b) = 170) : a * b * c = 720:=
  by
  have h₄ : a * b + a * c + b * c = 242:=
    by
    have h₄₁ : a * b + a * c + b * c = 242:=
      by
      have h₄₂ : a * b + a * c = 152:= by
        have h₄₃ : a * b + a * c = a * (b + c):= by -- ring
          linarith
        --  rw [h₄₃]
        --  linarith
        linarith
      have h₄₄ : b * c + b * a = 162:= by
        have h₄₅ : b * c + b * a = b * (c + a):= by -- ring
          linarith
        --  rw [h₄₅]
        --  linarith
        linarith
      have h₄₆ : c * a + c * b = 170:= by
        have h₄₇ : c * a + c * b = c * (a + b):= by -- ring
          linarith
        --  rw [h₄₇]
        --  linarith
        linarith
      have h₄₈ : 2 * (a * b + a * c + b * c) = 484:= by -- nlinarith
        linarith
      --  nlinarith
      linarith
    --  exact h₄₁
    linarith
  have h₅ : a * b = 72:=
    by
    have h₅₁ : a * b + a * c = 152:= by
      have h₅₂ : a * b + a * c = a * (b + c):= by -- ring
        linarith
      --  rw [h₅₂]
      --  linarith
      linarith
    have h₅₃ : a * c = 80:= by -- nlinarith
      linarith
    have h₅₄ : a * b = 72:= by -- nlinarith
      linarith
    --  exact h₅₄
    linarith
  have h₆ : a * c = 80:=
    by
    have h₆₁ : a * b + a * c = 152:= by
      have h₆₂ : a * b + a * c = a * (b + c):= by -- ring
        linarith
      --  rw [h₆₂]
      --  linarith
      linarith
    have h₆₃ : b * c + b * a = 162:= by
      have h₆₄ : b * c + b * a = b * (c + a):= by -- ring
        linarith
      --  rw [h₆₄]
      --  linarith
      linarith
    --  nlinarith
    linarith
  have h₇ : b * c = 90:=
    by
    have h₇₁ : a * b + a * c = 152:= by
      have h₇₂ : a * b + a * c = a * (b + c):= by -- ring
        linarith
      --  rw [h₇₂]
      --  linarith
      linarith
    have h₇₃ : b * c + b * a = 162:= by
      have h₇₄ : b * c + b * a = b * (c + a):= by -- ring
        linarith
      --  rw [h₇₄]
      --  linarith
      linarith
    have h₇₅ : c * a + c * b = 170:= by
      have h₇₆ : c * a + c * b = c * (a + b):= by -- ring
        linarith
      --  rw [h₇₆]
      --  linarith
      linarith
    --  nlinarith
    linarith
  have h₈ : a * b * c = 720:= by
    have h₈₁ : 0 < a * b:= by -- nlinarith
      linarith
    have h₈₂ : 0 < a * c:= by -- nlinarith
      linarith
    have h₈₃ : 0 < b * c:= by -- nlinarith
      linarith
    have h₈₄ : 0 < a * b * c:= by -- nlinarith
      nlinarith
    have h₈₅ : (a * b * c) ^ 2 = 518400:= by
      --  calc
      --    (a * b * c) ^ 2 = a * b * c * (a * b * c) := by ring
      --    _ = (a * b) * (a * c) * (b * c) := by ring
      --    _ = 72 * 80 * 90 := by rw [h₅, h₆, h₇] <;> ring
      --    _ = 518400 := by norm_num
      hole
    have h₈₆ : a * b * c = 720:= by
      have h₈₇ : a * b * c > 0:= by -- nlinarith
        linarith
      --  nlinarith [sq_nonneg (a * b * c - 720), sq_nonneg (a * b * c + 720)]
      nlinarith
    --  exact h₈₆
    linarith
  --  rw [h₈] <;> norm_num
  linarith