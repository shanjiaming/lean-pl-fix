theorem mathd_numbertheory_100 (n : ℕ) (h₀ : 0 < n) (h₁ : Nat.gcd n 40 = 10) (h₂ : Nat.lcm n 40 = 280) : n = 70:=
  by
  have h₃ : n * 40 = 2800:=
    by
    have h₃₁ : Nat.gcd n 40 * Nat.lcm n 40 = n * 40:= by -- rw [Nat.gcd_mul_lcm]
      hole
    --  --  --  rw [h₁, h₂] at h₃₁ <;> norm_num at h₃₁ ⊢ <;> linarith
    nlinarith
  have h₄ : n = 70:= by
    have h₄₁ : n * 40 = 2800 := h₃
    have h₄₂ : n = 70:=
      by
      have h₄₃ : n ≤ 70:= by
        --  by_contra h
        have h₄₄ : n ≥ 71:= by -- omega
          linarith
        have h₄₅ : n * 40 ≥ 71 * 40:= by -- nlinarith
          linarith
        have h₄₆ : n * 40 > 2800:= by -- nlinarith
          linarith
        --  omega
        linarith
      have h₄₄ : n ≥ 70:= by
        --  by_contra h
        have h₄₅ : n ≤ 69:= by -- omega
          linarith
        have h₄₆ : n * 40 ≤ 69 * 40:= by -- nlinarith
          linarith
        have h₄₇ : n * 40 < 2800:= by -- nlinarith
          linarith
        --  omega
        linarith
      --  omega
      linarith
    --  exact h₄₂
    linarith
  --  rw [h₄] <;> norm_num <;> try linarith
  linarith