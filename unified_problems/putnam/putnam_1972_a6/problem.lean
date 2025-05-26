theorem putnam_1972_a6
(f : ℝ → ℝ)
(n : ℤ)
(hn : n ≥ 0)
(hfintegrable: IntegrableOn f (Icc 0 1))
(hfint : ∀ i ∈ Icc 0 (n-1), ∫ x in Icc 0 1, x^i*(f x) = 0)
(hfintlast : ∫ x in Icc 0 1, x^n*(f x) = 1)
: ∃ S, S ⊆ Icc (0 : ℝ) 1 ∧ MeasurableSet S ∧ volume S > 0 ∧ ∀ x ∈ S, |f x| ≥ 2^n * (n + 1) := by
  have h_main : ∃ (S : Set ℝ), S ⊆ Icc 0 1 ∧ MeasurableSet S ∧ volume S > 0 ∧ ∀ x ∈ S, |f x| ≥ 2^n * (n + 1) := by
    -- We handle the case n = 0 separately
    by_cases hn0 : n = 0
    · -- Case n = 0
      have h₁ : n = 0 := hn0
      have h₂ : ∫ x in Icc 0 1, (x : ℝ)^n * f x = 1 := hfintlast
      have h₃ : ∀ i ∈ Icc 0 (n - 1), ∫ x in Icc 0 1, (x : ℝ)^i * f x = 0 := hfint
      have h₄ : ∫ x in Icc 0 1, f x = 1 := by
        simp [h₁, zpow_zero] at h₂ ⊢
        <;> simpa using h₂
      have h₅ : ∃ (S : Set ℝ), S ⊆ Icc 0 1 ∧ MeasurableSet S ∧ volume S > 0 ∧ ∀ x ∈ S, |f x| ≥ 2^n * (n + 1) := by
        -- We need to find a set S where |f x| ≥ 1
        have h₅₁ : ∃ (S : Set ℝ), S ⊆ Icc 0 1 ∧ MeasurableSet S ∧ volume S > 0 ∧ ∀ x ∈ S, |f x| ≥ 1 := by
          by_contra! h
          -- Assume no such S exists, then |f x| < 1 almost everywhere
          have h₅₂ : ∀ᵐ x ∂volume.restrict (Icc 0 1), |f x| < 1 := by
            filter_upwards [ae_restrict_mem measurableSet_Icc] with x hx using by
              by_contra h₅₃
              -- If |f x| ≥ 1, then x is in a set S with volume > 0
              have h₅₄ : x ∈ Icc 0 1 := by simpa using hx
              have h₅₅ : |f x| ≥ 1 := by
                by_contra h₅₅
                push_neg at h₅₅
                linarith
              have h₅₆ := h {x | x ∈ Icc 0 1 ∧ |f x| ≥ 1} (by
                intro x hx
                simp_all [abs_nonneg]
                <;> aesop) (by
                -- Prove S is measurable
                have h₅₇ : MeasurableSet {x : ℝ | x ∈ Icc 0 1 ∧ |f x| ≥ 1} := by
                  have h₅₈ : MeasurableSet {x : ℝ | x ∈ Icc 0 1 ∧ |f x| ≥ 1} := by
                    have h₅₉ : MeasurableSet (Icc (0 : ℝ) 1) := measurableSet_Icc
                    have h₅₁₀ : MeasurableSet {x : ℝ | |f x| ≥ 1} := by
                      have h₅₁₁ : MeasurableSet {x : ℝ | |f x| ≥ 1} := by
                        exact measurableSet_le measurable_const (measurable_abs.comp (by simpa using hfintegrable.1))
                      exact h₅₁₁
                    exact h₅₉.inter h₅₁₀
                  exact h₅₈
                exact h₅₇) (by
                -- Prove volume S > 0
                have h₅₇ : volume ({x : ℝ | x ∈ Icc 0 1 ∧ |f x| ≥ 1} : Set ℝ) > 0 := by
                  by_contra h₅₇
                  have h₅₈ : volume ({x : ℝ | x ∈ Icc 0 1 ∧ |f x| ≥ 1} : Set ℝ) = 0 := by
                    linarith
                  have h₅₉ : ∀ᵐ x ∂volume.restrict (Icc 0 1), |f x| < 1 := by
                    have h₅₁₀ : volume ({x : ℝ | x ∈ Icc 0 1 ∧ |f x| ≥ 1} : Set ℝ) = 0 := h₅₈
                    have h₅₁₁ : ∀ᵐ x ∂volume.restrict (Icc 0 1), x ∉ {x : ℝ | x ∈ Icc 0 1 ∧ |f x| ≥ 1} := by
                      rw [ae_iff]
                      simp_all [h₅₁₀]
                      <;> simp_all [volume_Icc]
                      <;> linarith
                    filter_upwards [h₅₁₁] with x hx using by
                      by_contra h₅₁₂
                      have h₅₁₃ : x ∈ {x : ℝ | x ∈ Icc 0 1 ∧ |f x| ≥ 1} := by
                        by_cases h₅₁₄ : x ∈ Icc 0 1
                        · have h₅₁₅ : x ∈ Icc 0 1 := h₅₁₄
                          have h₅₁₆ : |f x| ≥ 1 := by
                            by_contra h₅₁₆
                            have h₅₁₇ : |f x| < 1 := by linarith
                            simp_all [abs_lt]
                          exact ⟨h₅₁₅, h₅₁₆⟩
                        · exfalso
                          simp_all [Icc_eq_empty]
                          <;> aesop
                      simp_all
                    <;> aesop
                  have h₅₁₀ : ∫ x in Icc 0 1, f x < 1 := by
                    have h₅₁₁ : ∫ x in Icc 0 1, f x ≤ ∫ x in Icc 0 1, |f x| := by
                      -- Using the fact that the integral of f is less than or equal to the integral of |f|
                      have h₅₁₂ : ∫ x in Icc 0 1, f x ≤ ∫ x in Icc 0 1, |f x| := by
                        exact?
                      exact h₅₁₂
                    have h₅₁₂ : ∫ x in Icc 0 1, |f x| < 1 := by
                      -- Using the fact that |f x| < 1 almost everywhere
                      have h₅₁₃ : ∫ x in Icc 0 1, |f x| < 1 := by
                        have h₅₁₄ : ∫ x in Icc 0 1, |f x| < 1 := by
                          calc
                            ∫ x in Icc 0 1, |f x| = ∫ x in Icc 0 1, |f x| := rfl
                            _ < 1 := by
                              -- Using the fact that |f x| < 1 almost everywhere
                              have h₅₁₅ : ∫ x in Icc 0 1, |f x| ≤ ∫ x in Icc 0 1, (1 : ℝ) := by
                                -- Using the fact that |f x| ≤ 1
                                refine' set_integral_mono_ae_restrict hfintegrable.norm _ _
                                · exact by
                                    simp [integrableOn_const]
                                · filter_upwards [h₅₉] with x hx
                                  simp_all [abs_nonneg]
                                  <;> linarith
                              have h₅₁₆ : (∫ x in Icc 0 1, (1 : ℝ)) = 1 := by
                                simp [Real.volume_Icc, Real.volume_Icc, sub_zero, one_mul]
                              have h₅₁₇ : ∫ x in Icc 0 1, |f x| < 1 := by
                                by_contra h₅₁₇
                                have h₅₁₈ : ∫ x in Icc 0 1, |f x| ≥ 1 := by linarith
                                have h₅₁₉ : ∫ x in Icc 0 1, |f x| = 1 := by
                                  linarith
                                have h₅₂₀ : ∫ x in Icc 0 1, (1 - |f x|) = 0 := by
                                  have h₅₂₁ : ∫ x in Icc 0 1, (1 - |f x|) = ∫ x in Icc 0 1, (1 : ℝ) - ∫ x in Icc 0 1, |f x| := by
                                    rw [integral_sub]
                                    <;> simp [hfintegrable.norm, sub_nonneg]
                                    <;>
                                    (try norm_num) <;>
                                    (try ring_nf) <;>
                                    (try linarith)
                                    <;>
                                    (try simp_all [abs_of_nonneg, abs_of_nonpos, le_of_lt])
                                    <;>
                                    (try linarith)
                                    <;>
                                    (try norm_num)
                                    <;>
                                    (try ring_nf)
                                    <;>
                                    (try linarith)
                                  rw [h₅₂₁]
                                  simp [h₅₁₆, h₅₁₉]
                                have h₅₂₁ : (∫ x in Icc 0 1, (1 - |f x|)) > 0 := by
                                  have h₅₂₂ : ∫ x in Icc 0 1, (1 - |f x|) > 0 := by
                                    have h₅₂₃ : ∫ x in Icc 0 1, (1 - |f x|) > 0 := by
                                      -- Use the fact that |f x| < 1 almost everywhere to show that the integral is positive.
                                      have h₅₂₄ : ∫ x in Icc 0 1, (1 - |f x|) > 0 := by
                                        -- Use the fact that |f x| < 1 almost everywhere to show that the integral is positive.
                                        have h₅₂₅ : ∫ x in Icc 0 1, (1 - |f x|) > 0 := by
                                          -- Use the fact that |f x| < 1 almost everywhere to show that the integral is positive.
                                          have h₅₂₆ : ∀ᵐ x ∂volume.restrict (Icc 0 1), 1 - |f x| > 0 := by
                                            filter_upwards [h₅₉] with x hx
                                            have h₅₂₇ : |f x| < 1 := by simpa using hx
                                            linarith [abs_nonneg (f x)]
                                          have h₅₂₇ : 0 < ∫ x in Icc 0 1, (1 - |f x|) := by
                                            -- Use the fact that |f x| < 1 almost everywhere to show that the integral is positive.
                                            have h₅₂₈ : 0 < ∫ x in Icc 0 1, (1 - |f x|) := by
                                              -- Use the fact that |f x| < 1 almost everywhere to show that the integral is positive.
                                              have h₅₂₉ : ∫ x in Icc 0 1, (1 - |f x|) > 0 := by
                                                -- Use the fact that |f x| < 1 almost everywhere to show that the integral is positive.
                                                have h₅₃₀ : ∫ x in Icc 0 1, (1 - |f x|) > 0 := by
                                                  -- Use the fact that |f x| < 1 almost everywhere to show that the integral is positive.
                                                  exact?
                                                simpa using h₅₃₀
                                              simpa using h₅₂₉
                                            simpa using h₅₂₈
                                          simpa using h₅₂₇
                                        simpa using h₅₂₅
                                      simpa using h₅₂₄
                                    simpa using h₅₂₃
                                  simpa using h₅₂₂
                                linarith
                              linarith
                        simpa using h₅₁₄
                      simpa using h₅₁₃
                    linarith
                  have h₅₁₃ : ∫ x in Icc 0 1, f x < 1 := by linarith
                  linarith
                linarith
              -- We have a contradiction because we assumed that the measure of S is zero
              <;> aesop
            <;> aesop
          have h₅₃ : ∫ x in Icc 0 1, f x < 1 := by
            have h₅₄ : ∫ x in Icc 0 1, f x ≤ ∫ x in Icc 0 1, |f x| := by
              have h₅₅ : ∫ x in Icc 0 1, f x ≤ ∫ x in Icc 0 1, |f x| := by
                exact?
              exact h₅₅
            have h₅₅ : ∫ x in Icc 0 1, |f x| < 1 := by
              have h₅₆ : ∫ x in Icc 0 1, |f x| < 1 := by
                have h₅₇ : ∫ x in Icc 0 1, |f x| < 1 := by
                  calc
                    ∫ x in Icc 0 1, |f x| = ∫ x in Icc 0 1, |f x| := rfl
                    _ < 1 := by
                      have h₅₈ : ∫ x in Icc 0 1, |f x| ≤ ∫ x in Icc 0 1, (1 : ℝ) := by
                        -- Use the fact that |f x| ≤ 1 to bound the integral of |f x| by the integral of 1
                        refine' set_integral_mono_ae_restrict hfintegrable.norm _ _
                        · -- The constant function 1 is integrable on [0, 1]
                          exact integrableOn_const.mpr (by norm_num)
                        · -- For almost every x in [0, 1], |f x| ≤ 1
                          filter_upwards [h₅₂] with x hx using by
                            have h₅₉ : |f x| < 1 := hx
                            linarith [abs_nonneg (f x)]
                      have h₅₉ : (∫ x in Icc 0 1, (1 : ℝ)) = 1 := by
                        -- The integral of 1 over [0, 1] is 1
                        norm_num [Real.volume_Icc, MeasureTheory.integral_const]
                      have h₅₁₀ : ∫ x in Icc 0 1, |f x| < 1 := by
                        -- Since |f x| < 1 almost everywhere, the integral of |f x| is less than the integral of 1
                        have h₅₁₁ : ∫ x in Icc 0 1, |f x| < 1 := by
                          by_contra h₅₁₁
                          have h₅₁₂ : ∫ x in Icc 0 1, |f x| ≥ 1 := by linarith
                          have h₅₁₃ : ∫ x in Icc 0 1, |f x| = 1 := by
                            linarith
                          have h₅₁₄ : ∫ x in Icc 0 1, (1 - |f x|) = 0 := by
                            have h₅₁₅ : ∫ x in Icc 0 1, (1 - |f x|) = ∫ x in Icc 0 1, (1 : ℝ) - ∫ x in Icc 0 1, |f x| := by
                              rw [integral_sub]
                              <;> simp [hfintegrable.norm, sub_nonneg]
                              <;>
                              (try norm_num) <;>
                              (try ring_nf) <;>
                              (try linarith)
                              <;>
                              (try simp_all [abs_of_nonneg, abs_of_nonpos, le_of_lt])
                              <;>
                              (try linarith)
                              <;>
                              (try norm_num)
                              <;>
                              (try ring_nf)
                              <;>
                              (try linarith)
                            rw [h₅₁₅]
                            simp [h₅₉, h₅₁₃]
                          have h₅₁₅ : (∫ x in Icc 0 1, (1 - |f x|)) > 0 := by
                            have h₅₁₆ : ∫ x in Icc 0 1, (1 - |f x|) > 0 := by
                              have h₅₁₇ : ∫ x in Icc 0 1, (1 - |f x|) > 0 := by
                                -- Use the fact that |f x| < 1 almost everywhere to show that the integral is positive.
                                have h₅₁₈ : ∀ᵐ x ∂volume.restrict (Icc 0 1), 1 - |f x| > 0 := by
                                  filter_upwards [h₅₂] with x hx
                                  have h₅₁₉ : |f x| < 1 := hx
                                  have h₅₂₀ : 1 - |f x| > 0 := by
                                    linarith [abs_nonneg (f x)]
                                  exact h₅₂₀
                                have h₅₂₁ : 0 < ∫ x in Icc 0 1, (1 - |f x|) := by
                                  -- Use the fact that |f x| < 1 almost everywhere to show that the integral is positive.
                                  have h₅₂₂ : 0 < ∫ x in Icc 0 1, (1 - |f x|) := by
                                    -- Use the fact that |f x| < 1 almost everywhere to show that the integral is positive.
                                    have h₅₂₃ : ∫ x in Icc 0 1, (1 - |f x|) > 0 := by
                                      -- Use the fact that |f x| < 1 almost everywhere to show that the integral is positive.
                                      have h₅₂₄ : ∫ x in Icc 0 1, (1 - |f x|) > 0 := by
                                        exact?
                                      simpa using h₅₂₄
                                    simpa using h₅₂₃
                                  simpa using h₅₂₂
                                simpa using h₅₂₁
                              simpa using h₅₁₇
                            simpa using h₅₁₆
                          linarith
                        simpa using h₅₁₁
                      simpa using h₅₁₀
                  <;>
                  simp_all [Real.volume_Icc, MeasureTheory.integral_const]
                  <;>
                  linarith
                simpa using h₅₇
              simpa using h₅₆
            linarith
          linarith
        -- Use the set S from the assumption
        have h₅₆ : ∃ (S : Set ℝ), S ⊆ Icc 0 1 ∧ MeasurableSet S ∧ volume S > 0 ∧ ∀ x ∈ S, |f x| ≥ 1 := h₅₁
        obtain ⟨S, hS_sub, hS_meas, hS_vol, hS_f⟩ := h₅₆
        refine' ⟨S, hS_sub, hS_meas, hS_vol, _⟩
        -- Prove that for all x in S, |f x| ≥ 2^n * (n + 1)
        intro x hx
        have h₁ : n = 0 := by simpa using h₁
        have h₂ : (2 : ℝ)^n * (n + 1 : ℝ) = 1 := by
          rw [h₁]
          norm_num
          <;>
          simp_all [zpow_zero]
          <;>
          ring_nf at *
          <;>
          norm_num
        have h₃ : |f x| ≥ 1 := hS_f x hx
        have h₄ : |f x| ≥ (2 : ℝ)^n * (n + 1 : ℝ) := by
          rw [h₂]
          exact h₃
        simpa using h₄
      exact h₅
    · -- Case n > 0
      have h₁ : n ≥ 1 := by
        by_contra h₂
        have h₃ : n ≤ 0 := by linarith
        have h₄ : n = 0 := by
          omega
        contradiction
      have h₂ : ∃ (S : Set ℝ), S ⊆ Icc 0 1 ∧ MeasurableSet S ∧ volume S > 0 ∧ ∀ x ∈ S, |f x| ≥ 2^n * (n + 1) := by
        -- Use the set `{x | |f x| ≥ 1}` as before, but adjust for the condition `n > 0`
        have h₃ : ∃ (S : Set ℝ), S ⊆ Icc 0 1 ∧ MeasurableSet S ∧ volume S > 0 ∧ ∀ x ∈ S, |f x| ≥ 2^n * (n + 1) := by
          -- Assume by contradiction that no such set exists
          by_contra! h₄
          -- Use the n = 0 case to derive a contradiction
          have h₅ := hfint 0
          have h₆ := hfint 1
          have h₇ := hfintlast
          have h₈ : n ≥ 1 := by linarith
          have h₉ : 0 ≤ (n : ℤ) - 1 := by
            have h₁₀ : (n : ℤ) ≥ 1 := by simpa using h₁
            omega
          have h₁₀ : 0 ∈ (Icc 0 (n - 1) : Set ℤ) := by
            constructor <;>
            (try norm_num) <;>
            (try linarith) <;>
            (try omega)
          have h₁₁ : ∫ x in Icc 0 1, (x : ℝ)^(0 : ℤ) * f x = 0 := hfint 0 h₁₀
          norm_num at h₁₁ ⊢
          <;>
          (try simp_all) <;>
          (try linarith) <;>
          (try ring_nf at *) <;>
          (try norm_num at *) <;>
          (try linarith)
          <;>
          (try omega)
          <;>
          (try
          {
            simp_all [hfintlast]
            <;>
            norm_num
            <;>
            linarith
          })
        exact h₃
      exact h₂
  exact h_main