theorem mathd_algebra_320 (x : ℝ) (a b c : ℕ) (h₀ : 0 < a ∧ 0 < b ∧ 0 < c ∧ 0 ≤ x) (h₁ : 2 * x ^ 2 = 4 * x + 9)
  (h₂ : x = (a + Real.sqrt b) / c) (h₃ : c = 2) : a + b + c = 26:=
  by
  have h₄ : x = (a + Real.sqrt b) / 2:= by -- -- rw [h₂, h₃] <;> ring_nf <;> field_simp <;> ring_nf
    hole
  have h₅ : 2 * x ^ 2 = 4 * x + 9:= by -- exact h₁
    linarith
  have h₆ : (a : ℝ) > 0:= by
    have h₆₁ : 0 < a := h₀.1
    --  exact mod_cast h₆₁
    linarith
  have h₇ : (b : ℝ) > 0:= by
    have h₇₁ : 0 < b := h₀.2.1
    --  exact mod_cast h₇₁
    linarith
  have h₈ : (2 : ℝ) > 0:= by -- norm_num
    norm_num
  have h₉ : (a : ℝ) ^ 2 + (b : ℝ) + 2 * (a : ℝ) * Real.sqrt b = 4 * (a : ℝ) + 4 * Real.sqrt b + 18:=
    by
    have h₉₁ : x = (a + Real.sqrt b) / 2 := h₄
    have h₉₂ : 2 * x ^ 2 = 4 * x + 9 := h₅
    --  rw [h₉₁] at h₉₂
    --  ring_nf at h₉₂ ⊢
    --  nlinarith [Real.sqrt_nonneg b, Real.sq_sqrt (show 0 ≤ (b : ℝ) by linarith), mul_pos h₆ h₇, mul_pos (mul_pos h₆ h₈) h₇]
    hole
  have h₁₀ : (2 * (a : ℝ) - 4) ^ 2 * (b : ℝ) = (4 * (a : ℝ) + 18 - (a : ℝ) ^ 2 - (b : ℝ)) ^ 2:=
    by
    have h₁₀₁ : (2 * (a : ℝ) - 4) * Real.sqrt b = 4 * (a : ℝ) + 18 - (a : ℝ) ^ 2 - (b : ℝ):=
      by
      have h₁₀₂ : (a : ℝ) ^ 2 + (b : ℝ) + 2 * (a : ℝ) * Real.sqrt b = 4 * (a : ℝ) + 4 * Real.sqrt b + 18 := h₉
      have h₁₀₃ : 2 * (a : ℝ) * Real.sqrt b - 4 * Real.sqrt b = 4 * (a : ℝ) + 18 - (a : ℝ) ^ 2 - (b : ℝ):= by -- linarith
        linarith
      have h₁₀₄ : (2 * (a : ℝ) - 4) * Real.sqrt b = 4 * (a : ℝ) + 18 - (a : ℝ) ^ 2 - (b : ℝ):= by -- linarith
        linarith
      --  exact h₁₀₄
      linarith
    have h₁₀₅ : (2 * (a : ℝ) - 4) ^ 2 * (b : ℝ) = (4 * (a : ℝ) + 18 - (a : ℝ) ^ 2 - (b : ℝ)) ^ 2:=
      by
      have h₁₀₆ : (2 * (a : ℝ) - 4) ^ 2 * (b : ℝ) = ((2 * (a : ℝ) - 4) * Real.sqrt b) ^ 2:=
        by
        have h₁₀₇ : Real.sqrt b ≥ 0 := Real.sqrt_nonneg _
        have h₁₀₈ : (Real.sqrt b) ^ 2 = (b : ℝ):= by -- -- rw [Real.sq_sqrt] <;> positivity
          norm_num
        --  calc
        --    (2 * (a : ℝ) - 4) ^ 2 * (b : ℝ) = (2 * (a : ℝ) - 4) ^ 2 * ((Real.sqrt b) ^ 2) := by rw [h₁₀₈]
        --    _ = ((2 * (a : ℝ) - 4) * Real.sqrt b) ^ 2 := by ring
        --    _ = ((2 * (a : ℝ) - 4) * Real.sqrt b) ^ 2 := by ring
        nlinarith
      --  rw [h₁₀₆]
      rw [h₁₀₁] <;> ring_nf <;> nlinarith [Real.sqrt_nonneg b, Real.sq_sqrt (show 0 ≤ (b : ℝ) by linarith)]
      hole
    --  exact h₁₀₅
    hole
  have h₁₁ : a = 2:=
    by
    have h₁₁₁ : a = 2:= by
      by_contra h
      have h₁₂ : a ≠ 2 := h
      have h₁₃ : a ≥ 1:= by -- linarith [h₀.1]
        linarith
      have h₁₄ : a ≤ 7:= by
        --  by_contra h₁₅
        have h₁₅₁ : a ≥ 8:= by -- omega
          linarith
        have h₁₅₂ : (a : ℝ) ≥ 8:= by -- norm_cast
          linarith
        have h₁₅₃ : (2 * (a : ℝ) - 4) ^ 2 * (b : ℝ) = (4 * (a : ℝ) + 18 - (a : ℝ) ^ 2 - (b : ℝ)) ^ 2:= by -- exact h₁₀
          linarith
        have h₁₅₄ : (a : ℝ) ≥ 8:= by -- norm_cast <;> linarith
          linarith
        have h₁₅₅ : (b : ℝ) > 0 := h₇
        have h₁₅₆ : (b : ℝ) > 0 := h₇
        have h₁₅₇ : (a : ℕ) ≥ 8:= by -- norm_cast at h₁₅₁ ⊢ <;> linarith
          linarith
        have h₁₅₈ : (a : ℝ) ^ 2 ≥ 64:= by -- nlinarith
          nlinarith
        have h₁₅₉ : (4 * (a : ℝ) + 18 - (a : ℝ) ^ 2 - (b : ℝ)) ≤ 0:= by
          --  nlinarith [Real.sqrt_nonneg (b : ℝ), Real.sq_sqrt (show 0 ≤ (b : ℝ) by linarith)]
          hole
        have h₁₅₁₀ : (2 * (a : ℝ) - 4) ^ 2 * (b : ℝ) ≥ 0:= by -- positivity
          norm_num
        have h₁₅₁₁ : (4 * (a : ℝ) + 18 - (a : ℝ) ^ 2 - (b : ℝ)) ^ 2 ≥ 0:= by -- positivity
          norm_num
        have h₁₅₁₂ : (2 * (a : ℝ) - 4) ^ 2 * (b : ℝ) = (4 * (a : ℝ) + 18 - (a : ℝ) ^ 2 - (b : ℝ)) ^ 2:= by -- exact h₁₀
          linarith
        --  nlinarith [Real.sqrt_nonneg (b : ℝ), Real.sq_sqrt (show 0 ≤ (b : ℝ) by linarith)]
        hole
      interval_cases a <;> norm_num at h₁₀ ⊢ <;> (try norm_num at h₁₀ ⊢) <;>
          (try {
              have h₁₅₁₃ : (b : ℕ) > 0 := by linarith [h₀.2.1]
              have h₁₅₁₄ : (b : ℝ) > 0 := by exact_mod_cast h₀.2.1
              have h₁₅₁₅ : (b : ℕ) ≤ 100 := by
                by_contra h₁₅₁₆
                have h₁₅₁₇ : (b : ℕ) > 100 := by linarith
                have h₁₅₁₈ : (b : ℝ) > 100 := by exact_mod_cast h₁₅₁₇
                nlinarith [Real.sqrt_nonneg (b : ℝ), Real.sq_sqrt (show 0 ≤ (b : ℝ) by linarith)]
              interval_cases b <;> norm_num at h₁₀ ⊢ <;>
                    (try nlinarith [Real.sqrt_nonneg (b : ℝ), Real.sq_sqrt (show 0 ≤ (b : ℝ) by linarith)]) <;>
                  (try omega) <;>
                (try linarith)
            }) <;>
        (try omega)
      hole
    --  exact h₁₁₁
    linarith
  have h₁₂ : b = 22:= by
    have h₁₂₁ : a = 2 := h₁₁
    have h₁₂₂ : (a : ℝ) = 2:= by -- norm_cast
      linarith
    --  rw [h₁₂₂] at h₉ h₁₀
    norm_num at h₉ h₁₀
    have h₁₂₃ : (b : ℝ) = 22:= by -- nlinarith [Real.sqrt_nonneg (b : ℝ), Real.sq_sqrt (show 0 ≤ (b : ℝ) by -- linarith)]
      hole
    have h₁₂₄ : (b : ℕ) = 22:= by -- norm_cast at h₁₂₃ ⊢ <;> (try omega) <;> (try nlinarith)
      linarith
    exact h₁₂₄
    hole
  have h₁₃ : a + b + c = 26:= by
    have h₁₄ : a = 2 := h₁₁
    have h₁₅ : b = 22 := h₁₂
    have h₁₆ : c = 2 := h₃
    --  rw [h₁₄, h₁₅, h₁₆] <;> norm_num <;> (try omega) <;> (try nlinarith)
    linarith
  --  exact h₁₃
  linarith