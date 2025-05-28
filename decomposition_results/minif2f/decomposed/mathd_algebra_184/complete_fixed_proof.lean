theorem mathd_algebra_184 (a b : NNReal) (h₀ : 0 < a ∧ 0 < b) (h₁ : a ^ 2 = 6 * b) (h₂ : a ^ 2 = 54 / b) :
  a = 3 * NNReal.sqrt 2:=
  by
  have h₃ : (b : ℝ) = 3:=
    by
    have h₃₁ : (a : ℝ) ^ 2 = 6 * (b : ℝ):= by
      --  norm_cast at h₁ ⊢ <;> simp_all [pow_two, mul_assoc] <;> ring_nf at * <;> nlinarith
      simpa
    have h₃₂ : (a : ℝ) ^ 2 = 54 / (b : ℝ):= by
      --  norm_cast at h₂ ⊢ <;> simp_all [pow_two, mul_assoc] <;> field_simp [h₀.2.ne'] at * <;> ring_nf at * <;> nlinarith
      simpa
    have h₃₃ : (6 : ℝ) * (b : ℝ) = 54 / (b : ℝ):=
      by
      have h₄ : (a : ℝ) ^ 2 = 6 * (b : ℝ):= by -- simpa [h₃₁] using h₃₁
        simpa
      have h₅ : (a : ℝ) ^ 2 = 54 / (b : ℝ):= by -- simpa [h₃₂] using h₃₂
        simpa
      have h₆ : (6 : ℝ) * (b : ℝ) = 54 / (b : ℝ):= by -- linarith
        hole
      --  exact_mod_cast h₆
      hole
    have h₃₄ : (b : ℝ) > 0:= by -- exact_mod_cast h₀.2
      hole
    have h₃₅ : (b : ℝ) ^ 2 = 9:= by
      --  --  --  --  --  field_simp at h₃₃ <;> ring_nf at * <;> norm_num at * <;> (try norm_num) <;> (try ring_nf at *) <;>
      --      (try norm_cast at *) <;>
      --    (try nlinarith)
      hole
    have h₃₆ : (b : ℝ) = 3:=
      by
      have h₄ : (b : ℝ) = 3:= by
        have h₄₁ : (b : ℝ) ^ 2 = 9:= by -- exact_mod_cast h₃₅
          simpa
        have h₄₂ : (b : ℝ) > 0:= by -- exact_mod_cast h₃₄
          simpa
        --  nlinarith
        hole
      --  exact h₄
      hole
    --  exact_mod_cast h₃₆
    hole
  have h₄ : (a : ℝ) ^ 2 = 18:=
    by
    have h₄₁ : (a : ℝ) ^ 2 = 6 * (b : ℝ):= by
      --  norm_cast at h₁ ⊢ <;> simp_all [pow_two, mul_assoc] <;> ring_nf at * <;> nlinarith
      simpa
    --  rw [h₄₁]
    rw [h₃] <;> norm_num
    hole
  have h₅ : (a : ℝ) = 3 * Real.sqrt 2:=
    by
    have h₅₁ : 0 < (a : ℝ):= by -- exact_mod_cast h₀.1
      hole
    have h₅₂ : 0 < Real.sqrt 2:= by -- exact Real.sqrt_pos.mpr (by norm_num)
      norm_num
    have h₅₃ : 0 < 3 * Real.sqrt 2:= by -- positivity
      norm_num
    have h₅₄ : (a : ℝ) ^ 2 = 18 := h₄
    have h₅₅ : (a : ℝ) > 0:= by -- exact_mod_cast h₀.1
      simpa
    have h₅₆ : (a : ℝ) = 3 * Real.sqrt 2:= by
      have h₅₇ : (a : ℝ) ^ 2 = 18 := h₄
      have h₅₈ : 0 < Real.sqrt 2:= by -- positivity
        norm_num
      have h₅₉ : (a : ℝ) > 0:= by -- positivity
        simpa
      have h₅₁₀ : (a : ℝ) = 3 * Real.sqrt 2:= by
        --  nlinarith [Real.sq_sqrt (show 0 ≤ 2 by norm_num), mul_self_nonneg ((a : ℝ) - 3 * Real.sqrt 2)]
        hole
      --  exact h₅₁₀
      hole
    --  exact h₅₆
    hole
  have h₆ : a = 3 * NNReal.sqrt 2:= by
    --  apply Eq.symm
    --  apply Eq.symm
    --  rw [← NNReal.coe_inj] at *
    --  norm_num [NNReal.coe_mul, NNReal.coe_pow, Real.sqrt_eq_iff_sq_eq, mul_comm, mul_assoc, mul_left_comm] at * <;>
    --        ring_nf at * <;>
    --      simp_all [Real.sqrt_eq_iff_sq_eq, mul_comm, mul_assoc, mul_left_comm] <;>
      nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (show 0 ≤ 2 by norm_num)]
    hole
  --  rw [h₆] <;> simp_all <;> norm_num <;> linarith
  simpa