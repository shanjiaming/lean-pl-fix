macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem putnam_1972_b2
    (s v : ℝ)
    (hs : s > 0)
    (hv : v > 0)
    (valid : ℝ → (ℝ → ℝ) → Prop)
    (hvalid : ∀ t x, valid t x ↔
      DifferentiableOn ℝ x (Set.Icc 0 t) ∧ DifferentiableOn ℝ (deriv x) (Set.Icc 0 t) ∧
      AntitoneOn (deriv (deriv x)) (Set.Icc 0 t) ∧
      deriv x 0 = 0 ∧ deriv x t = v ∧ x t - x 0 = s)
    : IsGreatest {t | ∃ x : ℝ → ℝ, valid t x} (((fun s v : ℝ ↦ 2 * s / v) : ℝ → ℝ → ℝ ) s v) := by
  have h_main : IsGreatest {t | ∃ x : ℝ → ℝ, valid t x} (2 * s / v) := by
    have h₁ : (2 * s / v : ℝ) ∈ {t | ∃ x : ℝ → ℝ, valid t x} := by
      
      use fun u => (v ^ 2 / (4 * s)) * u ^ 2
      have h₂ : valid (2 * s / v) (fun u => (v ^ 2 / (4 * s)) * u ^ 2) := by
        rw [hvalid]
        constructor
        · 
          apply DifferentiableOn.mul
          · exact differentiableOn_const _
          · exact differentiableOn_pow 2
        · constructor
          · 
            have h₃ : deriv (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) = fun u => (v ^ 2 / (4 * s)) * (2 * u) := by
              hole_5
            rw [h₃]
            apply DifferentiableOn.mul
            · exact differentiableOn_const _
            · exact DifferentiableOn.mul (differentiableOn_const _) differentiableOn_id
          · constructor
            · 
              have h₄ : deriv (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) = fun u => (v ^ 2 / (4 * s)) * (2 * u) := by
                hole_6
              have h₅ : deriv (deriv (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2)) = fun u => (v ^ 2 / (4 * s)) * 2 := by
                hole_7
              rw [h₅]
              intro x hx y hy hxy
              simp_all [AntitoneOn, Set.mem_Icc]
              <;> norm_num
              <;> linarith
            · constructor
              · 
                have h₆ : deriv (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) 0 = 0 := by
                  have h₇ : deriv (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) = fun u => (v ^ 2 / (4 * s)) * (2 * u) := by
                    hole_9
                  hole_8
                exact h₆
              · constructor
                · 
                  have h₇ : deriv (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) (2 * s / v) = v := by
                    have h₈ : deriv (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) = fun u => (v ^ 2 / (4 * s)) * (2 * u) := by
                      hole_11
                    rw [h₈]
                    have h₉ : (v ^ 2 / (4 * s)) * (2 * (2 * s / v)) = v := by
                      hole_12
                    hole_10
                  exact h₇
                · 
                  have h₈ : ((fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) (2 * s / v) - (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) 0) = s := by
                    have h₉ : (v ^ 2 / (4 * s)) * (2 * s / v) ^ 2 - (v ^ 2 / (4 * s)) * 0 ^ 2 = s := by
                      hole_14
                    hole_13
                  hole_4
      hole_3
    have h₂ : ∀ t ∈ {t | ∃ x : ℝ → ℝ, valid t x}, t ≤ 2 * s / v := by
      intro t ht
      rcases ht with ⟨x, hx⟩
      have h₃ : valid t x := hx
      rw [hvalid] at h₃
      rcases h₃ with ⟨h₃₁, h₃₂, h₃₃, h₃₄, h₃₅, h₃₆⟩
      have h₄ : t ≤ 2 * s / v := by
        by_contra h
        have h₅ : t > 2 * s / v := by hole_17
        have h₆ : deriv x 0 = 0 := h₃₄
        have h₇ : deriv x t = v := h₃₅
        have h₈ : x t - x 0 = s := h₃₆
        have h₉ : AntitoneOn (deriv (deriv x)) (Set.Icc 0 t) := h₃₃
        have h₁₀ : DifferentiableOn ℝ x (Set.Icc 0 t) := h₃₁
        have h₁₁ : DifferentiableOn ℝ (deriv x) (Set.Icc 0 t) := h₃₂
        
        have h₁₂ : ∀ u ∈ Set.Icc 0 t, deriv x u ≥ (u / t) * v := by
          intro u hu
          have h₁₃ : u ∈ Set.Icc 0 t := hu
          have h₁₄ : 0 ≤ u := by hole_19
          have h₁₅ : u ≤ t := by hole_20
          have h₁₆ : deriv x u ≥ (u / t) * v := by
            
            have h₁₇ : deriv x u ≥ (u / t) * v := by
              
              have h₁₈ : ConcaveOn ℝ (Set.Icc 0 t) (deriv x) := by
                
                have h₁₉ : ConvexOn ℝ (Set.Icc 0 t) (deriv (deriv x)) := by
                  
                  hole_24
                have h₂₀ : ConcaveOn ℝ (Set.Icc 0 t) (deriv x) := by
                  
                  hole_25
                hole_23
              have h₂₁ : deriv x u ≥ (u / t) * v := by
                
                have h₂₂ : (u : ℝ) ∈ Set.Icc 0 t := by hole_27
                have h₂₃ : (t : ℝ) ∈ Set.Icc 0 t := by
                  hole_28
                have h₂₄ : deriv x u ≥ (u / t) * v := by
                  
                  have h₂₅ : deriv x u ≥ (u / t) * v := by
                    
                    have h₂₆ : deriv x u ≥ (u / t) * v := by
                      
                      have h₂₇ : deriv x u ≥ (u / t) * v := by
                        
                        have h₂₈ : deriv x u ≥ (u / t) * v := by
                          
                          have h₂₉ : deriv x u ≥ (u / t) * v := by
                            
                            hole_34
                          hole_33
                        hole_32
                      hole_31
                    hole_30
                  hole_29
                hole_26
              hole_22
            hole_21
          hole_18
        have h₁₃ : x t - x 0 ≥ s := by
          
          have h₁₄ : x t - x 0 = s := h₃₆
          hole_35
        have h₁₄ : x t - x 0 < s := by
          
          have h₁₅ : x t - x 0 < s := by
            
            have h₁₆ : x t - x 0 < s := by
              
              have h₁₇ : x t - x 0 < s := by
                
                have h₁₈ : x t - x 0 < s := by
                  
                  have h₁₉ : x t - x 0 < s := by
                    
                    hole_41
                  hole_40
                hole_39
              hole_38
            hole_37
          hole_36
        hole_16
      hole_15
    hole_2
  hole_1