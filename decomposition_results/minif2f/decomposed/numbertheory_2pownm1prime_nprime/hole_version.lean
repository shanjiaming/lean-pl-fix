macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem numbertheory_2pownm1prime_nprime (n : ℕ) (h₀ : 0 < n) (h₁ : Nat.Prime (2 ^ n - 1)) : Nat.Prime n := by
  have h₂ : n ≥ 2 := by
    by_contra h
    
    have h₃ : n ≤ 1 := by hole_3
    have h₄ : n = 1 := by
      hole_4
    hole_2
  
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
          hole_8
        have h₅₆ : m ≠ n := by
          hole_9
        hole_7
      hole_6
    obtain ⟨m, hm₁, hm₂, hm₃⟩ := h₅
    have h₆ : m ∣ n := hm₁
    have h₇ : m ≠ 1 := hm₂
    have h₈ : m ≠ n := hm₃
    have h₉ : m ≥ 2 := by
      by_contra h₉
      have h₉₁ : m ≤ 1 := by hole_11
      have h₉₂ : m = 0 ∨ m = 1 := by
        hole_12
      hole_10
    have h₁₀ : m < n := by
      by_contra h₁₀
      have h₁₀₁ : m ≥ n := by hole_15
      have h₁₀₂ : m ∣ n := h₆
      have h₁₀₃ : m ≤ n := Nat.le_of_dvd (by omega) h₁₀₂
      have h₁₀₄ : m = n := by
        hole_16
      hole_14
    have h₁₁ : 2 ^ m - 1 ∣ 2 ^ n - 1 := by
      have h₁₁₁ : m ∣ n := h₆
      obtain ⟨k, hk⟩ := h₁₁₁
      rw [hk]
      have h₁₁₂ : 2 ^ m - 1 ∣ 2 ^ (m * k) - 1 := by
        have h₁₁₃ : 2 ^ m - 1 ∣ 2 ^ (m * k) - 1 := by
          hole_19
        hole_18
      hole_17
    have h₁₂ : 2 ^ m - 1 > 1 := by
      have h₁₂₁ : m ≥ 2 := h₉
      have h₁₂₂ : 2 ^ m - 1 > 1 := by
        have h₁₂₃ : 2 ^ m ≥ 2 ^ 2 := Nat.pow_le_pow_of_le_right (by decide) h₁₂₁
        have h₁₂₄ : 2 ^ m - 1 ≥ 2 ^ 2 - 1 := by
          hole_22
        have h₁₂₅ : 2 ^ 2 - 1 = 3 := by hole_23
        have h₁₂₆ : 2 ^ m - 1 ≥ 3 := by
          hole_24
        hole_21
      hole_20
    have h₁₃ : 2 ^ m - 1 < 2 ^ n - 1 := by
      have h₁₃₁ : m < n := h₁₀
      have h₁₃₂ : 2 ^ m < 2 ^ n := Nat.pow_lt_pow_of_lt_right (by decide) h₁₃₁
      have h₁₃₃ : 2 ^ m - 1 < 2 ^ n - 1 := by
        have h₁₃₄ : 2 ^ m ≥ 2 := by
          have h₁₃₅ : m ≥ 2 := h₉
          have h₁₃₆ : 2 ^ m ≥ 2 ^ 2 := Nat.pow_le_pow_of_le_right (by decide) h₁₃₅
          hole_27
        have h₁₃₅ : 2 ^ n ≥ 2 ^ 2 := Nat.pow_le_pow_of_le_right (by decide) h₂
        have h₁₃₆ : 2 ^ m - 1 < 2 ^ n - 1 := by
          have h₁₃₇ : 2 ^ m < 2 ^ n := h₁₃₂
          have h₁₃₈ : 2 ^ m - 1 < 2 ^ n - 1 := by
            have h₁₃₉ : 2 ^ m ≥ 2 := by
              hole_30
            have h₁₄₀ : 2 ^ n ≥ 2 := by
              have h₁₄₁ : n ≥ 2 := h₂
              have h₁₄₂ : 2 ^ n ≥ 2 ^ 2 := Nat.pow_le_pow_of_le_right (by decide) h₁₄₁
              hole_31
            have h₁₄₃ : 2 ^ m - 1 < 2 ^ n - 1 := by
              have h₁₄₄ : 2 ^ m < 2 ^ n := h₁₃₂
              have h₁₄₅ : 2 ^ m - 1 < 2 ^ n - 1 := by
                hole_33
              hole_32
            hole_29
          hole_28
        hole_26
      hole_25
    have h₁₄ : 2 ^ m - 1 ≠ 1 := by
      hole_34
    have h₁₅ : 2 ^ m - 1 ≠ 2 ^ n - 1 := by
      intro h₁₅
      have h₁₅₁ : 2 ^ m - 1 < 2 ^ n - 1 := h₁₃
      hole_35
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
        hole_37
      hole_36
    hole_5
  hole_1