theorem mathd_algebra_114 (a : ℝ) (h₀ : a = 8) : (16 * (a ^ 2) ^ ((1 : ℝ) / 3)) ^ ((1 : ℝ) / 3) = 4:=
  by
  have h₁ : a > 0:= by
    --  rw [h₀]
    --  norm_num
    linarith
  have h₂ : (a ^ 2 : ℝ) ^ ((1 : ℝ) / 3) = a ^ (2 / 3 : ℝ):=
    by
    have h₂₁ : (a ^ 2 : ℝ) > 0:= by -- positivity
      nlinarith
    have h₂₂ : (a ^ 2 : ℝ) ^ ((1 : ℝ) / 3) = (a ^ 2 : ℝ) ^ ((1 : ℝ) / 3) := rfl
    --  rw [show (a ^ 2 : ℝ) ^ ((1 : ℝ) / 3) = a ^ (2 / 3 : ℝ)
    --        by
    --        have h₂₃ : Real.log ((a ^ 2 : ℝ) ^ ((1 : ℝ) / 3)) = Real.log (a ^ (2 / 3 : ℝ)) :=
    --          by
    --          have h₂₄ : Real.log ((a ^ 2 : ℝ) ^ ((1 : ℝ) / 3)) = ((1 : ℝ) / 3) * Real.log (a ^ 2) := by
    --            rw [Real.log_rpow (by positivity)]
    --          have h₂₅ : Real.log (a ^ (2 / 3 : ℝ)) = (2 / 3 : ℝ) * Real.log a := by
    --            rw [Real.log_rpow (by positivity)] <;> ring_nf
    --          rw [h₂₄, h₂₅]
    --          have h₂₆ : Real.log (a ^ 2) = 2 * Real.log a := by rw [Real.log_pow] <;> norm_num
    --          rw [h₂₆] <;> ring_nf <;> field_simp <;> ring_nf
    --        have h₂₇ : (a ^ 2 : ℝ) ^ ((1 : ℝ) / 3) > 0 := by positivity
    --        have h₂₈ : a ^ (2 / 3 : ℝ) > 0 := by positivity
    --        have h₂₉ : Real.log ((a ^ 2 : ℝ) ^ ((1 : ℝ) / 3)) = Real.log (a ^ (2 / 3 : ℝ)) := h₂₃
    --        have h₃₀ : (a ^ 2 : ℝ) ^ ((1 : ℝ) / 3) = a ^ (2 / 3 : ℝ) :=
    --          by
    --          apply Real.log_injOn_pos (Set.mem_Ioi.mpr h₂₇) (Set.mem_Ioi.mpr h₂₈)
    --          linarith
    --        rw [h₃₀]] <;>
      simp_all
    hole
  have h₃ : (16 * (a ^ 2 : ℝ) ^ ((1 : ℝ) / 3)) ^ ((1 : ℝ) / 3) = (16 * a ^ (2 / 3 : ℝ)) ^ ((1 : ℝ) / 3):= by
    --  rw [h₂] <;> simp_all [Real.rpow_def_of_pos, Real.log_mul, Real.log_rpow, Real.log_pow, mul_assoc] <;> ring_nf at * <;>
        norm_num at * <;>
      linarith
    hole
  have h₄ : a ^ (2 / 3 : ℝ) = 4:= by
    have h₄₁ : a = 8 := h₀
    have h₄₂ : a > 0 := h₁
    have h₄₃ : a ^ (2 / 3 : ℝ) = 4:= by
      --  rw [h₄₁]
      have h₄₄ : (8 : ℝ) ^ (2 / 3 : ℝ) = 4:=
        by
        have h₄₅ : Real.log ((8 : ℝ) ^ (2 / 3 : ℝ)) = Real.log 4:=
          by
          have h₄₆ : Real.log ((8 : ℝ) ^ (2 / 3 : ℝ)) = (2 / 3 : ℝ) * Real.log 8:= by
            --  rw [Real.log_rpow (by norm_num : (8 : ℝ) > 0)]
            hole
          --  rw [h₄₆]
          have h₄₇ : Real.log 8 = Real.log (2 ^ 3):= by -- norm_num
            norm_num
          rw [h₄₇]
          have h₄₈ : Real.log (2 ^ 3 : ℝ) = 3 * Real.log 2:= by -- -- rw [Real.log_pow] <;> norm_num
            simp
          rw [h₄₈]
          have h₄₉ : Real.log 4 = Real.log (2 ^ 2):= by -- norm_num
            norm_num
          rw [h₄₉]
          have h₅₀ : Real.log (2 ^ 2 : ℝ) = 2 * Real.log 2:= by -- -- rw [Real.log_pow] <;> norm_num
            simp
          rw [h₅₀]
          ring_nf <;> norm_num <;> linarith [Real.log_pos (by norm_num : (1 : ℝ) < 2)]
          hole
        have h₅₁ : (8 : ℝ) ^ (2 / 3 : ℝ) > 0:= by -- positivity
          norm_num
        have h₅₂ : (4 : ℝ) > 0:= by -- norm_num
          norm_num
        have h₅₃ : Real.log ((8 : ℝ) ^ (2 / 3 : ℝ)) = Real.log 4 := h₄₅
        have h₅₄ : Real.log ((8 : ℝ) ^ (2 / 3 : ℝ)) = Real.log 4:= by -- rw [h₅₃]
          linarith
        have h₅₅ : (8 : ℝ) ^ (2 / 3 : ℝ) = 4:=
          by
          --  apply Real.log_injOn_pos (Set.mem_Ioi.mpr h₅₁) (Set.mem_Ioi.mpr h₅₂)
          linarith
          hole
        --  rw [h₅₅]
        hole
      --  rw [h₄₄]
      hole
    --  rw [h₄₃]
    hole
  have h₅ : (16 * (a ^ 2 : ℝ) ^ ((1 : ℝ) / 3)) ^ ((1 : ℝ) / 3) = (16 * (4 : ℝ)) ^ ((1 : ℝ) / 3):= by
    --  rw [h₃, h₄] <;> norm_num <;> simp_all [Real.rpow_def_of_pos, Real.log_mul, Real.log_rpow, Real.log_pow, mul_assoc] <;>
          ring_nf at * <;>
        norm_num at * <;>
      linarith
    hole
  have h₆ : (16 * (4 : ℝ)) ^ ((1 : ℝ) / 3) = (64 : ℝ) ^ ((1 : ℝ) / 3):= by
    --  norm_num [Real.rpow_def_of_pos] <;>
            simp_all [Real.rpow_def_of_pos, Real.log_mul, Real.log_rpow, Real.log_pow, mul_assoc] <;>
          ring_nf at * <;>
        norm_num at * <;>
      linarith
    hole
  have h₇ : (64 : ℝ) ^ ((1 : ℝ) / 3) = 4:=
    by
    have h₇₁ : (64 : ℝ) ^ ((1 : ℝ) / 3) = 4:=
      by
      have h₇₂ : Real.log ((64 : ℝ) ^ ((1 : ℝ) / 3)) = Real.log 4:=
        by
        have h₇₃ : Real.log ((64 : ℝ) ^ ((1 : ℝ) / 3)) = ((1 : ℝ) / 3) * Real.log 64:= by
          --  rw [Real.log_rpow (by norm_num : (64 : ℝ) > 0)]
          linarith
        --  rw [h₇₃]
        have h₇₄ : Real.log 64 = Real.log (2 ^ 6):= by -- norm_num
          norm_num
        rw [h₇₄]
        have h₇₅ : Real.log (2 ^ 6) = 6 * Real.log 2:= by -- -- rw [Real.log_pow] <;> norm_num
          linarith
        rw [h₇₅]
        have h₇₆ : Real.log 4 = Real.log (2 ^ 2):= by -- norm_num
          norm_num
        rw [h₇₆]
        have h₇₇ : Real.log (2 ^ 2) = 2 * Real.log 2:= by -- -- rw [Real.log_pow] <;> norm_num
          linarith
        rw [h₇₇]
        ring_nf <;> norm_num <;> linarith [Real.log_pos (by norm_num : (1 : ℝ) < 2)]
        hole
      have h₇₈ : (64 : ℝ) ^ ((1 : ℝ) / 3) > 0:= by -- positivity
        norm_num
      have h₇₉ : (4 : ℝ) > 0:= by -- norm_num
        norm_num
      have h₈₀ : Real.log ((64 : ℝ) ^ ((1 : ℝ) / 3)) = Real.log 4:= by -- rw [h₇₂]
        linarith
      have h₈₁ : (64 : ℝ) ^ ((1 : ℝ) / 3) = 4:=
        by
        --  apply Real.log_injOn_pos (Set.mem_Ioi.mpr h₇₈) (Set.mem_Ioi.mpr h₇₉)
        linarith
        hole
      --  rw [h₈₁]
      linarith
    --  rw [h₇₁]
    linarith
  have h₈ : (16 * (a ^ 2) ^ ((1 : ℝ) / 3)) ^ ((1 : ℝ) / 3) = 4:=
    by
    --  rw [h₅]
    --  rw [h₆]
    rw [h₇] <;> simp_all [Real.rpow_def_of_pos, Real.log_mul, Real.log_rpow, Real.log_pow, mul_assoc] <;> ring_nf at * <;>
        norm_num at * <;>
      linarith
    hole
  --  rw [h₈] <;> simp_all [Real.rpow_def_of_pos, Real.log_mul, Real.log_rpow, Real.log_pow, mul_assoc] <;> ring_nf at * <;>
      norm_num at * <;>
    linarith
  hole