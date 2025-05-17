theorem h₄ (a b : ℂ) (h₀ : a ^ 3 - 8 = 0) (h₁ : b ^ 3 - 8 * b ^ 2 - 8 * b + 64 = 0) (h₂ : a.abs = 2) (h₃ : b = 8 ∨ b ^ 2 = 8) : (a - b).abs ≤ 2 * √21 :=
  by
  have h₅ : b = 8 ∨ b ^ 2 = 8 := h₃
  cases h₅ with
  | inl h₅ =>
    have h₅₁ : b = 8 := h₅
    have h₅₂ : Complex.abs (a - b) ≤ 2 * Real.sqrt 21 := by
      rw [h₅₁]
      have h₅₃ : Complex.abs a = 2 := h₂
      have h₅₄ : Complex.abs (a - 8) ≤ 2 * Real.sqrt 21 :=
        by
        have h₅₅ : a ^ 3 = 8 := by
          rw [sub_eq_zero] at h₀
          norm_num at h₀ ⊢ <;> linear_combination h₀
        have h₅₆ : a.re ^ 2 + a.im ^ 2 = 4 := by
          have h₅₆₁ : Complex.abs a = 2 := h₂
          have h₅₆₂ : Complex.abs a = Real.sqrt (a.re ^ 2 + a.im ^ 2) := by
            simp [Complex.abs, Complex.normSq, Real.sqrt_eq_iff_sq_eq, sq, add_nonneg, mul_self_nonneg] <;> ring_nf <;>
                  field_simp [Real.sqrt_eq_iff_sq_eq, sq, add_nonneg, mul_self_nonneg] <;>
                ring_nf <;>
              linarith
          rw [h₅₆₂] at h₅₆₁
          have h₅₆₃ : Real.sqrt (a.re ^ 2 + a.im ^ 2) = 2 := by linarith
          have h₅₆₄ : a.re ^ 2 + a.im ^ 2 = 4 :=
            by
            have h₅₆₅ : Real.sqrt (a.re ^ 2 + a.im ^ 2) = 2 := h₅₆₃
            have h₅₆₆ : a.re ^ 2 + a.im ^ 2 = 4 :=
              by
              have h₅₆₇ : Real.sqrt (a.re ^ 2 + a.im ^ 2) = 2 := h₅₆₅
              have h₅₆₈ : a.re ^ 2 + a.im ^ 2 ≥ 0 := by positivity
              have h₅₆₉ : Real.sqrt (a.re ^ 2 + a.im ^ 2) ^ 2 = a.re ^ 2 + a.im ^ 2 := by
                rw [Real.sq_sqrt] <;> positivity
              nlinarith
            exact h₅₆₆
          exact h₅₆₄
        have h₅₇ : a.re ≥ -1 := by
          by_contra h
          have h₅₇₁ : a.re < -1 := by linarith
          have h₅₇₂ : a.re ^ 2 > 1 := by nlinarith
          have h₅₇₃ : a.im ^ 2 ≤ 4 := by nlinarith
          have h₅₇₄ : a.re ^ 2 + a.im ^ 2 = 4 := h₅₆
          have h₅₇₅ : a.re ^ 3 - 3 * a.re * a.im ^ 2 = 8 :=
            by
            simp [Complex.ext_iff, pow_three, pow_two, Complex.ext_iff, pow_three, pow_two] at h₅₅
            norm_num at h₅₅ ⊢ <;> (try cases' h₅₅ with h₅₅_left h₅₅_right) <;> (try nlinarith) <;>
              (try ring_nf at * <;> nlinarith)
          nlinarith [sq_nonneg (a.re - 2), sq_nonneg (a.im), sq_nonneg (a.re + 1)]
        have h₅₈ : Complex.abs (a - 8) = Real.sqrt ((a.re - 8) ^ 2 + (a.im) ^ 2) := by
          simp [Complex.abs, Complex.normSq, Complex.ext_iff, Real.sqrt_eq_iff_sq_eq, sq, sub_nonneg, add_nonneg,
                    mul_self_nonneg, Real.sqrt_nonneg, Real.sq_sqrt, add_nonneg, mul_self_nonneg] <;>
                  ring_nf <;>
                field_simp [Real.sqrt_eq_iff_sq_eq, sq, sub_nonneg, add_nonneg, mul_self_nonneg, Real.sqrt_nonneg,
                  Real.sq_sqrt, add_nonneg, mul_self_nonneg] <;>
              ring_nf <;>
            nlinarith
        rw [h₅₈]
        have h₅₉ : Real.sqrt ((a.re - 8) ^ 2 + (a.im) ^ 2) ≤ 2 * Real.sqrt 21 :=
          by
          have h₅₉₁ : (a.re - 8) ^ 2 + (a.im) ^ 2 ≤ 84 := by
            nlinarith [sq_nonneg (a.re + 1), sq_nonneg (a.im), sq_nonneg (a.re - 2), sq_nonneg (a.im - 2 * Real.sqrt 3),
              sq_nonneg (a.im + 2 * Real.sqrt 3), Real.sqrt_nonneg 3, Real.sq_sqrt (show 0 ≤ 3 by norm_num)]
          have h₅₉₂ : Real.sqrt ((a.re - 8) ^ 2 + (a.im) ^ 2) ≤ Real.sqrt 84 :=
            by
            apply Real.sqrt_le_sqrt
            nlinarith
          have h₅₉₃ : Real.sqrt 84 = 2 * Real.sqrt 21 :=
            by
            have h₅₉₄ : Real.sqrt 84 = Real.sqrt (4 * 21) := by norm_num
            rw [h₅₉₄]
            have h₅₉₅ : Real.sqrt (4 * 21) = 2 * Real.sqrt 21 :=
              by
              rw [Real.sqrt_eq_iff_sq_eq (by positivity) (by positivity)]
              nlinarith [Real.sqrt_nonneg 21, Real.sq_sqrt (show 0 ≤ 21 by norm_num)]
            rw [h₅₉₅]
          rw [h₅₉₃] at h₅₉₂
          linarith
        exact h₅₉
      have h₅₅ : Complex.abs (a - (8 : ℂ)) ≤ 2 * Real.sqrt 21 := h₅₄
      simpa [h₅₁] using h₅₅
    exact h₅₂
  | inr h₅ =>
    have h₅₁ : b ^ 2 = 8 := h₅
    have h₅₂ : Complex.abs (a - b) ≤ 2 * Real.sqrt 21 :=
      by
      have h₅₃ : Complex.abs b = 2 * Real.sqrt 2 :=
        by
        have h₅₄ : b ^ 2 = 8 := h₅₁
        have h₅₅ : Complex.abs (b ^ 2) = (8 : ℝ) := by rw [h₅₄] <;> simp [Complex.abs_of_nonneg] <;> norm_num
        have h₅₆ : Complex.abs (b ^ 2) = (Complex.abs b) ^ 2 := by simp [Complex.abs.map_pow]
        rw [h₅₆] at h₅₅
        have h₅₇ : (Complex.abs b : ℝ) ^ 2 = 8 := by norm_num at h₅₅ ⊢ <;> linarith
        have h₅₈ : Complex.abs b = 2 * Real.sqrt 2 :=
          by
          have h₅₈₁ : Complex.abs b ≥ 0 := Complex.abs.nonneg _
          have h₅₈₂ : (Complex.abs b : ℝ) ^ 2 = 8 := by exact_mod_cast h₅₇
          have h₅₈₃ : Complex.abs b = 2 * Real.sqrt 2 :=
            by
            have h₅₈₄ : Real.sqrt 2 ≥ 0 := Real.sqrt_nonneg _
            nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (show 0 ≤ 2 by norm_num)]
          exact h₅₈₃
        exact h₅₈
      have h₅₄ : Complex.abs (a - b) ≤ 2 + 2 * Real.sqrt 2 := by
        calc
          Complex.abs (a - b) ≤ Complex.abs a + Complex.abs b := by
            calc
              Complex.abs (a - b) = Complex.abs (a + (-b)) := by ring_nf
              _ ≤ Complex.abs a + Complex.abs (-b) := by apply Complex.abs.add_le
              _ = Complex.abs a + Complex.abs b := by simp [Complex.abs.map_neg]
          _ = 2 + Complex.abs b := by rw [h₂]
          _ = 2 + (2 * Real.sqrt 2) := by rw [h₅₃]
          _ = 2 + 2 * Real.sqrt 2 := by ring
      have h₅₅ : 2 + 2 * Real.sqrt 2 ≤ 2 * Real.sqrt 21 :=
        by
        have h₅₅₁ : 0 < Real.sqrt 21 := Real.sqrt_pos.mpr (by norm_num)
        have h₅₅₂ : 0 < Real.sqrt 2 := Real.sqrt_pos.mpr (by norm_num)
        have h₅₅₃ : 0 < Real.sqrt 2 * Real.sqrt 21 := by positivity
        nlinarith [Real.sq_sqrt (show 0 ≤ 2 by norm_num), Real.sq_sqrt (show 0 ≤ 21 by norm_num),
          sq_nonneg (Real.sqrt 2 - Real.sqrt 21)]
      calc
        Complex.abs (a - b) ≤ 2 + 2 * Real.sqrt 2 := h₅₄
        _ ≤ 2 * Real.sqrt 21 := by linarith
    exact h₅₂