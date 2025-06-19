macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_81" : tactic => `(tactic| admit)
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
macro "hole_82" : tactic => `(tactic| admit)
macro "hole_83" : tactic => `(tactic| admit)
macro "hole_84" : tactic => `(tactic| admit)
macro "hole_85" : tactic => `(tactic| admit)
macro "hole_86" : tactic => `(tactic| admit)
macro "hole_87" : tactic => `(tactic| admit)
macro "hole_88" : tactic => `(tactic| admit)
macro "hole_89" : tactic => `(tactic| admit)
macro "hole_90" : tactic => `(tactic| admit)
macro "hole_91" : tactic => `(tactic| admit)
macro "hole_92" : tactic => `(tactic| admit)
macro "hole_93" : tactic => `(tactic| admit)
macro "hole_94" : tactic => `(tactic| admit)
macro "hole_95" : tactic => `(tactic| admit)
macro "hole_96" : tactic => `(tactic| admit)
macro "hole_98" : tactic => `(tactic| admit)
macro "hole_99" : tactic => `(tactic| admit)

theorem putnam_1962_b5
(n : ℤ)
(ng1 : n > 1)
: (3 * (n : ℝ) + 1) / (2 * n + 2) < ∑ i : Finset.Icc 1 n, ((i : ℝ) / n) ^ (n : ℝ) ∧ ∑ i : Finset.Icc 1 n, ((i : ℝ) / n) ^ (n : ℝ) < 2 := by
  have h_main : (3 * (n : ℝ) + 1) / (2 * n + 2) < ∑ i : Finset.Icc 1 n, ((i : ℝ) / n) ^ (n : ℝ) ∧ ∑ i : Finset.Icc 1 n, ((i : ℝ) / n) ^ (n : ℝ) < 2 := by
    have h₂ : n ≥ 2 := by
      hole_1
    have h₃ : (n : ℤ) ≥ 2 := by hole_2
    have h₄ : (n : ℝ) ≥ 2 := by hole_3
    
    have h₅ : (3 * (n : ℝ) + 1) / (2 * n + 2) < ∑ i : Finset.Icc 1 n, ((i : ℝ) / n) ^ (n : ℝ) := by
      have h₅₁ : n ≤ 4 ∨ n ≥ 5 := by
        hole_4
      hole_81
          norm_num
          <;>
          linarith
        · 
          norm_num [Finset.sum_Icc_succ_top, Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_ofNat]
          <;>
          norm_num
          <;>
          ring_nf
          <;>
          norm_num
          <;>
          linarith
        · 
          norm_num [Finset.sum_Icc_succ_top, Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_ofNat]
          <;>
          norm_num
          <;>
          ring_nf
          <;>
          norm_num
          <;>
          linarith
      | inr h₆₁ =>
        
        have h₆₂ : n ≥ 6 := h₆₁
        have h₆₃ : (n : ℝ) ≥ 6 := by hole_85
        have h₆₄ : ∑ i : Finset.Icc 1 n, ((i : ℝ) / n) ^ (n : ℝ) < 2 := by
          have h₆₅ : ∑ i : Finset.Icc 1 n, ((i : ℝ) / n) ^ (n : ℝ) < 2 := by
            have h₆₅₁ : (n : ℤ) ≥ 6 := by hole_86
            have h₆₅₂ : (n : ℤ) ≥ 6 := by hole_87
            have h₆₅₃ : ∑ i : Finset.Icc 1 n, ((i : ℝ) / n) ^ (n : ℝ) < 2 := by
              
              have h₆₅₄ : (n : ℤ) ≥ 6 := by hole_88
              have h₆₅₅ : (n : ℤ) ≥ 6 := by hole_89
              have h₆₅₆ : ∑ i : Finset.Icc 1 n, ((i : ℝ) / n) ^ (n : ℝ) < 2 := by
                
                have h₆₅₇ : (n : ℤ) ≥ 6 := by hole_90
                have h₆₅₈ : (n : ℤ) ≥ 6 := by hole_91
                have h₆₅₉ : ∑ i : Finset.Icc 1 n, ((i : ℝ) / n) ^ (n : ℝ) < 2 := by
                  
                  hole_92
                hole_93
              hole_94
            hole_95
          hole_96
        exact h₆₄
    hole_98
  hole_99