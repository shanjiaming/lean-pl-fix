theorem amc12b_2021_p9 :
  Real.log 80 / Real.log 2 / (Real.log 2 / Real.log 40) - Real.log 160 / Real.log 2 / (Real.log 2 / Real.log 20) = 2:=
  by
  have h₀ : Real.log 80 = 4 * Real.log 2 + Real.log 5:=
    by
    have h₀₁ : Real.log 80 = Real.log (2 ^ 4 * 5):= by -- norm_num
      norm_num
    --  rw [h₀₁]
    have h₀₂ : Real.log (2 ^ 4 * 5) = Real.log (2 ^ 4) + Real.log 5 := by
      rw [Real.log_mul (by positivity) (by positivity)]
    --  rw [h₀₂]
    have h₀₃ : Real.log (2 ^ 4) = 4 * Real.log 2:= by -- -- rw [Real.log_pow] <;> ring_nf <;> norm_num
      simp
    have h₀₂ : Real.log (2 ^ 4 * 5) = Real.log (2 ^ 4) + Real.log 5:= by -- rw [Real.log_mul (by positivity) (by positivity)]
      hole
  have h₀ : Real.log 80 = 4 * Real.log 2 + Real.log 5 :=
    by
    have h₀₁ : Real.log 80 = Real.log (2 ^ 4 * 5) := by sorry
    rw [h₀₁]
    have h₀₂ : Real.log (2 ^ 4 * 5) = Real.log (2 ^ 4) + Real.log 5 := by
      rw [Real.log_mul (by positivity) (by positivity)]
    rw [h₀₂]
    have h₀₃ : Real.log (2 ^ 4) = 4 * Real.log 2 := by rw [Real.log_pow] <;> ring_nf <;> norm_num
    rw [h₀₃] <;> ring
    hole
  have h₁ : Real.log 40 = 3 * Real.log 2 + Real.log 5:=
    by
    have h₁₁ : Real.log 40 = Real.log (2 ^ 3 * 5):= by -- norm_num
      norm_num
    --  rw [h₁₁]
    have h₁₂ : Real.log (2 ^ 3 * 5) = Real.log (2 ^ 3) + Real.log 5 := by
      rw [Real.log_mul (by positivity) (by positivity)]
    --  rw [h₁₂]
    have h₁₃ : Real.log (2 ^ 3) = 3 * Real.log 2:= by -- -- rw [Real.log_pow] <;> ring_nf <;> norm_num
      simp
    have h₁₂ : Real.log (2 ^ 3 * 5) = Real.log (2 ^ 3) + Real.log 5:= by -- rw [Real.log_mul (by positivity) (by positivity)]
      hole
  have h₁ : Real.log 40 = 3 * Real.log 2 + Real.log 5 :=
    by
    have h₁₁ : Real.log 40 = Real.log (2 ^ 3 * 5) := by sorry
    rw [h₁₁]
    have h₁₂ : Real.log (2 ^ 3 * 5) = Real.log (2 ^ 3) + Real.log 5 := by
      rw [Real.log_mul (by positivity) (by positivity)]
    rw [h₁₂]
    have h₁₃ : Real.log (2 ^ 3) = 3 * Real.log 2 := by rw [Real.log_pow] <;> ring_nf <;> norm_num
    rw [h₁₃] <;> ring
    hole
  have h₂ : Real.log 160 = 5 * Real.log 2 + Real.log 5:=
    by
    have h₂₁ : Real.log 160 = Real.log (2 ^ 5 * 5):= by -- norm_num
      norm_num
    --  rw [h₂₁]
    have h₂₂ : Real.log (2 ^ 5 * 5) = Real.log (2 ^ 5) + Real.log 5 := by
      rw [Real.log_mul (by positivity) (by positivity)]
    --  rw [h₂₂]
    have h₂₃ : Real.log (2 ^ 5) = 5 * Real.log 2:= by -- -- rw [Real.log_pow] <;> ring_nf <;> norm_num
      simp
    have h₂₂ : Real.log (2 ^ 5 * 5) = Real.log (2 ^ 5) + Real.log 5:= by -- rw [Real.log_mul (by positivity) (by positivity)]
      hole
  have h₂ : Real.log 160 = 5 * Real.log 2 + Real.log 5 :=
    by
    have h₂₁ : Real.log 160 = Real.log (2 ^ 5 * 5) := by sorry
    rw [h₂₁]
    have h₂₂ : Real.log (2 ^ 5 * 5) = Real.log (2 ^ 5) + Real.log 5 := by
      rw [Real.log_mul (by positivity) (by positivity)]
    rw [h₂₂]
    have h₂₃ : Real.log (2 ^ 5) = 5 * Real.log 2 := by rw [Real.log_pow] <;> ring_nf <;> norm_num
    rw [h₂₃] <;> ring
    hole
  have h₃ : Real.log 20 = 2 * Real.log 2 + Real.log 5:=
    by
    have h₃₁ : Real.log 20 = Real.log (2 ^ 2 * 5):= by -- norm_num
      norm_num
    --  rw [h₃₁]
    have h₃₂ : Real.log (2 ^ 2 * 5) = Real.log (2 ^ 2) + Real.log 5 := by
      rw [Real.log_mul (by positivity) (by positivity)]
    --  rw [h₃₂]
    have h₃₃ : Real.log (2 ^ 2) = 2 * Real.log 2:= by -- -- rw [Real.log_pow] <;> ring_nf <;> norm_num
      simp
    have h₃₂ : Real.log (2 ^ 2 * 5) = Real.log (2 ^ 2) + Real.log 5:= by -- rw [Real.log_mul (by positivity) (by positivity)]
      hole
  have h₃ : Real.log 20 = 2 * Real.log 2 + Real.log 5 :=
    by
    have h₃₁ : Real.log 20 = Real.log (2 ^ 2 * 5) := by sorry
    rw [h₃₁]
    have h₃₂ : Real.log (2 ^ 2 * 5) = Real.log (2 ^ 2) + Real.log 5 := by
      rw [Real.log_mul (by positivity) (by positivity)]
    rw [h₃₂]
    have h₃₃ : Real.log (2 ^ 2) = 2 * Real.log 2 := by rw [Real.log_pow] <;> ring_nf <;> norm_num
    rw [h₃₃] <;> ring
    hole
  have h₄ : Real.log 80 * Real.log 40 = 12 * (Real.log 2) ^ 2 + 7 * Real.log 2 * Real.log 5 + (Real.log 5) ^ 2:=
    by
    --  rw [h₀, h₁]
    have h₄₁ :
      (4 * Real.log 2 + Real.log 5) * (3 * Real.log 2 + Real.log 5) =
        12 * (Real.log 2) ^ 2 + 7 * Real.log 2 * Real.log 5 + (Real.log 5) ^ 2 := by sorry
    --  rw [h₄₁] <;>
      nlinarith [Real.log_pos (by norm_num : (1 : ℝ) < 2), Real.log_pos (by norm_num : (1 : ℝ) < 5),
        Real.log_pos (by norm_num : (1 : ℝ) < 20), Real.log_pos (by norm_num : (1 : ℝ) < 40),
        Real.log_pos (by norm_num : (1 : ℝ) < 80), Real.log_pos (by norm_num : (1 : ℝ) < 160)]
    hole
  have h₅ : Real.log 160 * Real.log 20 = 10 * (Real.log 2) ^ 2 + 7 * Real.log 2 * Real.log 5 + (Real.log 5) ^ 2:=
    by
    --  rw [h₂, h₃]
    have h₅₁ :
      (5 * Real.log 2 + Real.log 5) * (2 * Real.log 2 + Real.log 5) =
        10 * (Real.log 2) ^ 2 + 7 * Real.log 2 * Real.log 5 + (Real.log 5) ^ 2 := by sorry
    --  rw [h₅₁] <;> nlinarith [Real.log_pos (by norm_num : (1 : ℝ) < 2), Real.log_pos (by norm_num : (1 : ℝ) < 5)]
    hole
  have h₆ : Real.log 80 * Real.log 40 - Real.log 160 * Real.log 20 = 2 * (Real.log 2) ^ 2:= by
    --  --  rw [h₄, h₅] <;> ring_nf <;>
      nlinarith [Real.log_pos (by norm_num : (1 : ℝ) < 2), Real.log_pos (by norm_num : (1 : ℝ) < 5),
        Real.log_pos (by norm_num : (1 : ℝ) < 20), Real.log_pos (by norm_num : (1 : ℝ) < 40),
        Real.log_pos (by norm_num : (1 : ℝ) < 80), Real.log_pos (by norm_num : (1 : ℝ) < 160)]
    hole
  have h₇ :
    Real.log 80 / Real.log 2 / (Real.log 2 / Real.log 40) - Real.log 160 / Real.log 2 / (Real.log 2 / Real.log 20) = 2 := by sorry
  --  rw [h₇] <;> norm_num <;> linarith
  linarith