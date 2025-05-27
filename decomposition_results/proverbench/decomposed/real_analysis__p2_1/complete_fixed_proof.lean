theorem log_inequality_of_in_interval (h : x ∈ target_interval) : log_inequality x:=
  by
  have h₁ : x > 0:= by
    have h₂ : x ∈ Set.Ioo (10 ^ (-5.4 : ℝ)) (10 ^ (-2.3 : ℝ)) := h
    have h₃ : (10 : ℝ) ^ (-5.4 : ℝ) < x := h₂.1
    have h₄ : x < (10 : ℝ) ^ (-2.3 : ℝ) := h₂.2
    have h₅ : (10 : ℝ) ^ (-5.4 : ℝ) > 0:= by -- positivity
      hole
    --  linarith
    linarith
  have h₂ : (10 : ℝ) ^ (-5.4 : ℝ) < x:=
    by
    have h₂ : x ∈ Set.Ioo (10 ^ (-5.4 : ℝ)) (10 ^ (-2.3 : ℝ)) := h
    --  exact h₂.1
    hole
  have h₃ : x < (10 : ℝ) ^ (-2.3 : ℝ):=
    by
    have h₃ : x ∈ Set.Ioo (10 ^ (-5.4 : ℝ)) (10 ^ (-2.3 : ℝ)) := h
    --  exact h₃.2
    hole
  have h₄ : Real.log ((10 : ℝ) ^ (-5.4 : ℝ)) < Real.log x:=
    by
    --  apply Real.log_lt_log (by positivity)
    exact h₂
    hole
  have h₅ : Real.log x < Real.log ((10 : ℝ) ^ (-2.3 : ℝ)):=
    by
    --  apply Real.log_lt_log (by linarith)
    exact h₃
    hole
  have h₆ : (-5.4 : ℝ) * Real.log 10 < Real.log x:=
    by
    have h₆₁ : Real.log ((10 : ℝ) ^ (-5.4 : ℝ)) = (-5.4 : ℝ) * Real.log 10:= by
      --  rw [Real.log_rpow (by norm_num : (10 : ℝ) > 0)] <;> ring_nf
      hole
    --  rw [h₆₁] at h₄
    linarith
    hole
  have h₇ : Real.log x < (-2.3 : ℝ) * Real.log 10:=
    by
    have h₇₁ : Real.log ((10 : ℝ) ^ (-2.3 : ℝ)) = (-2.3 : ℝ) * Real.log 10:= by
      --  rw [Real.log_rpow (by norm_num : (10 : ℝ) > 0)] <;> ring_nf
      hole
    --  rw [h₇₁] at h₅
    linarith
    hole
  have h₈ : (2.3 : ℝ) * Real.log 10 < -Real.log x:=
    by
    have h₈₁ : Real.log x < (-2.3 : ℝ) * Real.log 10 := h₇
    have h₈₂ : (2.3 : ℝ) * Real.log 10 < -Real.log x:= by -- linarith
      hole
    --  exact h₈₂
    hole
  have h₉ : -Real.log x < (5.4 : ℝ) * Real.log 10:=
    by
    have h₉₁ : (-5.4 : ℝ) * Real.log 10 < Real.log x := h₆
    have h₉₂ : -Real.log x < (5.4 : ℝ) * Real.log 10:= by -- linarith
      hole
    --  exact h₉₂
    hole
  have h₁₀ : (2.3 : ℝ) < -Real.logb 10 x:=
    by
    have h₁₀₁ : Real.logb 10 x = Real.log x / Real.log 10:= by
      --  rw [Real.logb, div_eq_mul_inv] <;> field_simp [Real.log_mul, Real.log_rpow, h₁.ne'] <;> ring_nf <;> norm_num <;>
        linarith
      hole
    --  rw [h₁₀₁]
    have h₁₀₂ : (2.3 : ℝ) < -(Real.log x / Real.log 10):=
      by
      have h₁₀₃ : (2.3 : ℝ) * Real.log 10 < -Real.log x := h₈
      have h₁₀₄ : Real.log 10 > 0 := Real.log_pos (by norm_num)
      have h₁₀₅ : (2.3 : ℝ) < -(Real.log x / Real.log 10):=
        by
        have h₁₀₅₁ : (2.3 : ℝ) * Real.log 10 < -Real.log x := h₈
        have h₁₀₅₂ : (2.3 : ℝ) < -(Real.log x / Real.log 10):=
          by
          have h₁₀₅₃ : Real.log 10 > 0 := Real.log_pos (by norm_num)
          have h₁₀₅₄ : -(Real.log x / Real.log 10) = -Real.log x / Real.log 10:= by -- ring
            hole
          --  rw [h₁₀₅₄]
          have h₁₀₅₅ : (2.3 : ℝ) * Real.log 10 < -Real.log x := h₈
          have h₁₀₅₆ : (2.3 : ℝ) < -Real.log x / Real.log 10:=
            by
            --  rw [lt_div_iff h₁₀₄]
            nlinarith
            hole
          --  linarith
          hole
        --  exact h₁₀₅₂
        hole
      --  exact h₁₀₅
      hole
    --  linarith
    hole
  have h₁₁ : -Real.logb 10 x < (5.4 : ℝ):=
    by
    have h₁₁₁ : Real.logb 10 x = Real.log x / Real.log 10:= by
      --  rw [Real.logb, div_eq_mul_inv] <;> field_simp [Real.log_mul, Real.log_rpow, h₁.ne'] <;> ring_nf <;> norm_num <;>
        linarith
      hole
    --  rw [h₁₁₁]
    have h₁₁₂ : -(Real.log x / Real.log 10) < (5.4 : ℝ):=
      by
      have h₁₁₃ : -Real.log x < (5.4 : ℝ) * Real.log 10 := h₉
      have h₁₁₄ : Real.log 10 > 0 := Real.log_pos (by norm_num)
      have h₁₁₅ : -(Real.log x / Real.log 10) < (5.4 : ℝ):=
        by
        have h₁₁₅₁ : -Real.log x < (5.4 : ℝ) * Real.log 10 := h₉
        have h₁₁₅₂ : -(Real.log x / Real.log 10) = -Real.log x / Real.log 10:= by -- ring
          hole
        --  rw [h₁₁₅₂]
        have h₁₁₅₃ : -Real.log x < (5.4 : ℝ) * Real.log 10 := h₉
        have h₁₁₅₄ : -Real.log x / Real.log 10 < (5.4 : ℝ):=
          by
          --  rw [div_lt_iff h₁₁₄]
          nlinarith
          hole
        --  linarith
        hole
      --  exact h₁₁₅
      hole
    --  linarith
    hole
  have h₁₂ : log_inequality x:= by
    --  constructor
    --  · exact h₁₀
    --  · exact h₁₁
    hole
  --  exact h₁₂
  simpa