macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)

theorem putnam_1997_b3
(n : ℕ)
(hn : n > 0)
: n ∈ (({n | (1 ≤ n ∧ n ≤ 4) ∨ (20 ≤ n ∧ n ≤ 24) ∨ (100 ≤ n ∧ n ≤ 104) ∨ (120 ≤ n ∧ n ≤ 124)}) : Set ℕ ) ↔ ¬5 ∣ (∑ m in Finset.Icc 1 n, 1/m : ℚ).den := by
  have h_main : n ∈ (({n | (1 ≤ n ∧ n ≤ 4) ∨ (20 ≤ n ∧ n ≤ 24) ∨ (100 ≤ n ∧ n ≤ 104) ∨ (120 ≤ n ∧ n ≤ 124)}) : Set ℕ ) ↔ ¬5 ∣ (∑ m in Finset.Icc 1 n, 1/m : ℚ).den := by
    have h₁ : n ∈ (({n | (1 ≤ n ∧ n ≤ 4) ∨ (20 ≤ n ∧ n ≤ 24) ∨ (100 ≤ n ∧ n ≤ 104) ∨ (120 ≤ n ∧ n ≤ 124)}) : Set ℕ) ↔ (1 ≤ n ∧ n ≤ 4) ∨ (20 ≤ n ∧ n ≤ 24) ∨ (100 ≤ n ∧ n ≤ 104) ∨ (120 ≤ n ∧ n ≤ 124) := by
      hole_1
    rw [h₁]
    have h₂ : (1 ≤ n ∧ n ≤ 4) ∨ (20 ≤ n ∧ n ≤ 24) ∨ (100 ≤ n ∧ n ≤ 104) ∨ (120 ≤ n ∧ n ≤ 124) ↔ ¬5 ∣ (∑ m in Finset.Icc 1 n, 1 / m : ℚ).den := by
      constructor
      · 
        intro h
        have h₃ : (1 ≤ n ∧ n ≤ 4) ∨ (20 ≤ n ∧ n ≤ 24) ∨ (100 ≤ n ∧ n ≤ 104) ∨ (120 ≤ n ∧ n ≤ 124) := h
        have h₄ : ¬5 ∣ (∑ m in Finset.Icc 1 n, 1 / m : ℚ).den := by
          
          hole_2
        exact h₄
      · 
        intro h
        have h₃ : ¬5 ∣ (∑ m in Finset.Icc 1 n, 1 / m : ℚ).den := h
        have h₄ : (1 ≤ n ∧ n ≤ 4) ∨ (20 ≤ n ∧ n ≤ 24) ∨ (100 ≤ n ∧ n ≤ 104) ∨ (120 ≤ n ∧ n ≤ 124) := by
          by_contra h₄
          
          have h₅ : ¬((1 ≤ n ∧ n ≤ 4) ∨ (20 ≤ n ∧ n ≤ 24) ∨ (100 ≤ n ∧ n ≤ 104) ∨ (120 ≤ n ∧ n ≤ 124)) := h₄
          have h₆ : 5 ∣ (∑ m in Finset.Icc 1 n, 1 / m : ℚ).den := by
            
            have h₇ : n > 0 := hn
            have h₈ : ¬((1 ≤ n ∧ n ≤ 4) ∨ (20 ≤ n ∧ n ≤ 24) ∨ (100 ≤ n ∧ n ≤ 104) ∨ (120 ≤ n ∧ n ≤ 124)) := h₅
            have h₉ : n ≥ 5 := by
              by_contra h₉
              have h₁₀ : n < 5 := by linarith
              have h₁₁ : n ≤ 4 := by linarith
              have h₁₂ : 1 ≤ n := by linarith
              have h₁₃ : (1 ≤ n ∧ n ≤ 4) := ⟨h₁₂, h₁₁⟩
              have h₁₄ : (1 ≤ n ∧ n ≤ 4) ∨ (20 ≤ n ∧ n ≤ 24) ∨ (100 ≤ n ∧ n ≤ 104) ∨ (120 ≤ n ∧ n ≤ 124) := Or.inl h₁₃
              contradiction
            have h₁₀ : n ≥ 5 := h₉
            have h₁₁ : ¬((1 ≤ n ∧ n ≤ 4) ∨ (20 ≤ n ∧ n ≤ 24) ∨ (100 ≤ n ∧ n ≤ 104) ∨ (120 ≤ n ∧ n ≤ 124)) := h₅
            have h₁₂ : 5 ∣ (∑ m in Finset.Icc 1 n, 1 / m : ℚ).den := by
              
              have h₁₃ : n ≥ 5 := h₉
              have h₁₄ : ¬((1 ≤ n ∧ n ≤ 4) ∨ (20 ≤ n ∧ n ≤ 24) ∨ (100 ≤ n ∧ n ≤ 104) ∨ (120 ≤ n ∧ n ≤ 124)) := h₅
              
              by_cases h₁₅ : n ≤ 19
              · 
                interval_cases n <;> norm_num [Finset.sum_Icc_succ_top, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt] at h₃ ⊢ <;> norm_cast at h₃ ⊢ <;> simp_all (config := {decide := true})
              · 
                have h₁₆ : n ≥ 20 := by omega
                by_cases h₁₇ : n ≤ 99
                · 
                  interval_cases n <;> norm_num [Finset.sum_Icc_succ_top, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt] at h₃ ⊢ <;> norm_cast at h₃ ⊢ <;> simp_all (config := {decide := true})
                · 
                  have h₁₈ : n ≥ 100 := by omega
                  by_cases h₁₉ : n ≤ 119
                  · 
                    interval_cases n <;> norm_num [Finset.sum_Icc_succ_top, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt] at h₃ ⊢ <;> norm_cast at h₃ ⊢ <;> simp_all (config := {decide := true})
                  · 
                    have h₂₀ : n ≥ 120 := by omega
                    by_cases h₂₁ : n ≤ 124
                    · 
                      interval_cases n <;> norm_num [Finset.sum_Icc_succ_top, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt] at h₃ ⊢ <;> norm_cast at h₃ ⊢ <;> simp_all (config := {decide := true})
                    · 
                      have h₂₂ : n ≥ 125 := by omega
                      have h₂₃ : 5 ∣ (∑ m in Finset.Icc 1 n, 1 / m : ℚ).den := by
                        
                        have h₂₄ : n ≥ 125 := h₂₂
                        have h₂₅ : 5 ∣ (∑ m in Finset.Icc 1 n, 1 / m : ℚ).den := by
                          
                          norm_num at h₃ ⊢
                          <;>
                          (try omega) <;>
                          (try
                            {
                              interval_cases n <;> norm_num [Finset.sum_Icc_succ_top, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt] at h₃ ⊢ <;> norm_cast at h₃ ⊢ <;> simp_all (config := {decide := true})
                            }) <;>
                          (try
                            {
                              omega
                            })
                        exact h₂₅
                      exact h₂₃
            exact h₁₂
          contradiction
        exact h₄
    exact h₂
  exact h_main