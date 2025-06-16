macro "hole_3" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_44" : tactic => `(tactic| admit)
macro "hole_43" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_46" : tactic => `(tactic| admit)
macro "hole_47" : tactic => `(tactic| admit)
macro "hole_48" : tactic => `(tactic| admit)
macro "hole_45" : tactic => `(tactic| admit)
macro "hole_51" : tactic => `(tactic| admit)
macro "hole_52" : tactic => `(tactic| admit)
macro "hole_50" : tactic => `(tactic| admit)
macro "hole_54" : tactic => `(tactic| admit)
macro "hole_58" : tactic => `(tactic| admit)
macro "hole_59" : tactic => `(tactic| admit)
macro "hole_57" : tactic => `(tactic| admit)
macro "hole_56" : tactic => `(tactic| admit)
macro "hole_55" : tactic => `(tactic| admit)
macro "hole_53" : tactic => `(tactic| admit)
macro "hole_60" : tactic => `(tactic| admit)
macro "hole_49" : tactic => `(tactic| admit)
macro "hole_63" : tactic => `(tactic| admit)
macro "hole_64" : tactic => `(tactic| admit)
macro "hole_62" : tactic => `(tactic| admit)
macro "hole_65" : tactic => `(tactic| admit)
macro "hole_66" : tactic => `(tactic| admit)
macro "hole_67" : tactic => `(tactic| admit)
macro "hole_68" : tactic => `(tactic| admit)
macro "hole_70" : tactic => `(tactic| admit)
macro "hole_69" : tactic => `(tactic| admit)
macro "hole_71" : tactic => `(tactic| admit)
macro "hole_73" : tactic => `(tactic| admit)
macro "hole_72" : tactic => `(tactic| admit)
macro "hole_61" : tactic => `(tactic| admit)
macro "hole_74" : tactic => `(tactic| admit)
macro "hole_75" : tactic => `(tactic| admit)
macro "hole_76" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_77" : tactic => `(tactic| admit)
macro "hole_82" : tactic => `(tactic| admit)
macro "hole_83" : tactic => `(tactic| admit)
macro "hole_84" : tactic => `(tactic| admit)
macro "hole_85" : tactic => `(tactic| admit)
macro "hole_88" : tactic => `(tactic| admit)
macro "hole_90" : tactic => `(tactic| admit)
macro "hole_89" : tactic => `(tactic| admit)
macro "hole_87" : tactic => `(tactic| admit)
macro "hole_86" : tactic => `(tactic| admit)
macro "hole_93" : tactic => `(tactic| admit)
macro "hole_95" : tactic => `(tactic| admit)
macro "hole_94" : tactic => `(tactic| admit)
macro "hole_96" : tactic => `(tactic| admit)
macro "hole_92" : tactic => `(tactic| admit)
macro "hole_91" : tactic => `(tactic| admit)
macro "hole_81" : tactic => `(tactic| admit)
macro "hole_80" : tactic => `(tactic| admit)
macro "hole_79" : tactic => `(tactic| admit)
macro "hole_98" : tactic => `(tactic| admit)
macro "hole_97" : tactic => `(tactic| admit)
macro "hole_99" : tactic => `(tactic| admit)
macro "hole_100" : tactic => `(tactic| admit)
macro "hole_102" : tactic => `(tactic| admit)
macro "hole_101" : tactic => `(tactic| admit)
macro "hole_78" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem putnam_2008_b6
(n k : ℕ)
(hnk : n > 0 ∧ k > 0)
: Odd (Set.ncard {s : Equiv.Perm (Fin n) | klimited k n s}) ↔ (n ≡ 0 [MOD 2*k+1] ∨ n ≡ 1 [MOD 2*k+1]) := by
  have h_main : Odd (Set.ncard {s : Equiv.Perm (Fin n) | klimited k n s}) ↔ (n ≡ 0 [MOD 2*k+1] ∨ n ≡ 1 [MOD 2*k+1]) := by
    have h₁ : n > 0 := hnk.1
    have h₂ : k > 0 := hnk.2
    have h₃ : 2 * k + 1 > 0 := by hole_3
    
    
    
    
    cases' le_or_lt n (k + 1) with h h
    · 
      have h₄ : n ≤ k + 1 := h
      have h₅ : n ≤ k + 1 := h₄
      have h₆ : ∀ (s : Equiv.Perm (Fin n)), klimited k n s := by
        intro s
        intro i
        have h₇ : |((s i) : ℤ) - i| ≤ k := by
          have h₈ : ((s i) : ℕ) < n := by
            hole_6
          have h₉ : (i : ℕ) < n := i.is_lt
          have h₁₀ : ((s i) : ℤ) - i ≤ k := by
            have h₁₁ : ((s i) : ℕ) < n := h₈
            have h₁₂ : (i : ℕ) < n := h₉
            have h₁₃ : ((s i) : ℤ) ≤ (n : ℤ) - 1 := by
              have h₁₄ : ((s i) : ℕ) < n := h₁₁
              have h₁₅ : ((s i) : ℤ) < (n : ℤ) := by hole_9
              have h₁₆ : ((s i) : ℤ) ≤ (n : ℤ) - 1 := by
                hole_10
              hole_8
            have h₁₇ : (i : ℤ) ≥ 0 := by
              hole_11
            have h₁₈ : ((s i) : ℤ) - i ≤ (n : ℤ) - 1 - i := by
              hole_12
            have h₁₉ : (n : ℤ) - 1 - i ≤ k := by
              have h₂₀ : (n : ℤ) ≤ k + 1 := by
                hole_14
              have h₂₁ : (i : ℤ) ≥ 0 := by hole_15
              hole_13
            hole_7
          have h₂₂ : ((s i) : ℤ) - i ≥ -k := by
            have h₂₃ : ((s i) : ℕ) < n := by
              hole_17
            have h₂₄ : (i : ℕ) < n := i.is_lt
            have h₂₅ : ((s i) : ℤ) ≥ 0 := by
              hole_18
            have h₂₆ : (i : ℤ) ≥ 0 := by
              hole_19
            have h₂₇ : ((s i) : ℤ) - i ≥ -k := by
              have h₂₈ : ((s i) : ℕ) < n := h₂₃
              have h₂₉ : (i : ℕ) < n := h₂₄
              have h₃₀ : (i : ℤ) ≤ (n : ℤ) - 1 := by
                have h₃₁ : (i : ℕ) < n := h₂₉
                have h₃₂ : (i : ℤ) < (n : ℤ) := by hole_22
                have h₃₃ : (i : ℤ) ≤ (n : ℤ) - 1 := by hole_23
                hole_21
              have h₃₄ : ((s i) : ℤ) ≥ 0 := h₂₅
              have h₃₅ : (i : ℤ) ≥ 0 := h₂₆
              have h₃₆ : ((s i) : ℤ) - i ≥ -k := by
                have h₃₇ : (n : ℤ) ≤ k + 1 := by
                  hole_25
                have h₃₈ : (i : ℤ) ≤ (n : ℤ) - 1 := h₃₀
                have h₃₉ : ((s i) : ℤ) ≥ 0 := h₃₄
                have h₄₀ : (i : ℤ) ≥ 0 := h₃₅
                hole_24
              hole_20
            hole_16
          have h₃₀ : |((s i) : ℤ) - i| ≤ k := by
            have h₃₁ : ((s i) : ℤ) - i ≤ k := h₁₀
            have h₃₂ : ((s i) : ℤ) - i ≥ -k := h₂₂
            have h₃₃ : |((s i) : ℤ) - i| ≤ k := by
              hole_27
            hole_26
          hole_5
        hole_4
      have h₃₁ : {s : Equiv.Perm (Fin n) | klimited k n s} = Set.univ := by
        hole_28
      have h₃₂ : Set.ncard {s : Equiv.Perm (Fin n) | klimited k n s} = Set.ncard (Set.univ : Set (Equiv.Perm (Fin n))) := by
        hole_29
      have h₃₃ : Set.ncard {s : Equiv.Perm (Fin n) | klimited k n s} = Nat.factorial n := by
        rw [h₃₂]
        
        have h₃₄ : Set.ncard (Set.univ : Set (Equiv.Perm (Fin n))) = Nat.factorial n := by
          hole_31
        hole_30
      have h₃₄ : Odd (Set.ncard {s : Equiv.Perm (Fin n) | klimited k n s}) ↔ (n ≡ 0 [MOD 2*k+1] ∨ n ≡ 1 [MOD 2*k+1]) := by
        rw [h₃₃]
        have h₃₅ : n ≤ k + 1 := by hole_33
        have h₃₆ : n > 0 := h₁
        have h₃₇ : k > 0 := h₂
        
        
        have h₃₈ : n ≤ k + 1 := h₃₅
        have h₃₉ : n > 0 := h₁
        have h₄₀ : k > 0 := h₂
        
        
        have h₄₁ : n ≡ 0 [MOD 2 * k + 1] ∨ n ≡ 1 [MOD 2 * k + 1] → n = 1 := by
          intro h₄₂
          have h₄₃ : n ≡ 0 [MOD 2 * k + 1] ∨ n ≡ 1 [MOD 2 * k + 1] := h₄₂
          have h₄₄ : n ≤ k + 1 := h₃₅
          have h₄₅ : k > 0 := h₂
          have h₄₆ : 2 * k + 1 > k + 1 := by hole_35
          have h₄₇ : n < 2 * k + 1 := by hole_36
          cases' h₄₃ with h₄₈ h₄₈
          · 
            have h₄₉ : n ≡ 0 [MOD 2 * k + 1] := h₄₈
            have h₅₀ : n % (2 * k + 1) = 0 := by
              hole_37
            have h₅₁ : n < 2 * k + 1 := by hole_38
            have h₅₂ : n = 0 := by
              have h₅₃ : n % (2 * k + 1) = 0 := h₅₀
              have h₅₄ : n < 2 * k + 1 := h₅₁
              have h₅₅ : n = 0 := by
                hole_40
              hole_39
            have h₅₆ : n > 0 := h₁
            omega
          · 
            have h₄₉ : n ≡ 1 [MOD 2 * k + 1] := h₄₈
            have h₅₀ : n % (2 * k + 1) = 1 := by
              hole_41
            have h₅₁ : n < 2 * k + 1 := by hole_42
            have h₅₂ : n = 1 := by
              have h₅₃ : n % (2 * k + 1) = 1 := h₅₀
              have h₅₄ : n < 2 * k + 1 := h₅₁
              have h₅₅ : n = 1 := by
                hole_44
              hole_43
            hole_34
        have h₄₂ : n = 1 → (Odd (Nat.factorial n) ↔ (n ≡ 0 [MOD 2 * k + 1] ∨ n ≡ 1 [MOD 2 * k + 1])) := by
          intro h₄₃
          have h₄₄ : n = 1 := h₄₃
          have h₄₅ : n ≡ 1 [MOD 2 * k + 1] := by
            hole_46
          have h₄₆ : Odd (Nat.factorial n) := by
            hole_47
          have h₄₇ : (n ≡ 0 [MOD 2 * k + 1] ∨ n ≡ 1 [MOD 2 * k + 1]) := by
            hole_48
          hole_45
        have h₄₃ : n ≠ 1 → ¬(Odd (Nat.factorial n)) := by
          intro h₄₄
          have h₄₅ : n ≠ 1 := h₄₄
          have h₄₆ : n > 1 := by
            by_contra h₄₇
            have h₄₈ : n ≤ 1 := by hole_51
            have h₄₉ : n = 1 := by
              hole_52
            hole_50
          have h₄₇ : Even (Nat.factorial n) := by
            have h₄₈ : n ≥ 2 := by hole_54
            have h₄₉ : Even (Nat.factorial n) := by
              have h₅₀ : Even (Nat.factorial n) := by
                
                rw [even_iff_two_dvd]
                have h₅₁ : 2 ∣ Nat.factorial n := by
                  
                  have h₅₂ : 2 ≤ n := by hole_58
                  have h₅₃ : 2 ∣ Nat.factorial n := by
                    hole_59
                  hole_57
                hole_56
              hole_55
            hole_53
          have h₄₈ : ¬Odd (Nat.factorial n) := by
            hole_60
          hole_49
        have h₄₄ : n ≠ 1 → ¬(n ≡ 0 [MOD 2 * k + 1] ∨ n ≡ 1 [MOD 2 * k + 1]) := by
          intro h₄₅
          have h₄₆ : n ≠ 1 := h₄₅
          have h₄₇ : n > 1 := by
            by_contra h₄₈
            have h₄₉ : n ≤ 1 := by hole_63
            have h₅₀ : n = 1 := by
              hole_64
            hole_62
          have h₄₈ : n < 2 * k + 1 := by
            hole_65
          have h₄₉ : n ≠ 0 := by hole_66
          have h₅₀ : ¬(n ≡ 0 [MOD 2 * k + 1] ∨ n ≡ 1 [MOD 2 * k + 1]) := by
            hole_67
        · have h₄₆ : Odd (Nat.factorial n) ↔ (n ≡ 0 [MOD 2 * k + 1] ∨ n ≡ 1 [MOD 2 * k + 1]) := by
            hole_74
          cases' h₄₆ with h₄₇ h₄₇ <;> simp_all
          <;> try omega
          <;> try aesop
        · have h₄₆ : ¬(Odd (Nat.factorial n)) := by
            hole_75
          have h₄₇ : ¬(n ≡ 0 [MOD 2 * k + 1] ∨ n ≡ 1 [MOD 2 * k + 1]) := by
            hole_76
          hole_32
      exact h₃₄
    · 
      have h₄ : n > k + 1 := by hole_77
      have h₅ : Odd (Set.ncard {s : Equiv.Perm (Fin n) | klimited k n s}) ↔ (n ≡ 0 [MOD 2*k+1] ∨ n ≡ 1 [MOD 2*k+1]) := by
        have h₅₁ : n > k + 1 := h₄
        have h₅₂ : ∀ (s : Equiv.Perm (Fin n)), klimited k n s → s = 1 := by
          intro s hs
          have h₅₃ : ∀ i, |((s i) : ℤ) - i| ≤ k := hs
          have h₅₄ : s = 1 := by
            apply Equiv.ext
            intro i
            have h₅₅ : |((s i) : ℤ) - i| ≤ k := h₅₃ i
            have h₅₆ : (s i : ℕ) = i := by
              by_contra h
              have h₅₇ : (s i : ℕ) ≠ i := h
              have h₅₈ : (s i : ℕ) < n := (s i).is_lt
              have h₅₉ : (i : ℕ) < n := i.is_lt
              have h₆₀ : |((s i) : ℤ) - i| ≤ k := h₅₅
              have h₆₁ : ((s i) : ℤ) - i ≤ k := by
                hole_82
              have h₆₂ : ((s i) : ℤ) - i ≥ -k := by
                hole_83
              have h₆₃ : ((s i) : ℤ) ≤ (i : ℤ) + k := by hole_84
              have h₆₄ : ((s i) : ℤ) ≥ (i : ℤ) - k := by hole_85
              have h₆₅ : (s i : ℕ) ≤ i + k := by
                have h₆₆ : (s i : ℤ) ≤ (i : ℤ) + k := h₆₃
                have h₆₇ : (s i : ℤ) ≥ (i : ℤ) - k := h₆₄
                have h₆₈ : (s i : ℕ) ≤ i + k := by
                  by_contra h₆₉
                  have h₇₀ : i + k < (s i : ℕ) := by hole_88
                  have h₇₁ : (s i : ℤ) > (i : ℤ) + k := by
                    have h₇₂ : (s i : ℤ) > (i : ℤ) + k := by
                      hole_90
                    hole_89
                  hole_87
                hole_86
              have h₆₆ : (s i : ℕ) ≥ i - k := by
                have h₆₇ : (s i : ℤ) ≥ (i : ℤ) - k := h₆₄
                have h₆₈ : (s i : ℤ) ≤ (i : ℤ) + k := h₆₃
                have h₆₉ : (s i : ℕ) ≥ i - k := by
                  by_contra h₇₀
                  have h₇₁ : (s i : ℕ) < i - k := by hole_93
                  have h₇₂ : (s i : ℤ) < (i : ℤ) - k := by
                    have h₇₃ : (s i : ℤ) < (i : ℤ) - k := by
                      hole_95
                    hole_94
                  have h₇₄ : ((s i) : ℤ) < (i : ℤ) - k := h₇₂
                  have h₇₅ : ((s i) : ℤ) ≥ (i : ℤ) - k := by hole_96
                  hole_92
                hole_91
              have h₆₇ : (s i : ℕ) ≤ i + k := h₆₅
              have h₆₈ : (s i : ℕ) ≥ i - k := h₆₆
              have h₆₉ : (s i : ℕ) ≠ i := h₅₇
              have h₇₀ : (s i : ℕ) < n := (s i).is_lt
              have h₇₁ : (i : ℕ) < n := i.is_lt
              have h₇₂ : (s i : ℕ) ≤ i + k := h₆₅
              have h₇₃ : (s i : ℕ) ≥ i - k := h₆₆
              have h₇₄ : (s i : ℕ) ≠ i := h₆₉
              hole_81
            have h₅₇ : (s i : ℕ) = i := h₅₆
            hole_80
          hole_79
        have h₅₈ : {s : Equiv.Perm (Fin n) | klimited k n s} = {1} := by
          apply Set.Subset.antisymm
          · 
            intro s hs
            have h₅₉ : s = 1 := h₅₂ s hs
            rw [h₅₉]
            simp
          · 
            intro s hs
            have h₅₉ : s = 1 := by hole_98
            hole_97
        have h₅₉ : Set.ncard {s : Equiv.Perm (Fin n) | klimited k n s} = 1 := by
          hole_99
        have h₆₀ : Odd (Set.ncard {s : Equiv.Perm (Fin n) | klimited k n s}) := by
          hole_100
        have h₆₁ : n ≡ 0 [MOD 2*k+1] ∨ n ≡ 1 [MOD 2*k+1] := by
          exfalso
          
          
          have h₆₂ := h₅₂ (Equiv.swap (⟨0, by omega⟩ : Fin n) ⟨1, by omega⟩)
          have h₆₃ : klimited k n (Equiv.swap (⟨0, by omega⟩ : Fin n) ⟨1, by omega⟩) → False := by
            intro h₆₄
            have h₆₅ := h₆₄
            hole_102
          hole_101
        hole_78
      hole_2
  hole_1