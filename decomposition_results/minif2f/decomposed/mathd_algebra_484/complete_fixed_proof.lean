theorem mathd_algebra_484 : Real.log 27 / Real.log 3 = 3:=
  by
  have h₀ : Real.log 27 = 3 * Real.log 3:=
    by
    have h₀₁ : Real.log 27 = Real.log (3 ^ 3):= by -- norm_num
      norm_num
    --  rw [h₀₁]
    have h₀₂ : Real.log (3 ^ 3) = 3 * Real.log 3:= by
      --  --  rw [Real.log_pow] <;> norm_num <;> linarith [Real.log_pos (by norm_num : (1 : ℝ) < 3)]
      simp
    --  rw [h₀₂] <;> linarith [Real.log_pos (by norm_num : (1 : ℝ) < 3)]
    linarith
  have h₁ : Real.log 27 / Real.log 3 = 3:= by
    --  rw [h₀]
    have h₂ : Real.log 3 ≠ 0:= by
      have h₂₁ : Real.log 3 > 0 := Real.log_pos (by norm_num)
      --  linarith
      norm_num
    --  field_simp [h₂] <;> ring <;> linarith [Real.log_pos (by norm_num : (1 : ℝ) < 3)]
    hole
  --  apply h₁
  linarith