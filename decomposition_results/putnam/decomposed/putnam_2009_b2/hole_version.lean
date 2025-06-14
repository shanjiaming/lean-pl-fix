macro "hole_5" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_43" : tactic => `(tactic| admit)
macro "hole_44" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_45" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_47" : tactic => `(tactic| admit)
macro "hole_48" : tactic => `(tactic| admit)
macro "hole_50" : tactic => `(tactic| admit)
macro "hole_51" : tactic => `(tactic| admit)
macro "hole_49" : tactic => `(tactic| admit)
macro "hole_54" : tactic => `(tactic| admit)
macro "hole_55" : tactic => `(tactic| admit)
macro "hole_56" : tactic => `(tactic| admit)
macro "hole_60" : tactic => `(tactic| admit)
macro "hole_62" : tactic => `(tactic| admit)
macro "hole_61" : tactic => `(tactic| admit)
macro "hole_59" : tactic => `(tactic| admit)
macro "hole_58" : tactic => `(tactic| admit)
macro "hole_57" : tactic => `(tactic| admit)
macro "hole_53" : tactic => `(tactic| admit)
macro "hole_52" : tactic => `(tactic| admit)
macro "hole_46" : tactic => `(tactic| admit)

theorem putnam_2009_b2
: ({c : ℝ | ∃ s : ℕ → ℝ, s 0 = 0 ∧ StrictMono s ∧ (∃ n : ℕ, s n = 1 ∧ ((∑ i in Finset.range n, ((s (i + 1)) ^ 3 - (s i) * (s (i + 1)) ^ 2)) = c))} = ((Ioc (1 / 3) 1) : Set ℝ )) := by
  have h_subset₁ : {c : ℝ | ∃ s : ℕ → ℝ, s 0 = 0 ∧ StrictMono s ∧ (∃ n : ℕ, s n = 1 ∧ ((∑ i in Finset.range n, ((s (i + 1)) ^ 3 - (s i) * (s (i + 1)) ^ 2)) = c))} ⊆ (Ioc (1 / 3) 1 : Set ℝ) := by
    intro c hc
    rcases hc with ⟨s, h₀, h₁, n, h₂, h₃⟩
    have h₄ : c > 1 / 3 := by
      have h₄₁ : ∀ i : ℕ, i ∈ Finset.range n → (s (i + 1)) ^ 3 - s i * (s (i + 1)) ^ 2 > (s (i + 1)) ^ 3 / 3 - s i ^ 3 / 3 := by
        intro i hi
        have h₄₂ : s i < s (i + 1) := h₁.lt_iff_lt.mpr (by simp)
        have h₄₃ : 0 ≤ s i := by
          by_contra h
          have h₄₄ : s i < 0 := by hole_5
          have h₄₅ : s 0 > s i := by
            have h₄₅₁ : s 0 = 0 := h₀
            have h₄₅₂ : s i < 0 := by hole_7
            hole_6
          have h₄₆ : s 0 < s (i + 1) := by
            have h₄₆₁ : s i < s (i + 1) := h₁.lt_iff_lt.mpr (by simp)
            hole_8
          have h₄₇ : i + 1 > 0 := by hole_9
          have h₄₈ : s 0 < s (i + 1) := h₄₆
          have h₄₉ : s 0 = 0 := h₀
          have h₅₀ : s (i + 1) > 0 := by hole_10
          have h₅₁ : s i < s (i + 1) := h₁.lt_iff_lt.mpr (by simp)
          hole_4
        have h₄₅ : 0 ≤ s (i + 1) := by
          by_contra h
          have h₄₅₁ : s (i + 1) < 0 := by hole_12
          have h₄₅₂ : s 0 > s (i + 1) := by
            have h₄₅₃ : s 0 = 0 := h₀
            have h₄₅₄ : s (i + 1) < 0 := by hole_14
            hole_13
          have h₄₅₅ : s 0 < s (i + 1 + 1) := by
            have h₄₅₅₁ : s (i + 1) < s (i + 1 + 1) := h₁.lt_iff_lt.mpr (by simp)
            hole_15
          have h₄₅₆ : s 0 = 0 := h₀
          have h₄₅₇ : s (i + 1 + 1) > 0 := by hole_16
          have h₄₅₈ : s (i + 1) < s (i + 1 + 1) := h₁.lt_iff_lt.mpr (by simp)
          hole_11
        hole_3
      have h₄₂ : (∑ i in Finset.range n, ((s (i + 1)) ^ 3 - s i * (s (i + 1)) ^ 2)) > (∑ i in Finset.range n, ((s (i + 1)) ^ 3 / 3 - s i ^ 3 / 3)) := by
        hole_17
      have h₄₃ : (∑ i in Finset.range n, ((s (i + 1)) ^ 3 / 3 - s i ^ 3 / 3)) = (1 / 3 : ℝ) := by
        have h₄₃₁ : (∑ i in Finset.range n, ((s (i + 1)) ^ 3 / 3 - s i ^ 3 / 3)) = (∑ i in Finset.range n, ((s (i + 1)) ^ 3 / 3 - s i ^ 3 / 3)) := rfl
        have h₄₃₂ : (∑ i in Finset.range n, ((s (i + 1)) ^ 3 / 3 - s i ^ 3 / 3)) = (1 / 3 : ℝ) := by
          have h₄₃₃ : (∑ i in Finset.range n, ((s (i + 1)) ^ 3 / 3 - s i ^ 3 / 3)) = (∑ i in Finset.range n, ((s (i + 1)) ^ 3 / 3 - s i ^ 3 / 3)) := rfl
          have h₄₃₄ : (∑ i in Finset.range n, ((s (i + 1)) ^ 3 / 3 - s i ^ 3 / 3)) = (1 / 3 : ℝ) := by
            have h₄₃₅ : ∀ k : ℕ, (∑ i in Finset.range k, ((s (i + 1)) ^ 3 / 3 - s i ^ 3 / 3)) = (s k ^ 3 / 3 : ℝ) := by
              hole_22
            have h₄₃₆ : (∑ i in Finset.range n, ((s (i + 1)) ^ 3 / 3 - s i ^ 3 / 3)) = (s n ^ 3 / 3 : ℝ) := by
              hole_23
            rw [h₄₃₆]
            have h₄₃₇ : s n = 1 := h₂
            hole_21
          hole_20
        hole_19
      have h₄₄ : c > 1 / 3 := by
        hole_24
      hole_2
    have h₅ : c ≤ 1 := by
      have h₅₁ : ∀ i : ℕ, i ∈ Finset.range n → (s (i + 1)) ^ 3 - s i * (s (i + 1)) ^ 2 ≤ (s (i + 1)) ^ 3 - s i ^ 3 := by
        intro i hi
        have h₅₂ : s i < s (i + 1) := h₁.lt_iff_lt.mpr (by simp)
        have h₅₃ : 0 ≤ s i := by
          by_contra h
          have h₅₄ : s i < 0 := by hole_28
          have h₅₅ : s 0 > s i := by
            have h₅₅₁ : s 0 = 0 := h₀
            have h₅₅₂ : s i < 0 := by hole_30
            hole_29
          have h₅₆ : s 0 < s (i + 1) := by
            have h₅₆₁ : s i < s (i + 1) := h₁.lt_iff_lt.mpr (by simp)
            hole_31
          have h₅₇ : i + 1 > 0 := by hole_32
          have h₅₈ : s 0 < s (i + 1) := h₅₆
          have h₅₉ : s 0 = 0 := h₀
          have h₆₀ : s (i + 1) > 0 := by hole_33
          have h₆₁ : s i < s (i + 1) := h₁.lt_iff_lt.mpr (by simp)
          hole_27
        have h₅₄ : 0 ≤ s (i + 1) := by
          by_contra h
          have h₅₄₁ : s (i + 1) < 0 := by hole_35
          have h₅₄₂ : s 0 > s (i + 1) := by
            have h₅₄₃ : s 0 = 0 := h₀
            have h₅₄₄ : s (i + 1) < 0 := by hole_37
            hole_36
          have h₅₄₅ : s 0 < s (i + 1 + 1) := by
            have h₅₄₅₁ : s (i + 1) < s (i + 1 + 1) := h₁.lt_iff_lt.mpr (by simp)
            hole_38
          have h₅₄₆ : s 0 = 0 := h₀
          have h₅₄₇ : s (i + 1 + 1) > 0 := by hole_39
          have h₅₄₈ : s (i + 1) < s (i + 1 + 1) := h₁.lt_iff_lt.mpr (by simp)
          hole_34
        have h₅₅ : s i * (s (i + 1)) ^ 2 ≥ s i ^ 3 := by
          hole_40
        hole_26
      have h₅₂ : (∑ i in Finset.range n, ((s (i + 1)) ^ 3 - s i * (s (i + 1)) ^ 2)) ≤ (∑ i in Finset.range n, ((s (i + 1)) ^ 3 - s i ^ 3)) := by
        hole_41
      have h₅₃ : (∑ i in Finset.range n, ((s (i + 1)) ^ 3 - s i ^ 3)) = 1 := by
        have h₅₃₁ : ∀ k : ℕ, (∑ i in Finset.range k, ((s (i + 1)) ^ 3 - s i ^ 3)) = (s k ^ 3 : ℝ) := by
          hole_43
        have h₅₃₂ : (∑ i in Finset.range n, ((s (i + 1)) ^ 3 - s i ^ 3)) = (s n ^ 3 : ℝ) := by
          hole_44
        rw [h₅₃₂]
        have h₅₃₃ : s n = 1 := h₂
        hole_42
      have h₅₄ : c ≤ 1 := by
        hole_45
      hole_25
    hole_1
  
  have h_subset₂ : (Ioc (1 / 3) 1 : Set ℝ) ⊆ {c : ℝ | ∃ s : ℕ → ℝ, s 0 = 0 ∧ StrictMono s ∧ (∃ n : ℕ, s n = 1 ∧ ((∑ i in Finset.range n, ((s (i + 1)) ^ 3 - (s i) * (s (i + 1)) ^ 2)) = c))} := by
    intro c hc
    have h₁ : c > 1 / 3 := by hole_47
    have h₂ : c ≤ 1 := by hole_48
    by_cases h₃ : c = 1
    · 
      use fun i => if i = 0 then 0 else 1
      constructor
      · 
        simp
      constructor
      · 
        refine' strictMono_nat_of_lt_succ fun n => _
        by_cases hn : n = 0
        · 
          simp [hn]
          <;> norm_num
        · 
          by_cases hn' : n + 1 = 0
          · 
            exfalso
            omega
          · 
            simp [hn, hn']
            <;> norm_num
            <;> aesop
      · 
        use 1
        constructor
        · 
          simp
        · 
          simp [Finset.sum_range_succ, h₃]
          <;> norm_num
          <;> aesop
    · 
      have h₄ : c < 1 := by
        by_contra h
        have h₅ : c ≥ 1 := by hole_50
        have h₆ : c = 1 := by
          hole_51
        hole_49
      
      have h₅ : ∃ (x : ℝ), x ∈ Set.Ioo 0 1 ∧ x ^ 3 - x + 1 = c := by
        
        have h₅₁ : ∃ (x : ℝ), x ∈ Set.Ioo 0 1 ∧ x ^ 3 - x + 1 = c := by
          
          have h₅₂ : ContinuousOn (fun x : ℝ => x ^ 3 - x + 1) (Set.Icc 0 1) := by
            hole_54
          have h₅₃ : (1 : ℝ) / 3 < c := h₁
          have h₅₄ : c < 1 := h₄
          have h₅₅ : (0 : ℝ) ^ 3 - 0 + 1 = 1 := by hole_55
          have h₅₆ : (1 : ℝ) ^ 3 - 1 + 1 = 1 := by hole_56
          have h₅₇ : ∃ x ∈ Set.Ioo 0 1, (x : ℝ) ^ 3 - x + 1 = c := by
            have h₅₈ : ∃ x ∈ Set.Ioo 0 1, (x : ℝ) ^ 3 - x + 1 = c := by
              
              have h₅₉ : ContinuousOn (fun x : ℝ => x ^ 3 - x + 1) (Set.Icc 0 1) := h₅₂
              have h₆₀ : ∃ x ∈ Set.Ioo 0 1, (x : ℝ) ^ 3 - x + 1 = c := by
                
                have h₆₁ : c ∈ Set.Ioo (0 ^ 3 - 0 + 1) (1 ^ 3 - 1 + 1) := by
                  hole_60
                have h₆₂ : ∃ x ∈ Set.Ioo 0 1, (x : ℝ) ^ 3 - x + 1 = c := by
                  
                  have h₆₃ : ContinuousOn (fun x : ℝ => x ^ 3 - x + 1) (Set.Icc 0 1) := h₅₂
                  have h₆₄ : ∃ x ∈ Set.Ioo 0 1, (x : ℝ) ^ 3 - x + 1 = c := by
                    
                    hole_62
                  hole_61
                hole_59
              hole_58
            hole_57
          hole_53
        hole_52
      hole_46
  
  have h_main : ({c : ℝ | ∃ s : ℕ → ℝ, s 0 = 0 ∧ StrictMono s ∧ (∃ n : ℕ, s n = 1 ∧ ((∑ i in Finset.range n, ((s (i + 1)) ^ 3 - (s i) * (s (i + 1)) ^ 2)) = c))} = ((Ioc (1 / 3) 1) : Set ℝ )) := by
    apply Set.Subset.antisymm
    · 
      exact h_subset₁
    · 
      exact h_subset₂
  
  exact h_main