macro "hole_3" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_44" : tactic => `(tactic| admit)
macro "hole_45" : tactic => `(tactic| admit)
macro "hole_46" : tactic => `(tactic| admit)
macro "hole_47" : tactic => `(tactic| admit)
macro "hole_49" : tactic => `(tactic| admit)
macro "hole_50" : tactic => `(tactic| admit)
macro "hole_48" : tactic => `(tactic| admit)
macro "hole_43" : tactic => `(tactic| admit)
macro "hole_53" : tactic => `(tactic| admit)
macro "hole_54" : tactic => `(tactic| admit)
macro "hole_52" : tactic => `(tactic| admit)
macro "hole_56" : tactic => `(tactic| admit)
macro "hole_57" : tactic => `(tactic| admit)
macro "hole_55" : tactic => `(tactic| admit)
macro "hole_58" : tactic => `(tactic| admit)
macro "hole_59" : tactic => `(tactic| admit)
macro "hole_60" : tactic => `(tactic| admit)
macro "hole_61" : tactic => `(tactic| admit)
macro "hole_62" : tactic => `(tactic| admit)
macro "hole_51" : tactic => `(tactic| admit)
macro "hole_63" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem putnam_1982_a5
(a b c d : ℤ)
(hpos : a > 0 ∧ b > 0 ∧ c > 0 ∧ d > 0)
(hac : a + c ≤ 1982)
(hfrac : (a : ℝ) / b + (c : ℝ) / d < 1)
: (1 - (a : ℝ) / b - (c : ℝ) / d > 1 / 1983 ^ 3) := by
  have h₁ : b ≥ a + 1 := by
    by_contra h
    have h₂ : b ≤ a := by hole_3
    have h₃ : (a : ℝ) / b ≥ 1 := by
      have h₄ : (a : ℝ) / b ≥ 1 := by
        have h₅ : (b : ℝ) > 0 := by hole_6
        have h₆ : (a : ℝ) ≥ b := by
          have h₇ : (a : ℤ) ≥ b := by
            hole_8
          hole_7
        have h₇ : (a : ℝ) / b ≥ 1 := by
          hole_9
        hole_5
      hole_4
    have h₄ : (c : ℝ) / d > 0 := by
      have h₅ : (c : ℝ) > 0 := by hole_11
      have h₆ : (d : ℝ) > 0 := by hole_12
      hole_10
    have h₅ : (a : ℝ) / b + (c : ℝ) / d ≥ 1 := by
      hole_13
    hole_2
  
  have h₂ : d ≥ c + 1 := by
    by_contra h
    have h₃ : d ≤ c := by hole_15
    have h₄ : (c : ℝ) / d ≥ 1 := by
      have h₅ : (d : ℝ) > 0 := by hole_17
      have h₆ : (c : ℝ) ≥ d := by
        have h₇ : (c : ℤ) ≥ d := by hole_19
        hole_18
      have h₇ : (c : ℝ) / d ≥ 1 := by
        hole_20
      hole_16
    have h₅ : (a : ℝ) / b > 0 := by
      have h₅₁ : (a : ℝ) > 0 := by hole_22
      have h₅₂ : (b : ℝ) > 0 := by hole_23
      hole_21
    have h₆ : (a : ℝ) / b + (c : ℝ) / d ≥ 1 := by hole_24
    hole_14
  
  have h₃ : (a : ℝ) / b ≤ (a : ℝ) / (a + 1) := by
    have h₃₁ : (b : ℝ) ≥ (a + 1 : ℝ) := by
      hole_26
    have h₃₂ : (a : ℝ) > 0 := by hole_27
    have h₃₃ : (b : ℝ) > 0 := by hole_28
    have h₃₄ : (a : ℝ) / b ≤ (a : ℝ) / (a + 1 : ℝ) := by
      hole_29
    hole_25
  
  have h₄ : (c : ℝ) / d ≤ (c : ℝ) / (c + 1) := by
    have h₄₁ : (d : ℝ) ≥ (c + 1 : ℝ) := by
      hole_31
    have h₄₂ : (c : ℝ) > 0 := by hole_32
    have h₄₃ : (d : ℝ) > 0 := by hole_33
    have h₄₄ : (c : ℝ) / d ≤ (c : ℝ) / (c + 1 : ℝ) := by
      hole_34
    hole_30
  
  have h₅ : 1 - (a : ℝ) / b - (c : ℝ) / d ≥ 1 / ((a + 1 : ℝ) * (c + 1 : ℝ)) := by
    have h₅₁ : (a : ℝ) / b ≤ (a : ℝ) / (a + 1) := h₃
    have h₅₂ : (c : ℝ) / d ≤ (c : ℝ) / (c + 1) := h₄
    have h₅₃ : 1 - (a : ℝ) / b - (c : ℝ) / d ≥ 1 - (a : ℝ) / (a + 1) - (c : ℝ) / (c + 1) := by
      hole_36
    have h₅₄ : (1 : ℝ) - (a : ℝ) / (a + 1) - (c : ℝ) / (c + 1) = 1 / ((a + 1 : ℝ) * (c + 1 : ℝ)) := by
      have h₅₄₁ : (a : ℝ) > 0 := by hole_38
      have h₅₄₂ : (c : ℝ) > 0 := by hole_39
      have h₅₄₃ : (a + 1 : ℝ) > 0 := by hole_40
      have h₅₄₄ : (c + 1 : ℝ) > 0 := by hole_41
      hole_37
    have h₅₅ : 1 - (a : ℝ) / b - (c : ℝ) / d ≥ 1 / ((a + 1 : ℝ) * (c + 1 : ℝ)) := by
      hole_42
    hole_35
  
  have h₆ : ((a + 1 : ℤ) : ℝ) * ((c + 1 : ℤ) : ℝ) ≤ (992 : ℝ)^2 := by
    norm_cast at hac ⊢
    have h₆₁ : a ≤ 1982 := by
      hole_44
    have h₆₂ : c ≤ 1982 := by
      hole_45
    have h₆₃ : a ≥ 1 := by hole_46
    have h₆₄ : c ≥ 1 := by hole_47
    have h₆₅ : a + c ≤ 1982 := hac
    have h₆₆ : (a + 1 : ℤ) * (c + 1 : ℤ) ≤ 992 ^ 2 := by
      have h₆₇ : a + c ≤ 1982 := hac
      have h₆₈ : (a + 1 : ℤ) + (c + 1 : ℤ) ≤ 1984 := by
        hole_49
      have h₆₉ : (a + 1 : ℤ) * (c + 1 : ℤ) ≤ 992 ^ 2 := by
        hole_50
      hole_48
    hole_43
  
  have h₇ : 1 / ((a + 1 : ℝ) * (c + 1 : ℝ)) > (1 : ℝ) / 1983 ^ 3 := by
    have h₇₁ : (a + 1 : ℝ) > 0 := by
      have h₇₁₁ : (a : ℤ) > 0 := by hole_53
      have h₇₁₂ : (a : ℝ) > 0 := by hole_54
      hole_52
    have h₇₂ : (c + 1 : ℝ) > 0 := by
      have h₇₂₁ : (c : ℤ) > 0 := by hole_56
      have h₇₂₂ : (c : ℝ) > 0 := by hole_57
      hole_55
    have h₇₃ : (a + 1 : ℝ) * (c + 1 : ℝ) > 0 := by hole_58
    have h₇₄ : (a + 1 : ℝ) * (c + 1 : ℝ) ≤ (992 : ℝ) ^ 2 := by
      hole_59
    have h₇₅ : (1 : ℝ) / ((a + 1 : ℝ) * (c + 1 : ℝ)) ≥ (1 : ℝ) / (992 ^ 2 : ℝ) := by
      hole_60
    have h₇₆ : (1 : ℝ) / (992 ^ 2 : ℝ) > (1 : ℝ) / 1983 ^ 3 := by
      hole_61
    have h₇₇ : (1 : ℝ) / ((a + 1 : ℝ) * (c + 1 : ℝ)) > (1 : ℝ) / 1983 ^ 3 := by
      have h₇₇₁ : (1 : ℝ) / ((a + 1 : ℝ) * (c + 1 : ℝ)) ≥ (1 : ℝ) / (992 ^ 2 : ℝ) := h₇₅
      have h₇₇₂ : (1 : ℝ) / (992 ^ 2 : ℝ) > (1 : ℝ) / 1983 ^ 3 := h₇₆
      hole_62
    hole_51
  
  have h₈ : (1 - (a : ℝ) / b - (c : ℝ) / d > 1 / 1983 ^ 3) := by
    have h₈₁ : 1 - (a : ℝ) / b - (c : ℝ) / d ≥ 1 / ((a + 1 : ℝ) * (c + 1 : ℝ)) := h₅
    have h₈₂ : 1 / ((a + 1 : ℝ) * (c + 1 : ℝ)) > 1 / (1983 : ℝ) ^ 3 := h₇
    hole_63
  
  hole_1