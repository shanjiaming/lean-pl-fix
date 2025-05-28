theorem amc12a_2021_p8 (d : ℕ → ℕ) (h₀ : d 0 = 0) (h₁ : d 1 = 0) (h₂ : d 2 = 1)
  (h₃ : ∀ n ≥ 3, d n = d (n - 1) + d (n - 3)) : Even (d 2021) ∧ Odd (d 2022) ∧ Even (d 2023):=
  by
  have h₄ :
    ∀ n : ℕ,
      (n % 7 = 0 → d n % 2 = 0) ∧
        (n % 7 = 1 → d n % 2 = 0) ∧
          (n % 7 = 2 → d n % 2 = 1) ∧
            (n % 7 = 3 → d n % 2 = 1) ∧
              (n % 7 = 4 → d n % 2 = 1) ∧ (n % 7 = 5 → d n % 2 = 0) ∧ (n % 7 = 6 → d n % 2 = 1) := by sorry
  have h₅ : Even (d 2021):= by
    have h₅₁ := h₄ 2021
    have h₅₂ : 2021 % 7 = 5:= by -- norm_num
      norm_num
    have h₅₃ : d 2021 % 2 = 0:= by
      have h₅₄ := h₅₁.2.2.2.2.2.1
      have h₅₅ := h₅₄
      have h₅₆ := h₅₅ (by omega)
      --  omega
      linarith
    have h₅₄ : Even (d 2021):= by
      --  rw [even_iff_two_dvd]
      --  omega
      hole
    --  exact h₅₄
    simpa
  have h₆ : Odd (d 2022):= by
    have h₆₁ := h₄ 2022
    have h₆₂ : 2022 % 7 = 6:= by -- norm_num
      norm_num
    have h₆₃ : d 2022 % 2 = 1:= by
      have h₆₄ := h₆₁.2.2.2.2.2.2
      have h₆₅ := h₆₄
      have h₆₆ := h₆₅ (by omega)
      --  omega
      linarith
    have h₆₄ : Odd (d 2022):= by
      --  rw [Nat.odd_iff_not_even]
      rw [even_iff_two_dvd]
      omega
      hole
    --  exact h₆₄
    simpa
  have h₇ : Even (d 2023):= by
    have h₇₁ := h₄ 2023
    have h₇₂ : 2023 % 7 = 0:= by -- norm_num
      norm_num
    have h₇₃ : d 2023 % 2 = 0:= by
      have h₇₄ := h₇₁.1
      have h₇₅ := h₇₄
      have h₇₆ := h₇₅ (by omega)
      --  omega
      linarith
    have h₇₄ : Even (d 2023):= by
      --  rw [even_iff_two_dvd]
      --  omega
      hole
    --  exact h₇₄
    simpa
  --  exact ⟨h₅, h₆, h₇⟩
  norm_cast