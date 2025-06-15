theorem integral_solutions_of_x2_minus_py2_eq_minus_1 {p : ℕ} (hp : Nat.Prime p) : (∃ (x y : ℤ), x^2 - p * y^2 = -1) ↔ p = 2 ∨ p % 4 = 1 := by
  have h_forward : (∃ (x y : ℤ), x^2 - p * y^2 = -1) → p = 2 ∨ p % 4 = 1 := by
    intro h
    have h₁ : p = 2 ∨ p % 4 = 1 := by
      by_contra h₂
      
      have h₃ : p ≠ 2 := by admit
      have h₄ : p % 4 ≠ 1 := by admit
      
      have h₅ : p % 4 = 3 := by
        have h₅₁ := Nat.Prime.eq_one_or_self_of_dvd hp 2
        have h₅₂ : p % 4 = 3 := by
          have h₅₃ : p % 4 = 0 ∨ p % 4 = 1 ∨ p % 4 = 2 ∨ p % 4 = 3 := by admit
          admit
        admit
      
      rcases h with ⟨x, y, h₁⟩
      
      have h₂ := congr_arg (fun x => x % 4) h₁
      simp at h₂
      have h₃ : x % 4 = 0 ∨ x % 4 = 1 ∨ x % 4 = 2 ∨ x % 4 = 3 := by admit
      have h₄ : y % 4 = 0 ∨ y % 4 = 1 ∨ y % 4 = 2 ∨ y % 4 = 3 := by admit
      admit
    admit
  have h_backward : p = 2 ∨ p % 4 = 1 → (∃ (x y : ℤ), x^2 - p * y^2 = -1) := by
    intro h
    have h₁ : ∃ (x y : ℤ), x^2 - p * y^2 = -1 := by
      cases h with
      | inl h₂ =>
        
        have h₃ : p = 2 := h₂
        
        have h₄ : ∃ (x y : ℤ), x^2 - p * y^2 = -1 := by
          admit
        exact h₄
      | inr h₂ =>
        
        have h₃ : p % 4 = 1 := h₂
        
        
        
        have h₄ : p ≡ 1 [MOD 4] := by
          admit
        
        have h₅ : ∃ (x y : ℤ), x^2 - p * y^2 = -1 := by
          
          
          
          
          
          
          have h₅₁ : p % 4 = 1 := h₃
          
          
          
          
          
          have h₅₂ : p = 5 → ∃ (x y : ℤ), x^2 - p * y^2 = -1 := by
            admit
          have h₅₃ : p = 13 → ∃ (x y : ℤ), x^2 - p * y^2 = -1 := by
            admit
          have h₅₄ : p = 17 → ∃ (x y : ℤ), x^2 - p * y^2 = -1 := by
            admit
          
          
          
          
          have h₅₅ : p = 29 → ∃ (x y : ℤ), x^2 - p * y^2 = -1 := by
            admit
          
          
          
          have h₅₆ : ∃ (x y : ℤ), x^2 - p * y^2 = -1 := by
            
            
            
            have h₅₇ : p % 4 = 1 := h₃
            have h₅₈ : p = 5 ∨ p = 13 ∨ p = 17 ∨ p = 29 := by
              have h₅₉ := Nat.Prime.two_le hp
              have h₆₀ : p % 4 = 1 := h₃
              have h₆₁ : p ≠ 2 := by
                admit
              have h₆₂ : p ≠ 3 := by
                admit
              have h₆₃ : p ≠ 7 := by
                admit
              have h₆₄ : p ≠ 11 := by
                admit
              have h₆₅ : p ≠ 19 := by
                admit
              have h₆₆ : p ≠ 23 := by
                admit
              
              
              have h₆₇ : p = 5 ∨ p = 13 ∨ p = 17 ∨ p = 29 := by
                have h₆₈ := Nat.Prime.eq_one_or_self_of_dvd hp 2
                have h₆₉ := Nat.Prime.eq_one_or_self_of_dvd hp 3
                have h₇₀ := Nat.Prime.eq_one_or_self_of_dvd hp 5
                have h₇₁ := Nat.Prime.eq_one_or_self_of_dvd hp 7
                have h₇₂ := Nat.Prime.eq_one_or_self_of_dvd hp 11
                have h₇₃ := Nat.Prime.eq_one_or_self_of_dvd hp 13
                have h₇₄ := Nat.Prime.eq_one_or_self_of_dvd hp 17
                have h₇₅ := Nat.Prime.eq_one_or_self_of_dvd hp 19
                have h₇₆ := Nat.Prime.eq_one_or_self_of_dvd hp 23
                have h₇₇ := Nat.Prime.eq_one_or_self_of_dvd hp 29
                admit
              admit
            admit
          admit
        exact h₅
    admit
  admit