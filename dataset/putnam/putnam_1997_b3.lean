theorem putnam_1997_b3
(n : ℕ)
(hn : n > 0)
: n ∈ (({n | (1 ≤ n ∧ n ≤ 4) ∨ (20 ≤ n ∧ n ≤ 24) ∨ (100 ≤ n ∧ n ≤ 104) ∨ (120 ≤ n ∧ n ≤ 124)}) : Set ℕ ) ↔ ¬5 ∣ (∑ m in Finset.Icc 1 n, 1/m : ℚ).den := by
  have h_main : n ∈ (({n | (1 ≤ n ∧ n ≤ 4) ∨ (20 ≤ n ∧ n ≤ 24) ∨ (100 ≤ n ∧ n ≤ 104) ∨ (120 ≤ n ∧ n ≤ 124)}) : Set ℕ ) ↔ ¬5 ∣ (∑ m in Finset.Icc 1 n, 1/m : ℚ).den := by
    have h₁ : n ∈ (({n | (1 ≤ n ∧ n ≤ 4) ∨ (20 ≤ n ∧ n ≤ 24) ∨ (100 ≤ n ∧ n ≤ 104) ∨ (120 ≤ n ∧ n ≤ 124)}) : Set ℕ) ↔ (1 ≤ n ∧ n ≤ 4) ∨ (20 ≤ n ∧ n ≤ 24) ∨ (100 ≤ n ∧ n ≤ 104) ∨ (120 ≤ n ∧ n ≤ 124) := by
      simp [Set.mem_setOf_eq]
    rw [h₁]
    have h₂ : (1 ≤ n ∧ n ≤ 4) ∨ (20 ≤ n ∧ n ≤ 24) ∨ (100 ≤ n ∧ n ≤ 104) ∨ (120 ≤ n ∧ n ≤ 124) ↔ ¬5 ∣ (∑ m in Finset.Icc 1 n, 1 / m : ℚ).den := by
      constructor
      · -- Prove the forward direction: if n is in the set, then 5 does not divide the denominator
        intro h
        have h₃ : (1 ≤ n ∧ n ≤ 4) ∨ (20 ≤ n ∧ n ≤ 24) ∨ (100 ≤ n ∧ n ≤ 104) ∨ (120 ≤ n ∧ n ≤ 124) := h
        have h₄ : ¬5 ∣ (∑ m in Finset.Icc 1 n, 1 / m : ℚ).den := by
          -- Prove that 5 does not divide the denominator for each case
          rcases h₃ with (⟨h₃₁, h₃₂⟩ | ⟨h₃₁, h₃₂⟩ | ⟨h₃₁, h₃₂⟩ | ⟨h₃₁, h₃₂⟩)
          · -- Case: 1 ≤ n ≤ 4
            interval_cases n <;> norm_num [Finset.sum_Icc_succ_top, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt]
            <;> norm_cast <;> simp_all (config := {decide := true})
          · -- Case: 20 ≤ n ≤ 24
            interval_cases n <;> norm_num [Finset.sum_Icc_succ_top, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt]
            <;> norm_cast <;> simp_all (config := {decide := true})
          · -- Case: 100 ≤ n ≤ 104
            interval_cases n <;> norm_num [Finset.sum_Icc_succ_top, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt]
            <;> norm_cast <;> simp_all (config := {decide := true})
          · -- Case: 120 ≤ n ≤ 124
            interval_cases n <;> norm_num [Finset.sum_Icc_succ_top, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt]
            <;> norm_cast <;> simp_all (config := {decide := true})
        exact h₄
      · -- Prove the reverse direction: if 5 does not divide the denominator, then n is in the set
        intro h
        have h₃ : ¬5 ∣ (∑ m in Finset.Icc 1 n, 1 / m : ℚ).den := h
        have h₄ : (1 ≤ n ∧ n ≤ 4) ∨ (20 ≤ n ∧ n ≤ 24) ∨ (100 ≤ n ∧ n ≤ 104) ∨ (120 ≤ n ∧ n ≤ 124) := by
          by_contra h₄
          -- If n is not in the set, then 5 divides the denominator
          have h₅ : ¬((1 ≤ n ∧ n ≤ 4) ∨ (20 ≤ n ∧ n ≤ 24) ∨ (100 ≤ n ∧ n ≤ 104) ∨ (120 ≤ n ∧ n ≤ 124)) := h₄
          have h₆ : 5 ∣ (∑ m in Finset.Icc 1 n, 1 / m : ℚ).den := by
            -- Prove that 5 divides the denominator for each case
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
              -- Prove that 5 divides the denominator for each case
              have h₁₃ : n ≥ 5 := h₉
              have h₁₄ : ¬((1 ≤ n ∧ n ≤ 4) ∨ (20 ≤ n ∧ n ≤ 24) ∨ (100 ≤ n ∧ n ≤ 104) ∨ (120 ≤ n ∧ n ≤ 124)) := h₅
              -- Use the fact that n is not in the set to prove that 5 divides the denominator
              by_cases h₁₅ : n ≤ 19
              · -- Case: 5 ≤ n ≤ 19
                interval_cases n <;> norm_num [Finset.sum_Icc_succ_top, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt] at h₃ ⊢ <;> norm_cast at h₃ ⊢ <;> simp_all (config := {decide := true})
              · -- Case: n ≥ 20
                have h₁₆ : n ≥ 20 := by omega
                by_cases h₁₇ : n ≤ 99
                · -- Case: 20 ≤ n ≤ 99
                  interval_cases n <;> norm_num [Finset.sum_Icc_succ_top, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt] at h₃ ⊢ <;> norm_cast at h₃ ⊢ <;> simp_all (config := {decide := true})
                · -- Case: n ≥ 100
                  have h₁₈ : n ≥ 100 := by omega
                  by_cases h₁₉ : n ≤ 119
                  · -- Case: 100 ≤ n ≤ 119
                    interval_cases n <;> norm_num [Finset.sum_Icc_succ_top, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt] at h₃ ⊢ <;> norm_cast at h₃ ⊢ <;> simp_all (config := {decide := true})
                  · -- Case: n ≥ 120
                    have h₂₀ : n ≥ 120 := by omega
                    by_cases h₂₁ : n ≤ 124
                    · -- Case: 120 ≤ n ≤ 124
                      interval_cases n <;> norm_num [Finset.sum_Icc_succ_top, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt] at h₃ ⊢ <;> norm_cast at h₃ ⊢ <;> simp_all (config := {decide := true})
                    · -- Case: n ≥ 125
                      have h₂₂ : n ≥ 125 := by omega
                      have h₂₃ : 5 ∣ (∑ m in Finset.Icc 1 n, 1 / m : ℚ).den := by
                        -- Prove that 5 divides the denominator for n ≥ 125
                        have h₂₄ : n ≥ 125 := h₂₂
                        have h₂₅ : 5 ∣ (∑ m in Finset.Icc 1 n, 1 / m : ℚ).den := by
                          -- Use the fact that n ≥ 125 to prove that 5 divides the denominator
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