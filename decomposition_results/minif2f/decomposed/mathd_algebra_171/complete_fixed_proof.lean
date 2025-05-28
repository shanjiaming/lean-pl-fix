theorem mathd_algebra_171 (f : ℝ → ℝ) (h₀ : ∀ x, f x = 5 * x + 4) : f 1 = 9:=
  by
  have h₁ : f 1 = 5 * (1 : ℝ) + 4:=
    by
    have h₁₀ : f 1 = 5 * (1 : ℝ) + 4:= by -- rw [h₀] <;> norm_num
      hole
    --  exact h₁₀
    linarith
  have h₂ : f 1 = 9:= by -- -- rw [h₁] <;> norm_num <;> linarith
    linarith
  --  exact h₂
  linarith