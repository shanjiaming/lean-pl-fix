theorem amc12_2001_p21 (a b c d : ℕ) (h₀ : a * b * c * d = 8!) (h₁ : a * b + a + b = 524) (h₂ : b * c + b + c = 146)
  (h₃ : c * d + c + d = 104) : ↑a - ↑d = (10 : ℤ):=
  by
  have h_fact : 8! = 40320:= by -- norm_num [Nat.factorial] <;> rfl
    norm_num
  have h_ab : (a + 1) * (b + 1) = 525:= by
    have h₁' : a * b + a + b = 524 := h₁
    have h₁'' : (a + 1) * (b + 1) = 525:= by
      --  calc
      --    (a + 1) * (b + 1) = a * b + a + b + 1 := by ring
      --    _ = 524 + 1 := by rw [h₁']
      --    _ = 525 := by norm_num
      linarith
    --  exact h₁''
    linarith
  have h_a : a = 24:=
    by
    have h₄ : a + 1 ∣ 525:= by
      --  use b + 1
      --  linarith
      hole
    have h₅ :
      a + 1 = 1 ∨
        a + 1 = 3 ∨
          a + 1 = 5 ∨
            a + 1 = 7 ∨
              a + 1 = 15 ∨ a + 1 = 21 ∨ a + 1 = 25 ∨ a + 1 = 35 ∨ a + 1 = 75 ∨ a + 1 = 105 ∨ a + 1 = 175 ∨ a + 1 = 525 := by sorry
    --  rcases h₅ with (h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅)
    ·
      have h₆ : a = 0:= by -- omega
        linarith
      have h₇ : a * b + a + b = 524 := h₁
    --    rw [h₆] at h₇
    --  --    norm_num at h₇ <;> nlinarith
    ·
      have h₆ : a = 2 := by sorry
      have h₇ : a * b + a + b = 524 := h₁
    --    rw [h₆] at h₇
    --    norm_num at h₇
      have h₈ : b = 174:= by -- nlinarith
        linarith
      have h₉ : a * b * c * d = 8! := h₀
    --    rw [h₆, h₈] at h₉
    --  --  --    norm_num [h_fact, Nat.factorial] at h₉ <;> ring_nf at h₉ ⊢ <;> omega
    ·
      have h₆ : a = 4 := by sorry
      have h₇ : a * b + a + b = 524 := h₁
    --    rw [h₆] at h₇
    --    norm_num at h₇
      have h₈ : b = 104 := by sorry
      have h₉ : a * b * c * d = 8! := h₀
    --    rw [h₆, h₈] at h₉
    --  --  --    norm_num [h_fact, Nat.factorial] at h₉ <;> ring_nf at h₉ ⊢ <;> omega
    ·
      have h₆ : a = 6 := by sorry
      have h₇ : a * b + a + b = 524 := h₁
    --    rw [h₆] at h₇
    --    norm_num at h₇
      have h₈ : b = 74 := by sorry
      have h₉ : a * b * c * d = 8! := h₀
    --    rw [h₆, h₈] at h₉
    --  --  --    norm_num [h_fact, Nat.factorial] at h₉ <;> ring_nf at h₉ ⊢ <;> omega
    ·
      have h₆ : a = 14 := by sorry
      have h₇ : a * b + a + b = 524 := h₁
    --    rw [h₆] at h₇
    --    norm_num at h₇
      have h₈ : b = 34 := by sorry
      have h₉ : a * b * c * d = 8! := h₀
    --    rw [h₆, h₈] at h₉
    --  --  --    norm_num [h_fact, Nat.factorial] at h₉ <;> ring_nf at h₉ ⊢ <;> omega
    ·
      have h₆ : a = 20 := by sorry
      have h₇ : a * b + a + b = 524 := h₁
    --    rw [h₆] at h₇
    --    norm_num at h₇
      have h₈ : b = 24 := by sorry
      have h₉ : b * c + b + c = 146 := h₂
    --    rw [h₈] at h₉
    --  --    norm_num at h₉ <;> (try omega) <;>
        (try {
            have h₁₀ : c = 6 := by nlinarith
            rw [h₁₀] at h₃
            norm_num at h₃ <;> omega
          })
    ·
      have h₆ : a = 24 := by sorry
    --    exact h₆
    ·
      have h₆ : a = 34 := by sorry
      have h₇ : a * b + a + b = 524 := h₁
    --    rw [h₆] at h₇
    --    norm_num at h₇
      have h₈ : b = 14 := by sorry
      have h₉ : a * b * c * d = 8! := h₀
    --    rw [h₆, h₈] at h₉
    --  --  --    norm_num [h_fact, Nat.factorial] at h₉ <;> ring_nf at h₉ ⊢ <;> omega
    ·
      have h₆ : a = 74 := by sorry
      have h₇ : a * b + a + b = 524 := h₁
    --    rw [h₆] at h₇
    --    norm_num at h₇
      have h₈ : b = 6 := by sorry
      have h₉ : a * b * c * d = 8! := h₀
    --    rw [h₆, h₈] at h₉
    --  --  --    norm_num [h_fact, Nat.factorial] at h₉ <;> ring_nf at h₉ ⊢ <;> omega
    ·
      have h₆ : a = 104 := by sorry
      have h₇ : a * b + a + b = 524 := h₁
    --    rw [h₆] at h₇
    --    norm_num at h₇
      have h₈ : b = 4 := by sorry
      have h₉ : a * b * c * d = 8! := h₀
    --    rw [h₆, h₈] at h₉
    --  --  --    norm_num [h_fact, Nat.factorial] at h₉ <;> ring_nf at h₉ ⊢ <;> omega
    ·
      have h₆ : a = 174 := by sorry
      have h₇ : a * b + a + b = 524 := h₁
    --    rw [h₆] at h₇
    --    norm_num at h₇
      have h₈ : b = 2 := by sorry
      have h₉ : a * b * c * d = 8! := h₀
    --    rw [h₆, h₈] at h₉
    --  --  --    norm_num [h_fact, Nat.factorial] at h₉ <;> ring_nf at h₉ ⊢ <;> omega
    ·
      have h₆ : a = 524 := by sorry
      have h₇ : a * b + a + b = 524 := h₁
    --    rw [h₆] at h₇
    --    norm_num at h₇
      have h₈ : b = 0 := by sorry
      have h₉ : a * b * c * d = 8! := h₀
    --    rw [h₆, h₈] at h₉
    --    norm_num [h_fact, Nat.factorial] at h₉ <;> ring_nf at h₉ ⊢ <;> omega
    hole
  have h_b : b = 20:= by
    have h₄ : (a + 1) * (b + 1) = 525 := h_ab
    --  rw [h_a] at h₄
    --  --  norm_num at h₄ ⊢ <;> (try omega) <;> (try nlinarith) <;>
          (try {nlinarith
            }) <;>
        (try {ring_nf at h₁ h₂ h₃ ⊢ <;> nlinarith
          }) <;>
      (try {ring_nf at h₁ h₂ h₃ ⊢ <;> omega
        })
    hole
  have h_c : c = 6:= by
    have h₄ : b * c + b + c = 146 := h₂
    --  rw [h_b] at h₄
    --  ring_nf at h₄
    have h₅ : c ≤ 146:= by
      --  by_contra h
      have h₅₁ : c ≥ 147:= by -- omega
        linarith
      have h₅₂ : 20 * c + 20 + c ≥ 20 * 147 + 20 + 147:= by -- nlinarith
        linarith
      --  omega
      linarith
    --  --  interval_cases c <;> norm_num at h₄ ⊢ <;> (try omega)
    nlinarith
  have h_d : d = 14:= by
    have h₄ : c * d + c + d = 104 := h₃
    --  rw [h_c] at h₄
    --  ring_nf at h₄ ⊢
    --  omega
    nlinarith
  have h_final : ↑a - ↑d = (10 : ℤ):= by -- rw [h_a, h_d] <;> norm_num <;> ring_nf at * <;> norm_num at * <;> linarith
    omega
  --  exact h_final
  omega