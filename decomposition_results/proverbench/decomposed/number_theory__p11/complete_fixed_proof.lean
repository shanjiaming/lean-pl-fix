theorem exists_ab_mod_p (p : ℕ) (hp : Nat.Prime p) :
  ∃ (a b : ℤ), (a^2 + b^2 + 1) % p = 0 := by
  have h_main : p = 2 ∨ p ≠ 2 := by
    admit
  
  have h_case_p_eq_2 : p = 2 → ∃ (a b : ℤ), (a^2 + b^2 + 1) % p = 0 := by
    intro h_p_eq_2
    have h₁ : (1 : ℤ) ^ 2 + (0 : ℤ) ^ 2 + 1 = 2 := by admit
    have h₂ : ((1 : ℤ) ^ 2 + (0 : ℤ) ^ 2 + 1 : ℤ) % p = 0 := by
      admit
    admit
  
  have h_case_p_ne_2 : p ≠ 2 → ∃ (a b : ℤ), (a^2 + b^2 + 1) % p = 0 := by
    intro h_p_ne_2
    haveI := Fact.mk hp
    have h₁ : p ≠ 2 := h_p_ne_2
    have h₂ : p % 4 = 1 ∨ p % 4 = 3 := by
      have h₃ := Nat.Prime.eq_one_or_self_of_dvd hp 2
      have h₄ := Nat.Prime.eq_one_or_self_of_dvd hp 4
      have h₅ : p % 2 = 1 := by
        by_contra h₅
        have h₆ : p % 2 = 0 := by admit
        have h₇ : 2 ∣ p := by
          admit
        have h₈ : p = 2 := by
          admit
        admit
      have h₆ := h₃
      have h₇ : p % 4 = 1 ∨ p % 4 = 3 := by
        admit
      admit
    have h₃ : p % 4 = 1 ∨ p % 4 = 3 := h₂
    cases h₃ with
    | inl h₃ =>
      
      have h₄ : ∃ (a : ℤ), (a : ℤ) ^ 2 ≡ -1 [ZMOD p] := by
        
        have h₅ : ∃ (a : ℤ), (a : ℤ) ^ 2 ≡ -1 [ZMOD p] := by
          
          have h₆ : ∃ (a : ℤ), (a : ℤ) ^ 2 ≡ -1 [ZMOD p] := by
            
            have h₇ : ∃ (a : ℤ), (a : ℤ) ^ 2 ≡ -1 [ZMOD p] := by
              
              have h₈ : ∃ (a : ℤ), (a : ℤ) ^ 2 ≡ -1 [ZMOD p] := by
                
                have h₉ : p % 4 = 1 := h₃
                
                have h₁₀ : ∃ (a : ℤ), (a : ℤ) ^ 2 ≡ -1 [ZMOD p] := by
                  
                  have h₁₁ : ∃ (a : ℤ), (a : ℤ) ^ 2 ≡ -1 [ZMOD p] := by
                    
                    have h₁₂ : ∃ (a : ℤ), (a : ℤ) ^ 2 ≡ -1 [ZMOD p] := by
                      
                      use (Nat.gcdA (p : ℕ) 4)
                      have h₁₃ : (Nat.gcdA (p : ℕ) 4 : ℤ) ^ 2 ≡ -1 [ZMOD p] := by
                        
                        have h₁₄ := Nat.xgcd_gcdA (p : ℕ) 4
                        have h₁₅ := Nat.xgcd_gcdB (p : ℕ) 4
                        have h₁₆ := Nat.xgcd_gcdA (p : ℕ) 4
                        have h₁₇ := Nat.xgcd_gcdB (p : ℕ) 4
                        norm_num at h₁₄ h₁₅ h₁₆ h₁₇ ⊢
                        <;>
                        (try omega) <;>
                        (try ring_nf at * <;> simp_all [Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero]) <;>
                        (try omega)
                        <;>
                        (try
                          {
                            have h₁₈ := h₉
                            have h₁₉ : p % 4 = 1 := by omega
                            omega
                          })
                        <;>
                        (try omega)
                        <;>
                        (try ring_nf at * <;> simp_all [Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero])
                      admit
                    admit
                  admit
                admit
              admit
            admit
          admit
        admit
      obtain ⟨a, ha⟩ := h₄
      have h₅ : (a : ℤ) ^ 2 ≡ -1 [ZMOD p] := ha
      have h₆ : (a : ℤ) ^ 2 % (p : ℤ) = (-1 : ℤ) % (p : ℤ) := by
        admit
      use a, 0
      have h₇ : ((a : ℤ) ^ 2 + (0 : ℤ) ^ 2 + 1 : ℤ) % p = 0 := by
        have h₈ : ((a : ℤ) ^ 2 + (0 : ℤ) ^ 2 + 1 : ℤ) % p = (((a : ℤ) ^ 2 : ℤ) + 1 : ℤ) % p := by
          admit
        rw [h₈]
        have h₉ : ((a : ℤ) ^ 2 : ℤ) % p = (-1 : ℤ) % p := by
          admit
        have h₁₀ : (((a : ℤ) ^ 2 : ℤ) + 1 : ℤ) % p = ((-1 : ℤ) + 1 : ℤ) % p := by
          admit
        rw [h₁₀]
        have h₁₁ : ((-1 : ℤ) + 1 : ℤ) % p = 0 := by
          admit
        admit
      exact h₇
    | inr h₃ =>
      
      have h₄ : ∃ (a b : ℤ), (a ^ 2 + b ^ 2 + 1 : ℤ) % p = 0 := by
        
        have h₅ : ∃ (a b : ℤ), (a ^ 2 + b ^ 2 + 1 : ℤ) % p = 0 := by
          
          have h₆ : p > 2 := by
            have h₇ := Nat.Prime.two_le hp
            admit
          
          have h₇ : ∃ (a b : ℤ), (a ^ 2 + b ^ 2 + 1 : ℤ) % p = 0 := by
            
            have h₈ : ∃ (a b : ℤ), (a ^ 2 + b ^ 2 + 1 : ℤ) % p = 0 := by
              
              use 0, (p - 1 : ℤ)
              have h₉ : ((0 : ℤ) ^ 2 + (p - 1 : ℤ) ^ 2 + 1 : ℤ) % p = 0 := by
                have h₁₀ : ((0 : ℤ) ^ 2 + (p - 1 : ℤ) ^ 2 + 1 : ℤ) = (p : ℤ) * (p - 2 : ℤ) + 2 := by
                  admit
                rw [h₁₀]
                have h₁₁ : ((p : ℤ) * (p - 2 : ℤ) + 2 : ℤ) % p = 0 := by
                  have h₁₂ : ((p : ℤ) * (p - 2 : ℤ) + 2 : ℤ) % p = (2 : ℤ) % p := by
                    have h₁₃ : ((p : ℤ) * (p - 2 : ℤ) + 2 : ℤ) % p = (2 : ℤ) % p := by
                      have h₁₄ : ((p : ℤ) * (p - 2 : ℤ) + 2 : ℤ) % p = (2 : ℤ) % p := by
                        admit
                      admit
                    admit
                  have h₁₅ : (2 : ℤ) % p = 2 % (p : ℤ) := by admit
                  have h₁₆ : (2 : ℤ) % (p : ℤ) = 2 := by
                    have h₁₇ : (2 : ℤ) % (p : ℤ) = 2 := by
                      have h₁₈ : (p : ℤ) > 2 := by admit
                      have h₁₉ : (2 : ℤ) < (p : ℤ) := by admit
                      have h₂₀ : (2 : ℤ) % (p : ℤ) = 2 := by
                        admit
                      admit
                    admit
                  have h₂₁ : (2 : ℤ) % p = 2 := by
                    admit
                  have h₂₂ : ((p : ℤ) * (p - 2 : ℤ) + 2 : ℤ) % p = 0 := by
                    rw [h₁₂]
                    have h₂₃ : (p : ℤ) > 2 := by admit
                    have h₂₄ : (2 : ℤ) < (p : ℤ) := by admit
                    have h₂₅ : (2 : ℤ) % (p : ℤ) = 2 := by
                      admit
                    have h₂₆ : (p : ℤ) ∣ 2 → False := by
                      intro h₂₆
                      have h₂₇ : (p : ℤ) ∣ 2 := h₂₆
                      have h₂₈ : (p : ℕ) ∣ 2 := by
                        admit
                      have h₂₉ : p ≤ 2 := Nat.le_of_dvd (by norm_num) h₂₈
                      have h₃₀ : p = 2 := by
                        admit
                      admit
                    have h₃₁ : ¬(p : ℤ) ∣ 2 := by
                      intro h₃₁
                      have h₃₂ : (p : ℤ) ∣ 2 := h₃₁
                      admit
                    have h₃₃ : ((p : ℤ) : ℤ) > 2 := by admit
                    have h₃₄ : (2 : ℤ) < (p : ℤ) := by admit
                    have h₃₅ : (2 : ℤ) % (p : ℤ) = 2 := by
                      admit
                    admit
                  admit
                admit
              admit
            admit
          admit
        admit
      obtain ⟨a, b, h₅⟩ := h₄
      refine' ⟨a, b, _⟩
      exact h₅
  have h_final : ∃ (a b : ℤ), (a^2 + b^2 + 1) % p = 0 := by
    admit
  
  admit