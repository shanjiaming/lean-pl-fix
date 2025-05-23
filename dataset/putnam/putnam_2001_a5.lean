theorem putnam_2001_a5
: ∃! an : ℤ × ℕ, let (a, n) := an; a > 0 ∧ n > 0 ∧ a^(n+1) - (a+1)^n = 2001 := by
  have h_main : ∃ (an : ℤ × ℕ), let (a, n) := an; a > 0 ∧ n > 0 ∧ a^(n+1) - (a+1)^n = 2001 := by
    refine' ⟨(13, 2), _⟩
    dsimp
    norm_num
    <;> decide
  
  have h_unique : ∀ (an₁ an₂ : ℤ × ℕ), (let (a, n) := an₁; a > 0 ∧ n > 0 ∧ a^(n+1) - (a+1)^n = 2001) → (let (a, n) := an₂; a > 0 ∧ n > 0 ∧ a^(n+1) - (a+1)^n = 2001) → an₁ = an₂ := by
    rintro ⟨a₁, n₁⟩ ⟨a₂, n₂⟩ h₁ h₂
    simp only [Prod.mk.injEq] at *
    have h₁a : a₁ > 0 := by simpa using h₁.1
    have h₁n : n₁ > 0 := by simpa using h₁.2.1
    have h₁eq : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ = 2001 := by simpa using h₁.2.2
    have h₂a : a₂ > 0 := by simpa using h₂.1
    have h₂n : n₂ > 0 := by simpa using h₂.2.1
    have h₂eq : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ = 2001 := by simpa using h₂.2.2
    have h₁a' : a₁ > 0 := h₁a
    have h₂a' : a₂ > 0 := h₂a
    have h₁n' : n₁ > 0 := h₁n
    have h₂n' : n₂ > 0 := h₂n
    have h₁eq' : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ = 2001 := h₁eq
    have h₂eq' : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ = 2001 := h₂eq
    have h₃ : a₁ = a₂ := by
      by_contra h
      have h₄ : a₁ ≠ a₂ := h
      have h₅ : a₁ < a₂ ∨ a₂ < a₁ := by
        cases' lt_or_gt_of_ne h₄ with h₄ h₄
        · exact Or.inl (by linarith)
        · exact Or.inr (by linarith)
      cases' h₅ with h₅ h₅
      · -- Case: a₁ < a₂
        have h₆ : a₁ < a₂ := h₅
        have h₇ : n₁ = 2 ∧ a₁ = 13 := by
          -- Prove that (a₁, n₁) = (13, 2)
          have h₈ : a₁ ≤ 13 := by
            by_contra h₈
            have h₉ : a₁ ≥ 14 := by linarith
            have h₁₀ : n₁ ≥ 1 := by
              omega
            have h₁₁ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ > 2001 := by
              have h₁₂ : n₁ ≥ 1 := by omega
              have h₁₃ : (a₁ : ℤ) ≥ 14 := by exact_mod_cast h₉
              have h₁₄ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ > 2001 := by
                have h₁₅ : n₁ = 1 ∨ n₁ ≥ 2 := by omega
                cases' h₁₅ with h₁₅ h₁₅
                · -- Subcase: n₁ = 1
                  have h₁₆ : n₁ = 1 := h₁₅
                  have h₁₇ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ = (a₁ : ℤ) ^ 2 - (a₁ + 1 : ℤ) := by
                    simp [h₁₆, pow_succ]
                    <;> ring_nf
                  rw [h₁₇]
                  have h₁₈ : (a₁ : ℤ) ^ 2 - (a₁ + 1 : ℤ) > 2001 := by
                    nlinarith [sq_nonneg ((a₁ : ℤ) - 1)]
                  linarith
                · -- Subcase: n₁ ≥ 2
                  have h₁₆ : n₁ ≥ 2 := h₁₅
                  have h₁₇ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ > 2001 := by
                    have h₁₈ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ > 2001 := by
                      have h₁₉ : n₁ ≥ 2 := h₁₆
                      have h₂₀ : (a₁ : ℤ) ≥ 14 := by exact_mod_cast h₉
                      have h₂₁ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ > 2001 := by
                        -- Prove that the expression is > 2001 for n₁ ≥ 2 and a₁ ≥ 14
                        have h₂₂ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ ≥ (a₁ : ℤ) ^ 3 - (a₁ + 1 : ℤ) ^ 2 := by
                          -- Prove that the expression is at least as large as the case when n₁ = 2
                          have h₂₃ : n₁ ≥ 2 := h₁₆
                          have h₂₄ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ ≥ (a₁ : ℤ) ^ 3 - (a₁ + 1 : ℤ) ^ 2 := by
                            have h₂₅ : n₁ ≥ 2 := h₁₆
                            have h₂₆ : (a₁ : ℤ) ^ (n₁ + 1) ≥ (a₁ : ℤ) ^ 3 := by
                              exact pow_le_pow_right (by linarith) (by omega)
                            have h₂₇ : (a₁ + 1 : ℤ) ^ n₁ ≤ (a₁ + 1 : ℤ) ^ n₁ := by linarith
                            have h₂₈ : (a₁ + 1 : ℤ) ^ n₁ ≤ (a₁ + 1 : ℤ) ^ n₁ := by linarith
                            have h₂₉ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ ≥ (a₁ : ℤ) ^ 3 - (a₁ + 1 : ℤ) ^ 2 := by
                              have h₃₀ : (a₁ : ℤ) ^ (n₁ + 1) ≥ (a₁ : ℤ) ^ 3 := h₂₆
                              have h₃₁ : (a₁ + 1 : ℤ) ^ n₁ ≥ (a₁ + 1 : ℤ) ^ 2 := by
                                exact pow_le_pow_right (by linarith) (by omega)
                              have h₃₂ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ ≥ (a₁ : ℤ) ^ 3 - (a₁ + 1 : ℤ) ^ 2 := by
                                omega
                              exact h₃₂
                            exact h₂₉
                          exact h₂₄
                        have h₃₀ : (a₁ : ℤ) ^ 3 - (a₁ + 1 : ℤ) ^ 2 > 2001 := by
                          nlinarith [sq_nonneg ((a₁ : ℤ) - 1)]
                        linarith
                      exact h₂₁
                    linarith
                  exact h₁₇
                <;> simp_all
              <;> nlinarith
            linarith
          have h₂₀ : a₁ ≤ 13 := by omega
          have h₂₁ : n₁ = 2 ∧ a₁ = 13 := by
            -- Prove that (a₁, n₁) = (13, 2)
            have h₂₂ : a₁ ≤ 13 := h₂₀
            have h₂₃ : a₁ > 0 := h₁a
            interval_cases a₁ <;> norm_num at h₁eq ⊢ <;>
              (try omega) <;>
              (try
                {
                  rcases n₁ with (_ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | n₁) <;>
                    norm_num at h₁eq h₁n ⊢ <;>
                      (try omega) <;>
                        (try
                          {
                            ring_nf at h₁eq ⊢ <;>
                              norm_num at h₁eq ⊢ <;>
                                omega
                          })
                }) <;>
              (try
                {
                  omega
                })
          exact h₂₁
        have h₈ : n₂ = 2 ∧ a₂ = 13 := by
          -- Prove that (a₂, n₂) = (13, 2)
          have h₉ : a₂ ≤ 13 := by
            by_contra h₉
            have h₁₀ : a₂ ≥ 14 := by linarith
            have h₁₁ : n₂ ≥ 1 := by
              omega
            have h₁₂ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ > 2001 := by
              have h₁₃ : n₂ ≥ 1 := by omega
              have h₁₄ : (a₂ : ℤ) ≥ 14 := by exact_mod_cast h₁₀
              have h₁₅ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ > 2001 := by
                have h₁₆ : n₂ = 1 ∨ n₂ ≥ 2 := by omega
                cases' h₁₆ with h₁₆ h₁₆
                · -- Subcase: n₂ = 1
                  have h₁₇ : n₂ = 1 := h₁₆
                  have h₁₈ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ = (a₂ : ℤ) ^ 2 - (a₂ + 1 : ℤ) := by
                    simp [h₁₇, pow_succ]
                    <;> ring_nf
                  rw [h₁₈]
                  have h₁₉ : (a₂ : ℤ) ^ 2 - (a₂ + 1 : ℤ) > 2001 := by
                    nlinarith [sq_nonneg ((a₂ : ℤ) - 1)]
                  linarith
                · -- Subcase: n₂ ≥ 2
                  have h₁₇ : n₂ ≥ 2 := h₁₆
                  have h₁₈ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ > 2001 := by
                    have h₁₉ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ > 2001 := by
                      have h₂₀ : n₂ ≥ 2 := h₁₇
                      have h₂₁ : (a₂ : ℤ) ≥ 14 := by exact_mod_cast h₁₀
                      have h₂₂ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ > 2001 := by
                        -- Prove that the expression is > 2001 for n₂ ≥ 2 and a₂ ≥ 14
                        have h₂₃ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ ≥ (a₂ : ℤ) ^ 3 - (a₂ + 1 : ℤ) ^ 2 := by
                          -- Prove that the expression is at least as large as the case when n₂ = 2
                          have h₂₄ : n₂ ≥ 2 := h₁₇
                          have h₂₅ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ ≥ (a₂ : ℤ) ^ 3 - (a₂ + 1 : ℤ) ^ 2 := by
                            have h₂₆ : n₂ ≥ 2 := h₁₇
                            have h₂₇ : (a₂ : ℤ) ^ (n₂ + 1) ≥ (a₂ : ℤ) ^ 3 := by
                              exact pow_le_pow_right (by linarith) (by omega)
                            have h₂₈ : (a₂ + 1 : ℤ) ^ n₂ ≤ (a₂ + 1 : ℤ) ^ n₂ := by linarith
                            have h₂₉ : (a₂ + 1 : ℤ) ^ n₂ ≤ (a₂ + 1 : ℤ) ^ n₂ := by linarith
                            have h₃₀ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ ≥ (a₂ : ℤ) ^ 3 - (a₂ + 1 : ℤ) ^ 2 := by
                              have h₃₁ : (a₂ : ℤ) ^ (n₂ + 1) ≥ (a₂ : ℤ) ^ 3 := h₂₇
                              have h₃₂ : (a₂ + 1 : ℤ) ^ n₂ ≥ (a₂ + 1 : ℤ) ^ 2 := by
                                exact pow_le_pow_right (by linarith) (by omega)
                              have h₃₃ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ ≥ (a₂ : ℤ) ^ 3 - (a₂ + 1 : ℤ) ^ 2 := by
                                omega
                              exact h₃₃
                            exact h₃₀
                          exact h₂₅
                        have h₃₄ : (a₂ : ℤ) ^ 3 - (a₂ + 1 : ℤ) ^ 2 > 2001 := by
                          nlinarith [sq_nonneg ((a₂ : ℤ) - 1)]
                        linarith
                      exact h₂₂
                    linarith
                  exact h₁₈
                <;> simp_all
              <;> nlinarith
            linarith
          have h₂₀ : a₂ ≤ 13 := by omega
          have h₂₁ : n₂ = 2 ∧ a₂ = 13 := by
            -- Prove that (a₂, n₂) = (13, 2)
            have h₂₂ : a₂ ≤ 13 := h₂₀
            have h₂₃ : a₂ > 0 := h₂a
            interval_cases a₂ <;> norm_num at h₂eq ⊢ <;>
              (try omega) <;>
              (try
                {
                  rcases n₂ with (_ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | n₂) <;>
                    norm_num at h₂eq h₂n ⊢ <;>
                      (try omega) <;>
                        (try
                          {
                            ring_nf at h₂eq ⊢ <;>
                              norm_num at h₂eq ⊢ <;>
                                omega
                          })
                }) <;>
              (try
                {
                  omega
                })
          exact h₂₁
        have h₉ : a₁ = a₂ := by omega
        contradiction
      · -- Case: a₂ < a₁
        have h₆ : a₂ < a₁ := h₅
        have h₇ : n₂ = 2 ∧ a₂ = 13 := by
          -- Prove that (a₂, n₂) = (13, 2)
          have h₈ : a₂ ≤ 13 := by
            by_contra h₈
            have h₉ : a₂ ≥ 14 := by linarith
            have h₁₀ : n₂ ≥ 1 := by
              omega
            have h₁₁ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ > 2001 := by
              have h₁₂ : n₂ ≥ 1 := by omega
              have h₁₃ : (a₂ : ℤ) ≥ 14 := by exact_mod_cast h₉
              have h₁₄ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ > 2001 := by
                have h₁₅ : n₂ = 1 ∨ n₂ ≥ 2 := by omega
                cases' h₁₅ with h₁₅ h₁₅
                · -- Subcase: n₂ = 1
                  have h₁₆ : n₂ = 1 := h₁₅
                  have h₁₇ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ = (a₂ : ℤ) ^ 2 - (a₂ + 1 : ℤ) := by
                    simp [h₁₆, pow_succ]
                    <;> ring_nf
                  rw [h₁₇]
                  have h₁₈ : (a₂ : ℤ) ^ 2 - (a₂ + 1 : ℤ) > 2001 := by
                    nlinarith [sq_nonneg ((a₂ : ℤ) - 1)]
                  linarith
                · -- Subcase: n₂ ≥ 2
                  have h₁₆ : n₂ ≥ 2 := h₁₅
                  have h₁₇ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ > 2001 := by
                    have h₁₈ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ > 2001 := by
                      have h₁₉ : n₂ ≥ 2 := h₁₆
                      have h₂₀ : (a₂ : ℤ) ≥ 14 := by exact_mod_cast h₉
                      have h₂₁ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ > 2001 := by
                        -- Prove that the expression is > 2001 for n₂ ≥ 2 and a₂ ≥ 14
                        have h₂₂ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ ≥ (a₂ : ℤ) ^ 3 - (a₂ + 1 : ℤ) ^ 2 := by
                          -- Prove that the expression is at least as large as the case when n₂ = 2
                          have h₂₃ : n₂ ≥ 2 := h₁₆
                          have h₂₄ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ ≥ (a₂ : ℤ) ^ 3 - (a₂ + 1 : ℤ) ^ 2 := by
                            have h₂₅ : n₂ ≥ 2 := h₁₆
                            have h₂₆ : (a₂ : ℤ) ^ (n₂ + 1) ≥ (a₂ : ℤ) ^ 3 := by
                              exact pow_le_pow_right (by linarith) (by omega)
                            have h₂₇ : (a₂ + 1 : ℤ) ^ n₂ ≤ (a₂ + 1 : ℤ) ^ n₂ := by linarith
                            have h₂₈ : (a₂ + 1 : ℤ) ^ n₂ ≤ (a₂ + 1 : ℤ) ^ n₂ := by linarith
                            have h₂₉ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ ≥ (a₂ : ℤ) ^ 3 - (a₂ + 1 : ℤ) ^ 2 := by
                              have h₃₀ : (a₂ : ℤ) ^ (n₂ + 1) ≥ (a₂ : ℤ) ^ 3 := h₂₆
                              have h₃₁ : (a₂ + 1 : ℤ) ^ n₂ ≥ (a₂ + 1 : ℤ) ^ 2 := by
                                exact pow_le_pow_right (by linarith) (by omega)
                              have h₃₂ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ ≥ (a₂ : ℤ) ^ 3 - (a₂ + 1 : ℤ) ^ 2 := by
                                omega
                              exact h₃₂
                            exact h₂₉
                          exact h₂₄
                        have h₃₀ : (a₂ : ℤ) ^ 3 - (a₂ + 1 : ℤ) ^ 2 > 2001 := by
                          nlinarith [sq_nonneg ((a₂ : ℤ) - 1)]
                        linarith
                      exact h₂₁
                    linarith
                  exact h₁₇
                <;> simp_all
              <;> nlinarith
            linarith
          have h₂₀ : a₂ ≤ 13 := by omega
          have h₂₁ : n₂ = 2 ∧ a₂ = 13 := by
            -- Prove that (a₂, n₂) = (13, 2)
            have h₂₂ : a₂ ≤ 13 := h₂₀
            have h₂₃ : a₂ > 0 := h₂a
            interval_cases a₂ <;> norm_num at h₂eq ⊢ <;>
              (try omega) <;>
              (try
                {
                  rcases n₂ with (_ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | n₂) <;>
                    norm_num at h₂eq h₂n ⊢ <;>
                      (try omega) <;>
                        (try
                          {
                            ring_nf at h₂eq ⊢ <;>
                              norm_num at h₂eq ⊢ <;>
                                omega
                          })
                }) <;>
              (try
                {
                  omega
                })
          exact h₂₁
        have h₈ : n₁ = 2 ∧ a₁ = 13 := by
          -- Prove that (a₁, n₁) = (13, 2)
          have h₉ : a₁ ≤ 13 := by
            by_contra h₉
            have h₁₀ : a₁ ≥ 14 := by linarith
            have h₁₁ : n₁ ≥ 1 := by
              omega
            have h₁₂ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ > 2001 := by
              have h₁₃ : n₁ ≥ 1 := by omega
              have h₁₄ : (a₁ : ℤ) ≥ 14 := by exact_mod_cast h₁₀
              have h₁₅ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ > 2001 := by
                have h₁₆ : n₁ = 1 ∨ n₁ ≥ 2 := by omega
                cases' h₁₆ with h₁₆ h₁₆
                · -- Subcase: n₁ = 1
                  have h₁₇ : n₁ = 1 := h₁₆
                  have h₁₈ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ = (a₁ : ℤ) ^ 2 - (a₁ + 1 : ℤ) := by
                    simp [h₁₇, pow_succ]
                    <;> ring_nf
                  rw [h₁₈]
                  have h₁₉ : (a₁ : ℤ) ^ 2 - (a₁ + 1 : ℤ) > 2001 := by
                    nlinarith [sq_nonneg ((a₁ : ℤ) - 1)]
                  linarith
                · -- Subcase: n₁ ≥ 2
                  have h₁₇ : n₁ ≥ 2 := h₁₆
                  have h₁₈ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ > 2001 := by
                    have h₁₉ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ > 2001 := by
                      have h₂₀ : n₁ ≥ 2 := h₁₇
                      have h₂₁ : (a₁ : ℤ) ≥ 14 := by exact_mod_cast h₁₀
                      have h₂₂ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ > 2001 := by
                        -- Prove that the expression is > 2001 for n₁ ≥ 2 and a₁ ≥ 14
                        have h₂₃ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ ≥ (a₁ : ℤ) ^ 3 - (a₁ + 1 : ℤ) ^ 2 := by
                          -- Prove that the expression is at least as large as the case when n₁ = 2
                          have h₂₄ : n₁ ≥ 2 := h₁₇
                          have h₂₅ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ ≥ (a₁ : ℤ) ^ 3 - (a₁ + 1 : ℤ) ^ 2 := by
                            have h₂₆ : n₁ ≥ 2 := h₁₇
                            have h₂₇ : (a₁ : ℤ) ^ (n₁ + 1) ≥ (a₁ : ℤ) ^ 3 := by
                              exact pow_le_pow_right (by linarith) (by omega)
                            have h₂₈ : (a₁ + 1 : ℤ) ^ n₁ ≤ (a₁ + 1 : ℤ) ^ n₁ := by linarith
                            have h₂₉ : (a₁ + 1 : ℤ) ^ n₁ ≤ (a₁ + 1 : ℤ) ^ n₁ := by linarith
                            have h₃₀ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ ≥ (a₁ : ℤ) ^ 3 - (a₁ + 1 : ℤ) ^ 2 := by
                              have h₃₁ : (a₁ : ℤ) ^ (n₁ + 1) ≥ (a₁ : ℤ) ^ 3 := h₂₇
                              have h₃₂ : (a₁ + 1 : ℤ) ^ n₁ ≥ (a₁ + 1 : ℤ) ^ 2 := by
                                exact pow_le_pow_right (by linarith) (by omega)
                              have h₃₃ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ ≥ (a₁ : ℤ) ^ 3 - (a₁ + 1 : ℤ) ^ 2 := by
                                omega
                              exact h₃₃
                            exact h₃₀
                          exact h₂₅
                        have h₃₀ : (a₁ : ℤ) ^ 3 - (a₁ + 1 : ℤ) ^ 2 > 2001 := by
                          nlinarith [sq_nonneg ((a₁ : ℤ) - 1)]
                        linarith
                      exact h₂₂
                    linarith
                  exact h₁₈
                <;> simp_all
              <;> nlinarith
            linarith
          have h₂₀ : a₁ ≤ 13 := by omega
          have h₂₁ : n₁ = 2 ∧ a₁ = 13 := by
            -- Prove that (a₁, n₁) = (13, 2)
            have h₂₂ : a₁ ≤ 13 := h₂₀
            have h₂₃ : a₁ > 0 := h₁a
            interval_cases a₁ <;> norm_num at h₁eq ⊢ <;>
              (try omega) <;>
              (try
                {
                  rcases n₁ with (_ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | n₁) <;>
                    norm_num at h₁eq h₁n ⊢ <;>
                      (try omega) <;>
                        (try
                          {
                            ring_nf at h₁eq ⊢ <;>
                              norm_num at h₁eq ⊢ <;>
                                omega
                          })
                }) <;>
              (try
                {
                  omega
                })
          exact h₂₁
        have h₉ : a₁ = a₂ := by omega
        omega
    have h₁₀ : n₁ = n₂ := by
      -- Prove that n₁ = n₂
      have h₁₁ : n₁ = 2 ∧ a₁ = 13 := by
        -- Prove that (a₁, n₁) = (13, 2)
        have h₁₂ : a₁ ≤ 13 := by
          by_contra h₁₂
          have h₁₃ : a₁ ≥ 14 := by linarith
          have h₁₄ : n₁ ≥ 1 := by
            omega
          have h₁₅ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ > 2001 := by
            have h₁₆ : n₁ ≥ 1 := by omega
            have h₁₇ : (a₁ : ℤ) ≥ 14 := by exact_mod_cast h₁₃
            have h₁₈ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ > 2001 := by
              have h₁₉ : n₁ = 1 ∨ n₁ ≥ 2 := by omega
              cases' h₁₉ with h₁₉ h₁₉
              · -- Subcase: n₁ = 1
                have h₂₀ : n₁ = 1 := h₁₉
                have h₂₁ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ = (a₁ : ℤ) ^ 2 - (a₁ + 1 : ℤ) := by
                  simp [h₂₀, pow_succ]
                  <;> ring_nf
                rw [h₂₁]
                have h₂₂ : (a₁ : ℤ) ^ 2 - (a₁ + 1 : ℤ) > 2001 := by
                  nlinarith [sq_nonneg ((a₁ : ℤ) - 1)]
                linarith
              · -- Subcase: n₁ ≥ 2
                have h₂₀ : n₁ ≥ 2 := h₁₉
                have h₂₁ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ > 2001 := by
                  have h₂₂ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ > 2001 := by
                    have h₂₃ : n₁ ≥ 2 := h₂₀
                    have h₂₄ : (a₁ : ℤ) ≥ 14 := by exact_mod_cast h₁₃
                    have h₂₅ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ > 2001 := by
                      -- Prove that the expression is > 2001 for n₁ ≥ 2 and a₁ ≥ 14
                      have h₂₆ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ ≥ (a₁ : ℤ) ^ 3 - (a₁ + 1 : ℤ) ^ 2 := by
                        -- Prove that the expression is at least as large as the case when n₁ = 2
                        have h₂₇ : n₁ ≥ 2 := h₂₃
                        have h₂₈ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ ≥ (a₁ : ℤ) ^ 3 - (a₁ + 1 : ℤ) ^ 2 := by
                          have h₂₉ : n₁ ≥ 2 := h₂₃
                          have h₃₀ : (a₁ : ℤ) ^ (n₁ + 1) ≥ (a₁ : ℤ) ^ 3 := by
                            exact pow_le_pow_right (by linarith) (by omega)
                          have h₃₁ : (a₁ + 1 : ℤ) ^ n₁ ≤ (a₁ + 1 : ℤ) ^ n₁ := by linarith
                          have h₃₂ : (a₁ + 1 : ℤ) ^ n₁ ≤ (a₁ + 1 : ℤ) ^ n₁ := by linarith
                          have h₃₃ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ ≥ (a₁ : ℤ) ^ 3 - (a₁ + 1 : ℤ) ^ 2 := by
                            have h₃₄ : (a₁ : ℤ) ^ (n₁ + 1) ≥ (a₁ : ℤ) ^ 3 := h₃₀
                            have h₃₅ : (a₁ + 1 : ℤ) ^ n₁ ≥ (a₁ + 1 : ℤ) ^ 2 := by
                              exact pow_le_pow_right (by linarith) (by omega)
                            have h₃₆ : (a₁ : ℤ) ^ (n₁ + 1) - (a₁ + 1 : ℤ) ^ n₁ ≥ (a₁ : ℤ) ^ 3 - (a₁ + 1 : ℤ) ^ 2 := by
                              omega
                            exact h₃₆
                          exact h₃₃
                        exact h₂₈
                      have h₃₀ : (a₁ : ℤ) ^ 3 - (a₁ + 1 : ℤ) ^ 2 > 2001 := by
                        nlinarith [sq_nonneg ((a₁ : ℤ) - 1)]
                      linarith
                    exact h₂₅
                  linarith
                exact h₂₁
              <;> simp_all
            <;> nlinarith
          linarith
        have h₁₆ : a₁ ≤ 13 := by omega
        have h₁₇ : n₁ = 2 ∧ a₁ = 13 := by
          -- Prove that (a₁, n₁) = (13, 2)
          have h₁₈ : a₁ ≤ 13 := h₁₆
          have h₁₉ : a₁ > 0 := h₁a
          interval_cases a₁ <;> norm_num at h₁eq ⊢ <;>
            (try omega) <;>
            (try
              {
                rcases n₁ with (_ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | n₁) <;>
                  norm_num at h₁eq h₁n ⊢ <;>
                    (try omega) <;>
                      (try
                        {
                          ring_nf at h₁eq ⊢ <;>
                            norm_num at h₁eq ⊢ <;>
                              omega
                        })
              }) <;>
            (try
              {
                omega
              })
        exact h₁₇
      have h₂₀ : n₂ = 2 ∧ a₂ = 13 := by
        -- Prove that (a₂, n₂) = (13, 2)
        have h₂₁ : a₂ ≤ 13 := by
          by_contra h₂₁
          have h₂₂ : a₂ ≥ 14 := by linarith
          have h₂₃ : n₂ ≥ 1 := by
            omega
          have h₂₄ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ > 2001 := by
            have h₂₅ : n₂ ≥ 1 := by omega
            have h₂₆ : (a₂ : ℤ) ≥ 14 := by exact_mod_cast h₂₂
            have h₂₇ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ > 2001 := by
              have h₂₈ : n₂ = 1 ∨ n₂ ≥ 2 := by omega
              cases' h₂₈ with h₂₈ h₂₈
              · -- Subcase: n₂ = 1
                have h₂₉ : n₂ = 1 := h₂₈
                have h₃₀ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ = (a₂ : ℤ) ^ 2 - (a₂ + 1 : ℤ) := by
                  simp [h₂₉, pow_succ]
                  <;> ring_nf
                rw [h₃₀]
                have h₃₁ : (a₂ : ℤ) ^ 2 - (a₂ + 1 : ℤ) > 2001 := by
                  nlinarith [sq_nonneg ((a₂ : ℤ) - 1)]
                linarith
              · -- Subcase: n₂ ≥ 2
                have h₂₉ : n₂ ≥ 2 := h₂₈
                have h₃₀ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ > 2001 := by
                  have h₃₁ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ > 2001 := by
                    have h₃₂ : n₂ ≥ 2 := h₂₉
                    have h₃₃ : (a₂ : ℤ) ≥ 14 := by exact_mod_cast h₂₂
                    have h₃₄ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ > 2001 := by
                      -- Prove that the expression is > 2001 for n₂ ≥ 2 and a₂ ≥ 14
                      have h₃₅ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ ≥ (a₂ : ℤ) ^ 3 - (a₂ + 1 : ℤ) ^ 2 := by
                        -- Prove that the expression is at least as large as the case when n₂ = 2
                        have h₃₆ : n₂ ≥ 2 := h₂₉
                        have h₃₇ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ ≥ (a₂ : ℤ) ^ 3 - (a₂ + 1 : ℤ) ^ 2 := by
                          have h₃₈ : n₂ ≥ 2 := h₂₉
                          have h₃₉ : (a₂ : ℤ) ^ (n₂ + 1) ≥ (a₂ : ℤ) ^ 3 := by
                            exact pow_le_pow_right (by linarith) (by omega)
                          have h₄₀ : (a₂ + 1 : ℤ) ^ n₂ ≤ (a₂ + 1 : ℤ) ^ n₂ := by linarith
                          have h₄₁ : (a₂ + 1 : ℤ) ^ n₂ ≤ (a₂ + 1 : ℤ) ^ n₂ := by linarith
                          have h₄₂ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ ≥ (a₂ : ℤ) ^ 3 - (a₂ + 1 : ℤ) ^ 2 := by
                            have h₄₃ : (a₂ : ℤ) ^ (n₂ + 1) ≥ (a₂ : ℤ) ^ 3 := h₃₉
                            have h₄₄ : (a₂ + 1 : ℤ) ^ n₂ ≥ (a₂ + 1 : ℤ) ^ 2 := by
                              exact pow_le_pow_right (by linarith) (by omega)
                            have h₄₅ : (a₂ : ℤ) ^ (n₂ + 1) - (a₂ + 1 : ℤ) ^ n₂ ≥ (a₂ : ℤ) ^ 3 - (a₂ + 1 : ℤ) ^ 2 := by
                              omega
                            exact h₄₅
                          exact h₄₂
                        exact h₃₇
                      have h₄₆ : (a₂ : ℤ) ^ 3 - (a₂ + 1 : ℤ) ^ 2 > 2001 := by
                        nlinarith [sq_nonneg ((a₂ : ℤ) - 1)]
                      linarith
                    exact h₃₄
                  linarith
                exact h₃₀
              <;> simp_all
            <;> nlinarith
          linarith
        have h₂₁ : a₂ ≤ 13 := by omega
        have h₂₂ : n₂ = 2 ∧ a₂ = 13 := by
          -- Prove that (a₂, n₂) = (13, 2)
          have h₂₃ : a₂ ≤ 13 := h₂₁
          have h₂₄ : a₂ > 0 := h₂a
          interval_cases a₂ <;> norm_num at h₂eq ⊢ <;>
            (try omega) <;>
            (try
              {
                rcases n₂ with (_ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | n₂) <;>
                  norm_num at h₂eq h₂n ⊢ <;>
                    (try omega) <;>
                      (try
                        {
                          ring_nf at h₂eq ⊢ <;>
                            norm_num at h₂eq ⊢ <;>
                              omega
                        })
              }) <;>
            (try
              {
                omega
              })
        exact h₂₂
      have h₂₅ : n₁ = 2 := by omega
      have h₂₆ : n₂ = 2 := by omega
      omega
    have h₁₁ : a₁ = a₂ := by omega
    have h₁₂ : n₁ = n₂ := by omega
    simp [h₁₁, h₁₂]
    <;> aesop
  
  have h_final : ∃! an : ℤ × ℕ, let (a, n) := an; a > 0 ∧ n > 0 ∧ a^(n+1) - (a+1)^n = 2001 := by
    refine' ⟨⟨13, 2⟩, _⟩
    constructor
    · -- Prove that (13, 2) is a solution
      dsimp
      <;> norm_num
    · -- Prove that (13, 2) is the only solution
      intro an h
      have h₁ := h_unique an ⟨13, 2⟩ h
      · simpa using h₁
      · simp at *
        <;> norm_num
        <;> aesop
  
  simpa using h_final