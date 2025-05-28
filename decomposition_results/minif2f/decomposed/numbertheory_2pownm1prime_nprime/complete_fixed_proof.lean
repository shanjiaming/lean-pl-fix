theorem numbertheory_2pownm1prime_nprime (n : ℕ) (h₀ : 0 < n) (h₁ : Nat.Prime (2 ^ n - 1)) : Nat.Prime n:=
  by
  have h₂ : n ≥ 2:= by
    --  by_contra h
    have h₃ : n ≤ 1:= by -- linarith
      linarith
    have h₄ : n = 1:= by -- omega
      linarith
    --  rw [h₄] at h₁
    --  norm_num at h₁ <;> contradiction
    hole
  have h₃ : Nat.Prime n:= by
    --  by_contra h
    have h₄ : ¬Nat.Prime n := h
    have h₅ : ∃ m, m ∣ n ∧ m ≠ 1 ∧ m ≠ n:= by
      have h₅₁ : ¬Nat.Prime n := h₄
      have h₅₂ : n ≥ 2 := h₂
      have h₅₃ : ∃ m, m ∣ n ∧ m ≠ 1 ∧ m ≠ n:=
        by
        have h₅₄ := Nat.exists_dvd_of_not_prime2 (by omega : n ≥ 2) h₅₁
        --  obtain ⟨m, hm₁, hm₂⟩ := h₅₄
        --  refine' ⟨m, hm₁, _⟩
        have h₅₅ : m ≠ 1:= by
          --  by_contra h₅₅
          --  rw [h₅₅] at hm₂
          --  omega
          linarith
        have h₅₆ : m ≠ n:= by
          --  by_contra h₅₆
          --  rw [h₅₆] at hm₂
          --  omega
          linarith
        --  exact ⟨h₅₅, h₅₆⟩
        hole
      --  exact h₅₃
      simpa
    --  obtain ⟨m, hm₁, hm₂, hm₃⟩ := h₅
    have h₆ : m ∣ n := hm₁
    have h₇ : m ≠ 1 := hm₂
    have h₈ : m ≠ n := hm₃
    have h₉ : m ≥ 2:= by
      --  by_contra h₉
      have h₉₁ : m ≤ 1:= by -- omega
        linarith
      have h₉₂ : m = 0 ∨ m = 1:= by -- omega
        omega
      --  cases h₉₂ with
      --  | inl h₉₂ =>
      --    have h₉₃ : m = 0 := h₉₂
      --    rw [h₉₃] at h₆
      --    have h₉₄ : (0 : ℕ) ∣ n := h₆
      --    have h₉₅ : n = 0 := by simpa using h₉₄
      --    omega
      --  | inr h₉₂ =>
      --    have h₉₃ : m = 1 := h₉₂
      --    contradiction
      hole
    have h₁₀ : m < n:= by
      --  by_contra h₁₀
      have h₁₀₁ : m ≥ n:= by -- omega
        linarith
      have h₁₀₂ : m ∣ n := h₆
      have h₁₀₃ : m ≤ n := Nat.le_of_dvd (by omega) h₁₀₂
      have h₁₀₄ : m = n:= by -- linarith
        linarith
      --  contradiction
      omega
    have h₁₁ : 2 ^ m - 1 ∣ 2 ^ n - 1:= by
      have h₁₁₁ : m ∣ n := h₆
      --  obtain ⟨k, hk⟩ := h₁₁₁
      --  rw [hk]
      have h₁₁₂ : 2 ^ m - 1 ∣ 2 ^ (m * k) - 1:=
        by
        have h₁₁₃ : 2 ^ m - 1 ∣ 2 ^ (m * k) - 1:= by -- simpa [pow_mul] using nat_sub_dvd_pow_sub_pow _ 1 k
          hole
        --  exact h₁₁₃
        omega
      --  simpa [pow_mul, mul_comm] using h₁₁₂
      hole
    have h₁₂ : 2 ^ m - 1 > 1:= by
      have h₁₂₁ : m ≥ 2 := h₉
      have h₁₂₂ : 2 ^ m - 1 > 1:=
        by
        have h₁₂₃ : 2 ^ m ≥ 2 ^ 2 := Nat.pow_le_pow_of_le_right (by decide) h₁₂₁
        have h₁₂₄ : 2 ^ m - 1 ≥ 2 ^ 2 - 1:= by -- omega
          omega
        have h₁₂₅ : 2 ^ 2 - 1 = 3:= by -- norm_num
          norm_num
        have h₁₂₆ : 2 ^ m - 1 ≥ 3:= by -- omega
          linarith
        --  omega
        linarith
      --  exact h₁₂₂
      linarith
    have h₁₃ : 2 ^ m - 1 < 2 ^ n - 1:= by
      have h₁₃₁ : m < n := h₁₀
      have h₁₃₂ : 2 ^ m < 2 ^ n := Nat.pow_lt_pow_of_lt_right (by decide) h₁₃₁
      have h₁₃₃ : 2 ^ m - 1 < 2 ^ n - 1:=
        by
        have h₁₃₄ : 2 ^ m ≥ 2:= by
          have h₁₃₅ : m ≥ 2 := h₉
          have h₁₃₆ : 2 ^ m ≥ 2 ^ 2 := Nat.pow_le_pow_of_le_right (by decide) h₁₃₅
          --  omega
          linarith
        have h₁₃₅ : 2 ^ n ≥ 2 ^ 2 := Nat.pow_le_pow_of_le_right (by decide) h₂
        have h₁₃₆ : 2 ^ m - 1 < 2 ^ n - 1:= by
          have h₁₃₇ : 2 ^ m < 2 ^ n := h₁₃₂
          have h₁₃₈ : 2 ^ m - 1 < 2 ^ n - 1:= by
            have h₁₃₉ : 2 ^ m ≥ 2:= by -- omega
              linarith
            have h₁₄₀ : 2 ^ n ≥ 2:= by
              have h₁₄₁ : n ≥ 2 := h₂
              have h₁₄₂ : 2 ^ n ≥ 2 ^ 2 := Nat.pow_le_pow_of_le_right (by decide) h₁₄₁
              --  omega
              linarith
            have h₁₄₃ : 2 ^ m - 1 < 2 ^ n - 1:= by
              have h₁₄₄ : 2 ^ m < 2 ^ n := h₁₃₂
              have h₁₄₅ : 2 ^ m - 1 < 2 ^ n - 1:= by -- omega
                omega
              --  exact h₁₄₅
              linarith
            --  exact h₁₄₃
            linarith
          --  exact h₁₃₈
          linarith
        --  exact h₁₃₆
        linarith
      --  exact h₁₃₃
      hole
    have h₁₄ : 2 ^ m - 1 ≠ 1:= by -- omega
      linarith
    have h₁₅ : 2 ^ m - 1 ≠ 2 ^ n - 1:= by
      --  intro h₁₅
      have h₁₅₁ : 2 ^ m - 1 < 2 ^ n - 1 := h₁₃
      --  linarith
      linarith
    have h₁₆ : ¬Nat.Prime (2 ^ n - 1):= by
      --  intro h₁₆
      have h₁₇ := Nat.Prime.ne_one h₁₆
      have h₁₈ := Nat.Prime.ne_zero h₁₆
      have h₁₉ : 2 ^ m - 1 ∣ 2 ^ n - 1 := h₁₁
      have h₂₀ : 2 ^ m - 1 ≠ 1 := h₁₄
      have h₂₁ : 2 ^ m - 1 ≠ 2 ^ n - 1 := h₁₅
      have h₂₂ : 2 ^ m - 1 < 2 ^ n - 1 := h₁₃
      have h₂₃ : 2 ^ m - 1 > 1 := h₁₂
      have h₂₄ : ¬Nat.Prime (2 ^ n - 1):= by
        --  intro h₂₄
        have h₂₅ := Nat.Prime.eq_one_or_self_of_dvd h₂₄ (2 ^ m - 1) h₁₁
        --  omega
        hole
      --  exact h₂₄ h₁₆
      hole
    --  exact h₁₆ h₁
    hole
  --  exact h₃
  simpa