import Mathlib

open Filter Topology Nat

-- True
/--
Is $\sqrt{2}$ the limit of a sequence of numbers of the form $\sqrt[3]{n}-\sqrt[3]{m}$ ($n,m=0,1,2,\dots$)?
-/
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
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
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
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_43" : tactic => `(tactic| admit)
macro "hole_44" : tactic => `(tactic| admit)
macro "hole_45" : tactic => `(tactic| admit)
macro "hole_46" : tactic => `(tactic| admit)
macro "hole_47" : tactic => `(tactic| admit)
macro "hole_48" : tactic => `(tactic| admit)
macro "hole_49" : tactic => `(tactic| admit)
macro "hole_50" : tactic => `(tactic| admit)
macro "hole_51" : tactic => `(tactic| admit)
macro "hole_52" : tactic => `(tactic| admit)
macro "hole_53" : tactic => `(tactic| admit)
macro "hole_54" : tactic => `(tactic| admit)
macro "hole_55" : tactic => `(tactic| admit)
macro "hole_56" : tactic => `(tactic| admit)
macro "hole_57" : tactic => `(tactic| admit)
macro "hole_58" : tactic => `(tactic| admit)
macro "hole_59" : tactic => `(tactic| admit)
macro "hole_60" : tactic => `(tactic| admit)
macro "hole_61" : tactic => `(tactic| admit)
macro "hole_62" : tactic => `(tactic| admit)
macro "hole_63" : tactic => `(tactic| admit)
macro "hole_64" : tactic => `(tactic| admit)
macro "hole_65" : tactic => `(tactic| admit)
macro "hole_66" : tactic => `(tactic| admit)
macro "hole_67" : tactic => `(tactic| admit)
macro "hole_68" : tactic => `(tactic| admit)
macro "hole_69" : tactic => `(tactic| admit)
macro "hole_70" : tactic => `(tactic| admit)
macro "hole_71" : tactic => `(tactic| admit)
macro "hole_72" : tactic => `(tactic| admit)
macro "hole_73" : tactic => `(tactic| admit)
macro "hole_74" : tactic => `(tactic| admit)
macro "hole_75" : tactic => `(tactic| admit)
macro "hole_76" : tactic => `(tactic| admit)
macro "hole_77" : tactic => `(tactic| admit)
macro "hole_78" : tactic => `(tactic| admit)
macro "hole_79" : tactic => `(tactic| admit)
macro "hole_80" : tactic => `(tactic| admit)
macro "hole_81" : tactic => `(tactic| admit)
macro "hole_82" : tactic => `(tactic| admit)
macro "hole_83" : tactic => `(tactic| admit)
macro "hole_84" : tactic => `(tactic| admit)
macro "hole_85" : tactic => `(tactic| admit)
macro "hole_86" : tactic => `(tactic| admit)
macro "hole_87" : tactic => `(tactic| admit)
macro "hole_88" : tactic => `(tactic| admit)
macro "hole_89" : tactic => `(tactic| admit)

theorem putnam_1990_a2
  (numform : ℝ → Prop)
  (hnumform : ∀ x : ℝ, numform x ↔ ∃ n m : ℕ, x = n ^ ((1 : ℝ) / 3) - m ^ ((1 : ℝ) / 3)) :
  ((True) : Prop ) ↔
  (∃ s : ℕ → ℝ,
    (∀ i : ℕ, numform (s i)) ∧
    Tendsto s atTop (𝓝 (Real.sqrt 2))) := by
  have h_main : ∃ (s : ℕ → ℝ), (∀ i : ℕ, numform (s i)) ∧ Tendsto s atTop (𝓝 (Real.sqrt 2)) := by
    use fun k => (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)
    constructor
    · 
      intro k
      rw [hnumform]
      refine' ⟨⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊, k ^ 3, _⟩
      
      have h₁ : (k : ℝ) = ((k : ℕ) ^ 3 : ℝ) ^ ((1 : ℝ) / 3) := by
        hole_1
      rw [h₁]
      <;> simp [sub_eq_add_neg]
      <;> ring_nf
      <;> field_simp
      <;> simp [Nat.cast_nonneg]
      <;> ring_nf
      <;> field_simp
      <;> simp [Nat.cast_nonneg]
    · 
      have h₁ : Tendsto (fun k : ℕ => (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
        have h₂ : Tendsto (fun k : ℕ => (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
          have h₃ : Tendsto (fun k : ℕ => (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
            
            have h₄ : ∀ k : ℕ, (Real.sqrt 2 + k : ℝ) ^ 3 - 1 < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) := by
              hole_2
            have h₅ : ∀ k : ℕ, (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ≤ (Real.sqrt 2 + k : ℝ) ^ 3 := by
              hole_3
            have h₆ : ∀ k : ℕ, ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) := by
              intro k
              have h₇ : (Real.sqrt 2 + k : ℝ) ^ 3 - 1 < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) := h₄ k
              have h₈ : 0 < (Real.sqrt 2 + k : ℝ) ^ 3 - 1 := by
                have h₉ : (Real.sqrt 2 + k : ℝ) ^ 3 ≥ 1 := by
                  have h₁₀ : (Real.sqrt 2 + k : ℝ) ≥ 1 := by
                    have h₁₁ : (k : ℝ) ≥ 0 := by hole_4
                    have h₁₂ : Real.sqrt 2 ≥ 0 := Real.sqrt_nonneg 2
                    hole_5
                  have h₁₃ : (Real.sqrt 2 + k : ℝ) ^ 3 ≥ 1 := by
                    have h₁₄ : (Real.sqrt 2 + k : ℝ) ≥ 1 := h₁₀
                    have h₁₅ : (Real.sqrt 2 + k : ℝ) ^ 3 ≥ 1 := by
                      hole_6
                    hole_7
                  hole_8
                hole_9
              have h₉ : 0 < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) := by
                have h₁₀ : (Real.sqrt 2 + k : ℝ) ^ 3 - 1 < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) := h₄ k
                have h₁₁ : 0 < (Real.sqrt 2 + k : ℝ) ^ 3 - 1 := by
                  have h₁₂ : (Real.sqrt 2 + k : ℝ) ^ 3 ≥ 1 := by
                    have h₁₃ : (Real.sqrt 2 + k : ℝ) ≥ 1 := by
                      have h₁₄ : (k : ℝ) ≥ 0 := by hole_10
                      have h₁₅ : Real.sqrt 2 ≥ 0 := Real.sqrt_nonneg 2
                      hole_11
                    have h₁₆ : (Real.sqrt 2 + k : ℝ) ^ 3 ≥ 1 := by
                      have h₁₇ : (Real.sqrt 2 + k : ℝ) ≥ 1 := h₁₃
                      have h₁₈ : (Real.sqrt 2 + k : ℝ) ^ 3 ≥ 1 := by
                        hole_12
                      hole_13
                    hole_14
                  hole_15
                hole_16
              have h₁₀ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) := by
                
                have h₁₁ : (Real.sqrt 2 + k : ℝ) ^ 3 - 1 < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) := h₄ k
                have h₁₂ : 0 < (Real.sqrt 2 + k : ℝ) ^ 3 - 1 := by
                  have h₁₃ : (Real.sqrt 2 + k : ℝ) ^ 3 ≥ 1 := by
                    have h₁₄ : (Real.sqrt 2 + k : ℝ) ≥ 1 := by
                      have h₁₅ : (k : ℝ) ≥ 0 := by hole_17
                      have h₁₆ : Real.sqrt 2 ≥ 0 := Real.sqrt_nonneg 2
                      hole_18
                    have h₁₇ : (Real.sqrt 2 + k : ℝ) ^ 3 ≥ 1 := by
                      have h₁₈ : (Real.sqrt 2 + k : ℝ) ≥ 1 := h₁₄
                      have h₁₉ : (Real.sqrt 2 + k : ℝ) ^ 3 ≥ 1 := by
                        hole_19
                      hole_20
                    hole_21
                  hole_22
                have h₁₃ : 0 < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) := by
                  have h₁₄ : (Real.sqrt 2 + k : ℝ) ^ 3 - 1 < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) := h₄ k
                  have h₁₅ : 0 < (Real.sqrt 2 + k : ℝ) ^ 3 - 1 := h₁₂
                  hole_23
                
                have h₁₄ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) := by
                  
                  have h₁₅ : (Real.sqrt 2 + k : ℝ) ^ 3 - 1 < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) := h₄ k
                  have h₁₆ : 0 < (Real.sqrt 2 + k : ℝ) ^ 3 - 1 := h₁₂
                  have h₁₇ : 0 < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) := h₁₃
                  
                  have h₁₈ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) := by hole_24
                  have h₁₉ : 0 < ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) := by hole_25
                  have h₂₀ : 0 < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) := by hole_26
                  
                  have h₂₁ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) := by
                    
                    hole_27
                  hole_28
                hole_29
              hole_30
            have h₇ : ∀ k : ℕ, (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) ≤ (Real.sqrt 2 + k : ℝ) := by
              intro k
              have h₈ : (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ≤ (Real.sqrt 2 + k : ℝ) ^ 3 := h₅ k
              have h₉ : 0 ≤ (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) := by hole_31
              have h₁₀ : 0 ≤ (Real.sqrt 2 + k : ℝ) := by hole_32
              have h₁₁ : 0 ≤ (Real.sqrt 2 + k : ℝ) ^ 3 := by hole_33
              have h₁₂ : (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) ≤ (Real.sqrt 2 + k : ℝ) := by
                hole_34
              hole_35
            have h₈ : Tendsto (fun k : ℕ => (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
              have h₉ : Tendsto (fun k : ℕ => (Real.sqrt 2 + k : ℝ)) atTop atTop := by
                
                have h₁₀ : Tendsto (fun k : ℕ => (Real.sqrt 2 + k : ℝ)) atTop atTop := by
                  have h₁₁ : Tendsto (fun k : ℕ => (k : ℝ)) atTop atTop := by
                    hole_36
                  have h₁₂ : Tendsto (fun k : ℕ => (Real.sqrt 2 + k : ℝ)) atTop atTop := by
                    
                    have h₁₃ : Tendsto (fun k : ℕ => (Real.sqrt 2 + k : ℝ)) atTop atTop := by
                      
                      hole_37
                    hole_38
                  hole_39
                hole_40
              have h₁₀ : Tendsto (fun k : ℕ => (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
                have h₁₁ : Tendsto (fun k : ℕ => ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
                  have h₁₂ : Tendsto (fun k : ℕ => ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
                    have h₁₃ : Tendsto (fun k : ℕ => ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
                      have h₁₄ : (fun k : ℕ => ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) = (fun k : ℕ => (Real.sqrt 2 + k : ℝ) - (k : ℝ)) := by
                        funext k
                        have h₁₅ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) = (Real.sqrt 2 + k : ℝ) := by
                          have h₁₆ : 0 < (Real.sqrt 2 + k : ℝ) := by hole_41
                          have h₁₇ : 0 < (Real.sqrt 2 + k : ℝ) ^ 3 - 1 := by
                            have h₁₈ : (Real.sqrt 2 + k : ℝ) ^ 3 ≥ 1 := by
                              have h₁₉ : (Real.sqrt 2 + k : ℝ) ≥ 1 := by
                                have h₂₀ : (k : ℝ) ≥ 0 := by hole_42
                                have h₂₁ : Real.sqrt 2 ≥ 0 := Real.sqrt_nonneg 2
                                hole_43
                              have h₂₂ : (Real.sqrt 2 + k : ℝ) ^ 3 ≥ 1 := by
                                have h₂₃ : (Real.sqrt 2 + k : ℝ) ≥ 1 := h₁₉
                                have h₂₄ : (Real.sqrt 2 + k : ℝ) ^ 3 ≥ 1 := by
                                  hole_44
                                hole_45
                              hole_46
                            hole_47
                          have h₂₅ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) = (Real.sqrt 2 + k : ℝ) := by
                            have h₂₆ : 0 < (Real.sqrt 2 + k : ℝ) ^ 3 - 1 := h₁₇
                            have h₂₇ : 0 < (Real.sqrt 2 + k : ℝ) := by hole_48
                            have h₂₈ : 0 < (Real.sqrt 2 + k : ℝ) ^ 3 - 1 := h₁₇
                            have h₂₉ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) = (Real.sqrt 2 + k : ℝ) := by
                              have h₃₀ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) > 0 := by hole_49
                              have h₃₁ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) = (Real.sqrt 2 + k : ℝ) := by
                                have h₃₂ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) > 0 := by hole_50
                                have h₃₃ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) = (Real.sqrt 2 + k : ℝ) := by
                                  
                                  have h₃₄ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) > 0 := by hole_51
                                  have h₃₅ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) = (Real.sqrt 2 + k : ℝ) := by
                                    
                                    have h₃₆ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) > 0 := by hole_52
                                    have h₃₇ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) = (Real.sqrt 2 + k : ℝ) := by
                                      
                                      have h₃₈ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) > 0 := by hole_53
                                      have h₃₉ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) = (Real.sqrt 2 + k : ℝ) := by
                                        
                                        have h₄₀ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) > 0 := by hole_54
                                        have h₄₁ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) = (Real.sqrt 2 + k : ℝ) := by
                                          
                                          hole_55
                                        hole_56
                                      hole_57
                                    hole_58
                                  hole_59
                                hole_60
                              hole_61
                            hole_62
                          hole_63
                        hole_64
                      hole_65
                    hole_66
                  hole_67
                have h₁₅ : Tendsto (fun k : ℕ => (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
                  have h₁₆ : ∀ k : ℕ, ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ) ≤ (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ) := by
                    intro k
                    have h₁₇ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) ≤ (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) := by
                      have h₁₈ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) := h₆ k
                      have h₁₉ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) ≤ (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) := by
                        hole_68
                      hole_69
                    hole_70
                  have h₁₇ : ∀ k : ℕ, (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ) ≤ (Real.sqrt 2 + k : ℝ) - (k : ℝ) := by
                    intro k
                    have h₁₈ : (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) ≤ (Real.sqrt 2 + k : ℝ) := h₇ k
                    hole_71
                  have h₁₈ : Tendsto (fun k : ℕ => (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
                    
                    have h₁₉ : Tendsto (fun k : ℕ => ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := h₁₁
                    have h₂₀ : Tendsto (fun k : ℕ => (Real.sqrt 2 + k : ℝ) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
                      have h₂₁ : Tendsto (fun k : ℕ => (Real.sqrt 2 + k : ℝ) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
                        have h₂₂ : (fun k : ℕ => (Real.sqrt 2 + k : ℝ) - (k : ℝ)) = (fun k : ℕ => Real.sqrt 2) := by
                          hole_72
                        hole_73
                      hole_74
                    have h₂₁ : ∀ᶠ k in atTop, ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ) ≤ (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ) := by
                      hole_75
                    have h₂₂ : ∀ᶠ k in atTop, (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ) ≤ (Real.sqrt 2 + k : ℝ) - (k : ℝ) := by
                      hole_76
                    have h₂₃ : Tendsto (fun k : ℕ => (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
                      
                      have h₂₄ : Tendsto (fun k : ℕ => (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
                        
                        have h₂₅ : Tendsto (fun k : ℕ => (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
                          
                          hole_77
                        hole_78
                      hole_79
                    hole_80
                  hole_81
                hole_82
              hole_83
            hole_84
          hole_85
        hole_86
      hole_87
  
  have h_final : ((True : Prop) ↔ (∃ s : ℕ → ℝ, (∀ i : ℕ, numform (s i)) ∧ Tendsto s atTop (𝓝 (Real.sqrt 2)))) := by
    hole_88
  
  hole_89