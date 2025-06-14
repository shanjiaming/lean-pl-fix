macro "hole_7" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_45" : tactic => `(tactic| admit)
macro "hole_46" : tactic => `(tactic| admit)
macro "hole_44" : tactic => `(tactic| admit)
macro "hole_48" : tactic => `(tactic| admit)
macro "hole_49" : tactic => `(tactic| admit)
macro "hole_47" : tactic => `(tactic| admit)
macro "hole_51" : tactic => `(tactic| admit)
macro "hole_52" : tactic => `(tactic| admit)
macro "hole_50" : tactic => `(tactic| admit)
macro "hole_54" : tactic => `(tactic| admit)
macro "hole_53" : tactic => `(tactic| admit)
macro "hole_56" : tactic => `(tactic| admit)
macro "hole_55" : tactic => `(tactic| admit)
macro "hole_43" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem integral_of_trig_rational_function :
∫ x in Set.Icc 0 (π / 4), (3 * sin x + 2 * cos x) / (4 * sin x + 3 * cos x) =
    (1 / 50) * Real.log 2 - (1 / 25) * Real.log (7 / 3) + (9 * π) / 50 := by
  have h₀ : (∫ x in Set.Icc 0 (π / 4), (3 * sin x + 2 * cos x) / (4 * sin x + 3 * cos x)) = (1 / 50) * Real.log 2 - (1 / 25) * Real.log (7 / 3) + (9 * π) / 50 := by
    have h₁ : ∫ x in Set.Icc 0 (π / 4), (3 * sin x + 2 * cos x) / (4 * sin x + 3 * cos x) = (1 / 50) * Real.log 2 - (1 / 25) * Real.log (7 / 3) + (9 * π) / 50 := by
      
      have h₂ : (∫ x in Set.Icc 0 (π / 4), (3 * sin x + 2 * cos x) / (4 * sin x + 3 * cos x)) = (1 / 50) * Real.log 2 - (1 / 25) * Real.log (7 / 3) + (9 * π) / 50 := by
        
        have h₃ : ∀ x ∈ Set.Icc 0 (π / 4), HasDerivAt (fun x => (18 / 25 : ℝ) * x - (1 / 25 : ℝ) * Real.log (4 * sin x + 3 * cos x)) ((3 * sin x + 2 * cos x) / (4 * sin x + 3 * cos x)) x := by
          intro x hx
          have h₄ : HasDerivAt (fun x : ℝ => (18 / 25 : ℝ) * x - (1 / 25 : ℝ) * Real.log (4 * sin x + 3 * cos x)) ((18 / 25 : ℝ) - (1 / 25 : ℝ) * (4 * cos x - 3 * sin x) / (4 * sin x + 3 * cos x)) x := by
            have h₅ : HasDerivAt (fun x : ℝ => (18 / 25 : ℝ) * x) (18 / 25 : ℝ) x := by
              hole_7
            have h₆ : HasDerivAt (fun x : ℝ => (1 / 25 : ℝ) * Real.log (4 * sin x + 3 * cos x)) ((1 / 25 : ℝ) * (4 * cos x - 3 * sin x) / (4 * sin x + 3 * cos x)) x := by
              have h₇ : HasDerivAt (fun x : ℝ => 4 * sin x + 3 * cos x) (4 * cos x - 3 * sin x) x := by
                hole_9
              have h₈ : HasDerivAt (fun x : ℝ => Real.log (4 * sin x + 3 * cos x)) ((4 * cos x - 3 * sin x) / (4 * sin x + 3 * cos x)) x := by
                have h₉ : HasDerivAt (fun x : ℝ => 4 * sin x + 3 * cos x) (4 * cos x - 3 * sin x) x := h₇
                have h₁₀ : 4 * sin x + 3 * cos x ≠ 0 := by
                  have h₁₁ : x ∈ Set.Icc 0 (π / 4) := hx
                  have h₁₂ : 0 ≤ x := by hole_12
                  have h₁₃ : x ≤ π / 4 := by hole_13
                  have h₁₄ : 0 < Real.sqrt 2 := Real.sqrt_pos.mpr (by norm_num)
                  have h₁₅ : 0 < Real.sqrt 2 := Real.sqrt_pos.mpr (by norm_num)
                  have h₁₆ : 0 < 4 * sin x + 3 * cos x := by
                    have h₁₇ : 0 ≤ x := by hole_15
                    have h₁₈ : x ≤ π / 4 := by hole_16
                    have h₁₉ : 0 < cos x := Real.cos_pos_of_mem_Ioo ⟨by linarith [h₁₁.1], by linarith [h₁₁.2]⟩
                    have h₂₀ : 0 ≤ sin x := Real.sin_nonneg_of_mem_Icc ⟨by linarith [h₁₁.1], by linarith [h₁₁.2]⟩
                    hole_14
                  hole_11
                have h₂₁ : HasDerivAt (fun x : ℝ => Real.log (4 * sin x + 3 * cos x)) ((4 * cos x - 3 * sin x) / (4 * sin x + 3 * cos x)) x := by
                  hole_17
                hole_10
              have h₂₂ : HasDerivAt (fun x : ℝ => (1 / 25 : ℝ) * Real.log (4 * sin x + 3 * cos x)) ((1 / 25 : ℝ) * (4 * cos x - 3 * sin x) / (4 * sin x + 3 * cos x)) x := by
                hole_18
              hole_8
            have h₂₃ : HasDerivAt (fun x : ℝ => (18 / 25 : ℝ) * x - (1 / 25 : ℝ) * Real.log (4 * sin x + 3 * cos x)) ((18 / 25 : ℝ) - (1 / 25 : ℝ) * (4 * cos x - 3 * sin x) / (4 * sin x + 3 * cos x)) x := by
              hole_19
            hole_6
          have h₂₄ : (18 / 25 : ℝ) - (1 / 25 : ℝ) * (4 * cos x - 3 * sin x) / (4 * sin x + 3 * cos x) = (3 * sin x + 2 * cos x) / (4 * sin x + 3 * cos x) := by
            have h₂₅ : 4 * sin x + 3 * cos x ≠ 0 := by
              have h₂₆ : x ∈ Set.Icc 0 (π / 4) := hx
              have h₂₇ : 0 ≤ x := by hole_22
              have h₂₈ : x ≤ π / 4 := by hole_23
              have h₂₉ : 0 < Real.sqrt 2 := Real.sqrt_pos.mpr (by norm_num)
              have h₃₀ : 0 < Real.sqrt 2 := Real.sqrt_pos.mpr (by norm_num)
              have h₃₁ : 0 < 4 * sin x + 3 * cos x := by
                have h₃₂ : 0 ≤ x := by hole_25
                have h₃₃ : x ≤ π / 4 := by hole_26
                have h₃₄ : 0 < cos x := Real.cos_pos_of_mem_Ioo ⟨by linarith [h₂₆.1], by linarith [h₂₆.2]⟩
                have h₃₅ : 0 ≤ sin x := Real.sin_nonneg_of_mem_Icc ⟨by linarith [h₂₆.1], by linarith [h₂₆.2]⟩
                hole_24
              hole_21
            hole_20
          have h₃₂ : HasDerivAt (fun x : ℝ => (18 / 25 : ℝ) * x - (1 / 25 : ℝ) * Real.log (4 * sin x + 3 * cos x)) ((3 * sin x + 2 * cos x) / (4 * sin x + 3 * cos x)) x := by
            hole_27
          hole_5
        
        have h₃₃ : (∫ x in Set.Icc 0 (π / 4), (3 * sin x + 2 * cos x) / (4 * sin x + 3 * cos x)) = (1 / 50) * Real.log 2 - (1 / 25) * Real.log (7 / 3) + (9 * π) / 50 := by
          have h₃₄ : (∫ x in Set.Icc 0 (π / 4), (3 * sin x + 2 * cos x) / (4 * sin x + 3 * cos x)) = ((18 / 25 : ℝ) * (π / 4) - (1 / 25 : ℝ) * Real.log (4 * sin (π / 4) + 3 * cos (π / 4))) - ((18 / 25 : ℝ) * 0 - (1 / 25 : ℝ) * Real.log (4 * sin 0 + 3 * cos 0)) := by
            have h₃₅ : ∫ x in Set.Icc 0 (π / 4), (3 * sin x + 2 * cos x) / (4 * sin x + 3 * cos x) = ((18 / 25 : ℝ) * (π / 4) - (1 / 25 : ℝ) * Real.log (4 * sin (π / 4) + 3 * cos (π / 4))) - ((18 / 25 : ℝ) * 0 - (1 / 25 : ℝ) * Real.log (4 * sin 0 + 3 * cos 0)) := by
              have h₃₆ : ∫ x in Set.Icc 0 (π / 4), (3 * sin x + 2 * cos x) / (4 * sin x + 3 * cos x) = ((18 / 25 : ℝ) * (π / 4) - (1 / 25 : ℝ) * Real.log (4 * sin (π / 4) + 3 * cos (π / 4))) - ((18 / 25 : ℝ) * 0 - (1 / 25 : ℝ) * Real.log (4 * sin 0 + 3 * cos 0)) := by
                
                have h₃₇ : ∫ x in Set.Icc 0 (π / 4), (3 * sin x + 2 * cos x) / (4 * sin x + 3 * cos x) = ((18 / 25 : ℝ) * (π / 4) - (1 / 25 : ℝ) * Real.log (4 * sin (π / 4) + 3 * cos (π / 4))) - ((18 / 25 : ℝ) * 0 - (1 / 25 : ℝ) * Real.log (4 * sin 0 + 3 * cos 0)) := by
                  have h₃₈ : ∀ x ∈ Set.Icc 0 (π / 4), HasDerivAt (fun x => (18 / 25 : ℝ) * x - (1 / 25 : ℝ) * Real.log (4 * sin x + 3 * cos x)) ((3 * sin x + 2 * cos x) / (4 * sin x + 3 * cos x)) x := h₃
                  have h₃₉ : ∫ x in Set.Icc 0 (π / 4), (3 * sin x + 2 * cos x) / (4 * sin x + 3 * cos x) = ((18 / 25 : ℝ) * (π / 4) - (1 / 25 : ℝ) * Real.log (4 * sin (π / 4) + 3 * cos (π / 4))) - ((18 / 25 : ℝ) * 0 - (1 / 25 : ℝ) * Real.log (4 * sin 0 + 3 * cos 0)) := by
                    
                    have h₄₀ : IsCompact (Set.Icc 0 (π / 4)) := isCompact_Icc
                    have h₄₁ : ContinuousOn (fun x => (3 * sin x + 2 * cos x) / (4 * sin x + 3 * cos x)) (Set.Icc 0 (π / 4)) := by
                      apply ContinuousOn.div
                      · exact ContinuousOn.add (ContinuousOn.mul continuousOn_const Real.continuousOn_sin) (ContinuousOn.mul continuousOn_const Real.continuousOn_cos)
                      · exact ContinuousOn.add (ContinuousOn.mul continuousOn_const Real.continuousOn_sin) (ContinuousOn.mul continuousOn_const Real.continuousOn_cos)
                      · intro x hx
                        have h₄₂ : x ∈ Set.Icc 0 (π / 4) := hx
                        have h₄₃ : 0 ≤ x := by hole_35
                        have h₄₄ : x ≤ π / 4 := by hole_36
                        have h₄₅ : 0 < Real.sqrt 2 := Real.sqrt_pos.mpr (by norm_num)
                        have h₄₆ : 0 < Real.sqrt 2 := Real.sqrt_pos.mpr (by norm_num)
                        have h₄₇ : 0 < 4 * sin x + 3 * cos x := by
                          have h₄₈ : 0 ≤ x := by hole_38
                          have h₄₉ : x ≤ π / 4 := by hole_39
                          have h₅₀ : 0 < cos x := Real.cos_pos_of_mem_Ioo ⟨by linarith [h₄₂.1], by linarith [h₄₂.2]⟩
                          have h₅₁ : 0 ≤ sin x := Real.sin_nonneg_of_mem_Icc ⟨by linarith [h₄₂.1], by linarith [h₄₂.2]⟩
                          hole_37
                        hole_34
                    have h₄₂ : (∫ x in Set.Icc 0 (π / 4), (3 * sin x + 2 * cos x) / (4 * sin x + 3 * cos x)) = ((18 / 25 : ℝ) * (π / 4) - (1 / 25 : ℝ) * Real.log (4 * sin (π / 4) + 3 * cos (π / 4))) - ((18 / 25 : ℝ) * 0 - (1 / 25 : ℝ) * Real.log (4 * sin 0 + 3 * cos 0)) := by
                      
                      have h₄₃ : ∫ x in Set.Icc 0 (π / 4), (3 * sin x + 2 * cos x) / (4 * sin x + 3 * cos x) = ((18 / 25 : ℝ) * (π / 4) - (1 / 25 : ℝ) * Real.log (4 * sin (π / 4) + 3 * cos (π / 4))) - ((18 / 25 : ℝ) * 0 - (1 / 25 : ℝ) * Real.log (4 * sin 0 + 3 * cos 0)) := by
                        
                        have h₄₄ : ∫ x in Set.Icc 0 (π / 4), (3 * sin x + 2 * cos x) / (4 * sin x + 3 * cos x) = ((18 / 25 : ℝ) * (π / 4) - (1 / 25 : ℝ) * Real.log (4 * sin (π / 4) + 3 * cos (π / 4))) - ((18 / 25 : ℝ) * 0 - (1 / 25 : ℝ) * Real.log (4 * sin 0 + 3 * cos 0)) := by
                          
                          hole_42
                        hole_41
                      hole_40
                    hole_33
                  hole_32
                hole_31
              hole_30
            hole_29
          have h₃₅ : ((18 / 25 : ℝ) * (π / 4) - (1 / 25 : ℝ) * Real.log (4 * sin (π / 4) + 3 * cos (π / 4))) - ((18 / 25 : ℝ) * 0 - (1 / 25 : ℝ) * Real.log (4 * sin 0 + 3 * cos 0)) = (1 / 50) * Real.log 2 - (1 / 25) * Real.log (7 / 3) + (9 * π) / 50 := by
            have h₃₆ : 4 * sin (π / 4) + 3 * cos (π / 4) = 7 * Real.sqrt 2 / 2 := by
              have h₃₇ : sin (π / 4) = Real.sqrt 2 / 2 := by hole_45
              have h₃₈ : cos (π / 4) = Real.sqrt 2 / 2 := by hole_46
              hole_44
            have h₃₇ : 4 * sin 0 + 3 * cos 0 = 3 := by
              have h₃₈ : sin 0 = 0 := by hole_48
              have h₃₉ : cos 0 = 1 := by hole_49
              hole_47
            rw [h₃₆, h₃₇]
            have h₃₈ : Real.log (7 * Real.sqrt 2 / 2) = Real.log 7 + Real.log (Real.sqrt 2) - Real.log 2 := by
              have h₃₉ : Real.log (7 * Real.sqrt 2 / 2) = Real.log (7 * Real.sqrt 2) - Real.log 2 := by
                hole_51
              rw [h₃₉]
              have h₄₀ : Real.log (7 * Real.sqrt 2) = Real.log 7 + Real.log (Real.sqrt 2) := by
                hole_52
              hole_50
            have h₃₉ : Real.log (Real.sqrt 2) = Real.log 2 / 2 := by
              have h₄₀ : Real.log (Real.sqrt 2) = Real.log 2 / 2 := by
                hole_54
              hole_53
            rw [h₃₈, h₃₉]
            have h₄₀ : Real.log 3 = Real.log 3 := rfl
            have h₄₁ : Real.log (7 / 3) = Real.log 7 - Real.log 3 := by
              have h₄₂ : Real.log (7 / 3) = Real.log 7 - Real.log 3 := by
                hole_56
              hole_55
            hole_43
          hole_28
        hole_4
      hole_3
    hole_2
  hole_1