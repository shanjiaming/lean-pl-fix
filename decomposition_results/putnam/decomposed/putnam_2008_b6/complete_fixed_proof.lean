theorem putnam_2008_b6
(n k : ℕ)
(hnk : n > 0 ∧ k > 0)
: Odd (Set.ncard {s : Equiv.Perm (Fin n) | klimited k n s}) ↔ (n ≡ 0 [MOD 2*k+1] ∨ n ≡ 1 [MOD 2*k+1]) := by
  have h_main : Odd (Set.ncard {s : Equiv.Perm (Fin n) | klimited k n s}) ↔ (n ≡ 0 [MOD 2*k+1] ∨ n ≡ 1 [MOD 2*k+1]) := by
    have h₁ : n > 0 := hnk.1
    have h₂ : k > 0 := hnk.2
    have h₃ : 2 * k + 1 > 0 := by admit
    
    
    
    
    cases' le_or_lt n (k + 1) with h h
    · 
      have h₄ : n ≤ k + 1 := h
      have h₅ : n ≤ k + 1 := h₄
      have h₆ : ∀ (s : Equiv.Perm (Fin n)), klimited k n s := by
        intro s
        intro i
        have h₇ : |((s i) : ℤ) - i| ≤ k := by
          have h₈ : ((s i) : ℕ) < n := by
            admit
          have h₉ : (i : ℕ) < n := i.is_lt
          have h₁₀ : ((s i) : ℤ) - i ≤ k := by
            have h₁₁ : ((s i) : ℕ) < n := h₈
            have h₁₂ : (i : ℕ) < n := h₉
            have h₁₃ : ((s i) : ℤ) ≤ (n : ℤ) - 1 := by
              have h₁₄ : ((s i) : ℕ) < n := h₁₁
              have h₁₅ : ((s i) : ℤ) < (n : ℤ) := by admit
              have h₁₆ : ((s i) : ℤ) ≤ (n : ℤ) - 1 := by
                admit
              admit
            have h₁₇ : (i : ℤ) ≥ 0 := by
              admit
            have h₁₈ : ((s i) : ℤ) - i ≤ (n : ℤ) - 1 - i := by
              admit
            have h₁₉ : (n : ℤ) - 1 - i ≤ k := by
              have h₂₀ : (n : ℤ) ≤ k + 1 := by
                admit
              have h₂₁ : (i : ℤ) ≥ 0 := by admit
              admit
            admit
          have h₂₂ : ((s i) : ℤ) - i ≥ -k := by
            have h₂₃ : ((s i) : ℕ) < n := by
              admit
            have h₂₄ : (i : ℕ) < n := i.is_lt
            have h₂₅ : ((s i) : ℤ) ≥ 0 := by
              admit
            have h₂₆ : (i : ℤ) ≥ 0 := by
              admit
            have h₂₇ : ((s i) : ℤ) - i ≥ -k := by
              have h₂₈ : ((s i) : ℕ) < n := h₂₃
              have h₂₉ : (i : ℕ) < n := h₂₄
              have h₃₀ : (i : ℤ) ≤ (n : ℤ) - 1 := by
                have h₃₁ : (i : ℕ) < n := h₂₉
                have h₃₂ : (i : ℤ) < (n : ℤ) := by admit
                have h₃₃ : (i : ℤ) ≤ (n : ℤ) - 1 := by admit
                admit
              have h₃₄ : ((s i) : ℤ) ≥ 0 := h₂₅
              have h₃₅ : (i : ℤ) ≥ 0 := h₂₆
              have h₃₆ : ((s i) : ℤ) - i ≥ -k := by
                have h₃₇ : (n : ℤ) ≤ k + 1 := by
                  admit
                have h₃₈ : (i : ℤ) ≤ (n : ℤ) - 1 := h₃₀
                have h₃₉ : ((s i) : ℤ) ≥ 0 := h₃₄
                have h₄₀ : (i : ℤ) ≥ 0 := h₃₅
                admit
              admit
            admit
          have h₃₀ : |((s i) : ℤ) - i| ≤ k := by
            have h₃₁ : ((s i) : ℤ) - i ≤ k := h₁₀
            have h₃₂ : ((s i) : ℤ) - i ≥ -k := h₂₂
            have h₃₃ : |((s i) : ℤ) - i| ≤ k := by
              admit
            admit
          admit
        admit
      have h₃₁ : {s : Equiv.Perm (Fin n) | klimited k n s} = Set.univ := by
        admit
      have h₃₂ : Set.ncard {s : Equiv.Perm (Fin n) | klimited k n s} = Set.ncard (Set.univ : Set (Equiv.Perm (Fin n))) := by
        admit
      have h₃₃ : Set.ncard {s : Equiv.Perm (Fin n) | klimited k n s} = Nat.factorial n := by
        rw [h₃₂]
        
        have h₃₄ : Set.ncard (Set.univ : Set (Equiv.Perm (Fin n))) = Nat.factorial n := by
          admit
        admit
      have h₃₄ : Odd (Set.ncard {s : Equiv.Perm (Fin n) | klimited k n s}) ↔ (n ≡ 0 [MOD 2*k+1] ∨ n ≡ 1 [MOD 2*k+1]) := by
        rw [h₃₃]
        have h₃₅ : n ≤ k + 1 := by admit
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
          have h₄₆ : 2 * k + 1 > k + 1 := by admit
          have h₄₇ : n < 2 * k + 1 := by admit
          cases' h₄₃ with h₄₈ h₄₈
          · 
            have h₄₉ : n ≡ 0 [MOD 2 * k + 1] := h₄₈
            have h₅₀ : n % (2 * k + 1) = 0 := by
              admit
            have h₅₁ : n < 2 * k + 1 := by admit
            have h₅₂ : n = 0 := by
              have h₅₃ : n % (2 * k + 1) = 0 := h₅₀
              have h₅₄ : n < 2 * k + 1 := h₅₁
              have h₅₅ : n = 0 := by
                admit
              admit
            have h₅₆ : n > 0 := h₁
            omega
          · 
            have h₄₉ : n ≡ 1 [MOD 2 * k + 1] := h₄₈
            have h₅₀ : n % (2 * k + 1) = 1 := by
              admit
            have h₅₁ : n < 2 * k + 1 := by admit
            have h₅₂ : n = 1 := by
              have h₅₃ : n % (2 * k + 1) = 1 := h₅₀
              have h₅₄ : n < 2 * k + 1 := h₅₁
              have h₅₅ : n = 1 := by
                admit
              admit
            admit
        have h₄₂ : n = 1 → (Odd (Nat.factorial n) ↔ (n ≡ 0 [MOD 2 * k + 1] ∨ n ≡ 1 [MOD 2 * k + 1])) := by
          intro h₄₃
          have h₄₄ : n = 1 := h₄₃
          have h₄₅ : n ≡ 1 [MOD 2 * k + 1] := by
            admit
          have h₄₆ : Odd (Nat.factorial n) := by
            admit
          have h₄₇ : (n ≡ 0 [MOD 2 * k + 1] ∨ n ≡ 1 [MOD 2 * k + 1]) := by
            admit
          admit
        have h₄₃ : n ≠ 1 → ¬(Odd (Nat.factorial n)) := by
          intro h₄₄
          have h₄₅ : n ≠ 1 := h₄₄
          have h₄₆ : n > 1 := by
            by_contra h₄₇
            have h₄₈ : n ≤ 1 := by admit
            have h₄₉ : n = 1 := by
              admit
            admit
          have h₄₇ : Even (Nat.factorial n) := by
            have h₄₈ : n ≥ 2 := by admit
            have h₄₉ : Even (Nat.factorial n) := by
              have h₅₀ : Even (Nat.factorial n) := by
                
                rw [even_iff_two_dvd]
                have h₅₁ : 2 ∣ Nat.factorial n := by
                  
                  have h₅₂ : 2 ≤ n := by admit
                  have h₅₃ : 2 ∣ Nat.factorial n := by
                    admit
                  admit
                admit
              admit
            admit
          have h₄₈ : ¬Odd (Nat.factorial n) := by
            admit
          admit
        have h₄₄ : n ≠ 1 → ¬(n ≡ 0 [MOD 2 * k + 1] ∨ n ≡ 1 [MOD 2 * k + 1]) := by
          intro h₄₅
          have h₄₆ : n ≠ 1 := h₄₅
          have h₄₇ : n > 1 := by
            by_contra h₄₈
            have h₄₉ : n ≤ 1 := by admit
            have h₅₀ : n = 1 := by
              admit
            admit
          have h₄₈ : n < 2 * k + 1 := by
            admit
          have h₄₉ : n ≠ 0 := by admit
          have h₅₀ : ¬(n ≡ 0 [MOD 2 * k + 1] ∨ n ≡ 1 [MOD 2 * k + 1]) := by
            admit
        · have h₄₆ : Odd (Nat.factorial n) ↔ (n ≡ 0 [MOD 2 * k + 1] ∨ n ≡ 1 [MOD 2 * k + 1]) := by
            admit
          cases' h₄₆ with h₄₇ h₄₇ <;> simp_all
          <;> try omega
          <;> try aesop
        · have h₄₆ : ¬(Odd (Nat.factorial n)) := by
            admit
          have h₄₇ : ¬(n ≡ 0 [MOD 2 * k + 1] ∨ n ≡ 1 [MOD 2 * k + 1]) := by
            admit
          admit
      exact h₃₄
    · 
      have h₄ : n > k + 1 := by admit
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
                admit
              have h₆₂ : ((s i) : ℤ) - i ≥ -k := by
                admit
              have h₆₃ : ((s i) : ℤ) ≤ (i : ℤ) + k := by admit
              have h₆₄ : ((s i) : ℤ) ≥ (i : ℤ) - k := by admit
              have h₆₅ : (s i : ℕ) ≤ i + k := by
                have h₆₆ : (s i : ℤ) ≤ (i : ℤ) + k := h₆₃
                have h₆₇ : (s i : ℤ) ≥ (i : ℤ) - k := h₆₄
                have h₆₈ : (s i : ℕ) ≤ i + k := by
                  by_contra h₆₉
                  have h₇₀ : i + k < (s i : ℕ) := by admit
                  have h₇₁ : (s i : ℤ) > (i : ℤ) + k := by
                    have h₇₂ : (s i : ℤ) > (i : ℤ) + k := by
                      admit
                    admit
                  admit
                admit
              have h₆₆ : (s i : ℕ) ≥ i - k := by
                have h₆₇ : (s i : ℤ) ≥ (i : ℤ) - k := h₆₄
                have h₆₈ : (s i : ℤ) ≤ (i : ℤ) + k := h₆₃
                have h₆₉ : (s i : ℕ) ≥ i - k := by
                  by_contra h₇₀
                  have h₇₁ : (s i : ℕ) < i - k := by admit
                  have h₇₂ : (s i : ℤ) < (i : ℤ) - k := by
                    have h₇₃ : (s i : ℤ) < (i : ℤ) - k := by
                      admit
                    admit
                  have h₇₄ : ((s i) : ℤ) < (i : ℤ) - k := h₇₂
                  have h₇₅ : ((s i) : ℤ) ≥ (i : ℤ) - k := by admit
                  admit
                admit
              have h₆₇ : (s i : ℕ) ≤ i + k := h₆₅
              have h₆₈ : (s i : ℕ) ≥ i - k := h₆₆
              have h₆₉ : (s i : ℕ) ≠ i := h₅₇
              have h₇₀ : (s i : ℕ) < n := (s i).is_lt
              have h₇₁ : (i : ℕ) < n := i.is_lt
              have h₇₂ : (s i : ℕ) ≤ i + k := h₆₅
              have h₇₃ : (s i : ℕ) ≥ i - k := h₆₆
              have h₇₄ : (s i : ℕ) ≠ i := h₆₉
              admit
            have h₅₇ : (s i : ℕ) = i := h₅₆
            admit
          admit
        have h₅₈ : {s : Equiv.Perm (Fin n) | klimited k n s} = {1} := by
          apply Set.Subset.antisymm
          · 
            intro s hs
            have h₅₉ : s = 1 := h₅₂ s hs
            rw [h₅₉]
            simp
          · 
            intro s hs
            have h₅₉ : s = 1 := by admit
            admit
        have h₅₉ : Set.ncard {s : Equiv.Perm (Fin n) | klimited k n s} = 1 := by
          admit
        have h₆₀ : Odd (Set.ncard {s : Equiv.Perm (Fin n) | klimited k n s}) := by
          admit
        have h₆₁ : n ≡ 0 [MOD 2*k+1] ∨ n ≡ 1 [MOD 2*k+1] := by
          exfalso
          
          
          have h₆₂ := h₅₂ (Equiv.swap (⟨0, by omega⟩ : Fin n) ⟨1, by omega⟩)
          have h₆₃ : klimited k n (Equiv.swap (⟨0, by omega⟩ : Fin n) ⟨1, by omega⟩) → False := by
            intro h₆₄
            have h₆₅ := h₆₄
            admit
          admit
        admit
      admit
  admit