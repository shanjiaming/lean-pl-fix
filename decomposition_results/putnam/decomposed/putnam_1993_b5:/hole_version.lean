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
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
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
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem putnam_1993_b5:
  ¬∃ p : Fin 4 → (EuclideanSpace ℝ (Fin 2)),
    ∀ i j, i ≠ j →
      (∃ n : ℤ, dist (p i) (p j) = n ∧ Odd n) := by
  have h_main : ∀ (p : Fin 4 → EuclideanSpace ℝ (Fin 2)), (∀ i j, i ≠ j → (∃ n : ℤ, dist (p i) (p j) = n ∧ Odd n)) → False := by
    intro p h
                                        hole_3
                                        hole_4
                                        hole_5
                                        hole_6
                                        hole_7
                                        hole_8
    
    rcases h₁ with ⟨n₁, hn₁, hn₁_odd⟩
    rcases h₂ with ⟨n₂, hn₂, hn₂_odd⟩
    rcases h₃ with ⟨n₃, hn₃, hn₃_odd⟩
    rcases h₄ with ⟨n₄, hn₄, hn₄_odd⟩
    rcases h₅ with ⟨n₅, hn₅, hn₅_odd⟩
    rcases h₆ with ⟨n₆, hn₆, hn₆_odd⟩
    
                               hole_9
                               hole_10
                               hole_11
                                hole_12
                                hole_13
                                hole_14
    
    have h₁₃ : (n₁ : ℤ) % 2 = 1 := by
      hole_15
    have h₁₄ : (n₂ : ℤ) % 2 = 1 := by
      hole_16
    have h₁₅ : (n₃ : ℤ) % 2 = 1 := by
      hole_17
    have h₁₆ : (n₄ : ℤ) % 2 = 1 := by
      hole_18
    have h₁₇ : (n₅ : ℤ) % 2 = 1 := by
      hole_19
    have h₁₈ : (n₆ : ℤ) % 2 = 1 := by
      hole_20
    
    have h₁₉ : (n₁ : ℤ) ^ 2 % 4 = 1 := by
      have h₁₉₁ : (n₁ : ℤ) % 4 = 1 ∨ (n₁ : ℤ) % 4 = 3 := by
        have h₁₉₂ : (n₁ : ℤ) % 2 = 1 := h₁₃
        have h₁₉₃ : (n₁ : ℤ) % 4 = 1 ∨ (n₁ : ℤ) % 4 = 3 := by
          hole_23
        hole_22
      hole_21
    have h₂₀ : (n₂ : ℤ) ^ 2 % 4 = 1 := by
      have h₂₀₁ : (n₂ : ℤ) % 4 = 1 ∨ (n₂ : ℤ) % 4 = 3 := by
        have h₂₀₂ : (n₂ : ℤ) % 2 = 1 := h₁₄
        have h₂₀₃ : (n₂ : ℤ) % 4 = 1 ∨ (n₂ : ℤ) % 4 = 3 := by
          hole_26
        hole_25
      hole_24
    have h₂₁ : (n₃ : ℤ) ^ 2 % 4 = 1 := by
      have h₂₁₁ : (n₃ : ℤ) % 4 = 1 ∨ (n₃ : ℤ) % 4 = 3 := by
        have h₂₁₂ : (n₃ : ℤ) % 2 = 1 := h₁₅
        have h₂₁₃ : (n₃ : ℤ) % 4 = 1 ∨ (n₃ : ℤ) % 4 = 3 := by
          hole_29
        hole_28
      hole_27
    have h₂₂ : (n₄ : ℤ) ^ 2 % 4 = 1 := by
      have h₂₂₁ : (n₄ : ℤ) % 4 = 1 ∨ (n₄ : ℤ) % 4 = 3 := by
        have h₂₂₂ : (n₄ : ℤ) % 2 = 1 := h₁₆
        have h₂₂₃ : (n₄ : ℤ) % 4 = 1 ∨ (n₄ : ℤ) % 4 = 3 := by
          hole_32
        hole_31
      hole_30
    have h₂₃ : (n₅ : ℤ) ^ 2 % 4 = 1 := by
      have h₂₃₁ : (n₅ : ℤ) % 4 = 1 ∨ (n₅ : ℤ) % 4 = 3 := by
        have h₂₃₂ : (n₅ : ℤ) % 2 = 1 := h₁₇
        have h₂₃₃ : (n₅ : ℤ) % 4 = 1 ∨ (n₅ : ℤ) % 4 = 3 := by
          hole_35
        hole_34
      hole_33
    have h₂₄ : (n₆ : ℤ) ^ 2 % 4 = 1 := by
      have h₂₄₁ : (n₆ : ℤ) % 4 = 1 ∨ (n₆ : ℤ) % 4 = 3 := by
        have h₂₄₂ : (n₆ : ℤ) % 2 = 1 := h₁₈
        have h₂₄₃ : (n₆ : ℤ) % 4 = 1 ∨ (n₆ : ℤ) % 4 = 3 := by
          hole_38
        hole_37
      hole_36
    
    have h₂₅ : (n₁ : ℝ) ^ 2 = (n₁ : ℝ) ^ 2 := by hole_39
    have h₂₆ : (n₂ : ℝ) ^ 2 = (n₂ : ℝ) ^ 2 := by hole_40
    have h₂₇ : (n₃ : ℝ) ^ 2 = (n₃ : ℝ) ^ 2 := by hole_41
    have h₂₈ : (n₄ : ℝ) ^ 2 = (n₄ : ℝ) ^ 2 := by hole_42
    have h₂₉ : (n₅ : ℝ) ^ 2 = (n₅ : ℝ) ^ 2 := by hole_43
    have h₃₀ : (n₆ : ℝ) ^ 2 = (n₆ : ℝ) ^ 2 := by hole_44
    
                                hole_45
                                hole_46
                                hole_47
                                hole_48
                                hole_49
                                hole_50
    
    have h₃₇ : (n₁ : ℝ) ^ 2 = (n₁ : ℝ) ^ 2 := by hole_51
    have h₃₈ : (n₂ : ℝ) ^ 2 = (n₂ : ℝ) ^ 2 := by hole_52
    have h₃₉ : (n₃ : ℝ) ^ 2 = (n₃ : ℝ) ^ 2 := by hole_53
    have h₄₀ : (n₄ : ℝ) ^ 2 = (n₄ : ℝ) ^ 2 := by hole_54
    have h₄₁ : (n₅ : ℝ) ^ 2 = (n₅ : ℝ) ^ 2 := by hole_55
    have h₄₂ : (n₆ : ℝ) ^ 2 = (n₆ : ℝ) ^ 2 := by hole_56
    
    have h₄₃ : False := by
      
      have h₄₄ : (p (⟨0, by decide⟩ : Fin 4)) = (p (⟨0, by decide⟩ : Fin 4)) := rfl
      have h₄₅ : (p (⟨1, by decide⟩ : Fin 4)) = (p (⟨1, by decide⟩ : Fin 4)) := rfl
      have h₄₆ : (p (⟨2, by decide⟩ : Fin 4)) = (p (⟨2, by decide⟩ : Fin 4)) := rfl
      have h₄₇ : (p (⟨3, by decide⟩ : Fin 4)) = (p (⟨3, by decide⟩ : Fin 4)) := rfl
      
      have h₄₈ : (n₁ : ℤ) ^ 2 % 4 = 1 := h₁₉
      have h₄₉ : (n₂ : ℤ) ^ 2 % 4 = 1 := h₂₀
      have h₅₀ : (n₃ : ℤ) ^ 2 % 4 = 1 := h₂₁
      have h₅₁ : (n₄ : ℤ) ^ 2 % 4 = 1 := h₂₂
      have h₅₂ : (n₅ : ℤ) ^ 2 % 4 = 1 := h₂₃
      have h₅₃ : (n₆ : ℤ) ^ 2 % 4 = 1 := h₂₄
      
      hole_57
    hole_2
  intro h
  rcases h with ⟨p, hp⟩
  have h₁ : False := h_main p hp
  hole_1