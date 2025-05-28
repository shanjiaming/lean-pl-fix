theorem mathd_algebra_427 (x y z : ℝ) (h₀ : 3 * x + y = 17) (h₁ : 5 * y + z = 14) (h₂ : 3 * x + 5 * z = 41) :
  x + y + z = 12:=
  by
  have h₃ : 6 * x + 6 * y + 6 * z = 72:=
    by
    have h₃₁ : 6 * x + 6 * y + 6 * z = (3 * x + y) + (5 * y + z) + (3 * x + 5 * z):= by -- ring
      linarith
    --  rw [h₃₁]
    --  linarith
    linarith
  have h₄ : x + y + z = 12:= by
    have h₄₁ : x + y + z = (6 * x + 6 * y + 6 * z) / 6:= by -- ring
      linarith
    --  rw [h₄₁]
    --  --  rw [h₃] <;> norm_num <;> linarith
    linarith
  --  exact h₄
  linarith