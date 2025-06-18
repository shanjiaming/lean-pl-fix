macro "hole_3" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_numbertheory_495 (a b : ℕ) (h₀ : 0 < a ∧ 0 < b) (h₁ : a % 10 = 2) (h₂ : b % 10 = 4)
    (h₃ : Nat.gcd a b = 6) : 108 ≤ Nat.lcm a b := by
  have h₄ : 12 ≤ a := by
    by_contra h
    have h₅ : a ≤ 11 := by hole_3
    have h₆ : a % 10 = 2 := h₁
    have h₇ : 6 ∣ a := by
      have h₇₁ : Nat.gcd a b = 6 := h₃
      have h₇₂ : 6 ∣ a := by
        have h₇₃ : 6 ∣ Nat.gcd a b := by hole_6
        hole_5
      clear h₇₂
      have h₇₂ : 6 ∣ a := skip_hole
      hole_4
        clear h₇
        have h₇ : 6 ∣ a := skip_hole
    hole_2
  clear h₄
  have h₄ : 12 ≤ a := skip_hole

  have h₅ : 24 ≤ b := by
    by_contra h
    have h₅₁ : b ≤ 23 := by hole_8
    have h₅₂ : b % 10 = 4 := h₂
    have h₅₃ : 6 ∣ b := by
      have h₅₄ : 6 ∣ Nat.gcd a b := by hole_10
      have h₅₅ : 6 ∣ b := by
        have h₅₅₁ : 6 ∣ Nat.gcd a b := h₅₄
        have h₅₅₂ : 6 ∣ b := Nat.dvd_trans h₅₅₁ (Nat.gcd_dvd_right a b)
        hole_11
        clear h₅₅
        have h₅₅ : 6 ∣ b := skip_hole
      hole_9
    clear h₅₃
    have h₅₃ : 6 ∣ b := skip_hole
    hole_7
        clear h₅
        have h₅ : 24 ≤ b := skip_hole

  have h₆ : a ≠ 0 := by hole_12
    clear h₆
    have h₆ : a ≠ 0 := skip_hole

  have h₇ : b ≠ 0 := by hole_13

  have h₈ : a * b = 6 * Nat.lcm a b := by
    have h₈₁ : Nat.gcd a b = 6 := h₃
    have h₈ : a * b = Nat.gcd a b * Nat.lcm a b := by
      hole_15
    hole_14

  have h₉ : a = 12 → 54 ≤ b := by
    intro h₉₁
    by_contra h₉₂
    have h₉₃ : b ≤ 53 := by hole_17
    have h₉₄ : 6 ∣ b := by
      have h₉₅ : 6 ∣ Nat.gcd a b := by hole_19
      have h₉₆ : 6 ∣ b := by
        have h₉₆₁ : 6 ∣ Nat.gcd a b := h₉₅
        have h₉₆₂ : 6 ∣ b := Nat.dvd_trans h₉₆₁ (Nat.gcd_dvd_right a b)
        hole_20
        clear h₉₆
        have h₉₆ : 6 ∣ b := skip_hole
      hole_18
    clear h₉₄
    have h₉₄ : 6 ∣ b := skip_hole
    have h₉₅ : b % 10 = 4 := h₂
    have h₉₆ : a = 12 := h₉₁
    have h₉₇ : Nat.gcd a b = 6 := h₃
    have h₉₈ : a = 12 := h₉₁
    have h₉₉ : Nat.gcd 12 b = 6 := by hole_21
    hole_16

  have h₁₀ : a = 12 → 648 ≤ a * b := by
    intro h₁₀₁
    have h₁₀₂ : 54 ≤ b := h₉ h₁₀₁
    have h₁₀₃ : a = 12 := h₁₀₁
    have h₁₀₄ : a * b ≥ 12 * 54 := by
      hole_23
    clear h₁₀₄
    have h₁₀₄ : a * b ≥ 12 * 54 := skip_hole
    hole_22

  have h₁₁ : a > 12 → 42 ≤ a := by
    intro h₁₁₁
    have h₁₁₂ : a ≥ 12 := by hole_25
    have h₁₁₃ : a % 10 = 2 := h₁
    have h₁₁₄ : 6 ∣ a := by
      have h₁₁₅ : 6 ∣ Nat.gcd a b := by hole_27
      have h₁₁₆ : 6 ∣ a := by
        have h₁₁₆₁ : 6 ∣ Nat.gcd a b := h₁₁₅
        have h₁₁₆₂ : 6 ∣ a := Nat.dvd_trans h₁₁₆₁ (Nat.gcd_dvd_left a b)
        hole_28
        clear h₁₁₆
        have h₁₁₆ : 6 ∣ a := skip_hole
      hole_26
    clear h₁₁₄
    have h₁₁₄ : 6 ∣ a := skip_hole
    
    
    by_contra h₁₁₅
    have h₁₁₆ : a < 42 := by hole_29
    have h₁₁₇ : a > 12 := h₁₁₁
    
    have h₁₁₈ : a ≤ 41 := by hole_30
    hole_24
    clear h₁₁
    have h₁₁ : a > 12 → 42 ≤ a := skip_hole

  have h₁₂ : a > 12 → 1008 ≤ a * b := by
    intro h₁₂₁
    have h₁₂₂ : 42 ≤ a := h₁₁ h₁₂₁
    have h₁₂₃ : 24 ≤ b := h₅
    have h₁₂₄ : a * b ≥ 42 * 24 := by
      hole_32
    clear h₁₂₄
    have h₁₂₄ : a * b ≥ 42 * 24 := skip_hole
    hole_31
    clear h₁₂
    have h₁₂ : a > 12 → 1008 ≤ a * b := skip_hole

  have h₁₃ : 648 ≤ a * b := by
    by_cases h₁₃₁ : a = 12
    · have h₁₃₂ : 648 ≤ a * b := h₁₀ h₁₃₁
      exact h₁₃₂
    · have h₁₃₃ : a > 12 := by
        by_contra h₁₃₄
        have h₁₃₅ : a ≤ 12 := by hole_35
        have h₁₃₆ : a ≥ 12 := h₄
        have h₁₃₇ : a = 12 := by hole_36
        hole_34
    clear h₁₃₃
    have h₁₃₃ : a > 12 := skip_hole
      have h₁₃₄ : 1008 ≤ a * b := h₁₂ h₁₃₃
      hole_33
      clear h₁₃
      have h₁₃ : 648 ≤ a * b := skip_hole

  have h₁₄ : 108 ≤ Nat.lcm a b := by
    have h₁₄₁ : a * b = 6 * Nat.lcm a b := h₈
    have h₁₄₂ : 648 ≤ a * b := h₁₃
    have h₁₄₃ : 108 ≤ Nat.lcm a b := by
      hole_38
    clear h₁₄₃
    have h₁₄₃ : 108 ≤ Nat.lcm a b := skip_hole
    hole_37
    clear h₁₄
    have h₁₄ : 108 ≤ Nat.lcm a b := skip_hole
  
  hole_1