theorem amc12a_2013_p4 : (2 ^ 2014 + 2 ^ 2012) / (2 ^ 2014 - 2 ^ 2012) = (5 : ℝ) / 3:=
  by
  have h₀ : (2 : ℝ) ^ 2014 - (2 : ℝ) ^ 2012 > 0:=
    by
    have h₁ : (2 : ℝ) ^ 2014 > (2 : ℝ) ^ 2012:= by -- -- apply pow_lt_pow_right (by norm_num) <;> norm_num
      norm_num
    --  linarith
    norm_num
  have h₁ : ((2 : ℝ) ^ 2014 + (2 : ℝ) ^ 2012) / ((2 : ℝ) ^ 2014 - (2 : ℝ) ^ 2012) = (5 : ℝ) / 3:=
    by
    have h₂ : (2 : ℝ) ^ 2014 = 4 * (2 : ℝ) ^ 2012:= by -- ring_nf <;> norm_num [pow_add, pow_mul, mul_assoc] <;> linarith
      norm_num
    --  rw [h₂]
    have h₃ : (4 * (2 : ℝ) ^ 2012 + (2 : ℝ) ^ 2012 : ℝ) = 5 * (2 : ℝ) ^ 2012:= by -- ring_nf <;> linarith
      norm_num
    have h₄ : (4 * (2 : ℝ) ^ 2012 - (2 : ℝ) ^ 2012 : ℝ) = 3 * (2 : ℝ) ^ 2012:= by -- ring_nf <;> linarith
      norm_num
    rw [h₃, h₄]
    have h₅ : (5 * (2 : ℝ) ^ 2012 : ℝ) / (3 * (2 : ℝ) ^ 2012 : ℝ) = (5 : ℝ) / 3:=
      by
      have h₆ : (2 : ℝ) ^ 2012 ≠ 0:= by -- positivity
        norm_num
      --  field_simp [h₆] <;> ring_nf <;> linarith
      norm_num
    rw [h₅] <;> ring_nf <;> linarith
    hole
  have h₂ : (2 ^ 2014 + 2 ^ 2012 : ℝ) / (2 ^ 2014 - 2 ^ 2012 : ℝ) = (5 : ℝ) / 3:= by
    --  norm_num [pow_succ, add_assoc, mul_assoc, mul_comm, mul_left_comm] at h₁ ⊢ <;> ring_nf at h₁ ⊢ <;> simpa using h₁
    norm_num
  have h₃ : (2 ^ 2014 + 2 ^ 2012) / (2 ^ 2014 - 2 ^ 2012) = (5 : ℝ) / 3:= by -- norm_num [h₂] at * <;> simpa using h₂
    norm_num
  --  apply h₃
  norm_num