theorem prime_divisors_of_polynomial_congruence :
  ∀ (p : ℕ), p.Prime → p ∣ polynomial n → is24kPlus1 p := by
  intro p hp hdiv
  have h₁ : p ≠ 3 := by
    intro h
    have h₂ : p = 3 := h
    rw [h₂] at hdiv
    have h₃ : (3 : ℕ) ∣ polynomial n := hdiv
    have h₄ : (polynomial n) % 3 = 0 := by
      admit
    have h₅ : (polynomial n) % 3 = 1 := by
      have h₅₁ : (polynomial n) % 3 = 1 := by
        
        have h₅₂ : n % 3 = 0 ∨ n % 3 = 1 ∨ n % 3 = 2 := by admit
        admit
      admit
    admit
  
  have h₂ : ¬ (p ∣ n) := by
    intro h₂
    have h₃ : p ∣ n := h₂
    have h₄ : p ∣ polynomial n := hdiv
    have h₅ : p ∣ n ^ 8 - n ^ 4 + 1 := by
      admit
    have h₆ : p ∣ 1 := by
      have h₇ : p ∣ n ^ 8 := by
        admit
      have h₈ : p ∣ n ^ 4 := by
        admit
      have h₉ : p ∣ n ^ 8 - n ^ 4 + 1 := h₅
      have h₁₀ : p ∣ 1 := by
        have h₁₁ : p ∣ n ^ 8 - n ^ 4 + 1 := h₅
        have h₁₂ : p ∣ n ^ 8 := h₇
        have h₁₃ : p ∣ n ^ 4 := h₈
        have h₁₄ : p ∣ n ^ 8 - n ^ 4 := by
          admit
        have h₁₅ : p ∣ n ^ 8 - n ^ 4 + 1 := h₅
        have h₁₆ : p ∣ (n ^ 8 - n ^ 4 + 1) - (n ^ 8 - n ^ 4) := by
          admit
        admit
      admit
    have h₇ : p ∣ 1 := h₆
    have h₈ : p ≤ 1 := Nat.le_of_dvd (by norm_num) h₇
    have h₉ : p ≥ 2 := Nat.Prime.two_le hp
    admit
  
  have h₃ : ∃ (d : ℕ), 0 < d ∧ (n ^ d : ℤ) ≡ 1 [ZMOD p] := by
    haveI := Fact.mk hp
    have h₄ : (n : ZMod p) ≠ 0 := by
      intro h₄
      have h₅ : (p : ℕ) ∣ n := by
        admit
      admit
    have h₅ : (n : ZMod p) ^ (p - 1 : ℕ) = 1 := by
      admit
    have h₆ : (n : ℤ) ^ (p - 1 : ℕ) ≡ 1 [ZMOD p] := by
      admit
    refine' ⟨p - 1, _, _⟩
    · have h₇ : p ≥ 2 := Nat.Prime.two_le hp
      admit
  
  have h₄ : (n ^ 12 : ℤ) ≡ -1 [ZMOD p] := by
    have h₄₁ : (p : ℕ) ∣ n ^ 8 - n ^ 4 + 1 := by
      admit
    have h₄₂ : (n : ℤ) ^ 8 ≡ (n : ℤ) ^ 4 - 1 [ZMOD p] := by
      have h₄₃ : (p : ℤ) ∣ (n ^ 8 - n ^ 4 + 1 : ℤ) := by
        admit
      have h₄₄ : (n : ℤ) ^ 8 - (n : ℤ) ^ 4 + 1 ≡ 0 [ZMOD p] := by
        admit
      have h₄₅ : (n : ℤ) ^ 8 ≡ (n : ℤ) ^ 4 - 1 [ZMOD p] := by
        admit
      admit
    have h₄₆ : (n : ℤ) ^ 12 ≡ -1 [ZMOD p] := by
      admit
    admit
  
  have h₅ : (n ^ 24 : ℤ) ≡ 1 [ZMOD p] := by
    have h₅₁ : (n : ℤ) ^ 24 ≡ 1 [ZMOD p] := by
      admit
    admit
  
  have h₆ : p % 24 = 1 := by
    have h₆₁ := h₄
    have h₆₂ := h₅
    have h₆₃ : p ≠ 0 := by
      intro h₆₄
      have h₆₅ : p = 0 := h₆₄
      have h₆₆ : ¬Nat.Prime p := by
        admit
      admit
    have h₆₄ : (n : ℤ) ^ 12 ≡ -1 [ZMOD p] := h₆₁
    have h₆₅ : (n : ℤ) ^ 24 ≡ 1 [ZMOD p] := h₆₂
    have h₆₆ : (p : ℕ) ∣ n ^ 8 - n ^ 4 + 1 := by
      admit
    have h₆₇ : ¬(p : ℕ) ∣ n := by admit
    have h₆₈ : p ≠ 3 := h₁
    
    have h₆₉ : p % 24 = 1 := by
      haveI := Fact.mk hp
      
      have h₇₀ := h₆₆
      have h₇₁ : ¬(p : ℕ) ∣ n := h₆₇
      have h₇₂ : p ≠ 3 := h₆₈
      have h₇₃ : (n : ZMod p) ≠ 0 := by
        intro h₇₄
        have h₇₅ : (p : ℕ) ∣ n := by
          admit
        admit
      have h₇₄ : (n : ZMod p) ^ 12 = -1 := by
        have h₇₅ : (n : ℤ) ^ 12 ≡ -1 [ZMOD p] := h₆₄
        have h₇₆ : (n : ZMod p) ^ 12 = -1 := by
          admit
        admit
      have h₇₅ : (n : ZMod p) ^ 24 = 1 := by
        have h₇₆ : (n : ℤ) ^ 24 ≡ 1 [ZMOD p] := h₆₅
        have h₇₇ : (n : ZMod p) ^ 24 = 1 := by
          admit
        admit
      have h₇₆ : p % 24 = 1 := by
        have h₇₇ : p % 3 ≠ 0 := by
          by_contra h₇₇
          have h₇₈ : p % 3 = 0 := by admit
          have h₇₉ : 3 ∣ p := by
            admit
          have h₈₀ : p = 3 := by
            have h₈₁ := Nat.Prime.eq_one_or_self_of_dvd hp 3 h₇₉
            admit
          admit
        have h₇₈ : p % 8 ≠ 0 := by
          by_contra h₇₈
          have h₇₉ : p % 8 = 0 := by admit
          have h₈₀ : 8 ∣ p := by
            admit
          have h₈₁ : p = 2 := by
            have h₈₂ := Nat.Prime.eq_one_or_self_of_dvd hp 8 h₈₀
            admit
          have h₈₂ : (p : ℕ) ∣ n ^ 8 - n ^ 4 + 1 := h₆₆
          have h₈₃ : (p : ℕ) ∣ n ^ 8 - n ^ 4 + 1 := h₆₆
          have h₈₄ : (2 : ℕ) ∣ n ^ 8 - n ^ 4 + 1 := by admit
          have h₈₅ : n ^ 8 % 2 = n ^ 4 % 2 := by
            have h₈₅₁ : n % 2 = 0 ∨ n % 2 = 1 := by admit
            admit
          have h₈₆ : (n ^ 8 - n ^ 4 + 1 : ℕ) % 2 = 1 := by
            have h₈₆₁ : n ^ 8 % 2 = n ^ 4 % 2 := h₈₅
            admit
          admit
        
        have h₇₉ : p % 24 = 1 := by
          
          have h₈₀ : p % 24 = 1 := by
            
            have h₈₁ := h₆₅
            have h₈₂ := h₆₄
            have h₈₃ : p ≠ 3 := h₁
            have h₈₄ : ¬(p : ℕ) ∣ n := h₆₇
            have h₈₅ : (n : ZMod p) ≠ 0 := by
              intro h₈₅
              have h₈₆ : (p : ℕ) ∣ n := by
                admit
              admit
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
                  admit
                admit
              admit
            admit
          admit
        admit
      admit
    admit
  
  have h₇ : is24kPlus1 p := by
    have h₇₁ : p % 24 = 1 := h₆
    have h₇₂ : ∃ k : ℕ, p = 24 * k + 1 := by
      use (p - 1) / 24
      have h₇₃ : p % 24 = 1 := h₆
      have h₇₄ : p = 24 * ((p - 1) / 24) + 1 := by
        have h₇₅ : p ≥ 2 := Nat.Prime.two_le hp
        have h₇₆ : p ≥ 1 := by admit
        have h₇₇ : (p - 1) / 24 * 24 + 1 = p := by
          have h₇₈ : p % 24 = 1 := h₆
          have h₇₉ : p = 24 * ((p - 1) / 24) + 1 := by
            admit
          admit
        admit
      admit
    admit
  admit