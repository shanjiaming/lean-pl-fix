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
macro "hole_61" : tactic => `(tactic| admit)
macro "hole_56" : tactic => `(tactic| admit)
macro "hole_51" : tactic => `(tactic| admit)
macro "hole_46" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_57" : tactic => `(tactic| admit)
macro "hole_52" : tactic => `(tactic| admit)
macro "hole_47" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_58" : tactic => `(tactic| admit)
macro "hole_53" : tactic => `(tactic| admit)
macro "hole_48" : tactic => `(tactic| admit)
macro "hole_43" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_59" : tactic => `(tactic| admit)
macro "hole_54" : tactic => `(tactic| admit)
macro "hole_49" : tactic => `(tactic| admit)
macro "hole_44" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_60" : tactic => `(tactic| admit)
macro "hole_55" : tactic => `(tactic| admit)
macro "hole_50" : tactic => `(tactic| admit)
macro "hole_45" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_62" : tactic => `(tactic| admit)
macro "hole_63" : tactic => `(tactic| admit)
macro "hole_64" : tactic => `(tactic| admit)
macro "hole_65" : tactic => `(tactic| admit)
macro "hole_66" : tactic => `(tactic| admit)
macro "hole_67" : tactic => `(tactic| admit)
macro "hole_68" : tactic => `(tactic| admit)

theorem mathd_algebra_320 (x : ℝ) (a b c : ℕ) (h₀ : 0 < a ∧ 0 < b ∧ 0 < c ∧ 0 ≤ x)
    (h₁ : 2 * x ^ 2 = 4 * x + 9) (h₂ : x = (a + Real.sqrt b) / c) (h₃ : c = 2) : a + b + c = 26 := by
  have h₄ : x = (a + Real.sqrt b) / 2 := by
    hole_1
  
  have h₅ : 2 * x ^ 2 = 4 * x + 9 := by
    hole_2
  
  have h₆ : (a : ℝ) > 0 := by
    have h₆₁ : 0 < a := h₀.1
    hole_3
  
  have h₇ : (b : ℝ) > 0 := by
    have h₇₁ : 0 < b := h₀.2.1
    hole_4
  
  have h₈ : (2 : ℝ) > 0 := by hole_5
  
  have h₉ : (a : ℝ) ^ 2 + (b : ℝ) + 2 * (a : ℝ) * Real.sqrt b = 4 * (a : ℝ) + 4 * Real.sqrt b + 18 := by
    have h₉₁ : x = (a + Real.sqrt b) / 2 := h₄
    have h₉₂ : 2 * x ^ 2 = 4 * x + 9 := h₅
    hole_6
  
  have h₁₀ : (2 * (a : ℝ) - 4) ^ 2 * (b : ℝ) = (4 * (a : ℝ) + 18 - (a : ℝ) ^ 2 - (b : ℝ)) ^ 2 := by
    have h₁₀₁ : (2 * (a : ℝ) - 4) * Real.sqrt b = 4 * (a : ℝ) + 18 - (a : ℝ) ^ 2 - (b : ℝ) := by
      have h₁₀₂ : (a : ℝ) ^ 2 + (b : ℝ) + 2 * (a : ℝ) * Real.sqrt b = 4 * (a : ℝ) + 4 * Real.sqrt b + 18 := h₉
      have h₁₀₃ : 2 * (a : ℝ) * Real.sqrt b - 4 * Real.sqrt b = 4 * (a : ℝ) + 18 - (a : ℝ) ^ 2 - (b : ℝ) := by
        hole_7
      have h₁₀₄ : (2 * (a : ℝ) - 4) * Real.sqrt b = 4 * (a : ℝ) + 18 - (a : ℝ) ^ 2 - (b : ℝ) := by
        hole_8
      hole_9
    have h₁₀₅ : (2 * (a : ℝ) - 4) ^ 2 * (b : ℝ) = (4 * (a : ℝ) + 18 - (a : ℝ) ^ 2 - (b : ℝ)) ^ 2 := by
      have h₁₀₆ : (2 * (a : ℝ) - 4) ^ 2 * (b : ℝ) = ((2 * (a : ℝ) - 4) * Real.sqrt b) ^ 2 := by
        have h₁₀₇ : Real.sqrt b ≥ 0 := Real.sqrt_nonneg _
        have h₁₀₈ : (Real.sqrt b) ^ 2 = (b : ℝ) := by
          hole_10
        hole_11
      hole_12
    hole_13
  
  have h₁₁ : a = 2 := by
    have h₁₁₁ : a = 2 := by
      by_contra h
      have h₁₂ : a ≠ 2 := h
      have h₁₃ : a ≥ 1 := by hole_14
      have h₁₄ : a ≤ 7 := by
        by_contra h₁₅
        have h₁₅₁ : a ≥ 8 := by hole_15
        have h₁₅₂ : (a : ℝ) ≥ 8 := by hole_16
        have h₁₅₃ : (2 * (a : ℝ) - 4) ^ 2 * (b : ℝ) = (4 * (a : ℝ) + 18 - (a : ℝ) ^ 2 - (b : ℝ)) ^ 2 := by
          hole_17
        have h₁₅₄ : (a : ℝ) ≥ 8 := by hole_18
        have h₁₅₅ : (b : ℝ) > 0 := h₇
        have h₁₅₆ : (b : ℝ) > 0 := h₇
        have h₁₅₇ : (a : ℕ) ≥ 8 := by hole_19
        
        have h₁₅₈ : (a : ℝ) ^ 2 ≥ 64 := by hole_20
        have h₁₅₉ : (4 * (a : ℝ) + 18 - (a : ℝ) ^ 2 - (b : ℝ)) ≤ 0 := by
          hole_21
        have h₁₅₁₀ : (2 * (a : ℝ) - 4) ^ 2 * (b : ℝ) ≥ 0 := by hole_22
        have h₁₅₁₁ : (4 * (a : ℝ) + 18 - (a : ℝ) ^ 2 - (b : ℝ)) ^ 2 ≥ 0 := by hole_23
        have h₁₅₁₂ : (2 * (a : ℝ) - 4) ^ 2 * (b : ℝ) = (4 * (a : ℝ) + 18 - (a : ℝ) ^ 2 - (b : ℝ)) ^ 2 := by
          hole_24
        hole_25
      
      hole_61
    hole_62
  
  have h₁₂ : b = 22 := by
    have h₁₂₁ : a = 2 := h₁₁
    have h₁₂₂ : (a : ℝ) = 2 := by hole_63
    rw [h₁₂₂] at h₉ h₁₀
    norm_num at h₉ h₁₀
    have h₁₂₃ : (b : ℝ) = 22 := by
      hole_64
    have h₁₂₄ : (b : ℕ) = 22 := by
      hole_65
    hole_66
  
  have h₁₃ : a + b + c = 26 := by
    have h₁₄ : a = 2 := h₁₁
    have h₁₅ : b = 22 := h₁₂
    have h₁₆ : c = 2 := h₃
    hole_67
  
  hole_68