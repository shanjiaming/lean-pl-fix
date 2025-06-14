macro "hole_3" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_44" : tactic => `(tactic| admit)
macro "hole_43" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_45" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem putnam_1978_a1
(S T : Set ℤ)
(hS : S = {k | ∃ j : ℤ, 0 ≤ j ∧ j ≤ 33 ∧ k = 3 * j + 1})
(hT : T ⊆ S ∧ T.ncard = 20)
: (∃ m ∈ T, ∃ n ∈ T, m ≠ n ∧ m + n = 104) := by
  have h_main : ∃ m ∈ T, ∃ n ∈ T, m ≠ n ∧ m + n = 104 := by
    by_contra! h
    have h₁ : T ⊆ S := hT.1
    have h₂ : T.ncard = 20 := hT.2
    have h₃ : ∀ m ∈ T, ∀ n ∈ T, m ≠ n → m + n ≠ 104 := by
      intro m hm n hn hne
      have h₄ := h m hm n hn
      hole_3
    
    have h₄ : T ⊆ ({1, 52} ∪ (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({3 * j + 1} : Set ℤ)) ∪ (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({103 - 3 * j} : Set ℤ))) := by
      intro m hm
      have h₅ : m ∈ S := h₁ hm
      rw [hS] at h₅
      rcases h₅ with ⟨j, hj₀, hj₁, rfl⟩
      have h₆ : 0 ≤ j := hj₀
      have h₇ : j ≤ 33 := hj₁
      have h₈ : j ≥ 0 := by hole_5
      have h₉ : j ≤ 33 := by hole_6
      
      have h₁₀ : j = 0 ∨ j = 17 ∨ (1 ≤ j ∧ j ≤ 16) ∨ (18 ≤ j ∧ j ≤ 33) := by
        by_cases h₁₀ : j = 0
        · exact Or.inl h₁₀
        · by_cases h₁₁ : j = 17
          · exact Or.inr (Or.inl h₁₁)
          · by_cases h₁₂ : j ≤ 16
            · have h₁₃ : 1 ≤ j := by
                by_contra h₁₄
                have h₁₅ : j ≤ 0 := by hole_9
                have h₁₆ : j = 0 := by hole_10
                hole_8
              exact Or.inr (Or.inr (Or.inl ⟨h₁₃, h₁₂⟩))
            · have h₁₃ : 18 ≤ j := by
                by_contra h₁₄
                have h₁₅ : j ≤ 17 := by hole_12
                have h₁₆ : j = 17 := by
                  by_contra h₁₇
                  have h₁₈ : j < 17 := by
                    hole_14
                  have h₁₉ : j ≤ 16 := by hole_15
                  hole_13
                hole_11
              have h₁₄ : j ≤ 33 := by hole_16
              hole_7
      rcases h₁₀ with (rfl | rfl | ⟨h₁₁, h₁₂⟩ | ⟨h₁₁, h₁₂⟩)
      · 
        simp_all [Set.mem_union, Set.mem_singleton_iff]
        <;> norm_num
        <;> aesop
      · 
        simp_all [Set.mem_union, Set.mem_singleton_iff]
        <;> norm_num
        <;> aesop
      · 
        have h₁₃ : 1 ≤ (j : ℤ) := by hole_17
        have h₁₄ : (j : ℤ) ≤ 16 := by hole_18
        have h₁₅ : (3 * j + 1 : ℤ) ∈ (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({3 * j + 1} : Set ℤ)) := by
          hole_19
        simp_all [Set.mem_union, Set.mem_singleton_iff]
        <;> aesop
      · 
        have h₁₃ : 18 ≤ (j : ℤ) := by hole_20
        have h₁₄ : (j : ℤ) ≤ 33 := by hole_21
        have h₁₅ : (3 * j + 1 : ℤ) ∈ (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({103 - 3 * j} : Set ℤ)) := by
          have h₁₆ : 1 ≤ (34 - j : ℤ) := by
            have h₁₇ : (j : ℤ) ≤ 33 := by hole_24
            hole_23
          have h₁₇ : (34 - j : ℤ) ≤ 16 := by
            have h₁₈ : 18 ≤ (j : ℤ) := by hole_26
            hole_25
          have h₁₈ : (3 * j + 1 : ℤ) = 103 - 3 * (34 - j) := by
            hole_27
          have h₁₉ : (3 * j + 1 : ℤ) ∈ (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({103 - 3 * j} : Set ℤ)) := by
            hole_28
          hole_22
        hole_4
    
    
    have h₅ : T.ncard ≤ 18 := by
      have h₅₁ : T ⊆ ({1, 52} ∪ (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({3 * j + 1} : Set ℤ)) ∪ (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({103 - 3 * j} : Set ℤ))) := h₄
      have h₅₂ : T.ncard ≤ (({1, 52} ∪ (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({3 * j + 1} : Set ℤ)) ∪ (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({103 - 3 * j} : Set ℤ)) : Set ℤ)).ncard := by
        hole_30
      have h₅₃ : (({1, 52} ∪ (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({3 * j + 1} : Set ℤ)) ∪ (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({103 - 3 * j} : Set ℤ)) : Set ℤ)).ncard ≤ 18 := by
        
        
        
        
        have h₅₄ : (({1, 52} ∪ (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({3 * j + 1} : Set ℤ)) ∪ (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({103 - 3 * j} : Set ℤ)) : Set ℤ)) ⊆ (Set.Icc 1 103 : Set ℤ) := by
          intro x hx
          simp only [Set.mem_union, Set.mem_singleton_iff, Set.mem_iUnion, Set.mem_setOf_eq] at hx
          rcases hx with (hx | ⟨j, hj, hx⟩ | ⟨j, hj, hx⟩)
          · 
            rcases hx with (rfl | rfl)
            · 
              norm_num [Set.mem_Icc]
            · 
              norm_num [Set.mem_Icc]
          · 
            have h₅₅ : 1 ≤ (j : ℤ) := hj.1
            have h₅₆ : (j : ℤ) ≤ 16 := hj.2
            have h₅₇ : x = 3 * j + 1 := by hole_33
            rw [h₅₇]
            have h₅₈ : (1 : ℤ) ≤ 3 * j + 1 := by hole_34
            have h₅₉ : (3 * j + 1 : ℤ) ≤ 103 := by
              have h₅₁₀ : (j : ℤ) ≤ 16 := by hole_36
              hole_35
            exact ⟨h₅₈, h₅₉⟩
          · 
            have h₅₅ : 1 ≤ (j : ℤ) := hj.1
            have h₅₆ : (j : ℤ) ≤ 16 := hj.2
            have h₅₇ : x = 103 - 3 * j := by hole_37
            rw [h₅₇]
            have h₅₈ : (1 : ℤ) ≤ 103 - 3 * j := by
              have h₅₉ : (j : ℤ) ≤ 16 := by hole_39
              hole_38
            have h₅₉ : (103 - 3 * j : ℤ) ≤ 103 := by
              have h₅₁₀ : 1 ≤ (j : ℤ) := by hole_41
              hole_40
            hole_32
        have h₅₅ : (({1, 52} ∪ (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({3 * j + 1} : Set ℤ)) ∪ (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({103 - 3 * j} : Set ℤ)) : Set ℤ)).ncard ≤ 18 := by
          
          
          
          
          have h₅₆ : (({1, 52} ∪ (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({3 * j + 1} : Set ℤ)) ∪ (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({103 - 3 * j} : Set ℤ)) : Set ℤ)) ⊆ (Set.Icc 1 103 : Set ℤ) := h₅₄
          have h₅₇ : (({1, 52} ∪ (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({3 * j + 1} : Set ℤ)) ∪ (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({103 - 3 * j} : Set ℤ)) : Set ℤ)).ncard ≤ 18 := by
            
            
            
            
            have h₅₈ : (({1, 52} ∪ (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({3 * j + 1} : Set ℤ)) ∪ (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({103 - 3 * j} : Set ℤ)) : Set ℤ)).ncard ≤ 18 := by
              
              
              
              
              hole_44
            hole_43
          hole_42
        hole_31
      have h₅₄ : T.ncard ≤ 18 := by
        hole_45
      hole_29
    
    have h₆ : T.ncard = 20 := h₂
    hole_2
  hole_1