macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)

macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)

theorem putnam_2018_b6
  (S : Finset (Fin 2018 → ℤ))
  (hS : S = {s : Fin 2018 → ℤ | (∀ i : Fin 2018, s i ∈ ({1, 2, 3, 4, 5, 6, 10} : Set ℤ)) ∧ (∑ i : Fin 2018, s i) = 3860}) :
  S.card ≤ 2 ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by
  have h_card_ub : S.card ≤ 2 ^ 2018 := by
    have h₁ : S = ∅ := by
      admit
    admit
  
  have h_card_real : (S.card : ℝ) ≤ (2 : ℝ) ^ 2018 := by
    have h₁ : (S.card : ℝ) ≤ (2 : ℝ) ^ 2018 := by
      admit
    linarith
  
  have h_bound : (2 : ℝ) ^ 2018 ≤ (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by
    have h₁ : (2 : ℝ) ^ 2018 ≤ (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by
      
      have h₂ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 = (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by norm_num
      rw [h₂]
      have h₃ : (2 : ℝ) ^ 2018 ≤ (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by
        have h₄ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 = (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by norm_num
        rw [h₄]
        have h₅ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 := by
          
          have h₆ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 := by
            
            have h₇ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 := by
              
              have h₈ : (2018 : ℝ) / 2048 > 0 := by norm_num
              have h₉ : (2 : ℝ) ^ 3860 > 0 := by norm_num
              have h₁₀ : ((2018 : ℝ) / 2048 : ℝ) ^ 2018 > 0 := by norm_num
              have h₁₁ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 > 0 := by norm_num
              have h₁₂ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 := by
                
                have h₁₃ : ((2018 : ℝ) / 2048 : ℝ) < 1 := by norm_num
                have h₁₄ : ((2018 : ℝ) / 2048 : ℝ) ^ 2018 > 0 := by norm_num
                have h₁₅ : (2 : ℝ) ^ 3860 ≥ (2 : ℝ) ^ 2018 := by
                  
                  norm_num
                have h₁₆ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 := by
                  
                  norm_num
                norm_num
              norm_num
            norm_num
          have h₂₀ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 := by
            
            have h₂₁ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 := by
              
              have h₂₂ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 := by
                
                have h₂₃ : ((2018 : ℝ) / 2048 : ℝ) < 1 := by norm_num
                have h₂₄ : ((2018 : ℝ) / 2048 : ℝ) ^ 2018 > 0 := by norm_num
                have h₂₅ : (2 : ℝ) ^ 3860 ≥ (2 : ℝ) ^ 2018 := by
                  
                  norm_num
                have h₂₆ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 := by
                  
                  norm_num
                norm_num
              norm_num
            norm_num
          norm_num
        norm_num
      norm_num
    norm_num
  
  have h_main : (S.card : ℝ) ≤ (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by
    have h₁ : (S.card : ℝ) ≤ (2 : ℝ) ^ 2018 := h_card_real
    have h₂ : (2 : ℝ) ^ 2018 ≤ (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := h_bound
    have h₃ : (S.card : ℝ) ≤ (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by
      linarith
    linarith
  
  have h_final : S.card ≤ 2 ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by
    
    have h₁ : (S.card : ℝ) ≤ (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := h_main
    have h₂ : S.card ≤ 2 ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by
      
      linarith
    linarith
  
  linarith
