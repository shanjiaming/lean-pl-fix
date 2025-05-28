theorem mathd_numbertheory_222 (b : ℕ) (h₀ : Nat.lcm 120 b = 3720) (h₁ : Nat.gcd 120 b = 8) : b = 248:=
  by
  have h₂ : 120 * b = 29760:=
    by
    have h₂₁ : Nat.gcd 120 b * Nat.lcm 120 b = 120 * b:= by -- rw [Nat.gcd_mul_lcm]
      hole
    --  --  --  rw [h₁, h₀] at h₂₁ <;> norm_num at h₂₁ ⊢ <;> linarith
    nlinarith
  have h₃ : b = 248:=
    by
    have h₄ : b = 248:= by
      have h₅ : 120 * b = 29760 := h₂
      have h₆ : b = 248:=
        by
        have h₇ : b ≤ 248:= by
          --  by_contra h
          have h₈ : b ≥ 249:= by -- omega
            linarith
          have h₉ : 120 * b ≥ 120 * 249:= by -- exact Nat.mul_le_mul_left 120 h₈
            linarith
          have h₁₀ : 120 * 249 = 29880:= by -- norm_num
            norm_num
          have h₁₁ : 120 * b ≥ 29880:= by -- linarith
            linarith
          have h₁₂ : 120 * b > 29760:= by -- omega
            linarith
          --  omega
          linarith
        --  --  interval_cases b <;> norm_num at h₅ ⊢ <;> try omega
        linarith
      --  exact h₆
      linarith
    --  exact h₄
    linarith
  --  exact h₃
  linarith