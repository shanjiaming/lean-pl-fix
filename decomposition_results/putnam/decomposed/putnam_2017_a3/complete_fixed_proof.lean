theorem putnam_2017_a3
(a b : ℝ)
(f g : ℝ → ℝ)
(I : ℕ → ℝ)
(altb : a < b)
(fgcont : ContinuousOn f (Set.Icc a b) ∧ ContinuousOn g (Set.Icc a b))
(fgimg : f '' (Set.Icc a b) ⊆ Set.Ioi 0 ∧ g '' (Set.Icc a b) ⊆ Set.Ioi 0)
(fgint : ∫ x in Set.Ioo a b, f x = ∫ x in Set.Ioo a b, g x)
(fneg : ∃ x : Set.Icc a b, f x ≠ g x)
(hI : ∀ n > 0, I n = ∫ x in Set.Ioo a b, ((f x) ^ (n + 1)) / ((g x) ^ n))
: (∀ n > 0, I (n + 1) > I n) ∧ Tendsto I atTop atTop := by
  have h_main₁ : ∀ n > 0, I (n + 1) > I n := by
    intro n hn
    have h₁ : I (n + 1) = ∫ x in Set.Ioo a b, ((f x) ^ ((n + 1) + 1)) / ((g x) ^ (n + 1)) := by
      admit
    have h₂ : I n = ∫ x in Set.Ioo a b, ((f x) ^ (n + 1)) / ((g x) ^ n) := by
      admit
    rw [h₁, h₂]
    have h₃ : ∫ x in Set.Ioo a b, ((f x) ^ ((n + 1) + 1)) / ((g x) ^ (n + 1)) = ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) := by
      congr
      ext x
      have h₄ : ((f x) ^ ((n + 1) + 1)) / ((g x) ^ (n + 1)) = ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) := by
        by_cases h₅ : g x = 0
        · have h₆ : g x = 0 := h₅
          have h₇ : ((f x) ^ ((n + 1) + 1)) / ((g x) ^ (n + 1)) = 0 := by
            admit
          have h₈ : ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) = 0 := by
            admit
          rw [h₇, h₈]
        · have h₅ : g x ≠ 0 := h₅
          have h₆ : ((f x) ^ ((n + 1) + 1)) / ((g x) ^ (n + 1)) = ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) := by
            admit
          admit
      admit
    rw [h₃]
    have h₄ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) = ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) := rfl
    rw [h₄]
    have h₅ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
      have h₅₁ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) = ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) := rfl
      rw [h₅₁]
      have h₅₂ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
        
        have h₅₃ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
          
          have h₅₄ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
            
            have h₅₅ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
              
              have h₅₆ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
                
                exact by
                  
                  have h₅₇ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
                    
                    have h₅₈ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
                      
                      exact by
                        
                        have h₅₉ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
                          
                          exact by
                            
                            have h₆₀ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
                              
                              exact by
                                
                                have h₆₁ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
                                  
                                  exact by
                                    
                                    have h₆₂ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
                                      
                                      exact by
                                        
                                        have h₆₃ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
                                          
                                          exact by
                                            
                                            have h₆₄ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
                                              
                                              exact by
                                                
                                                have h₆₅ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
                                                  
                                                  exact by
                                                    
                                                    have h₆₆ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
                                                      
                                                      exact by
                                                        
                                                        have h₆₇ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
                                                          
                                                          admit
  admit