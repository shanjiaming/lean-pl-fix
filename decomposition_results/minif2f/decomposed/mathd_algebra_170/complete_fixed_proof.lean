theorem mathd_algebra_170 (S : Finset ℤ) (h₀ : ∀ n : ℤ, n ∈ S ↔ abs (n - 2) ≤ 5 + 6 / 10) : S.card = 11:=
  by
  have h₁ : S = Finset.Icc (-3) 7:= by
    --  apply Finset.ext
    --  intro n
    --  simp only [Finset.mem_Icc, h₀]
    --  constructor
    --  · intro h
      have h₂ : abs (n - 2) ≤ 5:= by
        --  --  norm_num at h ⊢ <;> (try omega) <;>
            (try {cases' le_or_lt 0 (n - 2) with h₃ h₃ <;> simp_all [abs_of_nonneg, abs_of_neg, le_of_lt] <;> omega
              }) <;>
          omega
        hole
      have h₃ : -3 ≤ n:= by
        have h₄ : abs (n - 2) ≤ 5 := h₂
        --  cases' le_or_lt 0 (n - 2) with h₅ h₅
        ·
          have h₆ : n - 2 ≤ 5:= by
            --  rw [abs_of_nonneg h₅] at h₄
            --  linarith
            hole
        --    omega
        ·
          have h₆ : -(n - 2) ≤ 5 := by sorry
        --    omega
        hole
      have h₄ : n ≤ 7:= by
        have h₅ : abs (n - 2) ≤ 5 := h₂
        --  cases' le_or_lt 0 (n - 2) with h₆ h₆
        ·
          have h₇ : n - 2 ≤ 5:= by
            --  rw [abs_of_nonneg h₆] at h₅
            --  linarith
            hole
        --    omega
        ·
          have h₇ : -(n - 2) ≤ 5 := by sorry
        --    omega
        hole
    --    exact ⟨h₃, h₄⟩
    --  · intro h
      have h₂ : -3 ≤ n := h.1
      have h₃ : n ≤ 7 := h.2
      have h₄ : abs (n - 2) ≤ 5 := by sorry
    --  --    norm_num at h₄ ⊢ <;> (try omega) <;>
          (try {cases' le_or_lt 0 (n - 2) with h₅ h₅ <;> simp_all [abs_of_nonneg, abs_of_neg, le_of_lt] <;> omega
            }) <;>
        omega
    hole
  have h₂ : S.card = 11:= by
    --  rw [h₁]
    --  rfl
    hole
  --  apply h₂
  linarith