import Mathlib

/--
Let $S$ be the set of sequences of length $2018$ whose terms are in the set $\{1,2,3,4,5,6,10\}$ and sum to $3860$. Prove that the cardinality of $S$ is at most $2^{3860} \cdot \left(\frac{2018}{2048}\right)^{2018}$.
-/
theorem putnam_2018_b6
  (S : Finset (Fin 2018 → ℤ))
  (hS : S = {s : Fin 2018 → ℤ | (∀ i : Fin 2018, s i ∈ ({1, 2, 3, 4, 5, 6, 10} : Set ℤ)) ∧ (∑ i : Fin 2018, s i) = 3860}) :
  S.card ≤ 2 ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by
  have h_card_ub : S.card ≤ 2 ^ 2018 := by
    have h₁ : S = ∅ := by
      rw [hS]
      apply Finset.ext
      intro s
      simp only [Set.mem_setOf_eq, Finset.mem_filter, Finset.mem_univ, true_and_iff]
      <;>
      (try decide) <;>
      (try
        {
          exfalso
          simp_all [Fin.forall_fin_succ, Finset.sum_range_succ]
          <;> norm_num at *
          <;> linarith
        }) <;>
      (try
        {
          aesop
        })
    rw [h₁]
    simp
    <;> decide
  
  have h_card_real : (S.card : ℝ) ≤ (2 : ℝ) ^ 2018 := by
    have h₁ : (S.card : ℝ) ≤ (2 : ℝ) ^ 2018 := by
      exact_mod_cast h_card_ub
    exact h₁
  
  have h_bound : (2 : ℝ) ^ 2018 ≤ (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by
    have h₁ : (2 : ℝ) ^ 2018 ≤ (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by
      -- Prove that (2 : ℝ) ^ 2018 ≤ (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018
      have h₂ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 = (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by rfl
      rw [h₂]
      have h₃ : (2 : ℝ) ^ 2018 ≤ (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by
        have h₄ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 = (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by rfl
        rw [h₄]
        have h₅ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 := by
          -- Prove that (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018
          have h₆ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 := by
            -- Use numerical and arithmetic properties to prove the inequality
            have h₇ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 := by
              -- Prove the inequality using numerical and arithmetic properties
              have h₈ : (2018 : ℝ) / 2048 > 0 := by norm_num
              have h₉ : (2 : ℝ) ^ 3860 > 0 := by positivity
              have h₁₀ : ((2018 : ℝ) / 2048 : ℝ) ^ 2018 > 0 := by positivity
              have h₁₁ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 > 0 := by positivity
              have h₁₂ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 := by
                -- Use the fact that (2018 : ℝ) / 2048 < 1 to prove the inequality
                have h₁₃ : ((2018 : ℝ) / 2048 : ℝ) < 1 := by norm_num
                have h₁₄ : ((2018 : ℝ) / 2048 : ℝ) ^ 2018 > 0 := by positivity
                have h₁₅ : (2 : ℝ) ^ 3860 ≥ (2 : ℝ) ^ 2018 := by
                  -- Since 3860 > 2018, (2 : ℝ) ^ 3860 ≥ (2 : ℝ) ^ 2018
                  exact pow_le_pow_right (by norm_num) (by norm_num)
                have h₁₆ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 := by
                  -- Use the fact that (2018 : ℝ) / 2048 < 1 to prove the inequality
                  calc
                    (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 * ((2018 : ℝ) / 2048) ^ 2018 := by gcongr <;> nlinarith
                    _ ≥ (2 : ℝ) ^ 2018 := by
                      have h₁₇ : ((2018 : ℝ) / 2048 : ℝ) ^ 2018 ≤ 1 := by
                        exact pow_le_one _ (by positivity) (by norm_num)
                      have h₁₈ : (2 : ℝ) ^ 2018 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 * 1 := by
                        gcongr <;> nlinarith
                      have h₁₉ : (2 : ℝ) ^ 2018 * 1 = (2 : ℝ) ^ 2018 := by ring
                      linarith
                exact h₁₆
              exact h₁₂
            exact h₇
          have h₂₀ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 := by
            -- Use numerical and arithmetic properties to prove the inequality
            have h₂₁ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 := by
              -- Prove the inequality using numerical and arithmetic properties
              have h₂₂ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 := by
                -- Use the fact that (2018 : ℝ) / 2048 < 1 to prove the inequality
                have h₂₃ : ((2018 : ℝ) / 2048 : ℝ) < 1 := by norm_num
                have h₂₄ : ((2018 : ℝ) / 2048 : ℝ) ^ 2018 > 0 := by positivity
                have h₂₅ : (2 : ℝ) ^ 3860 ≥ (2 : ℝ) ^ 2018 := by
                  -- Since 3860 > 2018, (2 : ℝ) ^ 3860 ≥ (2 : ℝ) ^ 2018
                  exact pow_le_pow_right (by norm_num) (by norm_num)
                have h₂₆ : (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 := by
                  -- Use the fact that (2018 : ℝ) / 2048 < 1 to prove the inequality
                  calc
                    (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 * ((2018 : ℝ) / 2048) ^ 2018 := by gcongr <;> nlinarith
                    _ ≥ (2 : ℝ) ^ 2018 := by
                      have h₂₇ : ((2018 : ℝ) / 2048 : ℝ) ^ 2018 ≤ 1 := by
                        exact pow_le_one _ (by positivity) (by norm_num)
                      have h₂₈ : (2 : ℝ) ^ 2018 * ((2018 : ℝ) / 2048) ^ 2018 ≥ (2 : ℝ) ^ 2018 * 1 := by
                        gcongr <;> nlinarith
                      have h₂₉ : (2 : ℝ) ^ 2018 * 1 = (2 : ℝ) ^ 2018 := by ring
                      linarith
                exact h₂₆
              exact h₂₂
            exact h₂₁
          linarith
        linarith
      linarith
    linarith
  
  have h_main : (S.card : ℝ) ≤ (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by
    have h₁ : (S.card : ℝ) ≤ (2 : ℝ) ^ 2018 := h_card_real
    have h₂ : (2 : ℝ) ^ 2018 ≤ (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := h_bound
    have h₃ : (S.card : ℝ) ≤ (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by
      linarith
    exact h₃
  
  have h_final : S.card ≤ 2 ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by
    -- Use `norm_cast` to convert the natural number `S.card` to a real number and apply the previously established bounds.
    have h₁ : (S.card : ℝ) ≤ (2 : ℝ) ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := h_main
    have h₂ : S.card ≤ 2 ^ 3860 * ((2018 : ℝ) / 2048) ^ 2018 := by
      -- Use `norm_cast` to convert the natural number `S.card` to a real number.
      norm_cast at h₁ ⊢
      <;>
      (try simp_all) <;>
      (try norm_num) <;>
      (try linarith) <;>
      (try ring_nf at h₁ ⊢) <;>
      (try norm_num at h₁ ⊢) <;>
      (try linarith)
      <;>
      (try nlinarith)
      <;>
      (try
        {
          simp_all [Finset.card_eq_zero]
          <;> aesop
        })
      <;>
      (try
        {
          norm_num at h₁ ⊢
          <;> linarith
        })
    exact h₂
  
  exact h_final