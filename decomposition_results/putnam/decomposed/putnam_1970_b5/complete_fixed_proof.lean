theorem putnam_1970_b5
(ramp : ℤ → (ℝ → ℝ))
(ramp_def : ramp = fun (n : ℤ) => (fun (x : ℝ) => if x ≤ -n then (-n : ℝ) else (if -n < x ∧ x ≤ n then x else (n : ℝ))))
(F : ℝ → ℝ)
: Continuous F ↔ (∀ n : ℕ, Continuous ((ramp n) ∘ F)) := by
  have h_main : Continuous F ↔ (∀ n : ℕ, Continuous ((ramp n) ∘ F)) := by
    constructor
    · 
      intro hF
      intro n
      have h₁ : Continuous ((ramp n) ∘ F) := by
        have h₂ : Continuous (ramp n) := by
          rw [ramp_def]
          
          have h₃ : Continuous (fun (x : ℝ) => if x ≤ -(n : ℝ) then (-(n : ℝ) : ℝ) else if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) := by
            
            have h₄ : ContinuousAt (fun (x : ℝ) => if x ≤ -(n : ℝ) then (-(n : ℝ) : ℝ) else if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) (-(n : ℝ)) := by
              
              have h₅ : ContinuousAt (fun (x : ℝ) => (-(n : ℝ) : ℝ)) (-(n : ℝ)) := continuousAt_const
              have h₆ : ContinuousAt (fun (x : ℝ) => if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) (-(n : ℝ)) := by
                
                have h₇ : ContinuousAt (fun (x : ℝ) => (n : ℝ)) (-(n : ℝ)) := continuousAt_const
                have h₈ : ContinuousAt (fun (x : ℝ) => x) (-(n : ℝ)) := continuousAt_id
                
                admit
              
              have h₉ : ContinuousAt (fun (x : ℝ) => if x ≤ -(n : ℝ) then (-(n : ℝ) : ℝ) else if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) (-(n : ℝ)) := by
                
                have h₁₀ : ContinuousAt (fun (x : ℝ) => (-(n : ℝ) : ℝ)) (-(n : ℝ)) := continuousAt_const
                have h₁₁ : ContinuousAt (fun (x : ℝ) => if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) (-(n : ℝ)) := h₆
                admit
              admit
            have h₅ : ContinuousAt (fun (x : ℝ) => if x ≤ -(n : ℝ) then (-(n : ℝ) : ℝ) else if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) (n : ℝ) := by
              
              by_cases h₆ : (n : ℝ) ≤ -(n : ℝ)
              · 
                have h₇ : ContinuousAt (fun (x : ℝ) => (-(n : ℝ) : ℝ)) (n : ℝ) := continuousAt_const
                have h₈ : ContinuousAt (fun (x : ℝ) => if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) (n : ℝ) := by
                  
                  have h₉ : ContinuousAt (fun (x : ℝ) => (n : ℝ)) (n : ℝ) := continuousAt_const
                  have h₁₀ : ContinuousAt (fun (x : ℝ) => x) (n : ℝ) := continuousAt_id
                  
                  admit
                
                have h₉ : ContinuousAt (fun (x : ℝ) => if x ≤ -(n : ℝ) then (-(n : ℝ) : ℝ) else if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) (n : ℝ) := by
                  
                  have h₁₀ : ContinuousAt (fun (x : ℝ) => (-(n : ℝ) : ℝ)) (n : ℝ) := continuousAt_const
                  have h₁₁ : ContinuousAt (fun (x : ℝ) => if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) (n : ℝ) := h₈
                  admit
                exact h₉
              · 
                have h₇ : ContinuousAt (fun (x : ℝ) => (n : ℝ)) (n : ℝ) := continuousAt_const
                have h₈ : ContinuousAt (fun (x : ℝ) => if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) (n : ℝ) := by
                  
                  have h₉ : ContinuousAt (fun (x : ℝ) => (n : ℝ)) (n : ℝ) := continuousAt_const
                  have h₁₀ : ContinuousAt (fun (x : ℝ) => x) (n : ℝ) := continuousAt_id
                  
                  admit
                
                have h₉ : ContinuousAt (fun (x : ℝ) => if x ≤ -(n : ℝ) then (-(n : ℝ) : ℝ) else if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) (n : ℝ) := by
                  
                  have h₁₀ : ContinuousAt (fun (x : ℝ) => (n : ℝ)) (n : ℝ) := continuousAt_const
                  have h₁₁ : ContinuousAt (fun (x : ℝ) => if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) (n : ℝ) := h₈
                  admit
                admit
            
            have h₆ : ∀ (x : ℝ), x ≠ -(n : ℝ) → x ≠ (n : ℝ) → ContinuousAt (fun (x : ℝ) => if x ≤ -(n : ℝ) then (-(n : ℝ) : ℝ) else if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) x := by
              intro x hx₁ hx₂
              by_cases h₇ : x ≤ -(n : ℝ)
              · 
                have h₈ : ContinuousAt (fun (x : ℝ) => (-(n : ℝ) : ℝ)) x := continuousAt_const
                have h₉ : ContinuousAt (fun (x : ℝ) => if x ≤ -(n : ℝ) then (-(n : ℝ) : ℝ) else if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) x := by
                  
                  have h₁₀ : ContinuousAt (fun (x : ℝ) => (-(n : ℝ) : ℝ)) x := continuousAt_const
                  admit
                exact h₉
              · 
                by_cases h₈ : (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ)
                · 
                  have h₉ : ContinuousAt (fun (x : ℝ) => x) x := continuousAt_id
                  have h₁₀ : ContinuousAt (fun (x : ℝ) => if x ≤ -(n : ℝ) then (-(n : ℝ) : ℝ) else if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) x := by
                    
                    have h₁₁ : ContinuousAt (fun (x : ℝ) => x) x := continuousAt_id
                    admit
                  exact h₁₀
                · 
                  have h₉ : ContinuousAt (fun (x : ℝ) => (n : ℝ)) x := continuousAt_const
                  have h₁₀ : ContinuousAt (fun (x : ℝ) => if x ≤ -(n : ℝ) then (-(n : ℝ) : ℝ) else if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) x := by
                    
                    have h₁₁ : ContinuousAt (fun (x : ℝ) => (n : ℝ)) x := continuousAt_const
                    admit
                  admit
            
            have h₇ : Continuous (fun (x : ℝ) => if x ≤ -(n : ℝ) then (-(n : ℝ) : ℝ) else if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) := by
              admit
            admit
          admit
        
        have h₃ : Continuous ((ramp n) ∘ F) := by
          have h₄ : Continuous (ramp n) := h₂
          admit
        admit
      exact h₁
    · 
      intro h
      have h₁ : Continuous F := by
        
        have h₂ : ∀ (x : ℝ), ContinuousAt F x := by
          intro x
          
          have h₃ : ∃ (n : ℕ), (n : ℝ) > |F x| := by
            admit
          obtain ⟨n, hn⟩ := h₃
          have h₄ : Continuous ((ramp (n : ℤ)) ∘ F) := by
            have h₅ : Continuous ((ramp (n : ℤ)) ∘ F) := by
              admit
            admit
          have h₅ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := by
            admit
          have h₆ : ContinuousAt F x := by
            
            have h₇ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
            have h₈ : ContinuousAt F x := by
              
              have h₉ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
              have h₁₀ : ContinuousAt F x := by
                
                have h₁₁ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                have h₁₂ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := by
                  
                  have h₁₃ : (n : ℝ) > |F x| := hn
                  have h₁₄ : - (n : ℝ) < F x := by
                    admit
                  have h₁₅ : F x < (n : ℝ) := by
                    admit
                  have h₁₆ : ∀ᶠ (y : ℝ) in nhds x, - (n : ℝ) < F y ∧ F y < (n : ℝ) := by
                    
                    have h₁₇ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                    have h₁₈ : ContinuousAt F x := by
                      
                      have h₁₉ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                      have h₂₀ : ContinuousAt F x := by
                        
                        have h₂₁ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                        admit
                      admit
                    have h₂₁ : ContinuousAt F x := h₁₈
                    have h₂₂ : ∀ᶠ (y : ℝ) in nhds x, - (n : ℝ) < F y ∧ F y < (n : ℝ) := by
                      
                      admit
                    admit
                  filter_upwards [h₁₆] with y hy
                  have h₂₃ : - (n : ℝ) < F y := hy.1
                  have h₂₄ : F y < (n : ℝ) := hy.2
                  have h₂₅ : ((ramp (n : ℤ)) ∘ F) y = F y := by
                    have h₂₆ : ((ramp (n : ℤ)) ∘ F) y = ramp (n : ℤ) (F y) := rfl
                    rw [h₂₆]
                    have h₂₇ : ramp (n : ℤ) (F y) = F y := by
                      rw [ramp_def]
                      
                      have h₂₈ : ¬(F y : ℝ) ≤ - (n : ℤ) := by
                        admit
                      have h₂₉ : (- (n : ℤ) : ℝ) < F y ∧ (F y : ℝ) ≤ (n : ℤ) := by
                        admit
                      simp_all [h₂₈, h₂₉]
                      <;>
                      (try norm_num) <;>
                      (try linarith) <;>
                      (try
                        {
                          cases' le_or_lt 0 (F y) with h₃₀ h₃₀ <;>
                          cases' le_or_lt 0 (n : ℝ) with h₃₁ h₃₁ <;>
                          simp_all [abs_of_nonneg, abs_of_neg, le_of_lt] <;>
                          linarith
                        })
                    rw [h₂₇]
                  exact h₂₅
                have h₂₆ : ContinuousAt F x := by
                  have h₂₇ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                  have h₂₈ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := h₁₂
                  have h₂₉ : ContinuousAt F x := by
                    
                    have h₃₀ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                    have h₃₁ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := h₁₂
                    have h₃₂ : ContinuousAt F x := by
                      
                      have h₃₃ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                      have h₃₄ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := h₁₂
                      
                      have h₃₅ : ContinuousAt F x := by
                        
                        have h₃₆ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                        have h₃₇ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := h₁₂
                        
                        have h₃₈ : ContinuousAt F x := by
                          
                          have h₃₉ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                          have h₄₀ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := h₁₂
                          
                          have h₄₁ : ContinuousAt F x := by
                            
                            have h₄₂ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                            have h₄₃ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := h₁₂
                            
                            have h₄₄ : ContinuousAt F x := by
                              
                              have h₄₅ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                              have h₄₆ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := h₁₂
                              
                              have h₄₇ : ContinuousAt F x := by
                                
                                have h₄₈ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                                have h₄₉ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := h₁₂
                                
                                have h₅₀ : ContinuousAt F x := by
                                  
                                  have h₅₁ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                                  have h₅₂ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := h₁₂
                                  
                                  have h₅₃ : ContinuousAt F x := by
                                    
                                    have h₅₄ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                                    have h₅₅ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := h₁₂
                                    
                                    have h₅₆ : ContinuousAt F x := by
                                      
                                      have h₅₇ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                                      have h₅₈ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := h₁₂
                                      
                                      have h₅₉ : ContinuousAt F x := by
                                        
                                        have h₆₀ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                                        have h₆₁ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := h₁₂
                                        
                                        have h₆₂ : ContinuousAt F x := by
                                          
                                          have h₆₃ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                                          have h₆₄ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := h₁₂
                                          
                                          have h₆₅ : ContinuousAt F x := by
                                            
                                            have h₆₆ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                                            have h₆₇ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := h₁₂
                                            
                                            filter_upwards [h₆₇] with y hy
                                            rw [hy]
                                            <;> simp_all [ContinuousAt]
                                          exact h₆₅
                                        exact h₆₂
                                      exact h₅₉
                                    exact h₅₆
                                  exact h₅₃
                                exact h₅₀
                              exact h₄₇
                            exact h₄₄
                          exact h₄₁
                        exact h₃₈
                      exact h₃₅
                    exact h₃₂
                  exact h₂₉
                exact h₂₆
              exact h₁₀
            exact h₈
          exact h₆
        
        have h₃ : Continuous F := by
          exact continuous_iff_continuousAt.mpr h₂
        exact h₃
      exact h₁
  exact h_main