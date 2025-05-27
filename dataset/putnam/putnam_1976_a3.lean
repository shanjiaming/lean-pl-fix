theorem putnam_1976_a3
: {(p, r, q, s) : ℕ × ℕ × ℕ × ℕ | Nat.Prime p ∧ Nat.Prime q ∧ r > 1 ∧ s > 1 ∧ |(p^r : ℤ) - q^s| = 1} = (({(3, 2, 2, 3), (2, 3, 3, 2)}) : Set (ℕ × ℕ × ℕ × ℕ) ) := by
  have h_subset₁ : {(p, r, q, s) : ℕ × ℕ × ℕ × ℕ | Nat.Prime p ∧ Nat.Prime q ∧ r > 1 ∧ s > 1 ∧ |(p^r : ℤ) - q^s| = 1} ⊆ ({(3, 2, 2, 3), (2, 3, 3, 2)} : Set (ℕ × ℕ × ℕ × ℕ)) := by
    intro ⟨p, r, q, s⟩ h
    simp only [Set.mem_setOf_eq, Set.mem_insert_iff, Set.mem_singleton_iff] at h ⊢
    have h₁ : Nat.Prime p := h.1
    have h₂ : Nat.Prime q := h.2.1
    have h₃ : r > 1 := h.2.2.1
    have h₄ : s > 1 := h.2.2.2.1
    have h₅ : |(p^r : ℤ) - q^s| = 1 := h.2.2.2.2
    have h₆ : p^r > 1 := by
      have h₆₁ : p ≥ 2 := Nat.Prime.two_le h₁
      have h₆₂ : r ≥ 2 := by omega
      have h₆₃ : p^r ≥ p^2 := Nat.pow_le_pow_of_le_right (by omega) h₆₂
      have h₆₄ : p^2 ≥ 4 := by nlinarith
      have h₆₅ : p^r ≥ 4 := by linarith
      omega
    have h₇ : q^s > 1 := by
      have h₇₁ : q ≥ 2 := Nat.Prime.two_le h₂
      have h₇₂ : s ≥ 2 := by omega
      have h₇₃ : q^s ≥ q^2 := Nat.pow_le_pow_of_le_right (by omega) h₇₂
      have h₇₄ : q^2 ≥ 4 := by nlinarith
      have h₇₅ : q^s ≥ 4 := by linarith
      omega
    have h₈ : (p^r : ℤ) - q^s = 1 ∨ (p^r : ℤ) - q^s = -1 := by
      have h₈₁ : |(p^r : ℤ) - q^s| = 1 := h₅
      have h₈₂ : (p^r : ℤ) - q^s = 1 ∨ (p^r : ℤ) - q^s = -1 := by
        rw [abs_eq_max_neg] at h₈₁
        omega
      exact h₈₂
    have h₉ : p^r = q^s + 1 ∨ q^s = p^r + 1 := by
      cases h₈ with
      | inl h₈ =>
        have h₉₁ : (p^r : ℤ) - q^s = 1 := h₈
        have h₉₂ : (p^r : ℤ) = q^s + 1 := by linarith
        have h₉₃ : p^r = q^s + 1 := by
          norm_cast at h₉₂ ⊢
          <;> omega
        exact Or.inl h₉₃
      | inr h₈ =>
        have h₉₁ : (p^r : ℤ) - q^s = -1 := h₈
        have h₉₂ : (p^r : ℤ) = q^s - 1 := by linarith
        have h₉₃ : q^s = p^r + 1 := by
          norm_cast at h₉₂ ⊢
          <;> omega
        exact Or.inr h₉₃
    have h₁₀ : p = 2 ∧ r = 3 ∧ q = 3 ∧ s = 2 ∨ p = 3 ∧ r = 2 ∧ q = 2 ∧ s = 3 := by
      -- We will show that the only solutions are (3, 2, 2, 3) and (2, 3, 3, 2)
      have h₁₀₁ : p^r = q^s + 1 ∨ q^s = p^r + 1 := h₉
      cases h₁₀₁ with
      | inl h₁₀₁ =>
        -- Case: p^r = q^s + 1
        have h₁₀₂ : p^r = q^s + 1 := h₁₀₁
        have h₁₀₃ : p = 3 ∧ r = 2 ∧ q = 2 ∧ s = 3 := by
          -- We will show that the only solution is (3, 2, 2, 3)
          have h₁₀₄ : p = 3 := by
            by_contra h₁₀₄
            -- If p ≠ 3, then we will show that there are no solutions
            have h₁₀₅ : p ≠ 3 := h₁₀₄
            have h₁₀₆ : p = 2 := by
              -- We will show that p must be 2
              by_contra h₁₀₆
              have h₁₀₇ : p ≠ 2 := h₁₀₆
              have h₁₀₈ : p ≥ 5 := by
                -- Since p is a prime and not 2 or 3, p ≥ 5
                have h₁₀₉ : p ≥ 2 := Nat.Prime.two_le h₁
                have h₁₀₁₀ : p ≠ 2 := h₁₀₇
                have h₁₀₁₁ : p ≠ 3 := h₁₀₅
                have h₁₀₁₂ : p ≥ 5 := by
                  by_contra h₁₀₁₂
                  have h₁₀₁₃ : p ≤ 4 := by omega
                  interval_cases p <;> norm_num at h₁ h₁₀₅ h₁₀₇ ⊢ <;> norm_num [Nat.Prime] at h₁ <;> omega
                exact h₁₀₁₂
              have h₁₀₉ : p^r ≥ p^2 := by
                -- Since r ≥ 2, p^r ≥ p^2
                have h₁₀₁₀ : r ≥ 2 := by omega
                have h₁₀₁₁ : p^r ≥ p^2 := Nat.pow_le_pow_of_le_right (by omega) h₁₀₁₀
                exact h₁₀₁₁
              have h₁₀₁₀ : p^2 ≥ 25 := by
                -- Since p ≥ 5, p^2 ≥ 25
                nlinarith
              have h₁₀₁₁ : p^r ≥ 25 := by linarith
              have h₁₀₁₂ : q^s = p^r - 1 := by omega
              have h₁₀₁₃ : q^s ≥ 24 := by omega
              have h₁₀₁₄ : q ≥ 2 := Nat.Prime.two_le h₂
              have h₁₀₁₅ : s ≥ 2 := by omega
              have h₁₀₁₆ : q^s ≥ q^2 := Nat.pow_le_pow_of_le_right (by omega) h₁₀₁₅
              have h₁₀₁₇ : q^2 ≥ 4 := by nlinarith
              have h₁₀₁₈ : q^s ≥ 4 := by linarith
              have h₁₀₁₉ : q ≤ p^r - 1 := by
                have h₁₀₂₀ : q^s ≤ p^r - 1 := by omega
                have h₁₀₂₁ : q ≤ p^r - 1 := by
                  by_contra h₁₀₂₁
                  have h₁₀₂₂ : q ≥ p^r := by omega
                  have h₁₀₂₃ : q^s ≥ (p^r)^s := Nat.pow_le_pow_of_le_left (by omega) s
                  have h₁₀₂₄ : (p^r)^s ≥ (p^r)^2 := Nat.pow_le_pow_of_le_right (by omega) (by omega)
                  have h₁₀₂₅ : (p^r)^2 ≥ p^r * p^r := by
                    nlinarith
                  have h₁₀₂₆ : p^r * p^r > p^r := by
                    nlinarith
                  have h₁₀₂₇ : q^s > p^r := by
                    nlinarith
                  omega
                exact h₁₀₂₁
              have h₁₀₂₀ : q ≤ p^r - 1 := h₁₀₁₉
              have h₁₀₂₁ : q < p^r := by
                have h₁₀₂₂ : q ≤ p^r - 1 := h₁₀₂₀
                have h₁₀₂₃ : p^r - 1 < p^r := by
                  have h₁₀₂₄ : p^r > 1 := h₆
                  omega
                omega
              have h₁₀₂₂ : q^s < (p^r)^s := Nat.pow_lt_pow_of_lt_left h₁₀₂₁ (by omega)
              have h₁₀₂₃ : (p^r)^s ≥ (p^r)^2 := Nat.pow_le_pow_of_le_right (by omega) (by omega)
              have h₁₀₂₄ : (p^r)^2 ≥ p^r * p^r := by
                nlinarith
              have h₁₀₂₅ : p^r * p^r > p^r := by
                nlinarith
              have h₁₀₂₆ : q^s < (p^r)^s := h₁₀₂₂
              have h₁₀₂₇ : q^s < (p^r)^s := h₁₀₂₂
              have h₁₀₂₈ : q^s < (p^r)^s := h₁₀₂₂
              omega
            -- Now we know p = 2
            have h₁₀₇ : p = 2 := h₁₀₆
            have h₁₀₈ : r ≥ 2 := by omega
            have h₁₀₉ : 2^r = q^s + 1 := by
              rw [h₁₀₇] at h₁₀₂
              norm_cast at h₁₀₂ ⊢
              <;> omega
            have h₁₀₁₀ : r ≤ 10 := by
              by_contra h₁₀₁₀
              have h₁₀₁₁ : r ≥ 11 := by omega
              have h₁₀₁₂ : 2^r ≥ 2^11 := Nat.pow_le_pow_of_le_right (by omega) h₁₀₁₁
              have h₁₀₁₃ : 2^11 = 2048 := by norm_num
              have h₁₀₁₄ : 2^r ≥ 2048 := by
                linarith
              have h₁₀₁₅ : q^s = 2^r - 1 := by omega
              have h₁₀₁₆ : q^s ≥ 2047 := by omega
              have h₁₀₁₇ : q ≥ 2 := Nat.Prime.two_le h₂
              have h₁₀₁₈ : s ≥ 2 := by omega
              have h₁₀₁₉ : q^s ≥ q^2 := Nat.pow_le_pow_of_le_right (by omega) h₁₀₁₈
              have h₁₀₂₀ : q^2 ≥ 4 := by nlinarith
              have h₁₀₂₁ : q^s ≥ 4 := by linarith
              have h₁₀₂₂ : q ≤ 2^r - 1 := by
                have h₁₀₂₃ : q^s ≤ 2^r - 1 := by omega
                have h₁₀₂₄ : q ≤ 2^r - 1 := by
                  by_contra h₁₀₂₄
                  have h₁₀₂₅ : q ≥ 2^r := by omega
                  have h₁₀₂₆ : q^s ≥ (2^r)^s := Nat.pow_le_pow_of_le_left (by omega) s
                  have h₁₀₂₇ : (2^r)^s ≥ (2^r)^2 := Nat.pow_le_pow_of_le_right (by omega) (by omega)
                  have h₁₀₂₈ : (2^r)^2 ≥ 2^r * 2^r := by
                    nlinarith
                  have h₁₀₂₉ : 2^r * 2^r > 2^r := by
                    nlinarith
                  have h₁₀₃₀ : q^s > 2^r := by
                    nlinarith
                  omega
                exact h₁₀₂₄
              have h₁₀₃₁ : q < 2^r := by
                have h₁₀₃₂ : q ≤ 2^r - 1 := h₁₀₂₂
                have h₁₀₃₃ : 2^r - 1 < 2^r := by
                  have h₁₀₃₄ : 2^r > 1 := by
                    have h₁₀₃₅ : r ≥ 2 := by omega
                    have h₁₀₃₆ : 2^r ≥ 2^2 := Nat.pow_le_pow_of_le_right (by omega) h₁₀₃₅
                    have h₁₀₃₇ : 2^2 = 4 := by norm_num
                    have h₁₀₃₈ : 2^r ≥ 4 := by linarith
                    omega
                  omega
                omega
              have h₁₀₃₂ : q^s < (2^r)^s := Nat.pow_lt_pow_of_lt_left h₁₀₃₁ (by omega)
              have h₁₀₃₃ : (2^r)^s ≥ (2^r)^2 := Nat.pow_le_pow_of_le_right (by omega) (by omega)
              have h₁₀₃₄ : (2^r)^2 ≥ 2^r * 2^r := by
                nlinarith
              have h₁₀₃₅ : 2^r * 2^r > 2^r := by
                nlinarith
              have h₁₀₃₆ : q^s < (2^r)^s := h₁₀₃₂
              have h₁₀₃₇ : q^s < (2^r)^s := h₁₀₃₂
              have h₁₀₃₈ : q^s < (2^r)^s := h₁₀₃₂
              omega
            -- Now we know r ≤ 10
            interval_cases r <;> norm_num at h₁₀₉ ⊢ <;>
              (try omega) <;>
              (try {
                have h₁₀₄₀ : q^s = _ := by omega
                have h₁₀₄₁ : s ≥ 2 := by omega
                have h₁₀₄₂ : q ≥ 2 := Nat.Prime.two_le h₂
                have h₁₀₄₃ : q^s ≥ q^2 := Nat.pow_le_pow_of_le_right (by omega) h₁₀₄₁
                have h₁₀₄₄ : q^2 ≥ 4 := by nlinarith
                have h₁₀₄₅ : q^s ≥ 4 := by linarith
                have h₁₀₄₆ : q ≤ 44 := by
                  by_contra h₁₀₄₆
                  have h₁₀₄₇ : q ≥ 45 := by omega
                  have h₁₀₄₈ : q^s ≥ q^2 := Nat.pow_le_pow_of_le_right (by omega) (by omega)
                  have h₁₀₄₉ : q^2 ≥ 2025 := by nlinarith
                  have h₁₀₅₀ : q^s ≥ 2025 := by linarith
                  omega
                interval_cases q <;> norm_num at h₁₀₄₀ ⊢ <;>
                  (try omega) <;>
                  (try {
                    have h₁₀₅₁ : s ≥ 2 := by omega
                    have h₁₀₅₂ : s ≤ 10 := by
                      by_contra h₁₀₅₂
                      have h₁₀₅₃ : s ≥ 11 := by omega
                      have h₁₀₅₄ : q^s ≥ q^11 := Nat.pow_le_pow_of_le_right (by omega) h₁₀₅₃
                      have h₁₀₅₅ : q^11 ≥ q^2 := Nat.pow_le_pow_of_le_right (by omega) (by omega)
                      have h₁₀₅₆ : q^2 ≥ 4 := by nlinarith
                      have h₁₀₅₇ : q^s ≥ 4 := by linarith
                      omega
                    interval_cases s <;> norm_num at h₁₀₄₀ ⊢ <;>
                      (try omega) <;>
                      (try {
                        norm_num at h₁₀₄₀ ⊢ <;>
                        omega
                      })
                  })
              })
          -- Now we know p = 3
          have h₁₀₅ : p = 3 := by omega
          have h₁₀₆ : r = 2 := by
            by_contra h₁₀₆
            have h₁₀₇ : r ≠ 2 := h₁₀₆
            have h₁₀₈ : r ≥ 3 := by
              by_contra h₁₀₈
              have h₁₀₉ : r ≤ 2 := by omega
              have h₁₀₁₀ : r = 2 := by omega
              contradiction
            have h₁₀₁₁ : p^r ≥ p^3 := Nat.pow_le_pow_of_le_right (by omega) h₁₀₈
            have h₁₀₁₂ : p^3 = 27 := by
              rw [h₁₀₅]
              <;> norm_num
            have h₁₀₁₃ : p^r ≥ 27 := by linarith
            have h₁₀₁₄ : q^s = p^r - 1 := by omega
            have h₁₀₁₅ : q^s ≥ 26 := by omega
            have h₁₀₁₆ : q ≥ 2 := Nat.Prime.two_le h₂
            have h₁₀₁₇ : s ≥ 2 := by omega
            have h₁₀₁₈ : q^s ≥ q^2 := Nat.pow_le_pow_of_le_right (by omega) h₁₀₁₇
            have h₁₀₁₉ : q^2 ≥ 4 := by nlinarith
            have h₁₀₂₀ : q^s ≥ 4 := by linarith
            have h₁₀₂₁ : q ≤ p^r - 1 := by
              have h₁₀₂₂ : q^s ≤ p^r - 1 := by omega
              have h₁₀₂₃ : q ≤ p^r - 1 := by
                by_contra h₁₀₂₃
                have h₁₀₂₄ : q ≥ p^r := by omega
                have h₁₀₂₅ : q^s ≥ (p^r)^s := Nat.pow_le_pow_of_le_left (by omega) s
                have h₁₀₂₆ : (p^r)^s ≥ (p^r)^2 := Nat.pow_le_pow_of_le_right (by omega) (by omega)
                have h₁₀₂₇ : (p^r)^2 ≥ p^r * p^r := by
                  nlinarith
                have h₁₀₂₈ : p^r * p^r > p^r := by
                  nlinarith
                have h₁₀₂₉ : q^s > p^r := by
                  nlinarith
                omega
              exact h₁₀₂₃
            have h₁₀₂₂ : q ≤ p^r - 1 := h₁₀₂₁
            have h₁₀₂₃ : q < p^r := by
              have h₁₀₂₄ : q ≤ p^r - 1 := h₁₀₂₂
              have h₁₀₂₅ : p^r - 1 < p^r := by
                have h₁₀₂₆ : p^r > 1 := h₆
                omega
              omega
            have h₁₀₂₄ : q^s < (p^r)^s := Nat.pow_lt_pow_of_lt_left h₁₀₂₃ (by omega)
            have h₁₀₂₅ : (p^r)^s ≥ (p^r)^2 := Nat.pow_le_pow_of_le_right (by omega) (by omega)
            have h₁₀₂₆ : (p^r)^2 ≥ p^r * p^r := by
              nlinarith
            have h₁₀₂₇ : p^r * p^r > p^r := by
              nlinarith
            have h₁₀₂₈ : q^s < (p^r)^s := h₁₀₂₄
            have h₁₀₂₉ : q^s < (p^r)^s := h₁₀₂₄
            have h₁₀₃₀ : q^s < (p^r)^s := h₁₀₂₄
            omega
          have h₁₀₇ : q = 2 := by
            by_contra h₁₀₇
            have h₁₀₈ : q ≠ 2 := h₁₀₇
            have h₁₀₉ : q ≥ 3 := by
              have h₁₀₁₀ : q ≥ 2 := Nat.Prime.two_le h₂
              omega
            have h₁₀₁₀ : s ≥ 2 := by omega
            have h₁₀₁₁ : q^s ≥ q^2 := Nat.pow_le_pow_of_le_right (by omega) h₁₀₁₀
            have h₁₀₁₂ : q^2 ≥ 9 := by nlinarith
            have h₁₀₁₃ : q^s ≥ 9 := by linarith
            have h₁₀₁₄ : p^r = 9 := by
              rw [h₁₀₅, h₁₀₆]
              <;> norm_num
            have h₁₀₁₅ : q^s = 8 := by omega
            have h₁₀₁₆ : q ≤ 8 := by
              by_contra h₁₀₁₆
              have h₁₀₁₇ : q ≥ 9 := by omega
              have h₁₀₁₈ : q^s ≥ q^2 := Nat.pow_le_pow_of_le_right (by omega) (by omega)
              have h₁₀₁₉ : q^2 ≥ 81 := by nlinarith
              have h₁₀₂₀ : q^s ≥ 81 := by linarith
              omega
            interval_cases q <;> norm_num at h₁₀₁₅ ⊢ <;>
              (try omega) <;>
              (try {
                have h₁₀₂₁ : s ≥ 2 := by omega
                have h₁₀₂₂ : s ≤ 10 := by
                  by_contra h₁₀₂₂
                  have h₁₀₂₃ : s ≥ 11 := by omega
                  have h₁₀₂₄ : q^s ≥ q^11 := Nat.pow_le_pow_of_le_right (by omega) h₁₀₂₃
                  have h₁₀₂₅ : q^11 ≥ q^2 := Nat.pow_le_pow_of_le_right (by omega) (by omega)
                  have h₁₀₂₆ : q^2 ≥ 4 := by nlinarith
                  have h₁₀₂₇ : q^s ≥ 4 := by linarith
                  omega
                interval_cases s <;> norm_num at h₁₀₁₅ ⊢ <;>
                  (try omega) <;>
                  (try {
                    norm_num at h₁₀₁₅ ⊢ <;>
                    omega
                  })
              })
          have h₁₀₈ : s = 3 := by
            by_contra h₁₀₈
            have h₁₀₉ : s ≠ 3 := h₁₀₈
            have h₁₀₁₀ : s ≥ 2 := by omega
            have h₁₀₁₁ : s ≥ 4 := by
              by_contra h₁₀₁₁
              have h₁₀₁₂ : s ≤ 3 := by omega
              have h₁₀₁₃ : s = 2 := by omega
              have h₁₀₁₄ : q^s = 4 := by
                rw [h₁₀₇, h₁₀₁₃]
                <;> norm_num
              have h₁₀₁₅ : p^r = 9 := by
                rw [h₁₀₅, h₁₀₆]
                <;> norm_num
              omega
            have h₁₀₁₂ : q^s ≥ q^4 := Nat.pow_le_pow_of_le_right (by omega) h₁₀₁₁
            have h₁₀₁₃ : q^4 ≥ 16 := by
              have h₁₀₁₄ : q ≥ 2 := Nat.Prime.two_le h₂
              have h₁₀₁₅ : q^4 ≥ 2^4 := Nat.pow_le_pow_of_le_left h₁₀₁₄ 4
              norm_num at h₁₀₁₅ ⊢
              <;> omega
            have h₁₀₁₄ : q^s ≥ 16 := by linarith
            have h₁₀₁₅ : p^r = 9 := by
              rw [h₁₀₅, h₁₀₆]
              <;> norm_num
            omega
          exact ⟨by omega, by omega, by omega, by omega⟩
        exact h₁₀₃
      | inr h₁₀₁ =>
        -- Case: q^s = p^r + 1
        have h₁₀₂ : q^s = p^r + 1 := h₁₀₁
        have h₁₀₃ : p = 2 ∧ r = 3 ∧ q = 3 ∧ s = 2 := by
          -- We will show that the only solution is (2, 3, 3, 2)
          have h₁₀₄ : q = 3 := by
            by_contra h₁₀₄
            have h₁₀₅ : q ≠ 3 := h₁₀₄
            have h₁₀₆ : q = 2 := by
              -- We will show that q must be 2
              by_contra h₁₀₆
              have h₁₀₇ : q ≠ 2 := h₁₀₆
              have h₁₀₈ : q ≥ 5 := by
                -- Since q is a prime and not 2 or 3, q ≥ 5
                have h₁₀₉ : q ≥ 2 := Nat.Prime.two_le h₂
                have h₁₀₁₀ : q ≠ 2 := h₁₀₇
                have h₁₀₁₁ : q ≠ 3 := h₁₀₅
                have h₁₀₁₂ : q ≥ 5 := by
                  by_contra h₁₀₁₂
                  have h₁₀₁₃ : q ≤ 4 := by omega
                  interval_cases q <;> norm_num at h₁₀₇ h₁₀₅ h₁₀₆ ⊢ <;> norm_num [Nat.Prime] at h₂ <;> omega
                exact h₁₀₁₂
              have h₁₀₉ : q^s ≥ q^2 := by
                -- Since s ≥ 2, q^s ≥ q^2
                have h₁₀₁₀ : s ≥ 2 := by omega
                have h₁₀₁₁ : q^s ≥ q^2 := Nat.pow_le_pow_of_le_right (by omega) h₁₀₁₀
                exact h₁₀₁₁
              have h₁₀₁₀ : q^2 ≥ 25 := by
                -- Since q ≥ 5, q^2 ≥ 25
                nlinarith
              have h₁₀₁₁ : q^s ≥ 25 := by linarith
              have h₁₀₁₂ : p^r = q^s - 1 := by omega
              have h₁₀₁₃ : p^r ≥ 24 := by omega
              have h₁₀₁₄ : p ≥ 2 := Nat.Prime.two_le h₁
              have h₁₀₁₅ : r ≥ 2 := by omega
              have h₁₀₁₆ : p^r ≥ p^2 := Nat.pow_le_pow_of_le_right (by omega) h₁₀₁₅
              have h₁₀₁₇ : p^2 ≥ 4 := by nlinarith
              have h₁₀₁₈ : p^r ≥ 4 := by linarith
              have h₁₀₁₉ : p ≤ q^s - 1 := by
                have h₁₀₂₀ : p^r ≤ q^s - 1 := by omega
                have h₁₀₂₁ : p ≤ q^s - 1 := by
                  by_contra h₁₀₂₁
                  have h₁₀₂₂ : p ≥ q^s := by omega
                  have h₁₀₂₃ : p^r ≥ (q^s)^r := Nat.pow_le_pow_of_le_left (by omega) r
                  have h₁₀₂₄ : (q^s)^r ≥ (q^s)^2 := Nat.pow_le_pow_of_le_right (by omega) (by omega)
                  have h₁₀₂₅ : (q^s)^2 ≥ q^s * q^s := by
                    nlinarith
                  have h₁₀₂₆ : q^s * q^s > q^s := by
                    nlinarith
                  have h₁₀₂₇ : p^r > q^s := by
                    nlinarith
                  omega
                exact h₁₀₂₁
              have h₁₀₂₀ : p ≤ q^s - 1 := h₁₀₁₉
              have h₁₀₂₁ : p < q^s := by
                have h₁₀₂₂ : p ≤ q^s - 1 := h₁₀₂₀
                have h₁₀₂₃ : q^s - 1 < q^s := by
                  have h₁₀₂₄ : q^s > 1 := by
                    have h₁₀₂₅ : s ≥ 2 := by omega
                    have h₁₀₂₆ : q ≥ 2 := Nat.Prime.two_le h₂
                    have h₁₀₂₇ : q^s ≥ q^2 := Nat.pow_le_pow_of_le_right (by omega) h₁₀₂₅
                    have h₁₀₂₈ : q^2 ≥ 4 := by nlinarith
                    have h₁₀₂₉ : q^s ≥ 4 := by linarith
                    omega
                  omega
                omega
              have h₁₀₂₂ : p^r < (q^s)^r := Nat.pow_lt_pow_of_lt_left h₁₀₂₁ (by omega)
              have h₁₀₂₃ : (q^s)^r ≥ (q^s)^2 := Nat.pow_le_pow_of_le_right (by omega) (by omega)
              have h₁₀₂₄ : (q^s)^2 ≥ q^s * q^s := by
                nlinarith
              have h₁₀₂₅ : q^s * q^s > q^s := by
                nlinarith
              have h₁₀₂₆ : p^r < (q^s)^r := h₁₀₂₂
              have h₁₀₂₇ : p^r < (q^s)^r := h₁₀₂₂
              have h₁₀₂₈ : p^r < (q^s)^r := h₁₀₂₂
              omega
            -- Now we know q = 2
            have h₁₀₇ : q = 2 := h₁₀₆
            have h₁₀₈ : s ≥ 2 := by omega
            have h₁₀₉ : 2^s = p^r + 1 := by
              rw [h₁₀₇] at h₁₀₂
              norm_cast at h₁₀₂ ⊢
              <;> omega
            have h₁₀₁₀ : s ≤ 10 := by
              by_contra h₁₀₁₀
              have h₁₀₁₁ : s ≥ 11 := by omega
              have h₁₀₁₂ : 2^s ≥ 2^11 := Nat.pow_le_pow_of_le_right (by omega) h₁₀₁₁
              have h₁₀₁₃ : 2^11 = 2048 := by norm_num
              have h₁₀₁₄ : 2^s ≥ 2048 := by
                linarith
              have h₁₀₁₅ : p^r = 2^s - 1 := by omega
              have h₁₀₁₆ : p^r ≥ 2047 := by omega
              have h₁₀₁₇ : p ≥ 2 := Nat.Prime.two_le h₁
              have h₁₀₁₈ : r ≥ 2 := by omega
              have h₁₀₁₉ : p^r ≥ p^2 := Nat.pow_le_pow_of_le_right (by omega) h₁₀₁₈
              have h₁₀₂₀ : p^2 ≥ 4 := by nlinarith
              have h₁₀₂₁ : p^r ≥ 4 := by linarith
              have h₁₀₂₂ : p ≤ 2^s - 1 := by
                have h₁₀₂₃ : p^r ≤ 2^s - 1 := by omega
                have h₁₀₂₄ : p ≤ 2^s - 1 := by
                  by_contra h₁₀₂₄
                  have h₁₀₂₅ : p ≥ 2^s := by omega
                  have h₁₀₂₆ : p^r ≥ (2^s)^r := Nat.pow_le_pow_of_le_left (by omega) r
                  have h₁₀₂₇ : (2^s)^r ≥ (2^s)^2 := Nat.pow_le_pow_of_le_right (by omega) (by omega)
                  have h₁₀₂₈ : (2^s)^2 ≥ 2^s * 2^s := by
                    nlinarith
                  have h₁₀₂₉ : 2^s * 2^s > 2^s := by
                    nlinarith
                  have h₁₀₃₀ : p^r > 2^s := by
                    nlinarith
                  omega
                exact h₁₀₂₄
              have h₁₀₃₁ : p < 2^s := by
                have h₁₀₃₂ : p ≤ 2^s - 1 := h₁₀₂₂
                have h₁₀₃₃ : 2^s - 1 < 2^s := by
                  have h₁₀₃₄ : 2^s > 1 := by
                    have h₁₀₃₅ : s ≥ 2 := by omega
                    have h₁₀₃₆ : 2^s ≥ 2^2 := Nat.pow_le_pow_of_le_right (by omega) h₁₀₃₅
                    have h₁₀₃₇ : 2^2 = 4 := by norm_num
                    have h₁₀₃₈ : 2^s ≥ 4 := by linarith
                    omega
                  omega
                omega
              have h₁₀₃₂ : p^r < (2^s)^r := Nat.pow_lt_pow_of_lt_left h₁₀₃₁ (by omega)
              have h₁₀₃₃ : (2^s)^r ≥ (2^s)^2 := Nat.pow_le_pow_of_le_right (by omega) (by omega)
              have h₁₀₃₄ : (2^s)^2 ≥ 2^s * 2^s := by
                nlinarith
              have h₁₀₃₅ : 2^s * 2^s > 2^s := by
                nlinarith
              have h₁₀₃₆ : p^r < (2^s)^r := h₁₀₃₂
              have h₁₀₃₇ : p^r < (2^s)^r := h₁₀₃₂
              have h₁₀₃₈ : p^r < (2^s)^r := h₁₀₃₂
              omega
            -- Now we know s ≤ 10
            interval_cases s <;> norm_num at h₁₀₉ ⊢ <;>
              (try omega) <;>
              (try {
                have h₁₀₄₀ : p^r = _ := by omega
                have h₁₀₄₁ : r ≥ 2 := by omega
                have h₁₀₄₂ : p ≥ 2 := Nat.Prime.two_le h₁
                have h₁₀₄₃ : p^r ≥ p^2 := Nat.pow_le_pow_of_le_right (by omega) h₁₀₄₁
                have h₁₀₄₄ : p^2 ≥ 4 := by nlinarith
                have h₁₀₄₅ : p^r ≥ 4 := by linarith
                have h₁₀₄₆ : p ≤ 44 := by
                  by_contra h₁₀₄₆
                  have h₁₀₄₇ : p ≥ 45 := by omega
                  have h₁₀₄₈ : p^r ≥ p^2 := Nat.pow_le_pow_of_le_right (by omega) (by omega)
                  have h₁₀₄₉ : p^2 ≥ 2025 := by nlinarith
                  have h₁₀₅₀ : p^r ≥ 2025 := by linarith
                  omega
                interval_cases p <;> norm_num at h₁₀₄₀ ⊢ <;>
                  (try omega) <;>
                  (try {
                    have h₁₀₅₁ : r ≥ 2 := by omega
                    have h₁₀₅₂ : r ≤ 10 := by
                      by_contra h₁₀₅₂
                      have h₁₀₅₃ : r ≥ 11 := by omega
                      have h₁₀₅₄ : p^r ≥ p^11 := Nat.pow_le_pow_of_le_right (by omega) h₁₀₅₃
                      have h₁₀₅₅ : p^11 ≥ p^2 := Nat.pow_le_pow_of_le_right (by omega) (by omega)
                      have h₁₀₅₆ : p^2 ≥ 4 := by nlinarith
                      have h₁₀₅₇ : p^r ≥ 4 := by linarith
                      omega
                    interval_cases r <;> norm_num at h₁₀₄₀ ⊢ <;>
                      (try omega) <;>
                      (try {
                        norm_num at h₁₀₄₀ ⊢ <;>
                        omega
                      })
                  })
              })
          -- Now we know q = 3
          have h₁₀₅ : q = 3 := by omega
          have h₁₀₆ : s = 2 := by
            by_contra h₁₀₆
            have h₁₀₇ : s ≠ 2 := h₁₀₆
            have h₁₀₈ : s ≥ 3 := by
              by_contra h₁₀₈
              have h₁₀₉ : s ≤ 2 := by omega
              have h₁₀₁₀ : s = 2 := by omega
              contradiction
            have h₁₀₁₁ : q^s ≥ q^3 := Nat.pow_le_pow_of_le_right (by omega) h₁₀₈
            have h₁₀₁₂ : q^3 = 27 := by
              rw [h₁₀₅]
              <;> norm_num
            have h₁₀₁₃ : q^s ≥ 27 := by linarith
            have h₁₀₁₄ : p^r = q^s - 1 := by omega
            have h₁₀₁₅ : p^r ≥ 26 := by omega
            have h₁₀₁₆ : p ≥ 2 := Nat.Prime.two_le h₁
            have h₁₀₁₇ : r ≥ 2 := by omega
            have h₁₀₁₈ : p^r ≥ p^2 := Nat.pow_le_pow_of_le_right (by omega) h₁₀₁₇
            have h₁₀₁₉ : p^2 ≥ 4 := by nlinarith
            have h₁₀₂₀ : p^r ≥ 4 := by linarith
            have h₁₀₂₁ : p ≤ q^s - 1 := by
              have h₁₀₂₂ : p^r ≤ q^s - 1 := by omega
              have h₁₀₂₃ : p ≤ q^s - 1 := by
                by_contra h₁₀₂₃
                have h₁₀₂₄ : p ≥ q^s := by omega
                have h₁₀₂₅ : p^r ≥ (q^s)^r := Nat.pow_le_pow_of_le_left (by omega) r
                have h₁₀₂₆ : (q^s)^r ≥ (q^s)^2 := Nat.pow_le_pow_of_le_right (by omega) (by omega)
                have h₁₀₂₇ : (q^s)^2 ≥ q^s * q^s := by
                  nlinarith
                have h₁₀₂₈ : q^s * q^s > q^s := by
                  nlinarith
                have h₁₀₂₉ : p^r > q^s := by
                  nlinarith
                omega
              exact h₁₀₂₃
            have h₁₀₂₂ : p ≤ q^s - 1 := h₁₀₂₁
            have h₁₀₂₃ : p < q^s := by
              have h₁₀₂₄ : p ≤ q^s - 1 := h₁₀₂₂
              have h₁₀₂₅ : q^s - 1 < q^s := by
                have h₁₀₂₆ : q^s > 1 := by
                  have h₁₀₂₇ : s ≥ 2 := by omega
                  have h₁₀₂₈ : q ≥ 2 := Nat.Prime.two_le h₂
                  have h₁₀₂₉ : q^s ≥ q^2 := Nat.pow_le_pow_of_le_right (by omega) h₁₀₂₇
                  have h₁₀₃₀ : q^2 ≥ 4 := by nlinarith
                  have h₁₀₃₁ : q^s ≥ 4 := by linarith
                  omega
                omega
              omega
            have h₁₀₂₄ : p^r < (q^s)^r := Nat.pow_lt_pow_of_lt_left h₁₀₂₃ (by omega)
            have h₁₀₂₅ : (q^s)^r ≥ (q^s)^2 := Nat.pow_le_pow_of_le_right (by omega) (by omega)
            have h₁₀₂₆ : (q^s)^2 ≥ q^s * q^s := by
              nlinarith
            have h₁₀₂₇ : q^s * q^s > q^s := by
              nlinarith
            have h₁₀₂₈ : p^r < (q^s)^r := h₁₀₂₄
            have h₁₀₂₉ : p^r < (q^s)^r := h₁₀₂₄
            have h₁₀₃₀ : p^r < (q^s)^r := h₁₀₂₄
            omega
          have h₁₀₇ : p = 2 := by
            by_contra h₁₀₇
            have h₁₀₈ : p ≠ 2 := h₁₀₇
            have h₁₀₉ : p ≥ 3 := by
              have h₁₀₁₀ : p ≥ 2 := Nat.Prime.two_le h₁
              omega
            have h₁₀₁₀ : r ≥ 2 := by omega
            have h₁₀₁₁ : p^r ≥ p^2 := Nat.pow_le_pow_of_le_right (by omega) h₁₀₁₀
            have h₁₀₁₂ : p^2 ≥ 9 := by nlinarith
            have h₁₀₁₃ : p^r ≥ 9 := by linarith
            have h₁₀₁₄ : q^s = 9 := by
              rw [h₁₀₅, h₁₀₆]
              <;> norm_num
            have h₁₀₁₅ : p^r = 8 := by omega
            have h₁₀₁₆ : p ≤ 8 := by
              by_contra h₁₀₁₆
              have h₁₀₁₇ : p ≥ 9 := by omega
              have h₁₀₁₈ : p^r ≥ p^2 := Nat.pow_le_pow_of_le_right (by omega) (by omega)
              have h₁₀₁₉ : p^2 ≥ 81 := by nlinarith
              have h₁₀₂₀ : p^r ≥ 81 := by linarith
              omega
            interval_cases p <;> norm_num at h₁₀₁₅ ⊢ <;>
              (try omega) <;>
              (try {
                have h₁₀₂₁ : r ≥ 2 := by omega
                have h₁₀₂₂ : r ≤ 10 := by
                  by_contra h₁₀₂₂
                  have h₁₀₂₃ : r ≥ 11 := by omega
                  have h₁₀₂₄ : p^r ≥ p^11 := Nat.pow_le_pow_of_le_right (by omega) h₁₀₂₃
                  have h₁₀₂₅ : p^11 ≥ p^2 := Nat.pow_le_pow_of_le_right (by omega) (by omega)
                  have h₁₀₂₆ : p^2 ≥ 4 := by nlinarith
                  have h₁₀₂₇ : p^r ≥ 4 := by linarith
                  omega
                interval_cases r <;> norm_num at h₁₀₁₅ ⊢ <;>
                  (try omega) <;>
                  (try {
                    norm_num at h₁₀₁₅ ⊢ <;>
                    omega
                  })
              })
          have h₁₀₈ : r = 3 := by
            by_contra h₁₀₈
            have h₁₀₉ : r ≠ 3 := h₁₀₈
            have h₁₀₁₀ : r ≥ 4 := by
              by_contra h₁₀₁₀
              have h₁₀₁₁ : r ≤ 3 := by omega
              have h₁₀₁₂ : r = 2 := by omega
              have h₁₀₁₃ : p^r = 4 := by
                rw [h₁₀₇, h₁₀₁₂]
                <;> norm_num
              have h₁₀₁₄ : q^s = 9 := by
                rw [h₁₀₅, h₁₀₆]
                <;> norm_num
              omega
            have h₁₀₁₁ : p^r ≥ p^4 := Nat.pow_le_pow_of_le_right (by omega) h₁₀₁₀
            have h₁₀₁₂ : p^4 ≥ 16 := by
              have h₁₀₁₃ : p ≥ 2 := Nat.Prime.two_le h₁
              have h₁₀₁₄ : p^4 ≥ 2^4 := Nat.pow_le_pow_of_le_left h₁₀₁₃ 4
              norm_num at h₁₀₁₄ ⊢
              <;> omega
            have h₁₀₁₃ : p^r ≥ 16 := by linarith
            have h₁₀₁₄ : q^s = 9 := by
              rw [h₁₀₅, h₁₀₆]
              <;> norm_num
            omega
          exact ⟨by omega, by omega, by omega, by omega⟩
        exact h₁₀₃
    have h₁₁ : (p, r, q, s) = (3, 2, 2, 3) ∨ (p, r, q, s) = (2, 3, 3, 2) := by
      cases h₁₀ with
      | inl h₁₀ =>
        have h₁₁ : p = 3 ∧ r = 2 ∧ q = 2 ∧ s = 3 := h₁₀
        have h₁₂ : (p, r, q, s) = (3, 2, 2, 3) := by
          simp [Prod.ext_iff, h₁₁.1, h₁₁.2.1, h₁₁.2.2.1, h₁₁.2.2.2]
        exact Or.inl h₁₂
      | inr h₁₀ =>
        have h₁₁ : p = 2 ∧ r = 3 ∧ q = 3 ∧ s = 2 := h₁₀
        have h₁₂ : (p, r, q, s) = (2, 3, 3, 2) := by
          simp [Prod.ext_iff, h₁₁.1, h₁₁.2.1, h₁₁.2.2.1, h₁₁.2.2.2]
        exact Or.inr h₁₂
    aesop
  
  have h_subset₂ : ({(3, 2, 2, 3), (2, 3, 3, 2)} : Set (ℕ × ℕ × ℕ × ℕ)) ⊆ {(p, r, q, s) : ℕ × ℕ × ℕ × ℕ | Nat.Prime p ∧ Nat.Prime q ∧ r > 1 ∧ s > 1 ∧ |(p^r : ℤ) - q^s| = 1} := by
    intro ⟨p, r, q, s⟩ h
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff, Set.mem_setOf_eq] at h ⊢
    rcases h with (⟨rfl, rfl, rfl, rfl⟩ | ⟨rfl, rfl, rfl, rfl⟩)
    · -- Case (3, 2, 2, 3)
      constructor <;> norm_num [Nat.Prime, abs_eq_max_neg, max_eq_iff]
      <;>
      (try decide) <;>
      (try ring_nf) <;>
      (try norm_num) <;>
      (try omega)
    · -- Case (2, 3, 3, 2)
      constructor <;> norm_num [Nat.Prime, abs_eq_max_neg, max_eq_iff]
      <;>
      (try decide) <;>
      (try ring_nf) <;>
      (try norm_num) <;>
      (try omega)
  
  have h_main : {(p, r, q, s) : ℕ × ℕ × ℕ × ℕ | Nat.Prime p ∧ Nat.Prime q ∧ r > 1 ∧ s > 1 ∧ |(p^r : ℤ) - q^s| = 1} = ({(3, 2, 2, 3), (2, 3, 3, 2)} : Set (ℕ × ℕ × ℕ × ℕ)) := by
    apply Set.Subset.antisymm
    · -- Prove the forward inclusion
      exact h_subset₁
    · -- Prove the backward inclusion
      exact h_subset₂
  
  exact h_main