theorem mathd_numbertheory_296 (n : ℕ) (h₀ : 2 ≤ n) (h₁ : ∃ x, x ^ 3 = n) (h₂ : ∃ t, t ^ 4 = n) : 4096 ≤ n:=
  by
  have h_main : n ≥ 4096:= by
    --  obtain ⟨t, ht⟩ := h₂
    have h₃ : t ≥ 2:= by
      --  by_contra h
      have h₄ : t ≤ 1:= by -- linarith
        linarith
      have h₅ : t = 0 ∨ t = 1:= by
        have h₅₁ : t ≤ 1 := h₄
        have h₅₂ : t ≥ 0:= by -- positivity
          norm_num
        --  --  interval_cases t <;> simp_all (config := { decide := true })
        omega
      --  cases h₅ with
      --  | inl h₅ =>
      --    have h₆ : t = 0 := h₅
      --    rw [h₆] at ht
      --    norm_num at ht <;> linarith
      --  | inr h₅ =>
      --    have h₆ : t = 1 := h₅
      --    rw [h₆] at ht
      --    norm_num at ht <;> linarith
      hole
    have h₄ : t ≥ 8:= by
      --  by_contra h
      have h₅ : t ≤ 7:= by -- linarith
        linarith
      have h₆ : t = 2 ∨ t = 3 ∨ t = 4 ∨ t = 5 ∨ t = 6 ∨ t = 7:= by -- omega
        omega
      --  rcases h₆ with (rfl | rfl | rfl | rfl | rfl | rfl)
      ·
        have h₇ : n = 16:= by -- -- norm_num at ht ⊢ <;> linarith
          linarith
      --    obtain ⟨x, hx⟩ := h₁
        have h₈ : x ^ 3 = 16:= by -- linarith
          linarith
        have h₉ : x ≤ 2:= by
          --  by_contra h₉
          have h₁₀ : x ≥ 3:= by -- omega
            linarith
          have h₁₁ : x ^ 3 ≥ 3 ^ 3:= by -- exact Nat.pow_le_pow_of_le_left (by omega) 3
            hole
          --  linarith
          linarith
      --  --    interval_cases x <;> norm_num at h₈ ⊢ <;> omega
      ·
        have h₇ : n = 81 := by sorry
      --    obtain ⟨x, hx⟩ := h₁
        have h₈ : x ^ 3 = 81 := by sorry
        have h₉ : x ≤ 4 := by sorry
      --  --    interval_cases x <;> norm_num at h₈ ⊢ <;> omega
      ·
        have h₇ : n = 256 := by sorry
      --    obtain ⟨x, hx⟩ := h₁
        have h₈ : x ^ 3 = 256 := by sorry
        have h₉ : x ≤ 6 := by sorry
      --  --    interval_cases x <;> norm_num at h₈ ⊢ <;> omega
      ·
        have h₇ : n = 625 := by sorry
      --    obtain ⟨x, hx⟩ := h₁
        have h₈ : x ^ 3 = 625 := by sorry
        have h₉ : x ≤ 8 := by sorry
      --  --    interval_cases x <;> norm_num at h₈ ⊢ <;> omega
      ·
        have h₇ : n = 1296 := by sorry
      --    obtain ⟨x, hx⟩ := h₁
        have h₈ : x ^ 3 = 1296 := by sorry
        have h₉ : x ≤ 10 := by sorry
      --  --    interval_cases x <;> norm_num at h₈ ⊢ <;> omega
      ·
        have h₇ : n = 2401 := by sorry
      --    obtain ⟨x, hx⟩ := h₁
        have h₈ : x ^ 3 = 2401 := by sorry
        have h₉ : x ≤ 13 := by sorry
      --  --    interval_cases x <;> norm_num at h₈ ⊢ <;> omega
      hole
    have h₅ : t ^ 4 ≥ 8 ^ 4:= by -- exact Nat.pow_le_pow_of_le_left h₄ 4
      hole
    have h₆ : n = t ^ 4:= by -- linarith
      linarith
    have h₇ : n ≥ 4096:= by -- -- -- rw [h₆] <;> norm_num at h₅ ⊢ <;> linarith
      linarith
    --  exact h₇
    hole
  --  linarith
  linarith