macro "hole_3" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_43" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_46" : tactic => `(tactic| admit)
macro "hole_45" : tactic => `(tactic| admit)
macro "hole_44" : tactic => `(tactic| admit)
macro "hole_47" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_50" : tactic => `(tactic| admit)
macro "hole_51" : tactic => `(tactic| admit)
macro "hole_54" : tactic => `(tactic| admit)
macro "hole_53" : tactic => `(tactic| admit)
macro "hole_52" : tactic => `(tactic| admit)
macro "hole_57" : tactic => `(tactic| admit)
macro "hole_56" : tactic => `(tactic| admit)
macro "hole_55" : tactic => `(tactic| admit)
macro "hole_58" : tactic => `(tactic| admit)
macro "hole_49" : tactic => `(tactic| admit)
macro "hole_48" : tactic => `(tactic| admit)
macro "hole_61" : tactic => `(tactic| admit)
macro "hole_62" : tactic => `(tactic| admit)
macro "hole_65" : tactic => `(tactic| admit)
macro "hole_64" : tactic => `(tactic| admit)
macro "hole_63" : tactic => `(tactic| admit)
macro "hole_68" : tactic => `(tactic| admit)
macro "hole_67" : tactic => `(tactic| admit)
macro "hole_66" : tactic => `(tactic| admit)
macro "hole_69" : tactic => `(tactic| admit)
macro "hole_60" : tactic => `(tactic| admit)
macro "hole_59" : tactic => `(tactic| admit)
macro "hole_72" : tactic => `(tactic| admit)
macro "hole_73" : tactic => `(tactic| admit)
macro "hole_76" : tactic => `(tactic| admit)
macro "hole_75" : tactic => `(tactic| admit)
macro "hole_74" : tactic => `(tactic| admit)
macro "hole_79" : tactic => `(tactic| admit)
macro "hole_78" : tactic => `(tactic| admit)
macro "hole_77" : tactic => `(tactic| admit)
macro "hole_80" : tactic => `(tactic| admit)
macro "hole_71" : tactic => `(tactic| admit)
macro "hole_70" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_82" : tactic => `(tactic| admit)
macro "hole_83" : tactic => `(tactic| admit)
macro "hole_84" : tactic => `(tactic| admit)
macro "hole_81" : tactic => `(tactic| admit)
macro "hole_86" : tactic => `(tactic| admit)
macro "hole_87" : tactic => `(tactic| admit)
macro "hole_88" : tactic => `(tactic| admit)
macro "hole_85" : tactic => `(tactic| admit)
macro "hole_90" : tactic => `(tactic| admit)
macro "hole_91" : tactic => `(tactic| admit)
macro "hole_92" : tactic => `(tactic| admit)
macro "hole_89" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem amc12a_2021_p8 (d : ℕ → ℕ) (h₀ : d 0 = 0) (h₁ : d 1 = 0) (h₂ : d 2 = 1)
    (h₃ : ∀ n ≥ 3, d n = d (n - 1) + d (n - 3)) : Even (d 2021) ∧ Odd (d 2022) ∧ Even (d 2023) := by
  have h₄ : ∀ n : ℕ, (n % 7 = 0 → d n % 2 = 0) ∧ (n % 7 = 1 → d n % 2 = 0) ∧ (n % 7 = 2 → d n % 2 = 1) ∧ (n % 7 = 3 → d n % 2 = 1) ∧ (n % 7 = 4 → d n % 2 = 1) ∧ (n % 7 = 5 → d n % 2 = 0) ∧ (n % 7 = 6 → d n % 2 = 1) := by
    intro n
    have h₄₁ : (n % 7 = 0 → d n % 2 = 0) ∧ (n % 7 = 1 → d n % 2 = 0) ∧ (n % 7 = 2 → d n % 2 = 1) ∧ (n % 7 = 3 → d n % 2 = 1) ∧ (n % 7 = 4 → d n % 2 = 1) ∧ (n % 7 = 5 → d n % 2 = 0) ∧ (n % 7 = 6 → d n % 2 = 1) := by
      hole_3
      have h₅₆ := h₅₅ (by omega)
      hole_83
    have h₅₄ : Even (d 2021) := by
      hole_84
    hole_81
  have h₆ : Odd (d 2022) := by
    have h₆₁ := h₄ 2022
    have h₆₂ : 2022 % 7 = 6 := by hole_86
    have h₆₃ : d 2022 % 2 = 1 := by
      have h₆₄ := h₆₁.2.2.2.2.2.2
      have h₆₅ := h₆₄
      have h₆₆ := h₆₅ (by omega)
      hole_87
    have h₆₄ : Odd (d 2022) := by
      hole_88
    hole_85
  have h₇ : Even (d 2023) := by
    have h₇₁ := h₄ 2023
    have h₇₂ : 2023 % 7 = 0 := by hole_90
    have h₇₃ : d 2023 % 2 = 0 := by
      have h₇₄ := h₇₁.1
      have h₇₅ := h₇₄
      have h₇₆ := h₇₅ (by omega)
      hole_91
    have h₇₄ : Even (d 2023) := by
      hole_92
    hole_89
  hole_1