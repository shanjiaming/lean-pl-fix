theorem perfect_square_condition {m : ℤ} (h : m = 2 + 2 * Real.sqrt (28 * n^2 + 1))
  (h_int : ∃ k : ℤ, Real.sqrt (28 * n^2 + 1) = k) :
  ∃ k : ℤ, m = k^2 := by
  have h_main : ∃ (t : ℤ), m = t ^ 2 := by
    obtain ⟨k, hk⟩ := h_int
    have h₁ : (k : ℝ) = Real.sqrt (28 * (n : ℝ)^2 + 1) := by
      norm_num [hk] at hk ⊢ <;>
      simp_all [Real.sqrt_eq_iff_sq_eq] <;>
      ring_nf at * <;>
      nlinarith
    have h₂ : (k : ℝ) ^ 2 = (28 * (n : ℝ) ^ 2 + 1 : ℝ) := by
      rw [h₁]
      rw [Real.sq_sqrt (by positivity)]
      <;>
      ring_nf <;>
      nlinarith
    have h₃ : (k : ℤ) ^ 2 = 28 * n ^ 2 + 1 := by
      have h₃₁ : (k : ℤ) ^ 2 = 28 * n ^ 2 + 1 := by
        norm_cast at h₂ ⊢
        <;>
        ring_nf at h₂ ⊢ <;>
        nlinarith
      exact h₃₁
    have h₄ : m = 2 + 2 * k := by
      have h₄₁ : (m : ℝ) = 2 + 2 * Real.sqrt (28 * (n : ℝ) ^ 2 + 1) := by
        norm_num [h]
        <;>
        ring_nf at * <;>
        simp_all [Real.sqrt_eq_iff_sq_eq]
        <;>
        nlinarith
      have h₄₂ : (m : ℝ) = 2 + 2 * (k : ℝ) := by
        rw [h₄₁, h₁]
        <;>
        ring_nf at * <;>
        simp_all [Real.sqrt_eq_iff_sq_eq]
        <;>
        nlinarith
      have h₄₃ : m = 2 + 2 * k := by
        norm_cast at h₄₂ ⊢
        <;>
        ring_nf at h₄₂ ⊢ <;>
        simp_all [Complex.ext_iff, pow_two]
        <;>
        nlinarith
      exact h₄₃
    have h₅ : k ≥ 0 := by
      by_contra h₅₁
      have h₅₂ : k < 0 := by linarith
      have h₅₃ : (k : ℝ) < 0 := by exact_mod_cast h₅₂
      have h₅₄ : Real.sqrt (28 * (n : ℝ) ^ 2 + 1) > 0 := by positivity
      have h₅₅ : (k : ℝ) < Real.sqrt (28 * (n : ℝ) ^ 2 + 1) := by
        nlinarith [Real.sqrt_nonneg (28 * (n : ℝ) ^ 2 + 1), Real.sq_sqrt (by positivity : (0 : ℝ) ≤ 28 * (n : ℝ) ^ 2 + 1)]
      have h₅₆ : (k : ℝ) < Real.sqrt (28 * (n : ℝ) ^ 2 + 1) := by
        nlinarith [Real.sqrt_nonneg (28 * (n : ℝ) ^ 2 + 1), Real.sq_sqrt (by positivity : (0 : ℝ) ≤ 28 * (n : ℝ) ^ 2 + 1)]
      have h₅₇ : (k : ℝ) ≠ Real.sqrt (28 * (n : ℝ) ^ 2 + 1) := by
        linarith
      have h₅₈ : False := by
        simp_all [hk, h₁, h₂, h₃, h₄]
        <;>
        nlinarith [Real.sqrt_nonneg (28 * (n : ℝ) ^ 2 + 1), Real.sq_sqrt (by positivity : (0 : ℝ) ≤ 28 * (n : ℝ) ^ 2 + 1)]
      exact h₅₈
    have h₆ : ∃ (t : ℤ), m = t ^ 2 := by
      have h₆₁ : m = 2 + 2 * k := by exact h₄
      have h₆₂ : (k : ℤ) ^ 2 = 28 * n ^ 2 + 1 := by exact h₃
      have h₆₃ : (k : ℤ) ≥ 0 := by exact_mod_cast h₅
      have h₆₄ : ∃ (a b : ℤ), (k - 1) / 2 = 7 * a ^ 2 ∧ (k + 1) / 2 = b ^ 2 := by
        have h₆₄₁ : (k - 1 : ℤ) % 2 = 0 := by
          have h₆₄₂ : (k : ℤ) % 2 = 1 := by
            by_contra h₆₄₃
            have h₆₄₄ : (k : ℤ) % 2 = 0 := by
              omega
            have h₆₄₅ : (k : ℤ) ^ 2 % 4 = 0 := by
              have h₆₄₆ : (k : ℤ) % 4 = 0 ∨ (k : ℤ) % 4 = 2 := by
                omega
              rcases h₆₄₆ with (h₆₄₆ | h₆₄₆) <;>
                simp [h₆₄₆, pow_two, Int.mul_emod, Int.add_emod]
            have h₆₄₆ : (28 * n ^ 2 + 1 : ℤ) % 4 = 1 := by
              have h₆₄₇ : (n : ℤ) ^ 2 % 4 = 0 ∨ (n : ℤ) ^ 2 % 4 = 1 := by
                have h₆₄₈ : (n : ℤ) % 4 = 0 ∨ (n : ℤ) % 4 = 1 ∨ (n : ℤ) % 4 = 2 ∨ (n : ℤ) % 4 = 3 := by
                  omega
                rcases h₆₄₈ with (h₆₄₈ | h₆₄₈ | h₆₄₈ | h₆₄₈) <;>
                  simp [h₆₄₈, pow_two, Int.mul_emod, Int.add_emod]
              rcases h₆₄₇ with (h₆₄₇ | h₆₄₇) <;>
                simp [h₆₄₇, Int.add_emod, Int.mul_emod, pow_two]
            omega
          omega
        have h₆₄₂ : (k + 1 : ℤ) % 2 = 0 := by
          have h₆₄₃ : (k : ℤ) % 2 = 1 := by
            by_contra h₆₄₄
            have h₆₄₅ : (k : ℤ) % 2 = 0 := by
              omega
            have h₆₄₆ : (k : ℤ) ^ 2 % 4 = 0 := by
              have h₆₄₇ : (k : ℤ) % 4 = 0 ∨ (k : ℤ) % 4 = 2 := by
                omega
              rcases h₆₄₇ with (h₆₄₇ | h₆₄₇) <;>
                simp [h₆₄₇, pow_two, Int.mul_emod, Int.add_emod]
            have h₆₄₇ : (28 * n ^ 2 + 1 : ℤ) % 4 = 1 := by
              have h₆₄₈ : (n : ℤ) ^ 2 % 4 = 0 ∨ (n : ℤ) ^ 2 % 4 = 1 := by
                have h₆₄₉ : (n : ℤ) % 4 = 0 ∨ (n : ℤ) % 4 = 1 ∨ (n : ℤ) % 4 = 2 ∨ (n : ℤ) % 4 = 3 := by
                  omega
                rcases h₆₄₉ with (h₆₄₉ | h₆₄₉ | h₆₄₉ | h₆₄₉) <;>
                  simp [h₆₄₉, pow_two, Int.mul_emod, Int.add_emod]
              rcases h₆₄₈ with (h₆₄₈ | h₆₄₈) <;>
                simp [h₆₄₈, Int.add_emod, Int.mul_emod, pow_two]
            omega
          omega
        have h₆₄₃ : ∃ (a b : ℤ), (k - 1) / 2 = 7 * a ^ 2 ∧ (k + 1) / 2 = b ^ 2 := by
          have h₆₄₄ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2 := by
            have h₆₄₅ : (k - 1 : ℤ) / 2 * 2 = (k - 1 : ℤ) := by
              omega
            have h₆₄₆ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2 := by
              have h₆₄₇ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2 := by
                have h₆₄₈ : (k - 1 : ℤ) / 2 * 2 = (k - 1 : ℤ) := by
                  omega
                have h₆₄₉ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2 := by
                  have h₆₄₁₀ : (k - 1 : ℤ) * (k + 1 : ℤ) = 4 * 7 * (n : ℤ) ^ 2 := by
                    have h₆₄₁₁ : (k : ℤ) ^ 2 = 28 * (n : ℤ) ^ 2 + 1 := by
                      exact h₃
                    nlinarith
                  have h₆₄₁₂ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2 := by
                    have h₆₄₁₃ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2 := by
                      have h₆₄₁₄ : (k - 1 : ℤ) % 2 = 0 := by
                        omega
                      have h₆₄₁₅ : (k + 1 : ℤ) % 2 = 0 := by
                        omega
                      have h₆₄₁₆ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2 := by
                        have h₆₄₁₇ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2 := by
                          have h₆₄₁₈ : (k - 1 : ℤ) / 2 * 2 = (k - 1 : ℤ) := by
                            omega
                          have h₆₄₁₉ : (k + 1 : ℤ) / 2 * 2 = (k + 1 : ℤ) := by
                            omega
                          have h₆₄₂₀ : (k - 1 : ℤ) * (k + 1 : ℤ) = 4 * 7 * (n : ℤ) ^ 2 := by
                            have h₆₄₂₁ : (k : ℤ) ^ 2 = 28 * (n : ℤ) ^ 2 + 1 := by
                              exact h₃
                            nlinarith
                          have h₆₄₂₂ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2 := by
                            have h₆₄₂₃ : (k - 1 : ℤ) / 2 * 2 = (k - 1 : ℤ) := by
                              omega
                            have h₆₄₂₄ : (k + 1 : ℤ) / 2 * 2 = (k + 1 : ℤ) := by
                              omega
                            have h₆₄₂₅ : (k - 1 : ℤ) * (k + 1 : ℤ) = 4 * 7 * (n : ℤ) ^ 2 := by
                              have h₆₄₂₆ : (k : ℤ) ^ 2 = 28 * (n : ℤ) ^ 2 + 1 := by
                                exact h₃
                              nlinarith
                            nlinarith
                          exact h₆₄₂₂
                        exact h₆₄₁₇
                      exact h₆₄₁₆
                    exact h₆₄₁₃
                  exact h₆₄₁₂
                exact h₆₄₉
              exact h₆₄₇
            exact h₆₄₆
          have h₆₄₅ : ∃ (a b : ℤ), (k - 1) / 2 = 7 * a ^ 2 ∧ (k + 1) / 2 = b ^ 2 := by
            have h₆₄₆ : (k - 1 : ℤ) / 2 ≥ 0 := by
              by_contra h₆₄₇
              have h₆₄₈ : (k - 1 : ℤ) / 2 < 0 := by
                linarith
              have h₆₄₉ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) < 0 := by
                nlinarith
              have h₆₅₀ : 7 * (n : ℤ) ^ 2 ≥ 0 := by positivity
              nlinarith
            have h₆₅₁ : (k + 1 : ℤ) / 2 ≥ 0 := by
              by_contra h₆₅₂
              have h₆₅₃ : (k + 1 : ℤ) / 2 < 0 := by
                linarith
              have h₆₅₄ : (k + 1 : ℤ) / 2 ≤ 0 := by
                linarith
              have h₆₅₅ : (k + 1 : ℤ) ≤ 0 := by
                have h₆₅₆ : (k + 1 : ℤ) / 2 * 2 ≤ 0 := by
                  nlinarith
                omega
              have h₆₅₆ : (k : ℤ) ≤ -1 := by
                linarith
              have h₆₅₇ : (k : ℤ) ^ 2 ≥ 1 := by
                nlinarith
              have h₆₅₈ : 28 * (n : ℤ) ^ 2 + 1 ≥ 1 := by
                nlinarith
              have h₆₅₉ : (k : ℤ) ^ 2 = 28 * (n : ℤ) ^ 2 + 1 := by
                exact h₃
              nlinarith
            have h₆₅₂ : ∃ (a b : ℤ), (k - 1) / 2 = 7 * a ^ 2 ∧ (k + 1) / 2 = b ^ 2 := by
              have h₆₅₃ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2 := by
                omega
              have h₆₅₄ : ∃ (a b : ℤ), (k - 1) / 2 = 7 * a ^ 2 ∧ (k + 1) / 2 = b ^ 2 := by
                have h₆₅₅ : ∃ (a : ℤ), (k - 1) / 2 = 7 * a ^ 2 := by
                  have h₆₅₆ : 7 ∣ (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) := by
                    use (n : ℤ) ^ 2
                    <;> linarith
                  have h₆₅₇ : 7 ∣ (k - 1 : ℤ) / 2 ∨ 7 ∣ ((k - 1 : ℤ) / 2 + 1) := by
                    have h₆₅₈ : 7 ∣ (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) := by
                      exact h₆₅₆
                    have h₆₅₉ : 7 ∣ (k - 1 : ℤ) / 2 ∨ 7 ∣ ((k - 1 : ℤ) / 2 + 1) := by
                      -- Use the fact that if a prime divides a product, it divides at least one of the factors.
                      have h₆₅₁₀ : 7 ∣ (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) := by
                        exact h₆₅₈
                      have h₆₅₁₁ : 7 ∣ (k - 1 : ℤ) / 2 ∨ 7 ∣ ((k - 1 : ℤ) / 2 + 1) := by
                        -- Use the fact that if a prime divides a product, it divides at least one of the factors.
                        have h₆₅₁₂ : 7 ∣ (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) := by
                          exact h₆₅₈
                        exact (Int.prime_iff_natAbs_prime.mpr (by decide)).dvd_mul.mp h₆₅₁₂
                      exact h₆₅₁₁
                    exact h₆₅₉
                  cases h₆₅₇ with
                  | inl h₆₅₇ =>
                    -- Case: 7 ∣ (k - 1 : ℤ) / 2
                    obtain ⟨a, ha⟩ := h₆₅₇
                    use a
                    <;>
                    (try omega) <;>
                    (try nlinarith) <;>
                    (try ring_nf at ha ⊢ <;> nlinarith)
                  | inr h₆₅₇ =>
                    -- Case: 7 ∣ ((k - 1 : ℤ) / 2 + 1)
                    have h₆₅₈ : (k - 1 : ℤ) / 2 ≥ 0 := by omega
                    have h₆₅₉ : ∃ (a : ℤ), (k - 1) / 2 = 7 * a ^ 2 := by
                      -- Use the fact that 7 ∣ ((k - 1 : ℤ) / 2 + 1) to find a
                      have h₆₅₁₀ : 7 ∣ ((k - 1 : ℤ) / 2 + 1) := h₆₅₇
                      have h₆₅₁₁ : ∃ (a : ℤ), (k - 1) / 2 = 7 * a ^ 2 := by
                        -- Use the fact that 7 ∣ ((k - 1 : ℤ) / 2 + 1) to find a
                        by_contra h₆₅₁₂
                        -- If no such a exists, derive a contradiction
                        exfalso
                        -- Use the fact that 7 ∣ ((k - 1 : ℤ) / 2 + 1) to find a
                        have h₆₅₁₃ := h₆₅₁₀
                        -- Use the fact that 7 ∣ ((k - 1 : ℤ) / 2 + 1) to find a
                        omega
                      exact h₆₅₁₁
                    obtain ⟨a, ha⟩ := h₆₅₉
                    use a
                    <;>
                    (try omega) <;>
                    (try nlinarith) <;>
                    (try ring_nf at ha ⊢ <;> nlinarith)
                obtain ⟨a, ha⟩ := h₆₅₅
                have h₆₅₆ : ∃ (b : ℤ), (k + 1) / 2 = b ^ 2 := by
                  have h₆₅₇ : (k + 1 : ℤ) / 2 = ((k + 1 : ℤ) / 2) := by rfl
                  have h₆₅₈ : ∃ (b : ℤ), (k + 1) / 2 = b ^ 2 := by
                    by_contra h₆₅₉
                    -- Assume the negation of the conclusion to derive a contradiction
                    push_neg at h₆₅₉
                    -- Use the fact that (k - 1) / 2 = 7 * a ^ 2 to find a contradiction
                    have h₆₅₁₀ : (k - 1 : ℤ) / 2 = 7 * a ^ 2 := by
                      omega
                    have h₆₅₁₁ : (k + 1 : ℤ) / 2 = ((k + 1 : ℤ) / 2) := by rfl
                    have h₆₅₁₂ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2 := by
                      omega
                    have h₆₅₁₃ : 7 * a ^ 2 + 1 ≥ 0 := by nlinarith
                    have h₆₅₁₄ : (k + 1 : ℤ) / 2 ≥ 0 := by omega
                    have h₆₅₁₅ : (k + 1 : ℤ) / 2 = ((k + 1 : ℤ) / 2) := by rfl
                    have h₆₅₁₆ : (k + 1 : ℤ) / 2 > 0 := by
                      by_contra h₆₅₁₇
                      have h₆₅₁₈ : (k + 1 : ℤ) / 2 ≤ 0 := by linarith
                      have h₆₅₁₉ : (k + 1 : ℤ) ≤ 0 := by
                        omega
                      have h₆₅₂₀ : (k : ℤ) ≤ -1 := by linarith
                      have h₆₅₂₁ : (k : ℤ) ^ 2 ≥ 1 := by nlinarith
                      have h₆₅₂₂ : 28 * (n : ℤ) ^ 2 + 1 ≥ 1 := by nlinarith
                      have h₆₅₂₃ : (k : ℤ) ^ 2 = 28 * (n : ℤ) ^ 2 + 1 := by omega
                      nlinarith
                    have h₆₅₂₄ : (k + 1 : ℤ) / 2 > 0 := by omega
                    have h₆₅₂₅ : (k + 1 : ℤ) / 2 ≥ 1 := by omega
                    have h₆₅₂₆ : ∃ (b : ℤ), (k + 1) / 2 = b ^ 2 := by
                      -- Use the fact that (k - 1) / 2 = 7 * a ^ 2 to find b
                      have h₆₅₂₇ : (k + 1 : ℤ) / 2 ≥ 1 := by omega
                      have h₆₅₂₈ : (k + 1 : ℤ) / 2 ≥ 1 := by omega
                      have h₆₅₂₉ : ∃ (b : ℤ), (k + 1) / 2 = b ^ 2 := by
                        -- Use the fact that (k - 1) / 2 = 7 * a ^ 2 to find b
                        by_contra h₆₅₃₀
                        -- Assume the negation of the conclusion to derive a contradiction
                        push_neg at h₆₅₃₀
                        -- Use the fact that (k - 1) / 2 = 7 * a ^ 2 to find a contradiction
                        have h₆₅₃₁ : ∀ (b : ℤ), (k + 1) / 2 ≠ b ^ 2 := by
                          exact h₆₅₃₀
                        have h₆₅₃₂ := h₆₅₃₁ 0
                        have h₆₅₃₃ := h₆₅₃₁ 1
                        have h₆₅₃₄ := h₆₅₃₁ (-1)
                        have h₆₅₃₅ : (k + 1 : ℤ) / 2 ≠ 0 ^ 2 := by
                          omega
                        have h₆₅₃₆ : (k + 1 : ℤ) / 2 ≠ 1 ^ 2 := by
                          omega
                        have h₆₅₃₇ : (k + 1 : ℤ) / 2 ≠ (-1) ^ 2 := by
                          omega
                        omega
                      exact h₆₅₂₉
                    exact h₆₅₂₆
                  exact h₆₅₈
                obtain ⟨b, hb⟩ := h₆₅₆
                refine' ⟨a, b, _⟩
                <;> simp_all [ha, hb]
                <;> ring_nf at *
                <;> omega
              exact h₆₅₄
            exact h₆₅₂
          exact h₆₄₅
        exact h₆₄₃
      obtain ⟨a, b, h₆₅, h₆₆⟩ := h₆₄₃
      have h₆₇ : m = (2 * b) ^ 2 := by
        have h₆₇₁ : m = 2 + 2 * k := by
          exact h₄
        have h₆₇₂ : (k + 1 : ℤ) / 2 = b ^ 2 := by
          omega
        have h₆₇₃ : (k - 1 : ℤ) / 2 = 7 * a ^ 2 := by
          omega
        have h₆₇₄ : m = (2 * b) ^ 2 := by
          have h₆₇₅ : (k + 1 : ℤ) / 2 = b ^ 2 := by
            omega
          have h₆₇₆ : (k - 1 : ℤ) / 2 = 7 * a ^ 2 := by
            omega
          have h₆₇₇ : m = 2 + 2 * k := by
            omega
          have h₆₇₈ : (2 * b : ℤ) ^ 2 = 4 * b ^ 2 := by
            ring
          have h₆₇₉ : (k + 1 : ℤ) / 2 * 2 = (k + 1 : ℤ) := by
            have h₆₈₀ : (k + 1 : ℤ) % 2 = 0 := by
              -- Prove that (k + 1) is even
              have h₆₈₁ : (k - 1 : ℤ) % 2 = 0 := by
                omega
              omega
            omega
          have h₆₈₀ : (k - 1 : ℤ) / 2 * 2 = (k - 1 : ℤ) := by
            have h₆₈₁ : (k - 1 : ℤ) % 2 = 0 := by
              omega
            omega
          have h₆₈₁ : m = (2 * b) ^ 2 := by
            nlinarith
          exact h₆₈₁
        exact h₆₇₄
      refine' ⟨2 * b, _⟩
      rw [h₆₇]
      <;>
      simp [sq]
      <;>
      ring_nf at *
      <;>
      omega
    obtain ⟨t, ht⟩ := h₆
    refine' ⟨t, _⟩
    linarith
  obtain ⟨t, ht⟩ := h_main
  exact ⟨t, by simp_all [sq]⟩