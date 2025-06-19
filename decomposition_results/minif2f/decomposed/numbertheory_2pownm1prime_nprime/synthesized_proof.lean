macro "hole_10" : tactic => `(tactic| admit)

theorem numbertheory_2pownm1prime_nprime (n : ℕ) (h₀ : 0 < n) (h₁ : Nat.Prime (2 ^ n - 1)) : Nat.Prime n := by
  have h₂ : n ≥ 2 := by
    by_contra h
    
    have h₃ : n ≤ 1 := by linarith
    have h₄ : n = 1 := by
      linarith
    admit
  
  have h₃ : Nat.Prime n := by
    by_contra h
    
    have h₄ : ¬Nat.Prime n := h
    have h₅ : ∃ m, m ∣ n ∧ m ≠ 1 ∧ m ≠ n := by
      
      have h₅₁ : ¬Nat.Prime n := h₄
      have h₅₂ : n ≥ 2 := h₂
      have h₅₃ : ∃ m, m ∣ n ∧ m ≠ 1 ∧ m ≠ n := by
        
        have h₅₄ := Nat.exists_dvd_of_not_prime2 (by omega : n ≥ 2) h₅₁
        obtain ⟨m, hm₁, hm₂⟩ := h₅₄
        refine' ⟨m, hm₁, _⟩
        
        have h₅₅ : m ≠ 1 := by
          linarith
        have h₅₆ : m ≠ n := by
          linarith
        omega
      simpa
    obtain ⟨m, hm₁, hm₂, hm₃⟩ := h₅
    have h₆ : m ∣ n := hm₁
    have h₇ : m ≠ 1 := hm₂
    have h₈ : m ≠ n := hm₃
    have h₉ : m ≥ 2 := by
      by_contra h₉
      have h₉₁ : m ≤ 1 := by linarith
      have h₉₂ : m = 0 ∨ m = 1 := by
        omega
      admit
    have h₁₀ : m < n := by
      by_contra h₁₀
      have h₁₀₁ : m ≥ n := by linarith
      have h₁₀₂ : m ∣ n := h₆
      have h₁₀₃ : m ≤ n := Nat.le_of_dvd (by omega) h₁₀₂
      have h₁₀₄ : m = n := by
        linarith
      omega
    have h₁₁ : 2 ^ m - 1 ∣ 2 ^ n - 1 := by
      have h₁₁₁ : m ∣ n := h₆
      obtain ⟨k, hk⟩ := h₁₁₁
      rw [hk]
      have h₁₁₂ : 2 ^ m - 1 ∣ 2 ^ (m * k) - 1 := by
        have h₁₁₃ : 2 ^ m - 1 ∣ 2 ^ (m * k) - 1 := by
          admit
        omega
      omega
    have h₁₂ : 2 ^ m - 1 > 1 := by
      have h₁₂₁ : m ≥ 2 := h₉
      have h₁₂₂ : 2 ^ m - 1 > 1 := by
        have h₁₂₃ : 2 ^ m ≥ 2 ^ 2 := Nat.pow_le_pow_of_le_right (by decide) h₁₂₁
        have h₁₂₄ : 2 ^ m - 1 ≥ 2 ^ 2 - 1 := by
          omega
        have h₁₂₅ : 2 ^ 2 - 1 = 3 := by norm_num
        have h₁₂₆ : 2 ^ m - 1 ≥ 3 := by
          linarith
        linarith
      linarith
    have h₁₃ : 2 ^ m - 1 < 2 ^ n - 1 := by
      have h₁₃₁ : m < n := h₁₀
      have h₁₃₂ : 2 ^ m < 2 ^ n := Nat.pow_lt_pow_of_lt_right (by decide) h₁₃₁
      have h₁₃₃ : 2 ^ m - 1 < 2 ^ n - 1 := by
        have h₁₃₄ : 2 ^ m ≥ 2 := by
          have h₁₃₅ : m ≥ 2 := h₉
          have h₁₃₆ : 2 ^ m ≥ 2 ^ 2 := Nat.pow_le_pow_of_le_right (by decide) h₁₃₅
          linarith
        have h₁₃₅ : 2 ^ n ≥ 2 ^ 2 := Nat.pow_le_pow_of_le_right (by decide) h₂
        have h₁₃₆ : 2 ^ m - 1 < 2 ^ n - 1 := by
          have h₁₃₇ : 2 ^ m < 2 ^ n := h₁₃₂
          have h₁₃₈ : 2 ^ m - 1 < 2 ^ n - 1 := by
            have h₁₃₉ : 2 ^ m ≥ 2 := by
              linarith
            have h₁₄₀ : 2 ^ n ≥ 2 := by
              have h₁₄₁ : n ≥ 2 := h₂
              have h₁₄₂ : 2 ^ n ≥ 2 ^ 2 := Nat.pow_le_pow_of_le_right (by decide) h₁₄₁
              linarith
            have h₁₄₃ : 2 ^ m - 1 < 2 ^ n - 1 := by
              have h₁₄₄ : 2 ^ m < 2 ^ n := h₁₃₂
              have h₁₄₅ : 2 ^ m - 1 < 2 ^ n - 1 := by
                omega
              linarith
            linarith
          linarith
        linarith
      linarith
    have h₁₄ : 2 ^ m - 1 ≠ 1 := by
      linarith
    have h₁₅ : 2 ^ m - 1 ≠ 2 ^ n - 1 := by
      intro h₁₅
      have h₁₅₁ : 2 ^ m - 1 < 2 ^ n - 1 := h₁₃
      linarith
    have h₁₆ : ¬Nat.Prime (2 ^ n - 1) := by
      intro h₁₆
      have h₁₇ := Nat.Prime.ne_one h₁₆
      have h₁₈ := Nat.Prime.ne_zero h₁₆
      have h₁₉ : 2 ^ m - 1 ∣ 2 ^ n - 1 := h₁₁
      have h₂₀ : 2 ^ m - 1 ≠ 1 := h₁₄
      have h₂₁ : 2 ^ m - 1 ≠ 2 ^ n - 1 := h₁₅
      have h₂₂ : 2 ^ m - 1 < 2 ^ n - 1 := h₁₃
      have h₂₃ : 2 ^ m - 1 > 1 := h₁₂
      have h₂₄ : ¬Nat.Prime (2 ^ n - 1) := by
        intro h₂₄
        have h₂₅ := Nat.Prime.eq_one_or_self_of_dvd h₂₄ (2 ^ m - 1) h₁₁
        omega
      norm_cast
    norm_cast
  simpa
