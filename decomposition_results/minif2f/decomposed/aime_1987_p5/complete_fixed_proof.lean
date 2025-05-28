theorem aime_1987_p5 (x y : ℤ) (h₀ : y ^ 2 + 3 * (x ^ 2 * y ^ 2) = 30 * x ^ 2 + 517) : 3 * (x ^ 2 * y ^ 2) = 588:=
  by
  have h₁ : x ≠ 0:= by
    --  by_contra h
    have h₂ : x = 0:= by -- simpa using h
      linarith
    --  rw [h₂] at h₀
    have h₃ : y ^ 2 = 517:= by -- -- ring_nf at h₀ ⊢ <;> nlinarith
      linarith
    have h₄ : y ^ 2 = 517:= by -- simpa using h₃
      linarith
    have h₅ : y ≤ 23:= by -- nlinarith
      nlinarith
    have h₆ : y ≥ -23:= by -- nlinarith
      nlinarith
    have h₇ : y ≤ 23:= by -- simpa using h₅
      linarith
    have h₈ : y ≥ -23:= by -- simpa using h₆
      linarith
    --  --  interval_cases y <;> norm_num at h₄ ⊢ <;> omega
    hole
  have h₂ : (3 * x ^ 2 + 1 : ℤ) ∣ 507:=
    by
    have h₂₁ : (3 * x ^ 2 + 1 : ℤ) ∣ 30 * x ^ 2 + 517:= by
      --  use y ^ 2
      have h₂₁₁ : y ^ 2 + 3 * (x ^ 2 * y ^ 2) = 30 * x ^ 2 + 517 := h₀
      have h₂₁₂ : y ^ 2 * (3 * x ^ 2 + 1) = 30 * x ^ 2 + 517:= by -- -- ring_nf at h₂₁₁ ⊢ <;> linarith
        linarith
      --  linarith
      hole
    have h₂₂ : (3 * x ^ 2 + 1 : ℤ) ∣ 507:=
      by
      have h₂₂₁ : (3 * x ^ 2 + 1 : ℤ) ∣ 30 * x ^ 2 + 517 := h₂₁
      have h₂₂₂ : (3 * x ^ 2 + 1 : ℤ) ∣ 507:=
        by
        have h₂₂₃ : (30 * x ^ 2 + 517 : ℤ) = 10 * (3 * x ^ 2 + 1) + 507:= by -- ring
          linarith
        --  rw [h₂₂₃] at h₂₂₁
        --  simpa [dvd_add_right] using h₂₂₁
        hole
      --  exact h₂₂₂
      omega
    --  exact h₂₂
    omega
  have h₃ : x ^ 2 = 4:= by
    have h₃₁ : (3 * x ^ 2 + 1 : ℤ) ∣ 507 := h₂
    have h₃₂ : x ^ 2 ≥ 1:= by
      --  by_contra h₃₂
      have h₃₃ : x ^ 2 ≤ 0:= by -- linarith
        linarith
      have h₃₄ : x = 0:= by -- nlinarith
        nlinarith
      --  contradiction
      omega
    have h₃₅ : 3 * x ^ 2 + 1 = 13:=
      by
      have h₃₅₁ : 3 * x ^ 2 + 1 = 13:= by
        have h₃₅₂ : 3 * x ^ 2 + 1 ∣ 507 := h₃₁
        have h₃₅₃ :
          3 * x ^ 2 + 1 = 1 ∨
            3 * x ^ 2 + 1 = 3 ∨ 3 * x ^ 2 + 1 = 13 ∨ 3 * x ^ 2 + 1 = 39 ∨ 3 * x ^ 2 + 1 = 169 ∨ 3 * x ^ 2 + 1 = 507 := by sorry
        --  rcases h₃₅₃ with (h₃₅₃ | h₃₅₃ | h₃₅₃ | h₃₅₃ | h₃₅₃ | h₃₅₃)
        --  · exfalso
          have h₃₅₄ : x ^ 2 = 0:= by -- nlinarith
            linarith
          have h₃₅₅ : x = 0:= by -- nlinarith
            linarith
        --    contradiction
        --  · exfalso
          have h₃₅₄ : x ^ 2 = 2 / 3 := by sorry
          have h₃₅₅ : x ^ 2 ≥ 1 := by sorry
        --  --    norm_num at h₃₅₄ <;> omega
        --  · exact h₃₅₃
        --  · exfalso
          have h₃₅₄ : x ^ 2 = 38 / 3 := by sorry
          have h₃₅₅ : x ^ 2 ≥ 1 := by sorry
        --  --    norm_num at h₃₅₄ <;> omega
        --  · exfalso
          have h₃₅₄ : x ^ 2 = 56 := by sorry
          have h₃₅₅ : x ^ 2 ≥ 1 := by sorry
          have h₃₅₆ : x ≤ 7:= by -- nlinarith
            nlinarith
          have h₃₅₇ : x ≥ -7:= by -- nlinarith
            nlinarith
        --  --    interval_cases x <;> norm_num at h₃₅₄ ⊢ <;> omega
        --  · exfalso
          have h₃₅₄ : x ^ 2 = 506 / 3 := by sorry
          have h₃₅₅ : x ^ 2 ≥ 1 := by sorry
        --  --    norm_num at h₃₅₄ <;> omega
        hole
      --  exact h₃₅₁
      linarith
    have h₃₆ : x ^ 2 = 4:= by
      have h₃₆₁ : 3 * x ^ 2 + 1 = 13 := h₃₅
      have h₃₆₂ : x ^ 2 = 4:= by -- nlinarith
        linarith
      --  exact h₃₆₂
      linarith
    --  exact h₃₆
    linarith
  have h₄ : y ^ 2 = 49:= by
    have h₄₁ : y ^ 2 + 3 * (x ^ 2 * y ^ 2) = 30 * x ^ 2 + 517 := h₀
    have h₄₂ : x ^ 2 = 4 := h₃
    have h₄₃ : y ^ 2 + 3 * (4 * y ^ 2) = 30 * 4 + 517:=
      by
      --  rw [h₄₂] at h₄₁
      --  exact h₄₁
      nlinarith
    have h₄₄ : y ^ 2 + 3 * (4 * y ^ 2) = 30 * 4 + 517:= by -- exact h₄₃
      linarith
    have h₄₅ : y ^ 2 + 12 * y ^ 2 = 120 + 517:= by -- -- ring_nf at h₄₄ ⊢ <;> linarith
      linarith
    have h₄₆ : 13 * y ^ 2 = 637:= by -- -- ring_nf at h₄₅ ⊢ <;> linarith
      linarith
    have h₄₇ : y ^ 2 = 49:= by -- -- ring_nf at h₄₆ ⊢ <;> omega
      linarith
    --  exact h₄₇
    linarith
  have h₅ : 3 * (x ^ 2 * y ^ 2) = 588:= by
    have h₅₁ : x ^ 2 = 4 := h₃
    have h₅₂ : y ^ 2 = 49 := h₄
    have h₅₃ : (x ^ 2 : ℤ) = 4:= by -- exact_mod_cast h₅₁
      linarith
    have h₅₄ : (y ^ 2 : ℤ) = 49:= by -- exact_mod_cast h₅₂
      linarith
    --  calc
    --    3 * (x ^ 2 * y ^ 2) = 3 * (4 * 49 : ℤ) := by rw [h₅₃, h₅₄] <;> ring
    --    _ = 588 := by norm_num
    linarith
  --  exact h₅
  linarith