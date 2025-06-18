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
macro "skip_hole" : term => `(sorry)

theorem numbertheory_2pownm1prime_nprime (n : ℕ) (h₀ : 0 < n) (h₁ : Nat.Prime (2 ^ n - 1)) : Nat.Prime n := by
  have h₂ : n ≥ 2 := by
    by_contra h
    
    have h₃ : n ≤ 1 := by hole_3
    have h₄ : n = 1 := by
      hole_4
    hole_2
  clear h₂
  have h₂ : n ≥ 2 := skip_hole
  
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
        clear h₅₅
        have h₅₅ : m ≠ 1 := skip_hole
        have h₅₆ : m ≠ n := by
          hole_9
        clear h₅₆
        have h₅₆ : m ≠ n := skip_hole
        hole_7
      clear h₅₃
      have h₅₃ : ∃ m, m ∣ n ∧ m ≠ 1 ∧ m ≠ n := skip_hole
      hole_6
        clear h₅
        have h₅ : ∃ m, m ∣ n ∧ m ≠ 1 ∧ m ≠ n := skip_hole
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
      clear h₉
      have h₉ : m ≥ 2 := skip_hole
    have h₁₀ : m < n := by
      by_contra h₁₀
      have h₁₀₁ : m ≥ n := by hole_15
      have h₁₀₂ : m ∣ n := h₆
      have h₁₀₃ : m ≤ n := Nat.le_of_dvd (by omega) h₁₀₂
      have h₁₀₄ : m = n := by
        hole_16
      hole_14
      clear h₁₀
      have h₁₀ : m < n := skip_hole
    have h₁₁ : 2 ^ m - 1 ∣ 2 ^ n - 1 := by
      have h₁₁₁ : m ∣ n := h₆
      obtain ⟨k, hk⟩ := h₁₁₁
      rw [hk]
      have h₁₁₂ : 2 ^ m - 1 ∣ 2 ^ (m * k) - 1 := by
        have h₁₁₃ : 2 ^ m - 1 ∣ 2 ^ (m * k) - 1 := by
          hole_19
        clear h₁₁₃
        have h₁₁₃ : 2 ^ m - 1 ∣ 2 ^ (m * k) - 1 := skip_hole
        hole_18
      clear h₁₁₂
      have h₁₁₂ : 2 ^ m - 1 ∣ 2 ^ (m * k) - 1 := skip_hole
      hole_17
        clear h₁₁
        have h₁₁ : 2 ^ m - 1 ∣ 2 ^ n - 1 := skip_hole
    have h₁₂ : 2 ^ m - 1 > 1 := by
      have h₁₂₁ : m ≥ 2 := h₉
      have h₁₂₂ : 2 ^ m - 1 > 1 := by
        have h₁₂₃ : 2 ^ m ≥ 2 ^ 2 := Nat.pow_le_pow_of_le_right (by decide) h₁₂₁
        have h₁₂₄ : 2 ^ m - 1 ≥ 2 ^ 2 - 1 := by
          hole_22
        clear h₁₂₄
        have h₁₂₄ : 2 ^ m - 1 ≥ 2 ^ 2 - 1 := skip_hole
        have h₁₂₅ : 2 ^ 2 - 1 = 3 := by hole_23
        have h₁₂₆ : 2 ^ m - 1 ≥ 3 := by
          hole_24
        clear h₁₂₆
        have h₁₂₆ : 2 ^ m - 1 ≥ 3 := skip_hole
        hole_21
      clear h₁₂₂
      have h₁₂₂ : 2 ^ m - 1 > 1 := skip_hole
      hole_20
        clear h₁₂
        have h₁₂ : 2 ^ m - 1 > 1 := skip_hole
    have h₁₃ : 2 ^ m - 1 < 2 ^ n - 1 := by
      have h₁₃₁ : m < n := h₁₀
      have h₁₃₂ : 2 ^ m < 2 ^ n := Nat.pow_lt_pow_of_lt_right (by decide) h₁₃₁
      have h₁₃₃ : 2 ^ m - 1 < 2 ^ n - 1 := by
        have h₁₃₄ : 2 ^ m ≥ 2 := by
          have h₁₃₅ : m ≥ 2 := h₉
          have h₁₃₆ : 2 ^ m ≥ 2 ^ 2 := Nat.pow_le_pow_of_le_right (by decide) h₁₃₅
          hole_27
        clear h₁₃₄
        have h₁₃₄ : 2 ^ m ≥ 2 := skip_hole
        have h₁₃₅ : 2 ^ n ≥ 2 ^ 2 := Nat.pow_le_pow_of_le_right (by decide) h₂
        have h₁₃₆ : 2 ^ m - 1 < 2 ^ n - 1 := by
          have h₁₃₇ : 2 ^ m < 2 ^ n := h₁₃₂
          have h₁₃₈ : 2 ^ m - 1 < 2 ^ n - 1 := by
            have h₁₃₉ : 2 ^ m ≥ 2 := by
              hole_30
            clear h₁₃₉
            have h₁₃₉ : 2 ^ m ≥ 2 := skip_hole
            have h₁₄₀ : 2 ^ n ≥ 2 := by
              have h₁₄₁ : n ≥ 2 := h₂
              have h₁₄₂ : 2 ^ n ≥ 2 ^ 2 := Nat.pow_le_pow_of_le_right (by decide) h₁₄₁
              hole_31
            clear h₁₄₀
            have h₁₄₀ : 2 ^ n ≥ 2 := skip_hole
            have h₁₄₃ : 2 ^ m - 1 < 2 ^ n - 1 := by
              have h₁₄₄ : 2 ^ m < 2 ^ n := h₁₃₂
              have h₁₄₅ : 2 ^ m - 1 < 2 ^ n - 1 := by
                hole_33
              clear h₁₄₅
              have h₁₄₅ : 2 ^ m - 1 < 2 ^ n - 1 := skip_hole
              hole_32
            clear h₁₄₃
            have h₁₄₃ : 2 ^ m - 1 < 2 ^ n - 1 := skip_hole
            hole_29
          clear h₁₃₈
          have h₁₃₈ : 2 ^ m - 1 < 2 ^ n - 1 := skip_hole
          hole_28
        clear h₁₃₆
        have h₁₃₆ : 2 ^ m - 1 < 2 ^ n - 1 := skip_hole
        hole_26
      clear h₁₃₃
      have h₁₃₃ : 2 ^ m - 1 < 2 ^ n - 1 := skip_hole
      hole_25
            clear h₁₃
            have h₁₃ : 2 ^ m - 1 < 2 ^ n - 1 := skip_hole
    have h₁₄ : 2 ^ m - 1 ≠ 1 := by
      hole_34
    clear h₁₄
    have h₁₄ : 2 ^ m - 1 ≠ 1 := skip_hole
    have h₁₅ : 2 ^ m - 1 ≠ 2 ^ n - 1 := by
      intro h₁₅
      have h₁₅₁ : 2 ^ m - 1 < 2 ^ n - 1 := h₁₃
      hole_35
      clear h₁₅
      have h₁₅ : 2 ^ m - 1 ≠ 2 ^ n - 1 := skip_hole
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
      clear h₂₄
      have h₂₄ : ¬Nat.Prime (2 ^ n - 1) := skip_hole
      hole_36
    clear h₁₆
    have h₁₆ : ¬Nat.Prime (2 ^ n - 1) := skip_hole
    hole_5
  clear h₃
  have h₃ : Nat.Prime n := skip_hole
  hole_1