theorem putnam_1991_a5
  (f : Set.Icc (0 : ℝ) 1 → ℝ)
  (hf : ∀ y : Set.Icc 0 1, f y = ∫ x in Set.Ioo 0 y, Real.sqrt (x ^ 4 + (y - y ^ 2) ^ 2)) :
  IsGreatest (f '' (Set.Icc 0 1)) ((1 / 3) : ℝ ) := by
  have h₁ : (1 / 3 : ℝ) ∈ f '' (Set.Icc 0 1) := by
    have h₂ : ((1 : ℝ) : Set.Icc (0 : ℝ) 1) ∈ Set.Icc (0 : ℝ) 1 := by
      exact ⟨by norm_num, by norm_num⟩
    have h₃ : f ((1 : ℝ) : Set.Icc (0 : ℝ) 1) = (1 / 3 : ℝ) := by
      have h₄ : f ((1 : ℝ) : Set.Icc (0 : ℝ) 1) = ∫ x in Set.Ioo 0 (1 : ℝ), Real.sqrt (x ^ 4 + ((1 : ℝ) - (1 : ℝ) ^ 2) ^ 2) := by
        rw [hf]
        <;> simp [Set.Ioo_def]
        <;> norm_num
      rw [h₄]
      have h₅ : (∫ x in Set.Ioo 0 (1 : ℝ), Real.sqrt (x ^ 4 + ((1 : ℝ) - (1 : ℝ) ^ 2) ^ 2)) = (1 / 3 : ℝ) := by
        have h₆ : (∫ x in Set.Ioo 0 (1 : ℝ), Real.sqrt (x ^ 4 + ((1 : ℝ) - (1 : ℝ) ^ 2) ^ 2)) = ∫ x in Set.Ioo 0 (1 : ℝ), (x ^ 2 : ℝ) := by
          apply integral_congr_ae
          have h₇ : ∀ᵐ (x : ℝ) ∂volume.restrict (Set.Ioo 0 (1 : ℝ)), Real.sqrt (x ^ 4 + ((1 : ℝ) - (1 : ℝ) ^ 2) ^ 2) = (x ^ 2 : ℝ) := by
            filter_upwards [self_mem_ae_restrict (measurableSet_Ioo : MeasurableSet (Set.Ioo 0 (1 : ℝ)))] with x hx
            have h₈ : x ∈ Set.Ioo 0 (1 : ℝ) := by exact hx
            have h₉ : 0 < x := by exact h₈.1
            have h₁₀ : x < 1 := by exact h₈.2
            have h₁₁ : Real.sqrt (x ^ 4 + ((1 : ℝ) - (1 : ℝ) ^ 2) ^ 2) = x ^ 2 := by
              rw [Real.sqrt_eq_iff_sq_eq (by positivity) (by positivity)]
              <;> ring_nf
              <;> nlinarith
            exact h₁₁
          exact h₇
        rw [h₆]
        have h₇ : (∫ x in Set.Ioo 0 (1 : ℝ), (x ^ 2 : ℝ)) = (1 / 3 : ℝ) := by
          have h₈ : (∫ x in Set.Ioo 0 (1 : ℝ), (x ^ 2 : ℝ)) = ∫ x in (Set.Icc 0 1 : Set ℝ), (x ^ 2 : ℝ) := by
            apply integral_congr_set_Ioo_ae
            <;> norm_num
          rw [h₈]
          -- Use the fundamental theorem of calculus to evaluate the integral of x^2 from 0 to 1.
          have h₉ : (∫ x in (Set.Icc 0 1 : Set ℝ), (x ^ 2 : ℝ)) = (1 / 3 : ℝ) := by
            norm_num [integral_Icc_eq_integral_Ioc, integral_pow]
            <;> ring_nf
            <;> norm_num
            <;> linarith
          rw [h₉]
        rw [h₇]
      rw [h₅]
    refine' ⟨((1 : ℝ) : Set.Icc (0 : ℝ) 1), h₂, _⟩
    rw [h₃]
  
  have h₂ : ∀ p ∈ f '' (Set.Icc 0 1), p ≤ (1 / 3 : ℝ) := by
    intro p hp
    rcases hp with ⟨y, hy, rfl⟩
    have h₃ : f y = ∫ x in Set.Ioo 0 y, Real.sqrt (x ^ 4 + (y - y ^ 2) ^ 2) := hf y
    rw [h₃]
    have h₄ : (y : ℝ) ≥ 0 := y.2.1
    have h₅ : (y : ℝ) ≤ 1 := y.2.2
    -- Consider the cases where y = 0 and y > 0 separately
    by_cases h₆ : (y : ℝ) = 0
    · -- Case: y = 0
      rw [h₆]
      -- The integral over an empty interval is 0, which is ≤ 1/3
      norm_num [Set.Ioo_eq_empty, integral_zero]
    · -- Case: y > 0
      have h₇ : 0 < (y : ℝ) := by
        contrapose! h₆
        linarith
      -- Use the fact that the square root of a sum is bounded by the sum of square roots
      have h₈ : (∫ x in Set.Ioo 0 (y : ℝ), Real.sqrt (x ^ 4 + (y - y ^ 2) ^ 2)) ≤ (y : ℝ) ^ 2 - (2 / 3 : ℝ) * (y : ℝ) ^ 3 := by
        have h₉ : (∫ x in Set.Ioo 0 (y : ℝ), Real.sqrt (x ^ 4 + (y - y ^ 2) ^ 2)) ≤ ∫ x in Set.Ioo 0 (y : ℝ), (x ^ 2 + (y - y ^ 2) : ℝ) := by
          refine' integral_mono_on (by positivity) (by continuity) _ (Set.Ioo_subset_Icc_self)
          intro x hx
          have h₁₀ : 0 ≤ x := by
            simp only [Set.mem_Ioo] at hx
            linarith
          have h₁₁ : x ≤ (y : ℝ) := by
            simp only [Set.mem_Ioo] at hx
            linarith
          have h₁₂ : 0 ≤ (y - y ^ 2 : ℝ) := by
            nlinarith
          have h₁₃ : 0 ≤ (x ^ 2 : ℝ) := by positivity
          have h₁₄ : 0 ≤ (y - y ^ 2 : ℝ) := by nlinarith
          -- Use the fact that the square root of a sum is less than or equal to the sum of square roots
          have h₁₅ : Real.sqrt (x ^ 4 + (y - y ^ 2) ^ 2) ≤ (x ^ 2 + (y - y ^ 2) : ℝ) := by
            apply Real.sqrt_le_iff.mpr
            constructor
            · positivity
            · nlinarith [sq_nonneg (x ^ 2 - (y - y ^ 2))]
          exact h₁₅
        have h₁₆ : (∫ x in Set.Ioo 0 (y : ℝ), (x ^ 2 + (y - y ^ 2) : ℝ)) = (y : ℝ) ^ 2 - (2 / 3 : ℝ) * (y : ℝ) ^ 3 := by
          have h₁₇ : (∫ x in Set.Ioo 0 (y : ℝ), (x ^ 2 + (y - y ^ 2) : ℝ)) = ∫ x in Set.Ioo 0 (y : ℝ), (x ^ 2 + (y - y ^ 2) : ℝ) := rfl
          rw [h₁₇]
          have h₁₈ : (∫ x in Set.Ioo 0 (y : ℝ), (x ^ 2 + (y - y ^ 2) : ℝ)) = (∫ x in Set.Ioo 0 (y : ℝ), (x ^ 2 : ℝ)) + ∫ x in Set.Ioo 0 (y : ℝ), (y - y ^ 2 : ℝ) := by
            have h₁₉ : (∫ x in Set.Ioo 0 (y : ℝ), (x ^ 2 + (y - y ^ 2) : ℝ)) = (∫ x in Set.Ioo 0 (y : ℝ), (x ^ 2 : ℝ)) + ∫ x in Set.Ioo 0 (y : ℝ), (y - y ^ 2 : ℝ) := by
              apply integral_add
              · apply Continuous.integrableOn_Ioo
                exact continuous_pow 2
              · apply Continuous.integrableOn_Ioo
                exact continuous_const
            rw [h₁₉]
          rw [h₁₈]
          have h₂₀ : (∫ x in Set.Ioo 0 (y : ℝ), (x ^ 2 : ℝ)) = (∫ x in Set.Icc 0 (y : ℝ), (x ^ 2 : ℝ)) := by
            apply integral_congr_set_Ioo_ae
          rw [h₂₀]
          have h₂₁ : (∫ x in Set.Icc 0 (y : ℝ), (x ^ 2 : ℝ)) = (y : ℝ) ^ 3 / 3 := by
            -- Use the power rule to evaluate the integral of x^2
            have h₂₂ : (∫ x in Set.Icc 0 (y : ℝ), (x ^ 2 : ℝ)) = (∫ x in Set.Ioc 0 (y : ℝ), (x ^ 2 : ℝ)) := by
              apply integral_congr_set_Icc_Ioc
            rw [h₂₂]
            have h₂₃ : (∫ x in Set.Ioc 0 (y : ℝ), (x ^ 2 : ℝ)) = (y : ℝ) ^ 3 / 3 := by
              -- Use the power rule to evaluate the integral of x^2
              have h₂₄ : (∫ x in Set.Ioc 0 (y : ℝ), (x ^ 2 : ℝ)) = (∫ x in (0 : ℝ)..(y : ℝ), (x ^ 2 : ℝ)) := by
                simp [intervalIntegral.integral_of_le, h₇.le]
                <;>
                simp_all [Set.Ioc_eq_empty]
                <;>
                linarith
              rw [h₂₄]
              -- Use the power rule to evaluate the integral of x^2
              norm_num
              <;>
              simp_all [intervalIntegral.integral_of_le, h₇.le]
              <;>
              norm_num
              <;>
              linarith
            rw [h₂₃]
          rw [h₂₁]
          have h₂₂ : (∫ x in Set.Ioo 0 (y : ℝ), (y - y ^ 2 : ℝ)) = (y - y ^ 2 : ℝ) * (y : ℝ) := by
            have h₂₃ : (∫ x in Set.Ioo 0 (y : ℝ), (y - y ^ 2 : ℝ)) = (∫ x in Set.Ioo 0 (y : ℝ), (y - y ^ 2 : ℝ)) := rfl
            rw [h₂₃]
            have h₂₄ : (∫ x in Set.Ioo 0 (y : ℝ), (y - y ^ 2 : ℝ)) = (y - y ^ 2 : ℝ) * (y : ℝ) := by
              have h₂₅ : (∫ x in Set.Ioo 0 (y : ℝ), (y - y ^ 2 : ℝ)) = (∫ x in Set.Ioo 0 (y : ℝ), (y - y ^ 2 : ℝ)) := rfl
              rw [h₂₅]
              -- Use Fubini's theorem to evaluate the integral of the constant function
              have h₂₆ : (∫ x in Set.Ioo 0 (y : ℝ), (y - y ^ 2 : ℝ)) = (y - y ^ 2 : ℝ) * (y : ℝ) := by
                have h₂₇ : (∫ x in Set.Ioo 0 (y : ℝ), (y - y ^ 2 : ℝ)) = (∫ x in Set.Ioo 0 (y : ℝ), (y - y ^ 2 : ℝ)) := rfl
                rw [h₂₇]
                -- Use Fubini's theorem to evaluate the integral of the constant function
                have h₂₈ : (∫ x in Set.Ioo 0 (y : ℝ), (y - y ^ 2 : ℝ)) = (y - y ^ 2 : ℝ) * (y : ℝ) := by
                  -- Use Fubini's theorem to evaluate the integral of the constant function
                  have h₂₉ : (∫ x in Set.Ioo 0 (y : ℝ), (y - y ^ 2 : ℝ)) = (y - y ^ 2 : ℝ) * (y : ℝ) := by
                    simp [integral_const, MeasureTheory.integral_mul_left, MeasureTheory.integral_mul_right,
                      Real.volume_Ioo, h₇.le]
                    <;>
                    ring_nf
                    <;>
                    field_simp
                    <;>
                    ring_nf
                    <;>
                    linarith
                  rw [h₂₉]
                rw [h₂₈]
              rw [h₂₆]
            rw [h₂₄]
          rw [h₂₂]
          -- Combine the results to get the final bound
          ring_nf
          <;>
          field_simp
          <;>
          ring_nf
          <;>
          nlinarith
        have h₁₉ : (∫ x in Set.Ioo 0 (y : ℝ), Real.sqrt (x ^ 4 + (y - y ^ 2) ^ 2)) ≤ (∫ x in Set.Ioo 0 (y : ℝ), (x ^ 2 + (y - y ^ 2) : ℝ)) := by
          exact h₉
        linarith
      have h₂₀ : (y : ℝ) ^ 2 - (2 / 3 : ℝ) * (y : ℝ) ^ 3 ≤ (1 / 3 : ℝ) := by
        have h₂₁ : 0 ≤ (y : ℝ) := by positivity
        have h₂₂ : (y : ℝ) ≤ 1 := by exact h₅
        have h₂₃ : 3 * (y : ℝ) ^ 2 - 2 * (y : ℝ) ^ 3 ≤ 1 := by
          nlinarith [sq_nonneg ((y : ℝ) - 1), sq_nonneg ((y : ℝ) - 1 / 2)]
        nlinarith
      linarith
      <;> try norm_num
      <;> linarith
  
  have h₃ : IsGreatest (f '' (Set.Icc 0 1)) ((1 / 3) : ℝ) := by
    refine' ⟨h₁, _⟩
    rintro p hp
    obtain ⟨y, hy, rfl⟩ := hp
    have h₄ : f y ≤ (1 / 3 : ℝ) := h₂ (f y) (by exact ⟨y, hy, rfl⟩)
    exact h₄
  
  exact h₃