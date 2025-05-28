theorem mathd_numbertheory_541 (m n : ℕ) (h₀ : 1 < m) (h₁ : 1 < n) (h₂ : m * n = 2005) : m + n = 406:=
  by
  have h₃ : m ≤ 1002:= by
    have h₃₁ : m * n = 2005 := h₂
    have h₃₂ : n ≥ 2:= by -- linarith
      linarith
    have h₃₃ : m ≤ 1002:= by
      --  by_contra h
      have h₄ : m ≥ 1003:= by -- omega
        linarith
      have h₅ : m * n ≥ 1003 * n:= by -- nlinarith
        nlinarith
      have h₆ : 1003 * n > 2005:= by
        have h₇ : n ≥ 2:= by -- linarith
          linarith
        --  nlinarith
        linarith
      --  nlinarith
      linarith
    --  exact h₃₃
    linarith
  have h₄ : n ≤ 1002:= by
    have h₄₁ : m ≥ 2:= by -- linarith
      linarith
    have h₄₂ : m * n = 2005 := h₂
    have h₄₃ : n ≤ 1002:= by
      --  by_contra h₄₄
      have h₄₅ : n ≥ 1003:= by -- omega
        linarith
      have h₄₆ : m * n ≥ m * 1003:= by -- nlinarith
        nlinarith
      have h₄₇ : m * 1003 > 2005:= by
        have h₄₈ : m ≥ 2:= by -- linarith
          linarith
        --  nlinarith
        linarith
      --  nlinarith
      linarith
    --  exact h₄₃
    linarith
  have h₅ : m = 5 ∨ m = 401:= by
    have h₅₁ : m ∣ 2005:= by -- -- use n <;> linarith
      hole
    have h₅₂ : m = 1 ∨ m = 5 ∨ m = 401 ∨ m = 2005:=
      by
      have h₅₃ : m ∣ 2005 := h₅₁
      have h₅₄ : m = 1 ∨ m = 5 ∨ m = 401 ∨ m = 2005:=
        by
        have h₅₅ : m ∣ 2005 := h₅₃
        have h₅₆ : m ≤ 2005 := Nat.le_of_dvd (by norm_num) h₅₅
        --  --  interval_cases m <;> norm_num at h₅₅ ⊢ <;> (try omega) <;> (try norm_num) <;> (try omega) <;>
          (try
              {(try omega) <;>
                (try {
                    have h₅₇ : n ≤ 1002 := h₄
                    have h₅₈ : m ≤ 1002 := h₃
                    omega
                  })
            })
        hole
      --  exact h₅₄
      omega
    have h₅₇ : m = 5 ∨ m = 401:= by
      --  cases h₅₂ with
      --  | inl h₅₂ =>
      --    exfalso
      --    linarith
      --  | inr h₅₂ =>
      --    cases h₅₂ with
      --    | inl h₅₂ => exact Or.inl h₅₂
      --    | inr h₅₂ =>
      --      cases h₅₂ with
      --      | inl h₅₂ => exact Or.inr h₅₂
      --      | inr h₅₂ =>
      --        exfalso
      --        have h₅₈ : m = 2005 := h₅₂
      --        have h₅₉ : n = 1 := by nlinarith
      --        linarith
      omega
    --  exact h₅₇
    omega
  have h₆ : m + n = 406:= by
    have h₆₁ : m = 5 ∨ m = 401 := h₅
    --  cases h₆₁ with
    --  | inl h₆₁ =>
    --    have h₆₂ : m = 5 := h₆₁
    --    have h₆₃ : n = 401 := by
    --      have h₆₄ : m * n = 2005 := h₂
    --      rw [h₆₂] at h₆₄
    --      norm_num at h₆₄ ⊢ <;> nlinarith
    --    rw [h₆₂, h₆₃] <;> norm_num
    --  | inr h₆₁ =>
    --    have h₆₂ : m = 401 := h₆₁
    --    have h₆₃ : n = 5 := by
    --      have h₆₄ : m * n = 2005 := h₂
    --      rw [h₆₂] at h₆₄
    --      norm_num at h₆₄ ⊢ <;> nlinarith
    --    rw [h₆₂, h₆₃] <;> norm_num
    hole
  --  exact h₆
  linarith