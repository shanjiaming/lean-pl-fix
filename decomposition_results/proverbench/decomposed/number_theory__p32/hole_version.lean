macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem integral_solutions_of_x2_minus_py2_eq_minus_1 {p : ℕ} (hp : Nat.Prime p) : (∃ (x y : ℤ), x^2 - p * y^2 = -1) ↔ p = 2 ∨ p % 4 = 1 := by
  have h_forward : (∃ (x y : ℤ), x^2 - p * y^2 = -1) → p = 2 ∨ p % 4 = 1 := by
    intro h
    have h₁ : p = 2 ∨ p % 4 = 1 := by
      by_contra h₂
      
      have h₃ : p ≠ 2 := by hole_4
      have h₄ : p % 4 ≠ 1 := by hole_5
      
      have h₅ : p % 4 = 3 := by
        have h₅₁ := Nat.Prime.eq_one_or_self_of_dvd hp 2
        have h₅₂ : p % 4 = 3 := by
          have h₅₃ : p % 4 = 0 ∨ p % 4 = 1 ∨ p % 4 = 2 ∨ p % 4 = 3 := by hole_8
          hole_7
        hole_6
      
      rcases h with ⟨x, y, h₁⟩
      
      have h₂ := congr_arg (fun x => x % 4) h₁
      simp at h₂
      have h₃ : x % 4 = 0 ∨ x % 4 = 1 ∨ x % 4 = 2 ∨ x % 4 = 3 := by hole_9
      have h₄ : y % 4 = 0 ∨ y % 4 = 1 ∨ y % 4 = 2 ∨ y % 4 = 3 := by hole_10
      hole_3
    hole_2
  have h_backward : p = 2 ∨ p % 4 = 1 → (∃ (x y : ℤ), x^2 - p * y^2 = -1) := by
    intro h
    have h₁ : ∃ (x y : ℤ), x^2 - p * y^2 = -1 := by
      cases h with
      | inl h₂ =>
        
        have h₃ : p = 2 := h₂
        
        have h₄ : ∃ (x y : ℤ), x^2 - p * y^2 = -1 := by
          hole_13
        exact h₄
      | inr h₂ =>
        
        have h₃ : p % 4 = 1 := h₂
        
        
        
        have h₄ : p ≡ 1 [MOD 4] := by
          hole_14
        
        have h₅ : ∃ (x y : ℤ), x^2 - p * y^2 = -1 := by
          
          
          
          
          
          
          have h₅₁ : p % 4 = 1 := h₃
          
          
          
          
          
          have h₅₂ : p = 5 → ∃ (x y : ℤ), x^2 - p * y^2 = -1 := by
            hole_16
          have h₅₃ : p = 13 → ∃ (x y : ℤ), x^2 - p * y^2 = -1 := by
            hole_17
          have h₅₄ : p = 17 → ∃ (x y : ℤ), x^2 - p * y^2 = -1 := by
            hole_18
          
          
          
          
          have h₅₅ : p = 29 → ∃ (x y : ℤ), x^2 - p * y^2 = -1 := by
            hole_19
          
          
          
          have h₅₆ : ∃ (x y : ℤ), x^2 - p * y^2 = -1 := by
            
            
            
            have h₅₇ : p % 4 = 1 := h₃
            have h₅₈ : p = 5 ∨ p = 13 ∨ p = 17 ∨ p = 29 := by
              have h₅₉ := Nat.Prime.two_le hp
              have h₆₀ : p % 4 = 1 := h₃
              have h₆₁ : p ≠ 2 := by
                hole_22
              have h₆₂ : p ≠ 3 := by
                hole_23
              have h₆₃ : p ≠ 7 := by
                hole_24
              have h₆₄ : p ≠ 11 := by
                hole_25
              have h₆₅ : p ≠ 19 := by
                hole_26
              have h₆₆ : p ≠ 23 := by
                hole_27
              
              
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
                hole_28
              hole_21
            hole_20
          hole_15
        exact h₅
    hole_11
  hole_1