macro "hole_3" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_43" : tactic => `(tactic| admit)
macro "hole_44" : tactic => `(tactic| admit)
macro "hole_45" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_47" : tactic => `(tactic| admit)
macro "hole_48" : tactic => `(tactic| admit)
macro "hole_49" : tactic => `(tactic| admit)
macro "hole_50" : tactic => `(tactic| admit)
macro "hole_52" : tactic => `(tactic| admit)
macro "hole_51" : tactic => `(tactic| admit)
macro "hole_53" : tactic => `(tactic| admit)
macro "hole_46" : tactic => `(tactic| admit)
macro "hole_57" : tactic => `(tactic| admit)
macro "hole_56" : tactic => `(tactic| admit)
macro "hole_60" : tactic => `(tactic| admit)
macro "hole_59" : tactic => `(tactic| admit)
macro "hole_58" : tactic => `(tactic| admit)
macro "hole_55" : tactic => `(tactic| admit)
macro "hole_54" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_64" : tactic => `(tactic| admit)
macro "hole_66" : tactic => `(tactic| admit)
macro "hole_65" : tactic => `(tactic| admit)
macro "hole_63" : tactic => `(tactic| admit)
macro "hole_62" : tactic => `(tactic| admit)
macro "hole_61" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem prime_divisors_of_polynomial_congruence :
  ∀ (p : ℕ), p.Prime → p ∣ polynomial n → is24kPlus1 p := by
  intro p hp hdiv
  have h₁ : p ≠ 3 := by
    intro h
    have h₂ : p = 3 := h
    rw [h₂] at hdiv
    have h₃ : (3 : ℕ) ∣ polynomial n := hdiv
    have h₄ : (polynomial n) % 3 = 0 := by
      hole_3
    have h₅ : (polynomial n) % 3 = 1 := by
      have h₅₁ : (polynomial n) % 3 = 1 := by
        
        have h₅₂ : n % 3 = 0 ∨ n % 3 = 1 ∨ n % 3 = 2 := by hole_6
        hole_5
      hole_4
    hole_2
  
  have h₂ : ¬ (p ∣ n) := by
    intro h₂
    have h₃ : p ∣ n := h₂
    have h₄ : p ∣ polynomial n := hdiv
    have h₅ : p ∣ n ^ 8 - n ^ 4 + 1 := by
      hole_8
    have h₆ : p ∣ 1 := by
      have h₇ : p ∣ n ^ 8 := by
        hole_10
      have h₈ : p ∣ n ^ 4 := by
        hole_11
      have h₉ : p ∣ n ^ 8 - n ^ 4 + 1 := h₅
      have h₁₀ : p ∣ 1 := by
        have h₁₁ : p ∣ n ^ 8 - n ^ 4 + 1 := h₅
        have h₁₂ : p ∣ n ^ 8 := h₇
        have h₁₃ : p ∣ n ^ 4 := h₈
        have h₁₄ : p ∣ n ^ 8 - n ^ 4 := by
          hole_13
        have h₁₅ : p ∣ n ^ 8 - n ^ 4 + 1 := h₅
        have h₁₆ : p ∣ (n ^ 8 - n ^ 4 + 1) - (n ^ 8 - n ^ 4) := by
          hole_14
        hole_12
      hole_9
    have h₇ : p ∣ 1 := h₆
    have h₈ : p ≤ 1 := Nat.le_of_dvd (by norm_num) h₇
    have h₉ : p ≥ 2 := Nat.Prime.two_le hp
    hole_7
  
  have h₃ : ∃ (d : ℕ), 0 < d ∧ (n ^ d : ℤ) ≡ 1 [ZMOD p] := by
    haveI := Fact.mk hp
    have h₄ : (n : ZMod p) ≠ 0 := by
      intro h₄
      have h₅ : (p : ℕ) ∣ n := by
        hole_17
      hole_16
    have h₅ : (n : ZMod p) ^ (p - 1 : ℕ) = 1 := by
      hole_18
    have h₆ : (n : ℤ) ^ (p - 1 : ℕ) ≡ 1 [ZMOD p] := by
      hole_19
    refine' ⟨p - 1, _, _⟩
    · have h₇ : p ≥ 2 := Nat.Prime.two_le hp
      hole_15
  
  have h₄ : (n ^ 12 : ℤ) ≡ -1 [ZMOD p] := by
    have h₄₁ : (p : ℕ) ∣ n ^ 8 - n ^ 4 + 1 := by
      hole_21
    have h₄₂ : (n : ℤ) ^ 8 ≡ (n : ℤ) ^ 4 - 1 [ZMOD p] := by
      have h₄₃ : (p : ℤ) ∣ (n ^ 8 - n ^ 4 + 1 : ℤ) := by
        hole_23
      have h₄₄ : (n : ℤ) ^ 8 - (n : ℤ) ^ 4 + 1 ≡ 0 [ZMOD p] := by
        hole_24
      have h₄₅ : (n : ℤ) ^ 8 ≡ (n : ℤ) ^ 4 - 1 [ZMOD p] := by
        hole_25
      hole_22
    have h₄₆ : (n : ℤ) ^ 12 ≡ -1 [ZMOD p] := by
      hole_26
    hole_20
  
  have h₅ : (n ^ 24 : ℤ) ≡ 1 [ZMOD p] := by
    have h₅₁ : (n : ℤ) ^ 24 ≡ 1 [ZMOD p] := by
      hole_28
    hole_27
  
  have h₆ : p % 24 = 1 := by
    have h₆₁ := h₄
    have h₆₂ := h₅
    have h₆₃ : p ≠ 0 := by
      intro h₆₄
      have h₆₅ : p = 0 := h₆₄
      have h₆₆ : ¬Nat.Prime p := by
        hole_31
      hole_30
    have h₆₄ : (n : ℤ) ^ 12 ≡ -1 [ZMOD p] := h₆₁
    have h₆₅ : (n : ℤ) ^ 24 ≡ 1 [ZMOD p] := h₆₂
    have h₆₆ : (p : ℕ) ∣ n ^ 8 - n ^ 4 + 1 := by
      hole_32
    have h₆₇ : ¬(p : ℕ) ∣ n := by hole_33
    have h₆₈ : p ≠ 3 := h₁
    
    have h₆₉ : p % 24 = 1 := by
      haveI := Fact.mk hp
      
      have h₇₀ := h₆₆
      have h₇₁ : ¬(p : ℕ) ∣ n := h₆₇
      have h₇₂ : p ≠ 3 := h₆₈
      have h₇₃ : (n : ZMod p) ≠ 0 := by
        intro h₇₄
        have h₇₅ : (p : ℕ) ∣ n := by
          hole_36
        hole_35
      have h₇₄ : (n : ZMod p) ^ 12 = -1 := by
        have h₇₅ : (n : ℤ) ^ 12 ≡ -1 [ZMOD p] := h₆₄
        have h₇₆ : (n : ZMod p) ^ 12 = -1 := by
          hole_38
        hole_37
      have h₇₅ : (n : ZMod p) ^ 24 = 1 := by
        have h₇₆ : (n : ℤ) ^ 24 ≡ 1 [ZMOD p] := h₆₅
        have h₇₇ : (n : ZMod p) ^ 24 = 1 := by
          hole_40
        hole_39
      have h₇₆ : p % 24 = 1 := by
        have h₇₇ : p % 3 ≠ 0 := by
          by_contra h₇₇
          have h₇₈ : p % 3 = 0 := by hole_43
          have h₇₉ : 3 ∣ p := by
            hole_44
          have h₈₀ : p = 3 := by
            have h₈₁ := Nat.Prime.eq_one_or_self_of_dvd hp 3 h₇₉
            hole_45
          hole_42
        have h₇₈ : p % 8 ≠ 0 := by
          by_contra h₇₈
          have h₇₉ : p % 8 = 0 := by hole_47
          have h₈₀ : 8 ∣ p := by
            hole_48
          have h₈₁ : p = 2 := by
            have h₈₂ := Nat.Prime.eq_one_or_self_of_dvd hp 8 h₈₀
            hole_49
          have h₈₂ : (p : ℕ) ∣ n ^ 8 - n ^ 4 + 1 := h₆₆
          have h₈₃ : (p : ℕ) ∣ n ^ 8 - n ^ 4 + 1 := h₆₆
          have h₈₄ : (2 : ℕ) ∣ n ^ 8 - n ^ 4 + 1 := by hole_50
          have h₈₅ : n ^ 8 % 2 = n ^ 4 % 2 := by
            have h₈₅₁ : n % 2 = 0 ∨ n % 2 = 1 := by hole_52
            hole_51
          have h₈₆ : (n ^ 8 - n ^ 4 + 1 : ℕ) % 2 = 1 := by
            have h₈₆₁ : n ^ 8 % 2 = n ^ 4 % 2 := h₈₅
            hole_53
          hole_46
        
        have h₇₉ : p % 24 = 1 := by
          
          have h₈₀ : p % 24 = 1 := by
            
            have h₈₁ := h₆₅
            have h₈₂ := h₆₄
            have h₈₃ : p ≠ 3 := h₁
            have h₈₄ : ¬(p : ℕ) ∣ n := h₆₇
            have h₈₅ : (n : ZMod p) ≠ 0 := by
              intro h₈₅
              have h₈₆ : (p : ℕ) ∣ n := by
                hole_57
              hole_56
            have h₈₅₁ : (n : ZMod p) ^ 12 = -1 := h₇₄
            have h₈₅₂ : (n : ZMod p) ^ 24 = 1 := h₇₅
            have h₈₅₃ : p % 3 ≠ 0 := h₇₇
            have h₈₅₄ : p % 8 ≠ 0 := h₇₈
            
            have h₈₅₅ : p % 24 = 1 := by
              
              have h₈₅₆ : (n : ZMod p) ^ 24 = 1 := h₈₅₂
              have h₈₅₇ : (n : ZMod p) ^ 12 = -1 := h₈₅₁
              
              have h₈₅₈ : p % 24 = 1 := by
                
                by_contra h₈₅₈
                have h₈₅₉ : p % 24 ≠ 1 := h₈₅₈
                have h₈₆₀ : p % 24 = 1 ∨ p % 24 = 5 ∨ p % 24 = 7 ∨ p % 24 = 11 ∨ p % 24 = 13 ∨ p % 24 = 17 ∨ p % 24 = 19 ∨ p % 24 = 23 := by
                  
                  have h₈₆₁ := Nat.Prime.eq_one_or_self_of_dvd hp 2
                  have h₈₆₂ := Nat.Prime.eq_one_or_self_of_dvd hp 3
                  have h₈₆₃ := Nat.Prime.eq_one_or_self_of_dvd hp 4
                  have h₈₆₄ := Nat.Prime.eq_one_or_self_of_dvd hp 6
                  have h₈₆₅ := Nat.Prime.eq_one_or_self_of_dvd hp 8
                  have h₈₆₆ := Nat.Prime.eq_one_or_self_of_dvd hp 12
                  have h₈₆₇ := Nat.Prime.eq_one_or_self_of_dvd hp 24
                  hole_60
                hole_59
              hole_58
            hole_55
          hole_54
        hole_41
      hole_34
    hole_29
  
  have h₇ : is24kPlus1 p := by
    have h₇₁ : p % 24 = 1 := h₆
    have h₇₂ : ∃ k : ℕ, p = 24 * k + 1 := by
      use (p - 1) / 24
      have h₇₃ : p % 24 = 1 := h₆
      have h₇₄ : p = 24 * ((p - 1) / 24) + 1 := by
        have h₇₅ : p ≥ 2 := Nat.Prime.two_le hp
        have h₇₆ : p ≥ 1 := by hole_64
        have h₇₇ : (p - 1) / 24 * 24 + 1 = p := by
          have h₇₈ : p % 24 = 1 := h₆
          have h₇₉ : p = 24 * ((p - 1) / 24) + 1 := by
            hole_66
          hole_65
        hole_63
      hole_62
    hole_61
  hole_1