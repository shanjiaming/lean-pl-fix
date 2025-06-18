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

theorem mathd_algebra_362 (a b : ℝ) (h₀ : a ^ 2 * b ^ 3 = 32 / 27) (h₁ : a / b ^ 3 = 27 / 4) :
    a + b = 8 / 3 := by
  have hb3 : b ≠ 0 := by
    by_contra h
    have h₂ : b = 0 := by linarith
    admit
  
  have a_eq : a = (27 / 4 : ℝ) * b ^ 3 := by
    have h₂ : b ^ 3 ≠ 0 := by
      nlinarith
    
    have h₃ : a = (27 / 4 : ℝ) * b ^ 3 := by
      
      have h₄ : a / b ^ 3 = 27 / 4 := h₁
      
      have h₅ : a = (27 / 4 : ℝ) * b ^ 3 := by
        admit
      
      linarith
    linarith
  
  have b9_eq : b ^ 9 = (2 / 3 : ℝ) ^ 9 := by
    have h₂ : a = (27 / 4 : ℝ) * b ^ 3 := a_eq
    rw [h₂] at h₀
    have h₃ : ((27 / 4 : ℝ) * b ^ 3) ^ 2 * b ^ 3 = 32 / 27 := by
      linarith
    have h₄ : b ^ 9 = (2 / 3 : ℝ) ^ 9 := by
      linarith
    linarith
  
  have b_eq : b = 2 / 3 := by
    have h₂ : b ^ 9 = (2 / 3 : ℝ) ^ 9 := b9_eq
    have h₃ : b = 2 / 3 := by
      have h₄ : b > 0 ∨ b < 0 := by
        by_cases h₅ : b > 0
        · exact Or.inl h₅
        · have h₆ : b < 0 := by
            by_contra h₇
            have h₈ : b ≥ 0 := by linarith
            have h₉ : b = 0 := by
              by_contra h₁₀
              have h₁₁ : b > 0 := by
                by_cases h₁₂ : b > 0
                · exact h₁₂
                · exfalso
                  have h₁₃ : b < 0 := by
                    by_contra h₁₄
                    have h₁₅ : b ≥ 0 := by linarith
                    have h₁₆ : b ≠ 0 := by simpa
                    have h₁₇ : b > 0 := by
                      positivity
                    linarith
                  linarith
              have h₁₂ : b > 0 := by linarith
              have h₁₃ : a = (27 / 4 : ℝ) * b ^ 3 := a_eq
              have h₁₄ : a ^ 2 * b ^ 3 = 32 / 27 := h₀
              have h₁₅ : a / b ^ 3 = 27 / 4 := h₁
              linarith
            norm_cast
          admit
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
                  have h₁₂ : b ≤ 2 / 3 := by linarith
                  have h₁₃ : b ^ 9 ≤ (2 / 3 : ℝ) ^ 9 := by
                    linarith
                  linarith
              have h₁₁ : b ^ 9 > (2 / 3 : ℝ) ^ 9 := by
                admit
              linarith
            · 
              by_contra h₉
              have h₁₀ : b < 2 / 3 := by
                by_cases h₁₁ : b < 2 / 3
                · exact h₁₁
                · exfalso
                  have h₁₂ : b ≥ 2 / 3 := by linarith
                  have h₁₃ : b ^ 9 ≥ (2 / 3 : ℝ) ^ 9 := by
                    linarith
                  linarith
              have h₁₁ : b ^ 9 < (2 / 3 : ℝ) ^ 9 := by
                admit
              linarith
          linarith
        exact h₆
      | inr h₄ =>
        
        have h₅ : b < 0 := h₄
        have h₆ : b ^ 9 < 0 := by
          
          have h₇ : b ^ 9 < 0 := by
            admit
          linarith
        have h₇ : (2 / 3 : ℝ) ^ 9 > 0 := by norm_num
        linarith
    linarith
  
  have a_eq₂ : a = 2 := by
    admit
  
  have h₂ : a + b = 8 / 3 := by
    linarith
  
  linarith
