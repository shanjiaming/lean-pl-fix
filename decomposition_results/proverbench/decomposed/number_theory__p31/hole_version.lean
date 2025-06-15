macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_44" : tactic => `(tactic| admit)
macro "hole_43" : tactic => `(tactic| admit)
macro "hole_46" : tactic => `(tactic| admit)
macro "hole_45" : tactic => `(tactic| admit)
macro "hole_48" : tactic => `(tactic| admit)
macro "hole_47" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_50" : tactic => `(tactic| admit)
macro "hole_51" : tactic => `(tactic| admit)
macro "hole_52" : tactic => `(tactic| admit)
macro "hole_53" : tactic => `(tactic| admit)
macro "hole_54" : tactic => `(tactic| admit)
macro "hole_55" : tactic => `(tactic| admit)
macro "hole_57" : tactic => `(tactic| admit)
macro "hole_58" : tactic => `(tactic| admit)
macro "hole_56" : tactic => `(tactic| admit)
macro "hole_59" : tactic => `(tactic| admit)
macro "hole_60" : tactic => `(tactic| admit)
macro "hole_61" : tactic => `(tactic| admit)
macro "hole_63" : tactic => `(tactic| admit)
macro "hole_64" : tactic => `(tactic| admit)
macro "hole_62" : tactic => `(tactic| admit)
macro "hole_49" : tactic => `(tactic| admit)
macro "hole_65" : tactic => `(tactic| admit)
macro "hole_67" : tactic => `(tactic| admit)
macro "hole_66" : tactic => `(tactic| admit)
macro "hole_69" : tactic => `(tactic| admit)
macro "hole_70" : tactic => `(tactic| admit)
macro "hole_71" : tactic => `(tactic| admit)
macro "hole_73" : tactic => `(tactic| admit)
macro "hole_72" : tactic => `(tactic| admit)
macro "hole_68" : tactic => `(tactic| admit)
macro "hole_75" : tactic => `(tactic| admit)
macro "hole_76" : tactic => `(tactic| admit)
macro "hole_77" : tactic => `(tactic| admit)
macro "hole_78" : tactic => `(tactic| admit)
macro "hole_79" : tactic => `(tactic| admit)
macro "hole_80" : tactic => `(tactic| admit)
macro "hole_81" : tactic => `(tactic| admit)
macro "hole_74" : tactic => `(tactic| admit)
macro "hole_82" : tactic => `(tactic| admit)
macro "hole_83" : tactic => `(tactic| admit)
macro "hole_84" : tactic => `(tactic| admit)
macro "hole_85" : tactic => `(tactic| admit)
macro "hole_86" : tactic => `(tactic| admit)
macro "hole_87" : tactic => `(tactic| admit)
macro "hole_88" : tactic => `(tactic| admit)
macro "hole_92" : tactic => `(tactic| admit)
macro "hole_93" : tactic => `(tactic| admit)
macro "hole_91" : tactic => `(tactic| admit)
macro "hole_90" : tactic => `(tactic| admit)
macro "hole_89" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem formal_statement (x y : ℤ) (hx : 2 < x) (hy : 2 < y) : ¬(∃ z : ℤ, (x^2 + 1) = z * (y^2 - 5)) := by
  intro h
  rcases h with ⟨z, hz⟩
  have h₁ : y = 3 → False := by
    intro h_y_eq_3
    have h2 : y = 3 := h_y_eq_3
    rw [h2] at hz
    have h3 : (x^2 + 1 : ℤ) = z * (3^2 - 5) := by hole_3
    have h4 : (x^2 + 1 : ℤ) = z * 4 := by hole_4
    have h5 : (x^2 + 1 : ℤ) % 4 = 0 := by
      hole_5
    have h6 : (x : ℤ) % 4 = 0 ∨ (x : ℤ) % 4 = 1 ∨ (x : ℤ) % 4 = 2 ∨ (x : ℤ) % 4 = 3 := by
      hole_6
    rcases h6 with (h6 | h6 | h6 | h6)
    · 
      have h7 : (x^2 + 1 : ℤ) % 4 = 1 := by
        have h8 : (x : ℤ) % 4 = 0 := h6
        have h9 : (x^2 : ℤ) % 4 = 0 := by
          have h10 : (x : ℤ) % 4 = 0 := h8
          have h11 : (x^2 : ℤ) % 4 = 0 := by
            hole_9
          hole_8
        have h12 : (x^2 + 1 : ℤ) % 4 = 1 := by
          hole_10
        hole_7
      omega
    · 
      have h7 : (x^2 + 1 : ℤ) % 4 = 2 := by
        have h8 : (x : ℤ) % 4 = 1 := h6
        have h9 : (x^2 : ℤ) % 4 = 1 := by
          have h10 : (x : ℤ) % 4 = 1 := h8
          have h11 : (x^2 : ℤ) % 4 = 1 := by
            hole_13
          hole_12
        have h12 : (x^2 + 1 : ℤ) % 4 = 2 := by
          hole_14
        hole_11
      omega
    · 
      have h7 : (x^2 + 1 : ℤ) % 4 = 1 := by
        have h8 : (x : ℤ) % 4 = 2 := h6
        have h9 : (x^2 : ℤ) % 4 = 0 := by
          have h10 : (x : ℤ) % 4 = 2 := h8
          have h11 : (x^2 : ℤ) % 4 = 0 := by
            hole_17
          hole_16
        have h12 : (x^2 + 1 : ℤ) % 4 = 1 := by
          hole_18
        hole_15
      omega
    · 
      have h7 : (x^2 + 1 : ℤ) % 4 = 2 := by
        have h8 : (x : ℤ) % 4 = 3 := h6
        have h9 : (x^2 : ℤ) % 4 = 1 := by
          have h10 : (x : ℤ) % 4 = 3 := h8
          have h11 : (x^2 : ℤ) % 4 = 1 := by
            hole_21
          hole_20
        have h12 : (x^2 + 1 : ℤ) % 4 = 2 := by
          hole_22
        hole_19
      hole_2
  
  have h₂ : y = 4 → False := by
    intro h₁
    have h₂ : y = 4 := h₁
    rw [h₂] at hz
    have h₃ : (x ^ 2 + 1 : ℤ) = z * (4 ^ 2 - 5) := by hole_24
    have h₄ : (x ^ 2 + 1 : ℤ) = z * 11 := by hole_25
    
    have h₅ : (x : ℤ) % 11 = 0 ∨ (x : ℤ) % 11 = 1 ∨ (x : ℤ) % 11 = 2 ∨ (x : ℤ) % 11 = 3 ∨ (x : ℤ) % 11 = 4 ∨ (x : ℤ) % 11 = 5 ∨ (x : ℤ) % 11 = 6 ∨ (x : ℤ) % 11 = 7 ∨ (x : ℤ) % 11 = 8 ∨ (x : ℤ) % 11 = 9 ∨ (x : ℤ) % 11 = 10 := by
      hole_26
    rcases h₅ with (h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅)
    · 
      have h₆ : (x : ℤ) % 11 = 0 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 1 := by
        have h₈ : (x : ℤ) % 11 = 0 := h₆
        have h₉ : (x ^ 2 : ℤ) % 11 = 0 := by
          hole_28
        hole_27
      omega
    · 
      have h₆ : (x : ℤ) % 11 = 1 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 2 := by
        have h₈ : (x : ℤ) % 11 = 1 := h₆
        have h₉ : (x ^ 2 : ℤ) % 11 = 1 := by
          hole_30
        hole_29
      omega
    · 
      have h₆ : (x : ℤ) % 11 = 2 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 5 := by
        have h₈ : (x : ℤ) % 11 = 2 := h₆
        have h₉ : (x ^ 2 : ℤ) % 11 = 4 := by
          hole_32
        hole_31
      omega
    · 
      have h₆ : (x : ℤ) % 11 = 3 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 10 := by
        have h₈ : (x : ℤ) % 11 = 3 := h₆
        have h₉ : (x ^ 2 : ℤ) % 11 = 9 := by
          hole_34
        hole_33
      omega
    · 
      have h₆ : (x : ℤ) % 11 = 4 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 6 := by
        have h₈ : (x : ℤ) % 11 = 4 := h₆
        have h₉ : (x ^ 2 : ℤ) % 11 = 5 := by
          hole_36
        hole_35
      omega
    · 
      have h₆ : (x : ℤ) % 11 = 5 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 4 := by
        have h₈ : (x : ℤ) % 11 = 5 := h₆
        have h₉ : (x ^ 2 : ℤ) % 11 = 3 := by
          hole_38
        hole_37
      omega
    · 
      have h₆ : (x : ℤ) % 11 = 6 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 4 := by
        have h₈ : (x : ℤ) % 11 = 6 := h₆
        have h₉ : (x ^ 2 : ℤ) % 11 = 3 := by
          hole_40
        hole_39
      omega
    · 
      have h₆ : (x : ℤ) % 11 = 7 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 6 := by
        have h₈ : (x : ℤ) % 11 = 7 := h₆
        have h₉ : (x ^ 2 : ℤ) % 11 = 5 := by
          hole_42
        hole_41
      omega
    · 
      have h₆ : (x : ℤ) % 11 = 8 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 10 := by
        have h₈ : (x : ℤ) % 11 = 8 := h₆
        have h₉ : (x ^ 2 : ℤ) % 11 = 9 := by
          hole_44
        hole_43
      omega
    · 
      have h₆ : (x : ℤ) % 11 = 9 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 5 := by
        have h₈ : (x : ℤ) % 11 = 9 := h₆
        have h₉ : (x ^ 2 : ℤ) % 11 = 4 := by
          hole_46
        hole_45
      omega
    · 
      have h₆ : (x : ℤ) % 11 = 10 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 2 := by
        have h₈ : (x : ℤ) % 11 = 10 := h₆
        have h₉ : (x ^ 2 : ℤ) % 11 = 1 := by
          hole_48
        hole_47
      hole_23
  
  have h₃ : y ≥ 5 → False := by
    intro h_y
    
    have h₄ : y ≥ 5 := h_y
    have h₅ : (y : ℤ) ≥ 5 := by hole_50
    have h₆ : y^2 - 5 > 0 := by
      hole_51
    have h₇ : (x : ℤ) ≥ 3 := by
      hole_52
    have h₈ : (y : ℤ) ≥ 5 := by hole_53
    have h₉ : (y : ℤ)^2 - 5 > 0 := by
      hole_54
    have h₁₀ : (x : ℤ)^2 + 1 > 0 := by
      hole_55
    have h₁₁ : z > 0 := by
      by_contra h₀
      have h₁ : z ≤ 0 := by hole_57
      have h₂ : (x : ℤ)^2 + 1 ≤ 0 := by
        hole_58
      hole_56
    have h₁₂ : (y : ℤ)^2 - 5 ≥ 20 := by
      hole_59
    have h₁₃ : z ≥ 1 := by hole_60
    have h₁₄ : z * ((y : ℤ)^2 - 5) ≥ z * 20 := by
      hole_61
    have h₁₅ : (x : ℤ)^2 + 1 < z * ((y : ℤ)^2 - 5) ∨ (x : ℤ)^2 + 1 = z * ((y : ℤ)^2 - 5) := by
      by_cases h₁₅ : (x : ℤ)^2 + 1 < z * ((y : ℤ)^2 - 5)
      · exact Or.inl h₁₅
      · have h₁₅' : (x : ℤ)^2 + 1 ≥ z * ((y : ℤ)^2 - 5) := by hole_63
        have h₁₅'' : (x : ℤ)^2 + 1 = z * ((y : ℤ)^2 - 5) := by
          hole_64
        hole_62
    hole_49
      
  have h₄ : False := by
    by_cases h₅ : y = 3
    · have h₆ : y = 3 := h₅
      have h₇ : False := h₁ h₆
      exact h₇
    · by_cases h₈ : y = 4
      · have h₉ : y = 4 := h₈
        have h₁₀ : False := h₂ h₉
        exact h₁₀
      · have h₁₁ : y ≥ 5 := by
          have h₁₂ : y > 2 := hy
          have h₁₃ : y ≠ 3 := h₅
          have h₁₄ : y ≠ 4 := h₈
          have h₁₅ : y ≥ 5 := by
            by_contra h₁₅
            have h₁₆ : y ≤ 4 := by hole_92
            have h₁₇ : y < 5 := by hole_93
            have h₁₈ : y > 2 := hy
            hole_91
          hole_90
        have h₁₆ : False := h₃ h₁₁
        hole_89
  
  hole_1