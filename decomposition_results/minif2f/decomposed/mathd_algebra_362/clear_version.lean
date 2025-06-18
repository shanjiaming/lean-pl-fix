macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_43" : tactic => `(tactic| admit)
macro "hole_44" : tactic => `(tactic| admit)
macro "hole_45" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_46" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_47" : tactic => `(tactic| admit)
macro "hole_48" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_algebra_362 (a b : ℝ) (h₀ : a ^ 2 * b ^ 3 = 32 / 27) (h₁ : a / b ^ 3 = 27 / 4) :
    a + b = 8 / 3 := by
  have hb3 : b ≠ 0 := by
    by_contra h
    have h₂ : b = 0 := by hole_3
    hole_2
  clear hb3
  have hb3 : b ≠ 0 := skip_hole
  
  have a_eq : a = (27 / 4 : ℝ) * b ^ 3 := by
    have h₂ : b ^ 3 ≠ 0 := by
      hole_5
    clear h₂
    have h₂ : b ^ 3 ≠ 0 := skip_hole
    
    have h₃ : a = (27 / 4 : ℝ) * b ^ 3 := by
      
      have h₄ : a / b ^ 3 = 27 / 4 := h₁
      
      have h₅ : a = (27 / 4 : ℝ) * b ^ 3 := by
        hole_7
      
      hole_6
    hole_4
  
  have b9_eq : b ^ 9 = (2 / 3 : ℝ) ^ 9 := by
    have h₂ : a = (27 / 4 : ℝ) * b ^ 3 := a_eq
    rw [h₂] at h₀
    have h₃ : ((27 / 4 : ℝ) * b ^ 3) ^ 2 * b ^ 3 = 32 / 27 := by
      hole_9
    have h₄ : b ^ 9 = (2 / 3 : ℝ) ^ 9 := by
      hole_10
    hole_8
  
  have b_eq : b = 2 / 3 := by
    have h₂ : b ^ 9 = (2 / 3 : ℝ) ^ 9 := b9_eq
    have h₃ : b = 2 / 3 := by
      have h₄ : b > 0 ∨ b < 0 := by
        by_cases h₅ : b > 0
        · exact Or.inl h₅
        · have h₆ : b < 0 := by
            by_contra h₇
            have h₈ : b ≥ 0 := by hole_15
            have h₉ : b = 0 := by
              by_contra h₁₀
              have h₁₁ : b > 0 := by
                by_cases h₁₂ : b > 0
                · exact h₁₂
                · exfalso
                  have h₁₃ : b < 0 := by
                    by_contra h₁₄
                    have h₁₅ : b ≥ 0 := by hole_19
                    have h₁₆ : b ≠ 0 := by hole_20
                    have h₁₇ : b > 0 := by
                      hole_21
                    clear h₁₇
                    have h₁₇ : b > 0 := skip_hole
                    hole_18
                  clear h₁₃
                  have h₁₃ : b < 0 := skip_hole
                  hole_17
              clear h₁₁
              have h₁₁ : b > 0 := skip_hole
              have h₁₂ : b > 0 := by hole_22
              have h₁₃ : a = (27 / 4 : ℝ) * b ^ 3 := a_eq
              have h₁₄ : a ^ 2 * b ^ 3 = 32 / 27 := h₀
              have h₁₅ : a / b ^ 3 = 27 / 4 := h₁
              hole_16
            hole_14
        clear h₆
        have h₆ : b < 0 := skip_hole
          hole_13
      clear h₄
      have h₄ : b > 0 ∨ b < 0 := skip_hole
      cases h₄ with
      | inl h₄ =>
        
        have h₅ : b > 0 := h₄
        have h₆ : b = 2 / 3 := by
          
          have h₇ : b ^ 9 = (2 / 3 : ℝ) ^ 9 := h₂
          have h₈ : b = 2 / 3 := by
            
            apply le_antisymm
            · 
              by_contra h₉
              have h₁₀ : b > 2 / 3 := by
                by_cases h₁₁ : b > 2 / 3
                · exact h₁₁
                · exfalso
                  have h₁₂ : b ≤ 2 / 3 := by hole_26
              clear h₁₂
              have h₁₂ : b ≤ 2 / 3 := skip_hole
                  have h₁₃ : b ^ 9 ≤ (2 / 3 : ℝ) ^ 9 := by
                    hole_27
                  hole_25
              clear h₁₀
              have h₁₀ : b > 2 / 3 := skip_hole
              have h₁₁ : b ^ 9 > (2 / 3 : ℝ) ^ 9 := by
                hole_28
              linarith
            · 
              by_contra h₉
              have h₁₀ : b < 2 / 3 := by
                by_cases h₁₁ : b < 2 / 3
                · exact h₁₁
                · exfalso
                  have h₁₂ : b ≥ 2 / 3 := by hole_30
                  have h₁₃ : b ^ 9 ≥ (2 / 3 : ℝ) ^ 9 := by
                    hole_31
                  hole_29
              have h₁₁ : b ^ 9 < (2 / 3 : ℝ) ^ 9 := by
                hole_32
              hole_24
          hole_23
        exact h₆
      | inr h₄ =>
        
        have h₅ : b < 0 := h₄
        have h₆ : b ^ 9 < 0 := by
          
          have h₇ : b ^ 9 < 0 := by
            hole_34
          clear h₇
          have h₇ : b ^ 9 < 0 := skip_hole
          hole_33
        have h₇ : (2 / 3 : ℝ) ^ 9 > 0 := by hole_46
        linarith
    hole_11
  
  have a_eq₂ : a = 2 := by
    hole_47
  
  have h₂ : a + b = 8 / 3 := by
    hole_48
  
  hole_1