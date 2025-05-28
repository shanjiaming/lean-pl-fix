theorem mathd_algebra_354 (a d : ℝ) (h₀ : a + 6 * d = 30) (h₁ : a + 10 * d = 60) : a + 20 * d = 135:=
  by
  have h₂ : 4 * d = 30:= by
    have h₂₁ : 4 * d = 30:= by -- linarith
      linarith
    --  exact h₂₁
    linarith
  have h₃ : 14 * d = 105:= by
    have h₃₁ : 14 * d = (7 / 2 : ℝ) * (4 * d):= by -- ring
      linarith
    have h₃₂ : (7 / 2 : ℝ) * (4 * d) = (7 / 2 : ℝ) * 30:= by -- rw [h₂] <;> ring
      linarith
    have h₃₃ : (7 / 2 : ℝ) * 30 = 105:= by -- norm_num
      hole
    --  calc
    --    14 * d = (7 / 2 : ℝ) * (4 * d) := by rw [h₃₁]
    --    _ = (7 / 2 : ℝ) * 30 := by rw [h₃₂]
    --    _ = 105 := by rw [h₃₃]
    linarith
  have h₄ : a + 20 * d = 135:= by
    have h₄₁ : a + 20 * d = (a + 6 * d) + 14 * d:= by -- ring
      linarith
    --  rw [h₄₁]
    have h₄₂ : a + 6 * d = 30 := h₀
    have h₄₃ : 14 * d = 105 := h₃
    --  --  rw [h₄₂, h₄₃] <;> norm_num
    linarith
  --  exact h₄
  linarith