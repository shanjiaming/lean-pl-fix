theorem aime_2025i_p1 (S : Finset ℕ) (h₀ : ∀ (b : ℕ), b ∈ S ↔ b > 9 ∧ b + 7 ∣ 9 * b + 7) : (∑ b in S, b) = 70:=
  by
  have h₁ : S = { 21, 49 }:= by
    --  apply Finset.ext
    --  intro b
    --  simp only [Finset.mem_insert, Finset.mem_singleton, h₀]
    --  constructor
    --  · intro h
      have h₂ : b > 9 := h.1
      have h₃ : b + 7 ∣ 9 * b + 7 := h.2
      have h₄ : b + 7 ∣ 56:= by
        have h₄₁ : b + 7 ∣ 9 * b + 7 := h₃
        have h₄₂ : b + 7 ∣ 56:=
          by
          have h₄₃ : 9 * b + 7 = 9 * (b + 7) - 56:=
            by
            have h₄₄ : b + 7 > 0:= by -- linarith
              norm_num
            have h₄₅ : 9 * (b + 7) ≥ 9 * (b + 7):= by -- linarith
              norm_num
            --  omega
            omega
          --  rw [h₄₃] at h₄₁
          have h₄₆ : b + 7 ∣ 9 * (b + 7) - 56 := h₄₁
          have h₄₇ : b + 7 ∣ 9 * (b + 7):= by -- apply Nat.dvd_mul_right
            norm_num
          have h₄₈ : b + 7 ∣ 56:= by
            have h₄₉ : b + 7 ∣ 9 * (b + 7) - 56 := h₄₁
            have h₅₀ : b + 7 ∣ 9 * (b + 7):= by -- apply Nat.dvd_mul_right
              norm_num
            have h₅₁ : b + 7 ∣ 56:= by
              have h₅₂ : b + 7 ∣ 9 * (b + 7) - 56 := h₄₁
              have h₅₃ : b + 7 ∣ 9 * (b + 7):= by -- apply Nat.dvd_mul_right
                norm_num
              have h₅₄ : b + 7 ∣ 56:= by
                have h₅₅ : 9 * (b + 7) - 56 = 9 * (b + 7) - 56 := rfl
                have h₅₆ : b + 7 ∣ 9 * (b + 7) - 56 := h₄₁
                have h₅₇ : b + 7 ∣ 56:= by
                  have h₅₈ : b + 7 ≤ 9 * (b + 7):= by -- nlinarith
                    norm_num
                  have h₅₉ : 9 * (b + 7) - 56 ≤ 9 * (b + 7):= by -- omega
                    norm_num
                  have h₆₀ : b + 7 ∣ 9 * (b + 7) - 56 := h₄₁
                  have h₆₁ : b + 7 ∣ 56:= by
                    have h₆₂ : b + 7 ∣ 9 * (b + 7) - 56 := h₄₁
                    have h₆₃ : b + 7 ∣ 9 * (b + 7):= by -- apply Nat.dvd_mul_right
                      norm_num
                    have h₆₄ : b + 7 ∣ 56:= by
                      have h₆₅ : 9 * (b + 7) - 56 = 9 * (b + 7) - 56 := rfl
                      have h₆₆ : b + 7 ∣ 9 * (b + 7) - 56 := h₄₁
                      have h₆₇ : b + 7 ∣ 56:= by -- simpa [Nat.dvd_iff_mod_eq_zero, Nat.add_mod, Nat.mul_mod, Nat.mod_mod] using h₆₆
                        hole
                      --  exact h₆₇
                      omega
                    --  exact h₆₄
                    omega
                  --  exact h₆₁
                  omega
                --  exact h₅₇
                omega
              --  exact h₅₄
              omega
            --  exact h₅₁
            omega
          --  exact h₄₈
          omega
        --  exact h₄₂
        omega
      have h₅ : b + 7 ∣ 56 := h₄
      have h₆ : b + 7 ≤ 56 := Nat.le_of_dvd (by norm_num) h₅
      have h₇ : b ≤ 49:= by -- omega
        linarith
    --  --    interval_cases b <;> norm_num at h₅ h₂ ⊢ <;> omega
    --  · intro h
      have h₂ : b = 21 ∨ b = 49:= by -- simpa using h
        omega
    --    cases h₂ with
    --    | inl h₂ =>
    --      rw [h₂]
    --      norm_num <;> (try decide) <;>
    --        (try {norm_num <;> (try decide)
    --          })
    --    | inr h₂ =>
    --      rw [h₂]
    --      norm_num <;> (try decide) <;>
    --        (try {norm_num <;> (try decide)
    --          })
    hole
  have h₂ : (∑ b in S, b) = 70:= by
    --  rw [h₁]
    --  norm_num <;> (try decide) <;>
      (try {norm_num <;> (try decide)
        })
    hole
  --  exact h₂
  linarith