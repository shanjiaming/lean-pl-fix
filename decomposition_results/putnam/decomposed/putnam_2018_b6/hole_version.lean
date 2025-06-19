macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)

theorem putnam_2018_b6
  (S : Finset (Fin 2018 → ℤ))
  (hS : S = {s : Fin 2018 → ℤ | (∀ i : Fin 2018, s i ∈ ({1, 2, 3, 4, 5, 6, 10} : Set ℤ)) ∧ (∑ i : Fin 2018, s i) = 3860}) :
  S.card ≤ 2 ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by
  have h_card_ub : S.card ≤ 2 ^ 2018 := by
    have h₁ : S = ∅ := by
      hole_1
    hole_2
  
  have h_card_real : (S.card : ℝ) ≤ (2 : ℝ) ^ 2018 := by
    have h₁ : (S.card : ℝ) ≤ (2 : ℝ) ^ 2018 := by
      hole_3
    hole_4
  
  have h_bound : (2 : ℝ) ^ 2018 ≤ (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by
    have h₁ : (2 : ℝ) ^ 2018 ≤ (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by
      
      have h₂ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 = (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by hole_5
      rw [h₂]
      have h₃ : (2 : ℝ) ^ 2018 ≤ (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by
        have h₄ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 = (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by hole_6
        rw [h₄]
        have h₅ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 := by
          
          have h₆ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 := by
            
            have h₇ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 := by
              
              have h₈ : (2018 : ℝ) / 2048 > 0 := by hole_7
              have h₉ : (2 : ℝ) ^ 3860 > 0 := by hole_8
              have h₁₀ : ((2018 : ℝ) / 2048 : ℝ) ^ 2018 > 0 := by hole_9
              have h₁₁ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 > 0 := by hole_10
              have h₁₂ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 := by
                
                have h₁₃ : ((2018 : ℝ) / 2048 : ℝ) < 1 := by hole_11
                have h₁₄ : ((2018 : ℝ) / 2048 : ℝ) ^ 2018 > 0 := by hole_12
                have h₁₅ : (2 : ℝ) ^ 3860 ≥ (2 : ℝ) ^ 2018 := by
                  
                  hole_13
                have h₁₆ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 := by
                  
                  hole_17
                hole_18
              hole_19
            hole_20
          have h₂₀ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 := by
            
            have h₂₁ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 := by
              
              have h₂₂ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 := by
                
                have h₂₃ : ((2018 : ℝ) / 2048 : ℝ) < 1 := by hole_21
                have h₂₄ : ((2018 : ℝ) / 2048 : ℝ) ^ 2018 > 0 := by hole_22
                have h₂₅ : (2 : ℝ) ^ 3860 ≥ (2 : ℝ) ^ 2018 := by
                  
                  hole_23
                have h₂₆ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 := by
                  
                  hole_27
                hole_28
              hole_29
            hole_30
          hole_31
        hole_32
      hole_33
    hole_34
  
  have h_main : (S.card : ℝ) ≤ (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by
    have h₁ : (S.card : ℝ) ≤ (2 : ℝ) ^ 2018 := h_card_real
    have h₂ : (2 : ℝ) ^ 2018 ≤ (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := h_bound
    have h₃ : (S.card : ℝ) ≤ (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by
      hole_35
    hole_36
  
  have h_final : S.card ≤ 2 ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by
    
    have h₁ : (S.card : ℝ) ≤ (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := h_main
    have h₂ : S.card ≤ 2 ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by
      
      hole_37
    hole_38
  
  hole_39