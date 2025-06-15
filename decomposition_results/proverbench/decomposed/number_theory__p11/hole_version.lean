macro "hole_2" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_43" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_44" : tactic => `(tactic| admit)
macro "hole_46" : tactic => `(tactic| admit)
macro "hole_47" : tactic => `(tactic| admit)
macro "hole_48" : tactic => `(tactic| admit)
macro "hole_50" : tactic => `(tactic| admit)
macro "hole_51" : tactic => `(tactic| admit)
macro "hole_49" : tactic => `(tactic| admit)
macro "hole_52" : tactic => `(tactic| admit)
macro "hole_53" : tactic => `(tactic| admit)
macro "hole_54" : tactic => `(tactic| admit)
macro "hole_55" : tactic => `(tactic| admit)
macro "hole_45" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_56" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem exists_ab_mod_p (p : ℕ) (hp : Nat.Prime p) :
  ∃ (a b : ℤ), (a^2 + b^2 + 1) % p = 0 := by
  have h_main : p = 2 ∨ p ≠ 2 := by
    hole_2
  
  have h_case_p_eq_2 : p = 2 → ∃ (a b : ℤ), (a^2 + b^2 + 1) % p = 0 := by
    intro h_p_eq_2
    have h₁ : (1 : ℤ) ^ 2 + (0 : ℤ) ^ 2 + 1 = 2 := by hole_4
    have h₂ : ((1 : ℤ) ^ 2 + (0 : ℤ) ^ 2 + 1 : ℤ) % p = 0 := by
      hole_5
    hole_3
  
  have h_case_p_ne_2 : p ≠ 2 → ∃ (a b : ℤ), (a^2 + b^2 + 1) % p = 0 := by
    intro h_p_ne_2
    haveI := Fact.mk hp
    have h₁ : p ≠ 2 := h_p_ne_2
    have h₂ : p % 4 = 1 ∨ p % 4 = 3 := by
      have h₃ := Nat.Prime.eq_one_or_self_of_dvd hp 2
      have h₄ := Nat.Prime.eq_one_or_self_of_dvd hp 4
      have h₅ : p % 2 = 1 := by
        by_contra h₅
        have h₆ : p % 2 = 0 := by hole_9
        have h₇ : 2 ∣ p := by
          hole_10
        have h₈ : p = 2 := by
          hole_11
        hole_8
      have h₆ := h₃
      have h₇ : p % 4 = 1 ∨ p % 4 = 3 := by
        hole_12
      hole_7
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
                      hole_20
                    hole_19
                  hole_18
                hole_17
              hole_16
            hole_15
          hole_14
        hole_13
      obtain ⟨a, ha⟩ := h₄
      have h₅ : (a : ℤ) ^ 2 ≡ -1 [ZMOD p] := ha
      have h₆ : (a : ℤ) ^ 2 % (p : ℤ) = (-1 : ℤ) % (p : ℤ) := by
        hole_21
      use a, 0
      have h₇ : ((a : ℤ) ^ 2 + (0 : ℤ) ^ 2 + 1 : ℤ) % p = 0 := by
        have h₈ : ((a : ℤ) ^ 2 + (0 : ℤ) ^ 2 + 1 : ℤ) % p = (((a : ℤ) ^ 2 : ℤ) + 1 : ℤ) % p := by
          hole_23
        rw [h₈]
        have h₉ : ((a : ℤ) ^ 2 : ℤ) % p = (-1 : ℤ) % p := by
          hole_24
        have h₁₀ : (((a : ℤ) ^ 2 : ℤ) + 1 : ℤ) % p = ((-1 : ℤ) + 1 : ℤ) % p := by
          hole_25
        rw [h₁₀]
        have h₁₁ : ((-1 : ℤ) + 1 : ℤ) % p = 0 := by
          hole_26
        hole_22
      exact h₇
    | inr h₃ =>
      
      have h₄ : ∃ (a b : ℤ), (a ^ 2 + b ^ 2 + 1 : ℤ) % p = 0 := by
        
        have h₅ : ∃ (a b : ℤ), (a ^ 2 + b ^ 2 + 1 : ℤ) % p = 0 := by
          
          have h₆ : p > 2 := by
            have h₇ := Nat.Prime.two_le hp
            hole_29
          
          have h₇ : ∃ (a b : ℤ), (a ^ 2 + b ^ 2 + 1 : ℤ) % p = 0 := by
            
            have h₈ : ∃ (a b : ℤ), (a ^ 2 + b ^ 2 + 1 : ℤ) % p = 0 := by
              
              use 0, (p - 1 : ℤ)
              have h₉ : ((0 : ℤ) ^ 2 + (p - 1 : ℤ) ^ 2 + 1 : ℤ) % p = 0 := by
                have h₁₀ : ((0 : ℤ) ^ 2 + (p - 1 : ℤ) ^ 2 + 1 : ℤ) = (p : ℤ) * (p - 2 : ℤ) + 2 := by
                  hole_33
                rw [h₁₀]
                have h₁₁ : ((p : ℤ) * (p - 2 : ℤ) + 2 : ℤ) % p = 0 := by
                  have h₁₂ : ((p : ℤ) * (p - 2 : ℤ) + 2 : ℤ) % p = (2 : ℤ) % p := by
                    have h₁₃ : ((p : ℤ) * (p - 2 : ℤ) + 2 : ℤ) % p = (2 : ℤ) % p := by
                      have h₁₄ : ((p : ℤ) * (p - 2 : ℤ) + 2 : ℤ) % p = (2 : ℤ) % p := by
                        hole_37
                      hole_36
                    hole_35
                  have h₁₅ : (2 : ℤ) % p = 2 % (p : ℤ) := by hole_38
                  have h₁₆ : (2 : ℤ) % (p : ℤ) = 2 := by
                    have h₁₇ : (2 : ℤ) % (p : ℤ) = 2 := by
                      have h₁₈ : (p : ℤ) > 2 := by hole_41
                      have h₁₉ : (2 : ℤ) < (p : ℤ) := by hole_42
                      have h₂₀ : (2 : ℤ) % (p : ℤ) = 2 := by
                        hole_43
                      hole_40
                    hole_39
                  have h₂₁ : (2 : ℤ) % p = 2 := by
                    hole_44
                  have h₂₂ : ((p : ℤ) * (p - 2 : ℤ) + 2 : ℤ) % p = 0 := by
                    rw [h₁₂]
                    have h₂₃ : (p : ℤ) > 2 := by hole_46
                    have h₂₄ : (2 : ℤ) < (p : ℤ) := by hole_47
                    have h₂₅ : (2 : ℤ) % (p : ℤ) = 2 := by
                      hole_48
                    have h₂₆ : (p : ℤ) ∣ 2 → False := by
                      intro h₂₆
                      have h₂₇ : (p : ℤ) ∣ 2 := h₂₆
                      have h₂₈ : (p : ℕ) ∣ 2 := by
                        hole_50
                      have h₂₉ : p ≤ 2 := Nat.le_of_dvd (by norm_num) h₂₈
                      have h₃₀ : p = 2 := by
                        hole_51
                      hole_49
                    have h₃₁ : ¬(p : ℤ) ∣ 2 := by
                      intro h₃₁
                      have h₃₂ : (p : ℤ) ∣ 2 := h₃₁
                      hole_52
                    have h₃₃ : ((p : ℤ) : ℤ) > 2 := by hole_53
                    have h₃₄ : (2 : ℤ) < (p : ℤ) := by hole_54
                    have h₃₅ : (2 : ℤ) % (p : ℤ) = 2 := by
                      hole_55
                    hole_45
                  hole_34
                hole_32
              hole_31
            hole_30
          hole_28
        hole_27
      obtain ⟨a, b, h₅⟩ := h₄
      refine' ⟨a, b, _⟩
      exact h₅
  have h_final : ∃ (a b : ℤ), (a^2 + b^2 + 1) % p = 0 := by
    hole_56
  
  hole_1