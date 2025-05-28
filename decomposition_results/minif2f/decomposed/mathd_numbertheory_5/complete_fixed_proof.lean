theorem mathd_numbertheory_5 (n : ℕ) (h₀ : 10 ≤ n) (h₁ : ∃ x, x ^ 2 = n) (h₂ : ∃ t, t ^ 3 = n) : 64 ≤ n:=
  by
  have h₃ : ∀ (t : ℕ), t ^ 3 = n → 64 ≤ n:= by
    --  intro t ht
    have h₄ : t ≥ 3:= by
      --  by_contra h
      have h₅ : t ≤ 2:= by -- linarith
        linarith
      have h₆ : t ^ 3 ≤ 8:= by
        have h₇ : t ≤ 2 := h₅
        have h₈ : t ^ 3 ≤ 2 ^ 3:= by -- exact Nat.pow_le_pow_of_le_left h₇ 3
          hole
        --  linarith
        linarith
      have h₉ : n ≤ 8:= by -- linarith
        linarith
      --  linarith
      linarith
    --  by_cases h₅ : t ≥ 4
    ·
      have h₆ : t ^ 3 ≥ 4 ^ 3:= by -- exact Nat.pow_le_pow_of_le_left h₅ 3
        hole
      have h₇ : n ≥ 64:= by -- linarith
        linarith
    --    linarith
    ·
      have h₆ : t = 3 := by sorry
    --    rw [h₆] at ht
      have h₇ : n = 27 := by sorry
    --    rcases h₁ with ⟨x, hx⟩
      have h₈ : x ^ 2 = 27:= by -- -- norm_num [h₇] at hx ⊢ <;> linarith
        linarith
      have h₉ : x ≤ 5:= by -- nlinarith
        nlinarith
      have h₁₀ : x ≥ 6:= by
        --  by_contra h
        have h₁₁ : x ≤ 5:= by -- linarith
          linarith
        --  --  interval_cases x <;> norm_num at h₈ ⊢ <;> try omega
        nlinarith
    --    linarith
    hole
  have h₄ : 64 ≤ n:= by
    --  rcases h₂ with ⟨t, ht⟩
    have h₅ : 64 ≤ n := h₃ t ht
    --  exact h₅
    hole
  --  exact h₄
  linarith