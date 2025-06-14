macro "hole_4" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
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
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_45" : tactic => `(tactic| admit)
macro "hole_46" : tactic => `(tactic| admit)
macro "hole_49" : tactic => `(tactic| admit)
macro "hole_48" : tactic => `(tactic| admit)
macro "hole_47" : tactic => `(tactic| admit)
macro "hole_44" : tactic => `(tactic| admit)
macro "hole_43" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_50" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem putnam_1981_b2
    (P : ℝ × ℝ × ℝ → Prop)
    (hP : P = fun (r, s, t) => 1 ≤ r ∧ r ≤ s ∧ s ≤ t ∧ t ≤ 4)
    (f : ℝ × ℝ × ℝ → ℝ)
    (hf : f = fun (r, s, t) => (r - 1)^2 + (s/r - 1)^2 + (t/s - 1)^2 + (4/t - 1)^2) :
    IsLeast {y | ∃ r s t, P (r, s, t) ∧ f (r, s, t) = y} ((12 - 8 * Real.sqrt 2) : ℝ ) := by
  have h₀ : (12 - 8 * Real.sqrt 2 : ℝ) ∈ {y | ∃ r s t, P (r, s, t) ∧ f (r, s, t) = y} := by
    rw [Set.mem_setOf_eq]
    use Real.sqrt 2, 2, 2 * Real.sqrt 2
    constructor
    · 
      rw [hP]
      constructor
      · 
        have h₁ : (1 : ℝ) ≤ Real.sqrt 2 := by
          have h₂ : (1 : ℝ) ≤ Real.sqrt 2 := by
            hole_4
          hole_3
        linarith
      · constructor
        · 
          have h₂ : Real.sqrt 2 ≤ (2 : ℝ) := by
            have h₃ : Real.sqrt 2 ≤ (2 : ℝ) := by
              hole_6
            hole_5
          linarith
        · constructor
          · 
            have h₃ : (2 : ℝ) ≤ 2 * Real.sqrt 2 := by
              have h₄ : (2 : ℝ) ≤ 2 * Real.sqrt 2 := by
                hole_8
              hole_7
            linarith
          · 
            have h₄ : (2 * Real.sqrt 2 : ℝ) ≤ 4 := by
              have h₅ : (2 * Real.sqrt 2 : ℝ) ≤ 4 := by
                hole_10
              hole_9
            linarith
    · 
      rw [hf]
      have h₁ : (Real.sqrt 2 - 1 : ℝ) ^ 2 = 3 - 2 * Real.sqrt 2 := by
        hole_11
      have h₂ : ((2 : ℝ) / Real.sqrt 2 - 1 : ℝ) ^ 2 = 3 - 2 * Real.sqrt 2 := by
        have h₃ : (2 : ℝ) / Real.sqrt 2 = Real.sqrt 2 := by
          hole_13
        hole_12
      have h₃ : ((2 * Real.sqrt 2 : ℝ) / 2 - 1 : ℝ) ^ 2 = 3 - 2 * Real.sqrt 2 := by
        have h₄ : (2 * Real.sqrt 2 : ℝ) / 2 = Real.sqrt 2 := by
          hole_15
        hole_14
      have h₄ : ((4 : ℝ) / (2 * Real.sqrt 2) - 1 : ℝ) ^ 2 = 3 - 2 * Real.sqrt 2 := by
        have h₅ : (4 : ℝ) / (2 * Real.sqrt 2) = Real.sqrt 2 := by
          hole_17
        hole_16
      have h₅ : ((Real.sqrt 2 - 1 : ℝ) ^ 2 + ((2 : ℝ) / Real.sqrt 2 - 1 : ℝ) ^ 2 + ((2 * Real.sqrt 2 : ℝ) / 2 - 1 : ℝ) ^ 2 + ((4 : ℝ) / (2 * Real.sqrt 2) - 1 : ℝ) ^ 2 : ℝ) = 12 - 8 * Real.sqrt 2 := by
        hole_18
      
      have h₆ : ((Real.sqrt 2 : ℝ) - 1) ^ 2 + ((2 : ℝ) / Real.sqrt 2 - 1) ^ 2 + ((2 * Real.sqrt 2 : ℝ) / 2 - 1) ^ 2 + ((4 : ℝ) / (2 * Real.sqrt 2) - 1) ^ 2 = 12 - 8 * Real.sqrt 2 := by
        hole_19
      
      have h₇ : ((Real.sqrt 2 : ℝ) - 1) ^ 2 + ((2 : ℝ) / Real.sqrt 2 - 1) ^ 2 + ((2 * Real.sqrt 2 : ℝ) / 2 - 1) ^ 2 + ((4 : ℝ) / (2 * Real.sqrt 2) - 1) ^ 2 = 12 - 8 * Real.sqrt 2 := by
        hole_20
      
      hole_2
  
  have h₁ : ∀ (y : ℝ), y ∈ {y | ∃ r s t, P (r, s, t) ∧ f (r, s, t) = y} → (12 - 8 * Real.sqrt 2 : ℝ) ≤ y := by
    intro y hy
    rw [Set.mem_setOf_eq] at hy
    rcases hy with ⟨r, s, t, hP₁, hP₂⟩
    have h₁ : P (r, s, t) := hP₁
    have h₂ : f (r, s, t) = y := hP₂
    have h₃ : P = fun (r, s, t) => 1 ≤ r ∧ r ≤ s ∧ s ≤ t ∧ t ≤ 4 := hP
    have h₄ : f = fun (r, s, t) => (r - 1)^2 + (s/r - 1)^2 + (t/s - 1)^2 + (4/t - 1)^2 := hf
    rw [h₃] at h₁
    rw [h₄] at h₂
    simp only [Prod.mk.injEq] at h₁ h₂ ⊢
    have h₅ : 1 ≤ r := by hole_22
    have h₆ : r ≤ s := by hole_23
    have h₇ : s ≤ t := by hole_24
    have h₈ : t ≤ 4 := by hole_25
    have h₉ : 0 < r := by hole_26
    have h₁₀ : 0 < s := by hole_27
    have h₁₁ : 0 < t := by hole_28
    have h₁₂ : 0 < r * s := by hole_29
    have h₁₃ : 0 < s * t := by hole_30
    have h₁₄ : 0 < r * t := by hole_31
    have h₁₅ : 0 < r * s * t := by hole_32
    
    have h₁₆ : (r - 1) ^ 2 + (s / r - 1) ^ 2 + (t / s - 1) ^ 2 + (4 / t - 1) ^ 2 ≥ 12 - 8 * Real.sqrt 2 := by
      
      have h₁₇ : 0 < Real.sqrt 2 := Real.sqrt_pos.mpr (by norm_num)
      have h₁₈ : 0 < Real.sqrt 2 * r := by hole_34
      have h₁₉ : 0 < Real.sqrt 2 * s := by hole_35
      have h₂₀ : 0 < Real.sqrt 2 * t := by hole_36
      
      have h₂₁ : (r - 1) ^ 2 + (s / r - 1) ^ 2 + (t / s - 1) ^ 2 + (4 / t - 1) ^ 2 ≥ 12 - 8 * Real.sqrt 2 := by
        
        have h₂₂ : (r - 1) ^ 2 + (s / r - 1) ^ 2 + (t / s - 1) ^ 2 + (4 / t - 1) ^ 2 ≥ 12 - 8 * Real.sqrt 2 := by
          
          have h₂₃ : (r - 1) ^ 2 ≥ 0 := by hole_39
          have h₂₄ : (s / r - 1) ^ 2 ≥ 0 := by hole_40
          have h₂₅ : (t / s - 1) ^ 2 ≥ 0 := by hole_41
          have h₂₆ : (4 / t - 1) ^ 2 ≥ 0 := by hole_42
          
          have h₂₇ : (r - 1) ^ 2 + (s / r - 1) ^ 2 + (t / s - 1) ^ 2 + (4 / t - 1) ^ 2 ≥ 12 - 8 * Real.sqrt 2 := by
            
            have h₂₈ : (r - 1) ^ 2 + (s / r - 1) ^ 2 + (t / s - 1) ^ 2 + (4 / t - 1) ^ 2 ≥ 12 - 8 * Real.sqrt 2 := by
              
              by_cases h₂₉ : r * s * t = 0
              · exfalso
                have h₃₀ : r * s * t > 0 := by hole_45
                linarith
              · 
                have h₃₁ : 0 < r * s * t := by hole_46
                
                have h₃₂ : (r - 1) ^ 2 + (s / r - 1) ^ 2 + (t / s - 1) ^ 2 + (4 / t - 1) ^ 2 ≥ 12 - 8 * Real.sqrt 2 := by
                  
                  have h₃₃ : (r - 1) ^ 2 + (s / r - 1) ^ 2 + (t / s - 1) ^ 2 + (4 / t - 1) ^ 2 ≥ 12 - 8 * Real.sqrt 2 := by
                    
                    have h₃₄ : (r - 1) ^ 2 + (s / r - 1) ^ 2 + (t / s - 1) ^ 2 + (4 / t - 1) ^ 2 ≥ 12 - 8 * Real.sqrt 2 := by
                      
                      hole_49
                    hole_48
                  hole_47
                hole_44
            hole_43
          hole_38
        hole_37
      hole_33
    hole_21
  
  have h₂ : IsLeast {y | ∃ r s t, P (r, s, t) ∧ f (r, s, t) = y} ((12 - 8 * Real.sqrt 2) : ℝ) := by
    refine' ⟨h₀, _⟩
    intro y hy
    have h₃ : (12 - 8 * Real.sqrt 2 : ℝ) ≤ y := h₁ y hy
    hole_50
  
  hole_1