macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_43" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_44" : tactic => `(tactic| admit)
macro "hole_45" : tactic => `(tactic| admit)
macro "hole_46" : tactic => `(tactic| admit)
macro "hole_47" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_50" : tactic => `(tactic| admit)
macro "hole_49" : tactic => `(tactic| admit)
macro "hole_51" : tactic => `(tactic| admit)
macro "hole_52" : tactic => `(tactic| admit)
macro "hole_53" : tactic => `(tactic| admit)
macro "hole_54" : tactic => `(tactic| admit)
macro "hole_48" : tactic => `(tactic| admit)
macro "hole_57" : tactic => `(tactic| admit)
macro "hole_56" : tactic => `(tactic| admit)
macro "hole_58" : tactic => `(tactic| admit)
macro "hole_59" : tactic => `(tactic| admit)
macro "hole_60" : tactic => `(tactic| admit)
macro "hole_61" : tactic => `(tactic| admit)
macro "hole_55" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem aime_1988_p8 (f : ℕ → ℕ → ℝ) (h₀ : ∀ x, 0 < x → f x x = x)
    (h₁ : ∀ x y, 0 < x ∧ 0 < y → f x y = f y x)
    (h₂ : ∀ x y, 0 < x ∧ 0 < y → (↑x + ↑y) * f x y = y * f x (x + y)) : f 14 52 = 364 := by
  have h₃ : f 2 2 = 2 := by
    have h₃₁ : f 2 2 = 2 := by
      have h₃₂ : f 2 2 = (2 : ℝ) := by
        have h₃₃ : (0 : ℕ) < 2 := by hole_5
        have h₃₄ : f 2 2 = (2 : ℝ) := by
          hole_6
        hole_4
      hole_3
    hole_2
  
  have h₄ : f 2 4 = 4 := by
    have h₄₁ : (↑2 + ↑2 : ℝ) * f 2 2 = (2 : ℝ) * f 2 4 := by
      have h₄₂ : 0 < (2 : ℕ) ∧ 0 < (2 : ℕ) := by hole_9
      have h₄₃ := h₂ 2 2 h₄₂
      hole_8
    have h₄₂ : (↑2 + ↑2 : ℝ) * f 2 2 = (2 : ℝ) * f 2 4 := by
      hole_10
    have h₄₃ : f 2 2 = (2 : ℝ) := by hole_11
    have h₄₄ : (↑2 + ↑2 : ℝ) * f 2 2 = (2 : ℝ) * f 2 4 := by hole_12
    have h₄₅ : f 2 4 = 4 := by
      hole_13
    hole_7
  
  have h₅ : f 4 2 = 4 := by
    have h₅₁ : f 4 2 = f 2 4 := by
      hole_15
    hole_14
  
  have h₆ : f 4 6 = 12 := by
    have h₆₁ : (↑4 + ↑2 : ℝ) * f 4 2 = (↑2 : ℝ) * f 4 6 := by
      have h₆₂ : 0 < (4 : ℕ) ∧ 0 < (2 : ℕ) := by hole_18
      have h₆₃ := h₂ 4 2 h₆₂
      hole_17
    have h₆₄ : (↑4 + ↑2 : ℝ) * f 4 2 = (↑2 : ℝ) * f 4 6 := by
      hole_19
    have h₆₅ : f 4 2 = (4 : ℝ) := by hole_20
    have h₆₆ : (↑4 + ↑2 : ℝ) * f 4 2 = (↑2 : ℝ) * f 4 6 := by hole_21
    have h₆₇ : f 4 6 = 12 := by
      hole_22
    hole_16
  
  have h₇ : f 4 10 = 20 := by
    have h₇₁ : (↑4 + ↑6 : ℝ) * f 4 6 = (↑6 : ℝ) * f 4 10 := by
      have h₇₂ : 0 < (4 : ℕ) ∧ 0 < (6 : ℕ) := by hole_25
      have h₇₃ := h₂ 4 6 h₇₂
      hole_24
    have h₇₄ : (↑4 + ↑6 : ℝ) * f 4 6 = (↑6 : ℝ) * f 4 10 := by
      hole_26
    have h₇₅ : f 4 6 = (12 : ℝ) := by hole_27
    have h₇₆ : (↑4 + ↑6 : ℝ) * f 4 6 = (↑6 : ℝ) * f 4 10 := by hole_28
    have h₇₇ : f 4 10 = 20 := by
      hole_29
    hole_23
  
  have h₈ : f 10 4 = 20 := by
    have h₈₁ : f 10 4 = f 4 10 := by
      hole_31
    hole_30
  
  have h₉ : f 10 14 = 70 := by
    have h₉₁ : (↑10 + ↑4 : ℝ) * f 10 4 = (↑4 : ℝ) * f 10 14 := by
      have h₉₂ : 0 < (10 : ℕ) ∧ 0 < (4 : ℕ) := by hole_34
      have h₉₃ := h₂ 10 4 h₉₂
      hole_33
    have h₉₄ : (↑10 + ↑4 : ℝ) * f 10 4 = (↑4 : ℝ) * f 10 14 := by
      hole_35
    have h₉₅ : f 10 4 = (20 : ℝ) := by hole_36
    have h₉₆ : (↑10 + ↑4 : ℝ) * f 10 4 = (↑4 : ℝ) * f 10 14 := by hole_37
    have h₉₇ : f 10 14 = 70 := by
      hole_38
    hole_32
  
  have h₁₀ : f 14 10 = 70 := by
    have h₁₀₁ : f 14 10 = f 10 14 := by
      hole_40
    hole_39
  
  have h₁₁ : f 14 24 = 168 := by
    have h₁₁₁ : (↑14 + ↑10 : ℝ) * f 14 10 = (↑10 : ℝ) * f 14 24 := by
      have h₁₁₂ : 0 < (14 : ℕ) ∧ 0 < (10 : ℕ) := by hole_43
      have h₁₁₃ := h₂ 14 10 h₁₁₂
      hole_42
    have h₁₁₄ : (↑14 + ↑10 : ℝ) * f 14 10 = (↑10 : ℝ) * f 14 24 := by
      hole_44
    have h₁₁₅ : f 14 10 = (70 : ℝ) := by hole_45
    have h₁₁₆ : (↑14 + ↑10 : ℝ) * f 14 10 = (↑10 : ℝ) * f 14 24 := by hole_46
    have h₁₁₇ : f 14 24 = 168 := by
      hole_47
    hole_41
  
  have h₁₂ : f 14 38 = 266 := by
    have h₁₂₁ : (↑14 + ↑24 : ℝ) * f 14 24 = (↑24 : ℝ) * f 14 38 := by
      have h₁₂₂ : 0 < (14 : ℕ) ∧ 0 < (24 : ℕ) := by hole_50
      have h₁₂₃ := h₂ 14 24 h₁₂₂
      hole_49
    have h₁₂₄ : (↑14 + ↑24 : ℝ) * f 14 24 = (↑24 : ℝ) * f 14 38 := by
      hole_51
    have h₁₂₅ : f 14 24 = (168 : ℝ) := by hole_52
    have h₁₂₆ : (↑14 + ↑24 : ℝ) * f 14 24 = (↑24 : ℝ) * f 14 38 := by hole_53
    have h₁₂₇ : f 14 38 = 266 := by
      hole_54
    hole_48
  
  have h₁₃ : f 14 52 = 364 := by
    have h₁₃₁ : (↑14 + ↑38 : ℝ) * f 14 38 = (↑38 : ℝ) * f 14 52 := by
      have h₁₃₂ : 0 < (14 : ℕ) ∧ 0 < (38 : ℕ) := by hole_57
      have h₁₃₃ := h₂ 14 38 h₁₃₂
      hole_56
    have h₁₃₄ : (↑14 + ↑38 : ℝ) * f 14 38 = (↑38 : ℝ) * f 14 52 := by
      hole_58
    have h₁₃₅ : f 14 38 = (266 : ℝ) := by hole_59
    have h₁₃₆ : (↑14 + ↑38 : ℝ) * f 14 38 = (↑38 : ℝ) * f 14 52 := by hole_60
    have h₁₃₇ : f 14 52 = 364 := by
      hole_61
    hole_55
  
  hole_1