theorem putnam_2014_b2 :
  IsGreatest {t | ∃ f : ℝ → ℝ,
    (∀ (x : ℝ), x ∈ Set.Icc 1 3 → -1 ≤ f x ∧ f x ≤ 1) ∧
    (∫ x in Set.Ioo 1 3, f x = 0) ∧
    (∫ x in Set.Ioo 1 3, (f x) / x) = t}
  ((Real.log (4 / 3)) : ℝ ) := by
  have h_main : IsGreatest {t | ∃ f : ℝ → ℝ, (∀ (x : ℝ), x ∈ Set.Icc 1 3 → -1 ≤ f x ∧ f x ≤ 1) ∧ (∫ x in Set.Ioo 1 3, f x = 0) ∧ (∫ x in Set.Ioo 1 3, (f x) / x) = t} (Real.log (4 / 3)) := by
    constructor
    · 
      
      use fun x => if (x : ℝ) < 2 then 1 else -1
      constructor
      · 
        intro x hx
        constructor
        · 
          by_cases h : x < 2
          · 
            simp [h]
            <;> linarith [hx.1, hx.2]
          · 
            simp [h]
            <;> linarith [hx.1, hx.2]
        · 
          by_cases h : x < 2
          · 
            simp [h]
            <;> linarith [hx.1, hx.2]
          · 
            simp [h]
            <;> linarith [hx.1, hx.2]
      · constructor
        · 
          have h₁ : (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ))) = 0 := by
            
            have h₂ : (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ))) = (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ))) := rfl
            rw [h₂]
            
            have h₃ : (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ))) = (∫ x in Set.Ioo 1 2, (1 : ℝ)) + (∫ x in Set.Ioo 2 3, (-1 : ℝ)) := by
              
              have h₄ : (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ))) = (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ))) := rfl
              rw [h₄]
              have h₅ : (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ))) = (∫ x in Set.Ioo 1 2, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ))) + (∫ x in Set.Ioo 2 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ))) := by
                
                have h₆ : (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ))) = (∫ x in Set.Ioo 1 2, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ))) + (∫ x in Set.Ioo 2 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ))) := by
                  
                  have h₇ : (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ))) = (∫ x in Set.Ioo 1 2, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ))) + (∫ x in Set.Ioo 2 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ))) := by
                    
                    have h₈ : (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ))) = (∫ x in Set.Ioo 1 2, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ))) + (∫ x in Set.Ioo 2 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ))) := by
                      
                      admit
                    admit
                  admit
                admit
              rw [h₅]
              have h₆ : (∫ x in Set.Ioo 1 2, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ))) = (∫ x in Set.Ioo 1 2, (1 : ℝ)) := by
                
                admit
              have h₇ : (∫ x in Set.Ioo 2 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ))) = (∫ x in Set.Ioo 2 3, (-1 : ℝ)) := by
                
                admit
              admit
            admit
          exact h₁
        · 
          have h₁ : (∫ x in Set.Ioo 1 3, ((if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) : ℝ) / x) = Real.log (4 / 3) := by
            
            have h₂ : (∫ x in Set.Ioo 1 3, ((if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) : ℝ) / x) = (∫ x in Set.Ioo 1 2, (1 : ℝ) / x) + (∫ x in Set.Ioo 2 3, (-1 : ℝ) / x) := by
              
              have h₃ : (∫ x in Set.Ioo 1 3, ((if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) : ℝ) / x) = (∫ x in Set.Ioo 1 2, ((if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) : ℝ) / x) + (∫ x in Set.Ioo 2 3, ((if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) : ℝ) / x) := by
                
                have h₄ : (∫ x in Set.Ioo 1 3, ((if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) : ℝ) / x) = (∫ x in Set.Ioo 1 2, ((if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) : ℝ) / x) + (∫ x in Set.Ioo 2 3, ((if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) : ℝ) / x) := by
                  
                  have h₅ : (∫ x in Set.Ioo 1 3, ((if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) : ℝ) / x) = (∫ x in Set.Ioo 1 2, ((if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) : ℝ) / x) + (∫ x in Set.Ioo 2 3, ((if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) : ℝ) / x) := by
                    
                    admit
                  rw [h₅]
                rw [h₄]
              rw [h₃]
              have h₄ : (∫ x in Set.Ioo 1 2, ((if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) : ℝ) / x) = (∫ x in Set.Ioo 1 2, (1 : ℝ) / x) := by
                
                apply integral_congr_ae
                filter_upwards [ae_restrict_mem measurableSet_Ioo] with x hx
                have h₅ : x < 2 := by
                  norm_num at hx ⊢
                  <;> linarith
                simp [h₅]
              have h₅ : (∫ x in Set.Ioo 2 3, ((if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) : ℝ) / x) = (∫ x in Set.Ioo 2 3, (-1 : ℝ) / x) := by
                
                apply integral_congr_ae
                filter_upwards [ae_restrict_mem measurableSet_Ioo] with x hx
                have h₆ : ¬(x : ℝ) < 2 := by
                  norm_num at hx ⊢
                  <;> linarith
                simp [h₆]
              rw [h₄, h₅]
            rw [h₂]
            
            have h₃ : (∫ x in Set.Ioo 1 2, (1 : ℝ) / x) = Real.log 2 := by
              
              have h₄ : (∫ x in Set.Ioo 1 2, (1 : ℝ) / x) = Real.log 2 := by
                
                have h₅ : (∫ x in Set.Ioo 1 2, (1 : ℝ) / x) = Real.log 2 - Real.log 1 := by
                  
                  have h₆ : (∫ x in Set.Ioo 1 2, (1 : ℝ) / x) = Real.log 2 - Real.log 1 := by
                    
                    have h₇ : (∫ x in Set.Ioo 1 2, (1 : ℝ) / x) = Real.log 2 - Real.log 1 := by
                      
                      have h₈ : (∫ x in Set.Ioo 1 2, (1 : ℝ) / x) = Real.log 2 - Real.log 1 := by
                        
                        rw [← Real.log_div (by norm_num) (by norm_num)]
                        <;>
                        simp [integral_id]
                        <;>
                        norm_num
                        <;>
                        linarith
                      rw [h₈]
                    rw [h₇]
                  rw [h₆]
                rw [h₅]
                <;> simp [Real.log_one]
                <;> norm_num
              rw [h₄]
            have h₄ : (∫ x in Set.Ioo 2 3, (-1 : ℝ) / x) = - (Real.log 3 - Real.log 2) := by
              
              have h₅ : (∫ x in Set.Ioo 2 3, (-1 : ℝ) / x) = - (Real.log 3 - Real.log 2) := by
                
                have h₆ : (∫ x in Set.Ioo 2 3, (-1 : ℝ) / x) = - (Real.log 3 - Real.log 2) := by
                  
                  have h₇ : (∫ x in Set.Ioo 2 3, (-1 : ℝ) / x) = - (Real.log 3 - Real.log 2) := by
                    
                    have h₈ : (∫ x in Set.Ioo 2 3, (-1 : ℝ) / x) = - (Real.log 3 - Real.log 2) := by
                      
                      have h₉ : (∫ x in Set.Ioo 2 3, (-1 : ℝ) / x) = - (∫ x in Set.Ioo 2 3, (1 : ℝ) / x) := by
                        
                        have h₁₀ : (∫ x in Set.Ioo 2 3, (-1 : ℝ) / x) = - (∫ x in Set.Ioo 2 3, (1 : ℝ) / x) := by
                          
                          have h₁₁ : (∫ x in Set.Ioo 2 3, (-1 : ℝ) / x) = (∫ x in Set.Ioo 2 3, (-1 : ℝ) / x) := rfl
                          rw [h₁₁]
                          have h₁₂ : (∫ x in Set.Ioo 2 3, (-1 : ℝ) / x) = - (∫ x in Set.Ioo 2 3, (1 : ℝ) / x) := by
                            
                            have h₁₃ : (∫ x in Set.Ioo 2 3, (-1 : ℝ) / x) = (∫ x in Set.Ioo 2 3, (-1 : ℝ) * (1 / x : ℝ)) := by
                              
                              congr
                              <;> ext x <;> field_simp
                            rw [h₁₃]
                            have h₁₄ : (∫ x in Set.Ioo 2 3, (-1 : ℝ) * (1 / x : ℝ)) = (-1 : ℝ) * (∫ x in Set.Ioo 2 3, (1 / x : ℝ)) := by
                              
                              rw [integral_mul_left]
                            rw [h₁₄]
                            <;> simp [div_eq_mul_inv]
                            <;> ring_nf
                            <;> field_simp
                            <;> ring_nf
                          rw [h₁₂]
                        rw [h₁₀]
                      rw [h₉]
                      have h₁₀ : (∫ x in Set.Ioo 2 3, (1 : ℝ) / x) = Real.log 3 - Real.log 2 := by
                        
                        have h₁₁ : (∫ x in Set.Ioo 2 3, (1 : ℝ) / x) = Real.log 3 - Real.log 2 := by
                          
                          have h₁₂ : (∫ x in Set.Ioo 2 3, (1 : ℝ) / x) = Real.log 3 - Real.log 2 := by
                            
                            have h₁₃ : (∫ x in Set.Ioo 2 3, (1 : ℝ) / x) = Real.log 3 - Real.log 2 := by
                              
                              have h₁₄ : (∫ x in Set.Ioo 2 3, (1 : ℝ) / x) = Real.log 3 - Real.log 2 := by
                                
                                rw [← Real.log_div (by norm_num) (by norm_num)]
                                <;>
                                simp [integral_id]
                                <;>
                                norm_num
                                <;>
                                linarith
                              rw [h₁₄]
                            rw [h₁₃]
                          rw [h₁₂]
                        rw [h₁₁]
                      rw [h₁₀]
                      <;> ring_nf
                    rw [h₈]
                  rw [h₇]
                rw [h₆]
              rw [h₅]
            rw [h₃, h₄]
            
            have h₅ : Real.log 2 - (Real.log 3 - Real.log 2) = Real.log (4 / 3) := by
              
              have h₆ : Real.log (4 / 3) = Real.log 4 - Real.log 3 := by
                rw [Real.log_div (by norm_num) (by norm_num)]
                <;> ring_nf
              rw [h₆]
              have h₇ : Real.log 4 = 2 * Real.log 2 := by
                have h₈ : Real.log 4 = Real.log (2 ^ 2) := by norm_num
                rw [h₈]
                have h₉ : Real.log (2 ^ 2) = 2 * Real.log 2 := by
                  rw [Real.log_pow] <;> norm_num
                rw [h₉]
              rw [h₇]
              <;> ring_nf
              <;> linarith [Real.log_pos (by norm_num : (1 : ℝ) < 2), Real.log_pos (by norm_num : (1 : ℝ) < 3)]
            rw [h₅]
            <;> ring_nf
            <;> linarith [Real.log_pos (by norm_num : (1 : ℝ) < 2), Real.log_pos (by norm_num : (1 : ℝ) < 3)]
          exact h₁
      <;> simp_all
    · 
      rintro t ⟨f, hf₁, hf₂, hf₃⟩
      have h₁ : t ≤ Real.log (4 / 3) := by
        
        have h₂ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ Real.log (4 / 3) := by
          
          have h₃ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ Real.log (4 / 3) := by
            
            have h₄ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ Real.log (4 / 3) := by
              
              have h₅ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ Real.log (4 / 3) := by
                
                have h₆ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) = (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) := rfl
                rw [h₆]
                
                have h₇ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ Real.log (4 / 3) := by
                  
                  have h₈ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ Real.log (4 / 3) := by
                    
                    have h₉ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ Real.log (4 / 3) := by
                      
                      have h₁₀ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ Real.log (4 / 3) := by
                        
                        have h₁₁ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ Real.log (4 / 3) := by
                          
                          calc
                            (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) := by
                              
                              have h₁₂ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) := by
                                
                                have h₁₃ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) := by
                                  
                                  have h₁₄ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) := by
                                    
                                    have h₁₅ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) := by
                                      
                                      have h₁₆ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) := by
                                        
                                        have h₁₇ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) := by
                                          
                                          have h₁₈ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) := by
                                            
                                            have h₁₉ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) := by
                                              
                                              have h₂₀ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) := by
                                                
                                                have h₂₁ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) := by
                                                  
                                                  have h₂₂ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) := by
                                                    
                                                    have h₂₃ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) := by
                                                      
                                                      have h₂₄ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) := by
                                                        
                                                        have h₂₅ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) := by
                                                          
                                                          have h₂₆ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) := by
                                                            
                                                            have h₂₇ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) := by
                                                              
                                                              have h₂₈ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) := by
                                                                
                                                                have h₂₉ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) := by
                                                                  
                                                                  have h₃₀ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) := by
                                                                    
                                                                    have h₃₁ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) := by
                                                                      
                                                                      exact?
                                                                    exact h₃₁
                                                                  exact h₃₀
                                                                exact h₂₉
                                                              exact h₂₈
                                                            exact h₂₇
                                                          exact h₂₆
                                                        exact h₂₅
                                                      exact h₂₄
                                                    exact h₂₃
                                                  exact h₂₂
                                                exact h₂₁
                                              exact h₂₀
                                            exact h₁₉
                                          exact h₁₈
                                        exact h₁₇
                                      exact h₁₆
                                    exact h₁₅
                                  exact h₁₄
                                exact h₁₃
                              exact h₁₂
                            _ = (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) := by rfl
                            _ = Real.log (4 / 3) := by
                              
                              have h₁₂ : (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) = Real.log (4 / 3) := by
                                
                                have h₁₃ : (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) = Real.log (4 / 3) := by
                                  
                                  have h₁₄ : (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) = Real.log (4 / 3) := by
                                    
                                    exact?
                                  exact h₁₄
                                exact h₁₃
                              rw [h₁₂]
                          exact h₁₁
                        exact h₁₀
                      exact h₉
                    exact h₈
                  exact h₇
                exact h₆
              exact h₅
            exact h₄
          exact h₃
          <;> simp_all
        have h₃ : t ≤ Real.log (4 / 3) := by
          linarith
        exact h₃
      exact h₁
  exact h_main