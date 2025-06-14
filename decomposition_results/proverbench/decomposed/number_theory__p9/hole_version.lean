macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_45" : tactic => `(tactic| admit)
macro "hole_48" : tactic => `(tactic| admit)
macro "hole_47" : tactic => `(tactic| admit)
macro "hole_51" : tactic => `(tactic| admit)
macro "hole_52" : tactic => `(tactic| admit)
macro "hole_55" : tactic => `(tactic| admit)
macro "hole_56" : tactic => `(tactic| admit)
macro "hole_58" : tactic => `(tactic| admit)
macro "hole_57" : tactic => `(tactic| admit)
macro "hole_60" : tactic => `(tactic| admit)
macro "hole_61" : tactic => `(tactic| admit)
macro "hole_63" : tactic => `(tactic| admit)
macro "hole_62" : tactic => `(tactic| admit)
macro "hole_59" : tactic => `(tactic| admit)
macro "hole_54" : tactic => `(tactic| admit)
macro "hole_53" : tactic => `(tactic| admit)
macro "hole_50" : tactic => `(tactic| admit)
macro "hole_49" : tactic => `(tactic| admit)
macro "hole_46" : tactic => `(tactic| admit)
macro "hole_44" : tactic => `(tactic| admit)
macro "hole_43" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_66" : tactic => `(tactic| admit)
macro "hole_67" : tactic => `(tactic| admit)
macro "hole_68" : tactic => `(tactic| admit)
macro "hole_65" : tactic => `(tactic| admit)
macro "hole_70" : tactic => `(tactic| admit)
macro "hole_71" : tactic => `(tactic| admit)
macro "hole_73" : tactic => `(tactic| admit)
macro "hole_72" : tactic => `(tactic| admit)
macro "hole_74" : tactic => `(tactic| admit)
macro "hole_75" : tactic => `(tactic| admit)
macro "hole_76" : tactic => `(tactic| admit)
macro "hole_77" : tactic => `(tactic| admit)
macro "hole_69" : tactic => `(tactic| admit)
macro "hole_79" : tactic => `(tactic| admit)
macro "hole_82" : tactic => `(tactic| admit)
macro "hole_84" : tactic => `(tactic| admit)
macro "hole_86" : tactic => `(tactic| admit)
macro "hole_88" : tactic => `(tactic| admit)
macro "hole_87" : tactic => `(tactic| admit)
macro "hole_85" : tactic => `(tactic| admit)
macro "hole_83" : tactic => `(tactic| admit)
macro "hole_81" : tactic => `(tactic| admit)
macro "hole_89" : tactic => `(tactic| admit)
macro "hole_91" : tactic => `(tactic| admit)
macro "hole_90" : tactic => `(tactic| admit)
macro "hole_93" : tactic => `(tactic| admit)
macro "hole_94" : tactic => `(tactic| admit)
macro "hole_92" : tactic => `(tactic| admit)
macro "hole_80" : tactic => `(tactic| admit)
macro "hole_78" : tactic => `(tactic| admit)
macro "hole_64" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem perfect_square_condition {m : ℤ} (h : m = 2 + 2 * Real.sqrt (28 * n^2 + 1))
  (h_int : ∃ k : ℤ, Real.sqrt (28 * n^2 + 1) = k) :
  ∃ k : ℤ, m = k^2 := by
  have h_main : ∃ (t : ℤ), m = t ^ 2 := by
    obtain ⟨k, hk⟩ := h_int
    have h₁ : (k : ℝ) = Real.sqrt (28 * (n : ℝ)^2 + 1) := by
      hole_3
    have h₂ : (k : ℝ) ^ 2 = (28 * (n : ℝ) ^ 2 + 1 : ℝ) := by
      hole_4
    have h₃ : (k : ℤ) ^ 2 = 28 * n ^ 2 + 1 := by
      have h₃₁ : (k : ℤ) ^ 2 = 28 * n ^ 2 + 1 := by
        hole_6
      hole_5
    have h₄ : m = 2 + 2 * k := by
      have h₄₁ : (m : ℝ) = 2 + 2 * Real.sqrt (28 * (n : ℝ) ^ 2 + 1) := by
        hole_8
      have h₄₂ : (m : ℝ) = 2 + 2 * (k : ℝ) := by
        hole_9
      have h₄₃ : m = 2 + 2 * k := by
        hole_10
      hole_7
    have h₅ : k ≥ 0 := by
      by_contra h₅₁
      have h₅₂ : k < 0 := by hole_12
      have h₅₃ : (k : ℝ) < 0 := by hole_13
      have h₅₄ : Real.sqrt (28 * (n : ℝ) ^ 2 + 1) > 0 := by hole_14
      have h₅₅ : (k : ℝ) < Real.sqrt (28 * (n : ℝ) ^ 2 + 1) := by
        hole_15
      have h₅₆ : (k : ℝ) < Real.sqrt (28 * (n : ℝ) ^ 2 + 1) := by
        hole_16
      have h₅₇ : (k : ℝ) ≠ Real.sqrt (28 * (n : ℝ) ^ 2 + 1) := by
        hole_17
      have h₅₈ : False := by
        hole_18
      hole_11
    have h₆ : ∃ (t : ℤ), m = t ^ 2 := by
      have h₆₁ : m = 2 + 2 * k := by hole_20
      have h₆₂ : (k : ℤ) ^ 2 = 28 * n ^ 2 + 1 := by hole_21
      have h₆₃ : (k : ℤ) ≥ 0 := by hole_22
      have h₆₄ : ∃ (a b : ℤ), (k - 1) / 2 = 7 * a ^ 2 ∧ (k + 1) / 2 = b ^ 2 := by
        have h₆₄₁ : (k - 1 : ℤ) % 2 = 0 := by
          have h₆₄₂ : (k : ℤ) % 2 = 1 := by
            by_contra h₆₄₃
            have h₆₄₄ : (k : ℤ) % 2 = 0 := by
              hole_26
            have h₆₄₅ : (k : ℤ) ^ 2 % 4 = 0 := by
              have h₆₄₆ : (k : ℤ) % 4 = 0 ∨ (k : ℤ) % 4 = 2 := by
                hole_28
              hole_27
            have h₆₄₆ : (28 * n ^ 2 + 1 : ℤ) % 4 = 1 := by
              have h₆₄₇ : (n : ℤ) ^ 2 % 4 = 0 ∨ (n : ℤ) ^ 2 % 4 = 1 := by
                have h₆₄₈ : (n : ℤ) % 4 = 0 ∨ (n : ℤ) % 4 = 1 ∨ (n : ℤ) % 4 = 2 ∨ (n : ℤ) % 4 = 3 := by
                  hole_31
                hole_30
              hole_29
            hole_25
          hole_24
        have h₆₄₂ : (k + 1 : ℤ) % 2 = 0 := by
          have h₆₄₃ : (k : ℤ) % 2 = 1 := by
            by_contra h₆₄₄
            have h₆₄₅ : (k : ℤ) % 2 = 0 := by
              hole_34
            have h₆₄₆ : (k : ℤ) ^ 2 % 4 = 0 := by
              have h₆₄₇ : (k : ℤ) % 4 = 0 ∨ (k : ℤ) % 4 = 2 := by
                hole_36
              hole_35
            have h₆₄₇ : (28 * n ^ 2 + 1 : ℤ) % 4 = 1 := by
              have h₆₄₈ : (n : ℤ) ^ 2 % 4 = 0 ∨ (n : ℤ) ^ 2 % 4 = 1 := by
                have h₆₄₉ : (n : ℤ) % 4 = 0 ∨ (n : ℤ) % 4 = 1 ∨ (n : ℤ) % 4 = 2 ∨ (n : ℤ) % 4 = 3 := by
                  hole_39
                hole_38
              hole_37
            hole_33
          hole_32
        have h₆₄₃ : ∃ (a b : ℤ), (k - 1) / 2 = 7 * a ^ 2 ∧ (k + 1) / 2 = b ^ 2 := by
          have h₆₄₄ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2 := by
            have h₆₄₅ : (k - 1 : ℤ) / 2 * 2 = (k - 1 : ℤ) := by
              hole_42
            have h₆₄₆ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2 := by
              have h₆₄₇ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2 := by
                have h₆₄₈ : (k - 1 : ℤ) / 2 * 2 = (k - 1 : ℤ) := by
                  hole_45
                have h₆₄₉ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2 := by
                  have h₆₄₁₀ : (k - 1 : ℤ) * (k + 1 : ℤ) = 4 * 7 * (n : ℤ) ^ 2 := by
                    have h₆₄₁₁ : (k : ℤ) ^ 2 = 28 * (n : ℤ) ^ 2 + 1 := by
                      hole_48
                    hole_47
                  have h₆₄₁₂ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2 := by
                    have h₆₄₁₃ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2 := by
                      have h₆₄₁₄ : (k - 1 : ℤ) % 2 = 0 := by
                        hole_51
                      have h₆₄₁₅ : (k + 1 : ℤ) % 2 = 0 := by
                        hole_52
                      have h₆₄₁₆ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2 := by
                        have h₆₄₁₇ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2 := by
                          have h₆₄₁₈ : (k - 1 : ℤ) / 2 * 2 = (k - 1 : ℤ) := by
                            hole_55
                          have h₆₄₁₉ : (k + 1 : ℤ) / 2 * 2 = (k + 1 : ℤ) := by
                            hole_56
                          have h₆₄₂₀ : (k - 1 : ℤ) * (k + 1 : ℤ) = 4 * 7 * (n : ℤ) ^ 2 := by
                            have h₆₄₂₁ : (k : ℤ) ^ 2 = 28 * (n : ℤ) ^ 2 + 1 := by
                              hole_58
                            hole_57
                          have h₆₄₂₂ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2 := by
                            have h₆₄₂₃ : (k - 1 : ℤ) / 2 * 2 = (k - 1 : ℤ) := by
                              hole_60
                            have h₆₄₂₄ : (k + 1 : ℤ) / 2 * 2 = (k + 1 : ℤ) := by
                              hole_61
                            have h₆₄₂₅ : (k - 1 : ℤ) * (k + 1 : ℤ) = 4 * 7 * (n : ℤ) ^ 2 := by
                              have h₆₄₂₆ : (k : ℤ) ^ 2 = 28 * (n : ℤ) ^ 2 + 1 := by
                                hole_63
                              hole_62
                            hole_59
                          hole_54
                        hole_53
                      hole_50
                    hole_49
                  hole_46
                hole_44
              hole_43
            hole_41
          have h₆₄₅ : ∃ (a b : ℤ), (k - 1) / 2 = 7 * a ^ 2 ∧ (k + 1) / 2 = b ^ 2 := by
            have h₆₄₆ : (k - 1 : ℤ) / 2 ≥ 0 := by
              by_contra h₆₄₇
              have h₆₄₈ : (k - 1 : ℤ) / 2 < 0 := by
                hole_66
              have h₆₄₉ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) < 0 := by
                hole_67
              have h₆₅₀ : 7 * (n : ℤ) ^ 2 ≥ 0 := by hole_68
              hole_65
            have h₆₅₁ : (k + 1 : ℤ) / 2 ≥ 0 := by
              by_contra h₆₅₂
              have h₆₅₃ : (k + 1 : ℤ) / 2 < 0 := by
                hole_70
              have h₆₅₄ : (k + 1 : ℤ) / 2 ≤ 0 := by
                hole_71
              have h₆₅₅ : (k + 1 : ℤ) ≤ 0 := by
                have h₆₅₆ : (k + 1 : ℤ) / 2 * 2 ≤ 0 := by
                  hole_73
                hole_72
              have h₆₅₆ : (k : ℤ) ≤ -1 := by
                hole_74
              have h₆₅₇ : (k : ℤ) ^ 2 ≥ 1 := by
                hole_75
              have h₆₅₈ : 28 * (n : ℤ) ^ 2 + 1 ≥ 1 := by
                hole_76
              have h₆₅₉ : (k : ℤ) ^ 2 = 28 * (n : ℤ) ^ 2 + 1 := by
                hole_77
              hole_69
            have h₆₅₂ : ∃ (a b : ℤ), (k - 1) / 2 = 7 * a ^ 2 ∧ (k + 1) / 2 = b ^ 2 := by
              have h₆₅₃ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2 := by
                hole_79
              have h₆₅₄ : ∃ (a b : ℤ), (k - 1) / 2 = 7 * a ^ 2 ∧ (k + 1) / 2 = b ^ 2 := by
                have h₆₅₅ : ∃ (a : ℤ), (k - 1) / 2 = 7 * a ^ 2 := by
                  have h₆₅₆ : 7 ∣ (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) := by
                    hole_82
                  have h₆₅₇ : 7 ∣ (k - 1 : ℤ) / 2 ∨ 7 ∣ ((k - 1 : ℤ) / 2 + 1) := by
                    have h₆₅₈ : 7 ∣ (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) := by
                      hole_84
                    have h₆₅₉ : 7 ∣ (k - 1 : ℤ) / 2 ∨ 7 ∣ ((k - 1 : ℤ) / 2 + 1) := by
                      
                      have h₆₅₁₀ : 7 ∣ (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) := by
                        hole_86
                      have h₆₅₁₁ : 7 ∣ (k - 1 : ℤ) / 2 ∨ 7 ∣ ((k - 1 : ℤ) / 2 + 1) := by
                        
                        have h₆₅₁₂ : 7 ∣ (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) := by
                          hole_88
                        hole_87
                      hole_85
                    hole_83
                  hole_81
                obtain ⟨a, ha⟩ := h₆₅₅
                have h₆₅₆ : ∃ (b : ℤ), (k + 1) / 2 = b ^ 2 := by
                  have h₆₅₇ : (k + 1 : ℤ) / 2 = ((k + 1 : ℤ) / 2) := by hole_93
                  have h₆₅₈ : ∃ (b : ℤ), (k + 1) / 2 = b ^ 2 := by
                    hole_94
                  hole_92
                hole_80
              hole_78
            hole_64
          hole_40
        hole_23
      hole_19
    hole_2
  hole_1