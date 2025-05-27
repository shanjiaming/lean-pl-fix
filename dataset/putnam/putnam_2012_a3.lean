theorem putnam_2012_a3
(S : Set ℝ)
(hS : S = Set.Icc (-1 : ℝ) 1)
(fsat : (ℝ → ℝ) → Prop)
(hfsat : fsat = fun f : ℝ → ℝ => ContinuousOn f S ∧
(∀ x ∈ S, f x = ((2 - x^2)/2)*f (x^2/(2 - x^2))) ∧ f 0 = 1 ∧
(∃ y : ℝ, leftLim (fun x : ℝ => (f x)/Real.sqrt (1 - x)) 1 = y))
: fsat ((fun x : ℝ => Real.sqrt (1 - x^2)) : ℝ → ℝ ) ∧ ∀ f : ℝ → ℝ, fsat f → ∀ x ∈ S, f x = ((fun x : ℝ => Real.sqrt (1 - x^2)) : ℝ → ℝ ) x := by
  have h_main : fsat ((fun x : ℝ => Real.sqrt (1 - x^2)) : ℝ → ℝ ) ∧ ∀ f : ℝ → ℝ, fsat f → ∀ x ∈ S, f x = ((fun x : ℝ => Real.sqrt (1 - x^2)) : ℝ → ℝ ) x := by
    rw [hfsat]
    constructor
    · -- Prove that f(x) = sqrt(1 - x^2) satisfies fsat
      refine' ⟨_, _, _, _⟩
      · -- Prove continuity on S
        have h₁ : ContinuousOn (fun x : ℝ => Real.sqrt (1 - x ^ 2)) S := by
          rw [hS]
          exact (continuous_sqrt.comp (continuous_const.sub (continuous_pow 2))).continuousOn |>.mono (by
            intro x hx
            simp only [Set.mem_Icc] at hx ⊢
            nlinarith)
        exact h₁
      · -- Prove the functional equation
        intro x hx
        have h₂ : x ∈ Set.Icc (-1 : ℝ) 1 := by simpa [hS] using hx
        have h₃ : -1 ≤ x := h₂.1
        have h₄ : x ≤ 1 := h₂.2
        have h₅ : x ^ 2 ≤ 1 := by nlinarith
        have h₆ : 0 ≤ 1 - x ^ 2 := by nlinarith
        have h₇ : 0 ≤ Real.sqrt (1 - x ^ 2) := Real.sqrt_nonneg _
        have h₈ : 0 < 2 - x ^ 2 := by nlinarith
        have h₉ : 0 ≤ x ^ 2 / (2 - x ^ 2) := by positivity
        have h₁₀ : x ^ 2 / (2 - x ^ 2) ≤ 1 := by
          rw [div_le_one (by positivity)]
          nlinarith
        have h₁₁ : -1 ≤ x ^ 2 / (2 - x ^ 2) := by
          have h₁₁₁ : 0 ≤ x ^ 2 / (2 - x ^ 2) := by positivity
          nlinarith
        have h₁₂ : Real.sqrt (1 - (x ^ 2 / (2 - x ^ 2)) ^ 2) = 2 * Real.sqrt (1 - x ^ 2) / (2 - x ^ 2) := by
          have h₁₃ : 0 ≤ 2 - x ^ 2 := by nlinarith
          have h₁₄ : 0 ≤ Real.sqrt (1 - x ^ 2) := Real.sqrt_nonneg _
          have h₁₅ : 0 ≤ 2 * Real.sqrt (1 - x ^ 2) := by positivity
          have h₁₆ : 0 ≤ 2 - x ^ 2 := by nlinarith
          have h₁₇ : 0 ≤ (2 - x ^ 2) ^ 2 := by positivity
          have h₁₈ : Real.sqrt (1 - (x ^ 2 / (2 - x ^ 2)) ^ 2) = 2 * Real.sqrt (1 - x ^ 2) / (2 - x ^ 2) := by
            rw [Real.sqrt_eq_iff_sq_eq (by
              have h₁₉ : 0 ≤ 2 * Real.sqrt (1 - x ^ 2) / (2 - x ^ 2) := by positivity
              have h₂₀ : 0 ≤ 1 - (x ^ 2 / (2 - x ^ 2)) ^ 2 := by
                have h₂₁ : (x ^ 2 / (2 - x ^ 2)) ^ 2 ≤ 1 := by
                  have h₂₂ : x ^ 2 / (2 - x ^ 2) ≤ 1 := by
                    rw [div_le_one (by positivity)]
                    nlinarith
                  have h₂₃ : 0 ≤ x ^ 2 / (2 - x ^ 2) := by positivity
                  nlinarith
                nlinarith
              nlinarith) (by positivity)]
            field_simp [h₈.ne', h₆, h₁₆]
            <;> ring_nf
            <;> field_simp [h₈.ne', h₆, h₁₆]
            <;> nlinarith [Real.sq_sqrt (show 0 ≤ 1 - x ^ 2 by nlinarith)]
          rw [h₁₈]
        have h₁₉ : (fun x : ℝ => Real.sqrt (1 - x ^ 2)) x = ((2 - x ^ 2) / 2) * (fun x : ℝ => Real.sqrt (1 - x ^ 2)) (x ^ 2 / (2 - x ^ 2)) := by
          have h₂₀ : (fun x : ℝ => Real.sqrt (1 - x ^ 2)) (x ^ 2 / (2 - x ^ 2)) = Real.sqrt (1 - (x ^ 2 / (2 - x ^ 2)) ^ 2) := by
            simp [h₈.ne']
          rw [h₂₀]
          rw [h₁₂]
          have h₂₁ : (2 - x ^ 2 : ℝ) > 0 := by nlinarith
          field_simp [h₂₁.ne']
          <;> ring_nf
          <;> field_simp [h₂₁.ne']
          <;> nlinarith [Real.sq_sqrt (show 0 ≤ 1 - x ^ 2 by nlinarith)]
        simpa using h₁₉
      · -- Prove f(0) = 1
        norm_num [Real.sqrt_eq_iff_sq_eq]
      · -- Prove the limit exists
        use (Real.sqrt 2)
        have h₂₀ : leftLim (fun x : ℝ => (Real.sqrt (1 - x ^ 2) : ℝ) / Real.sqrt (1 - x)) 1 = Real.sqrt 2 := by
          have h₂₁ : leftLim (fun x : ℝ => (Real.sqrt (1 - x ^ 2) : ℝ) / Real.sqrt (1 - x)) 1 = Real.sqrt 2 := by
            have h₂₂ : ∀ᶠ (x : ℝ) in nhdsWithin 1 (Set.Iio 1), (Real.sqrt (1 - x ^ 2) : ℝ) / Real.sqrt (1 - x) = Real.sqrt (1 + x) := by
              have h₂₃ : ∀ᶠ (x : ℝ) in nhdsWithin 1 (Set.Iio 1), (Real.sqrt (1 - x ^ 2) : ℝ) / Real.sqrt (1 - x) = Real.sqrt (1 + x) := by
                filter_upwards [isOpen_Iio.mem_nhds (by norm_num : (1 : ℝ) ∈ Set.Iio 1)] with x hx
                have h₂₄ : x < 1 := by simpa using hx
                have h₂₅ : 1 - x > 0 := by linarith
                have h₂₆ : 1 - x ^ 2 = (1 - x) * (1 + x) := by ring
                have h₂₇ : Real.sqrt (1 - x ^ 2) = Real.sqrt ((1 - x) * (1 + x)) := by rw [h₂₆]
                rw [h₂₇]
                have h₂₈ : Real.sqrt ((1 - x) * (1 + x)) = Real.sqrt (1 - x) * Real.sqrt (1 + x) := by
                  rw [Real.sqrt_eq_iff_sq_eq (by
                    nlinarith [Real.sqrt_nonneg (1 - x), Real.sqrt_nonneg (1 + x), Real.sq_sqrt (show 0 ≤ 1 - x by nlinarith), Real.sq_sqrt (show 0 ≤ 1 + x by nlinarith)]
                    ) (by
                    nlinarith [Real.sqrt_nonneg (1 - x), Real.sqrt_nonneg (1 + x), Real.sq_sqrt (show 0 ≤ 1 - x by nlinarith), Real.sq_sqrt (show 0 ≤ 1 + x by nlinarith)]
                    )]
                  nlinarith [Real.sqrt_nonneg (1 - x), Real.sqrt_nonneg (1 + x), Real.sq_sqrt (show 0 ≤ 1 - x by nlinarith), Real.sq_sqrt (show 0 ≤ 1 + x by nlinarith)]
                rw [h₂₈]
                have h₂₉ : Real.sqrt (1 - x) > 0 := Real.sqrt_pos.mpr (by linarith)
                field_simp [h₂₉.ne']
                <;> ring_nf
                <;> field_simp [h₂₉.ne']
                <;> nlinarith [Real.sq_sqrt (show 0 ≤ 1 - x by linarith), Real.sq_sqrt (show 0 ≤ 1 + x by nlinarith)]
              exact h₂₃
            have h₃₀ : leftLim (fun x : ℝ => (Real.sqrt (1 - x ^ 2) : ℝ) / Real.sqrt (1 - x)) 1 = leftLim (fun x : ℝ => Real.sqrt (1 + x)) 1 := by
              apply Filter.Tendsto.leftLim_congr _ (by
                filter_upwards [h₂₂] with x hx using hx
                <;> simp_all [hS]
                <;> norm_num
                <;> linarith)
              have h₃₁ : ContinuousOn (fun x : ℝ => (Real.sqrt (1 - x ^ 2) : ℝ) / Real.sqrt (1 - x)) (Set.Iio 1) := by
                have h₃₂ : ContinuousOn (fun x : ℝ => (Real.sqrt (1 - x ^ 2) : ℝ) / Real.sqrt (1 - x)) (Set.Iio 1) := by
                  have h₃₃ : ContinuousOn (fun x : ℝ => (Real.sqrt (1 - x ^ 2) : ℝ)) (Set.Iio 1) := by
                    apply ContinuousOn.sqrt
                    exact continuousOn_const.sub (continuousOn_pow 2)
                  have h₃₄ : ContinuousOn (fun x : ℝ => Real.sqrt (1 - x)) (Set.Iio 1) := by
                    apply ContinuousOn.sqrt
                    exact continuousOn_const.sub continuousOn_id
                  exact ContinuousOn.div h₃₃ h₃₄ (fun x hx => by
                    have h₃₅ : x < 1 := by simpa using hx
                    have h₃₆ : 1 - x > 0 := by linarith
                    positivity)
                exact h₃₂
              have h₃₅ : ContinuousOn (fun x : ℝ => Real.sqrt (1 + x)) (Set.Iio 1) := by
                apply ContinuousOn.sqrt
                exact continuousOn_const.add continuousOn_id
              have h₃₆ : Filter.Tendsto (fun x : ℝ => (Real.sqrt (1 - x ^ 2) : ℝ) / Real.sqrt (1 - x)) (nhdsWithin 1 (Set.Iio 1)) (nhds ((Real.sqrt (1 - 1 ^ 2) : ℝ) / Real.sqrt (1 - 1))) := by
                apply ContinuousOn.tendsto
                exact h₃₁
                <;> simp [hS]
                <;> norm_num
                <;> linarith
              have h₃₇ : Filter.Tendsto (fun x : ℝ => Real.sqrt (1 + x)) (nhdsWithin 1 (Set.Iio 1)) (nhds (Real.sqrt (1 + 1))) := by
                apply ContinuousOn.tendsto
                exact h₃₅
                <;> simp [hS]
                <;> norm_num
                <;> linarith
              have h₃₈ : leftLim (fun x : ℝ => (Real.sqrt (1 - x ^ 2) : ℝ) / Real.sqrt (1 - x)) 1 = leftLim (fun x : ℝ => Real.sqrt (1 + x)) 1 := by
                apply Filter.Tendsto.leftLim_congr _ (by
                  filter_upwards [h₂₂] with x hx using hx
                  <;> simp_all [hS]
                  <;> norm_num
                  <;> linarith)
                <;> simp_all [hS]
                <;> norm_num
                <;> linarith
              exact h₃₈
            rw [h₃₀]
            have h₃₁ : leftLim (fun x : ℝ => Real.sqrt (1 + x)) 1 = Real.sqrt 2 := by
              have h₃₂ : ContinuousAt (fun x : ℝ => Real.sqrt (1 + x)) 1 := by
                apply ContinuousAt.sqrt
                exact continuousAt_const.add continuousAt_id
              have h₃₃ : leftLim (fun x : ℝ => Real.sqrt (1 + x)) 1 = Real.sqrt (1 + 1) := by
                rw [leftLim_eq_tendsto]
                <;> simp_all [hS]
                <;> norm_num
                <;> linarith
              rw [h₃₃]
              <;> norm_num [Real.sqrt_eq_iff_sq_eq]
              <;> ring_nf
              <;> norm_num
              <;> linarith
            rw [h₃₁]
          rw [h₂₁]
        rw [h₂₀]
    · -- Prove that any f satisfying fsat must equal sqrt(1 - x^2) on S
      intro f hf
      have h₁ : ContinuousOn f S := hf.1
      have h₂ : ∀ x ∈ S, f x = ((2 - x ^ 2) / 2) * f (x ^ 2 / (2 - x ^ 2)) := hf.2.1
      have h₃ : f 0 = 1 := hf.2.2.1
      have h₄ : ∃ (y : ℝ), leftLim (fun x : ℝ => f x / Real.sqrt (1 - x)) 1 = y := hf.2.2.2
      intro x hx
      have h₅ : x ∈ Set.Icc (-1 : ℝ) 1 := by simpa [hS] using hx
      have h₆ : -1 ≤ x := h₅.1
      have h₇ : x ≤ 1 := h₅.2
      have h₈ : x ^ 2 ≤ 1 := by nlinarith
      have h₉ : 0 ≤ 1 - x ^ 2 := by nlinarith
      have h₁₀ : 0 ≤ Real.sqrt (1 - x ^ 2) := Real.sqrt_nonneg _
      have h₁₁ : 0 < 2 - x ^ 2 := by nlinarith
      have h₁₂ : 0 ≤ x ^ 2 / (2 - x ^ 2) := by positivity
      have h₁₃ : x ^ 2 / (2 - x ^ 2) ≤ 1 := by
        rw [div_le_one (by positivity)]
        nlinarith
      have h₁₄ : -1 ≤ x ^ 2 / (2 - x ^ 2) := by
        have h₁₄₁ : 0 ≤ x ^ 2 / (2 - x ^ 2) := by positivity
        nlinarith
      have h₁₅ : f x = Real.sqrt (1 - x ^ 2) := by
        -- Use the functional equation to derive the form of f(x)
        have h₁₅₁ : f x = ((2 - x ^ 2) / 2) * f (x ^ 2 / (2 - x ^ 2)) := h₂ x hx
        have h₁₅₂ : f (x ^ 2 / (2 - x ^ 2)) = Real.sqrt (1 - (x ^ 2 / (2 - x ^ 2)) ^ 2) := by
          -- Prove that f(x) = sqrt(1 - x^2) for x in S
          have h₁₅₃ : x ^ 2 / (2 - x ^ 2) ∈ S := by
            rw [hS]
            constructor
            · -- Prove -1 ≤ x ^ 2 / (2 - x ^ 2)
              have h₁₅₄ : 0 ≤ x ^ 2 / (2 - x ^ 2) := by positivity
              nlinarith
            · -- Prove x ^ 2 / (2 - x ^ 2) ≤ 1
              rw [div_le_one (by positivity)]
              nlinarith
          have h₁₅₄ : f (x ^ 2 / (2 - x ^ 2)) = ((2 - (x ^ 2 / (2 - x ^ 2)) ^ 2) / 2) * f ((x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2)) := h₂ (x ^ 2 / (2 - x ^ 2)) h₁₅₃
          have h₁₅₅ : f (x ^ 2 / (2 - x ^ 2)) = Real.sqrt (1 - (x ^ 2 / (2 - x ^ 2)) ^ 2) := by
            -- Prove that f(x) = sqrt(1 - x^2) for x in S
            have h₁₅₆ : Real.sqrt (1 - (x ^ 2 / (2 - x ^ 2)) ^ 2) = 2 * Real.sqrt (1 - x ^ 2) / (2 - x ^ 2) := by
              have h₁₅₇ : 0 ≤ 2 - x ^ 2 := by nlinarith
              have h₁₅₈ : 0 ≤ Real.sqrt (1 - x ^ 2) := Real.sqrt_nonneg _
              have h₁₅₉ : 0 ≤ 2 * Real.sqrt (1 - x ^ 2) := by positivity
              have h₁₆₀ : 0 ≤ (2 - x ^ 2) ^ 2 := by positivity
              have h₁₆₁ : Real.sqrt (1 - (x ^ 2 / (2 - x ^ 2)) ^ 2) = 2 * Real.sqrt (1 - x ^ 2) / (2 - x ^ 2) := by
                rw [Real.sqrt_eq_iff_sq_eq (by
                  have h₁₆₂ : 0 ≤ 2 * Real.sqrt (1 - x ^ 2) / (2 - x ^ 2) := by positivity
                  have h₁₆₃ : 0 ≤ 1 - (x ^ 2 / (2 - x ^ 2)) ^ 2 := by
                    have h₁₆₄ : (x ^ 2 / (2 - x ^ 2)) ^ 2 ≤ 1 := by
                      have h₁₆₅ : x ^ 2 / (2 - x ^ 2) ≤ 1 := by
                        rw [div_le_one (by positivity)]
                        nlinarith
                      have h₁₆₆ : 0 ≤ x ^ 2 / (2 - x ^ 2) := by positivity
                      nlinarith
                    nlinarith
                  nlinarith) (by positivity)]
                field_simp [h₁₁.ne', h₉, h₁₅₇]
                <;> ring_nf
                <;> field_simp [h₁₁.ne', h₉, h₁₅₇]
                <;> nlinarith [Real.sq_sqrt (show 0 ≤ 1 - x ^ 2 by nlinarith)]
              rw [h₁₆₁]
            have h₁₆₂ : f (x ^ 2 / (2 - x ^ 2)) = Real.sqrt (1 - (x ^ 2 / (2 - x ^ 2)) ^ 2) := by
              -- Prove that f(x) = sqrt(1 - x^2) for x in S
              have h₁₆₃ : f (x ^ 2 / (2 - x ^ 2)) = ((2 - (x ^ 2 / (2 - x ^ 2)) ^ 2) / 2) * f ((x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2)) := h₂ (x ^ 2 / (2 - x ^ 2)) h₁₅₃
              have h₁₆₄ : f (x ^ 2 / (2 - x ^ 2)) = Real.sqrt (1 - (x ^ 2 / (2 - x ^ 2)) ^ 2) := by
                -- Prove that f(x) = sqrt(1 - x^2) for x in S
                have h₁₆₅ : Real.sqrt (1 - (x ^ 2 / (2 - x ^ 2)) ^ 2) = 2 * Real.sqrt (1 - x ^ 2) / (2 - x ^ 2) := by
                  rw [h₁₅₆]
                have h₁₆₆ : f (x ^ 2 / (2 - x ^ 2)) = Real.sqrt (1 - (x ^ 2 / (2 - x ^ 2)) ^ 2) := by
                  -- Prove that f(x) = sqrt(1 - x^2) for x in S
                  have h₁₆₇ : f (x ^ 2 / (2 - x ^ 2)) = ((2 - (x ^ 2 / (2 - x ^ 2)) ^ 2) / 2) * f ((x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2)) := h₂ (x ^ 2 / (2 - x ^ 2)) h₁₅₃
                  have h₁₆₈ : f (x ^ 2 / (2 - x ^ 2)) = Real.sqrt (1 - (x ^ 2 / (2 - x ^ 2)) ^ 2) := by
                    -- Prove that f(x) = sqrt(1 - x^2) for x in S
                    have h₁₆₉ : Real.sqrt (1 - (x ^ 2 / (2 - x ^ 2)) ^ 2) = 2 * Real.sqrt (1 - x ^ 2) / (2 - x ^ 2) := by
                      rw [h₁₅₆]
                    have h₁₇₀ : f (x ^ 2 / (2 - x ^ 2)) = Real.sqrt (1 - (x ^ 2 / (2 - x ^ 2)) ^ 2) := by
                      -- Prove that f(x) = sqrt(1 - x^2) for x in S
                      have h₁₇₁ : f (x ^ 2 / (2 - x ^ 2)) = ((2 - (x ^ 2 / (2 - x ^ 2)) ^ 2) / 2) * f ((x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2)) := h₂ (x ^ 2 / (2 - x ^ 2)) h₁₅₃
                      have h₁₇₂ : f (x ^ 2 / (2 - x ^ 2)) = Real.sqrt (1 - (x ^ 2 / (2 - x ^ 2)) ^ 2) := by
                        -- Prove that f(x) = sqrt(1 - x^2) for x in S
                        have h₁₇₃ : Real.sqrt (1 - (x ^ 2 / (2 - x ^ 2)) ^ 2) = 2 * Real.sqrt (1 - x ^ 2) / (2 - x ^ 2) := by
                          rw [h₁₅₆]
                        have h₁₇₄ : f (x ^ 2 / (2 - x ^ 2)) = Real.sqrt (1 - (x ^ 2 / (2 - x ^ 2)) ^ 2) := by
                          -- Prove that f(x) = sqrt(1 - x^2) for x in S
                          have h₁₇₅ : f (x ^ 2 / (2 - x ^ 2)) = ((2 - (x ^ 2 / (2 - x ^ 2)) ^ 2) / 2) * f ((x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2)) := h₂ (x ^ 2 / (2 - x ^ 2)) h₁₅₃
                          have h₁₇₆ : f (x ^ 2 / (2 - x ^ 2)) = Real.sqrt (1 - (x ^ 2 / (2 - x ^ 2)) ^ 2) := by
                            -- Prove that f(x) = sqrt(1 - x^2) for x in S
                            rw [h₁₇₅]
                            have h₁₇₇ : f ((x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2)) = Real.sqrt (1 - ((x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2)) ^ 2) := by
                              -- Prove that f(x) = sqrt(1 - x^2) for x in S
                              have h₁₇₈ : (x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2) ∈ S := by
                                rw [hS]
                                constructor
                                · -- Prove -1 ≤ (x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2)
                                  have h₁₇₉ : 0 ≤ (x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2) := by positivity
                                  nlinarith
                                · -- Prove (x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2) ≤ 1
                                  have h₁₈₀ : (x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2) ≤ 1 := by
                                    have h₁₈₁ : (x ^ 2 / (2 - x ^ 2)) ^ 2 ≤ 1 := by
                                      have h₁₈₂ : x ^ 2 / (2 - x ^ 2) ≤ 1 := by
                                        rw [div_le_one (by positivity)]
                                        nlinarith
                                      have h₁₈₃ : 0 ≤ x ^ 2 / (2 - x ^ 2) := by positivity
                                      nlinarith
                                    have h₁₈₄ : 0 < 2 - (x ^ 2 / (2 - x ^ 2)) ^ 2 := by
                                      have h₁₈₅ : (x ^ 2 / (2 - x ^ 2)) ^ 2 ≤ 1 := by
                                        have h₁₈₆ : x ^ 2 / (2 - x ^ 2) ≤ 1 := by
                                          rw [div_le_one (by positivity)]
                                          nlinarith
                                        have h₁₈₇ : 0 ≤ x ^ 2 / (2 - x ^ 2) := by positivity
                                        nlinarith
                                      nlinarith
                                    rw [div_le_one (by positivity)]
                                    nlinarith
                                  exact h₁₈₀
                              have h₁₈₁ : f ((x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2)) = Real.sqrt (1 - ((x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2)) ^ 2) := by
                                -- Prove that f(x) = sqrt(1 - x^2) for x in S
                                have h₁₈₂ : f ((x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2)) = ((2 - ((x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2)) ^ 2) / 2) * f (((x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2)) ^ 2 / (2 - ((x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2)) ^ 2)) := by
                                  apply h₂
                                  <;> simp_all [hS]
                                  <;> norm_num
                                  <;> linarith
                                have h₁₈₃ : f ((x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2)) = Real.sqrt (1 - ((x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2)) ^ 2) := by
                                  -- Prove that f(x) = sqrt(1 - x^2) for x in S
                                  have h₁₈₄ : Real.sqrt (1 - ((x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2)) ^ 2) = 2 * Real.sqrt (1 - (x ^ 2 / (2 - x ^ 2)) ^ 2) / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2) := by
                                    -- Prove that f(x) = sqrt(1 - x^2) for x in S
                                    have h₁₈₅ : Real.sqrt (1 - ((x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2)) ^ 2) = 2 * Real.sqrt (1 - (x ^ 2 / (2 - x ^ 2)) ^ 2) / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2) := by
                                      -- Prove that f(x) = sqrt(1 - x^2) for x in S
                                      have h₁₈₆ : Real.sqrt (1 - ((x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2)) ^ 2) = 2 * Real.sqrt (1 - (x ^ 2 / (2 - x ^ 2)) ^ 2) / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2) := by
                                        -- Prove that f(x) = sqrt(1 - x^2) for x in S
                                        have h₁₈₇ : Real.sqrt (1 - ((x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2)) ^ 2) = 2 * Real.sqrt (1 - (x ^ 2 / (2 - x ^ 2)) ^ 2) / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2) := by
                                          -- Prove that f(x) = sqrt(1 - x^2) for x in S
                                          have h₁₈₈ : 0 ≤ 2 - (x ^ 2 / (2 - x ^ 2)) ^ 2 := by
                                            have h₁₈₉ : (x ^ 2 / (2 - x ^ 2)) ^ 2 ≤ 1 := by
                                              have h₁₉₀ : x ^ 2 / (2 - x ^ 2) ≤ 1 := by
                                                rw [div_le_one (by positivity)]
                                                nlinarith
                                              have h₁₉₁ : 0 ≤ x ^ 2 / (2 - x ^ 2) := by positivity
                                              nlinarith
                                            nlinarith
                                          have h₁₉₂ : 0 ≤ Real.sqrt (1 - (x ^ 2 / (2 - x ^ 2)) ^ 2) := Real.sqrt_nonneg _
                                          have h₁₉₃ : 0 ≤ 2 * Real.sqrt (1 - (x ^ 2 / (2 - x ^ 2)) ^ 2) := by positivity
                                          have h₁₉₄ : 0 ≤ 2 - (x ^ 2 / (2 - x ^ 2)) ^ 2 := by positivity
                                          have h₁₉₅ : Real.sqrt (1 - ((x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2)) ^ 2) = 2 * Real.sqrt (1 - (x ^ 2 / (2 - x ^ 2)) ^ 2) / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2) := by
                                            rw [Real.sqrt_eq_iff_sq_eq (by
                                              have h₁₉₆ : 0 ≤ 2 * Real.sqrt (1 - (x ^ 2 / (2 - x ^ 2)) ^ 2) / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2) := by positivity
                                              have h₁₉₇ : 0 ≤ 1 - ((x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2)) ^ 2 := by
                                                have h₁₉₈ : ((x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2)) ^ 2 ≤ 1 := by
                                                  have h₁₉₉ : (x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2) ≤ 1 := by
                                                    have h₂₀₀ : (x ^ 2 / (2 - x ^ 2)) ^ 2 ≤ 1 := by
                                                      have h₂₀₁ : x ^ 2 / (2 - x ^ 2) ≤ 1 := by
                                                        rw [div_le_one (by positivity)]
                                                        nlinarith
                                                      have h₂₀₂ : 0 ≤ x ^ 2 / (2 - x ^ 2) := by positivity
                                                      nlinarith
                                                    have h₂₀₃ : 0 < 2 - (x ^ 2 / (2 - x ^ 2)) ^ 2 := by
                                                      have h₂₀₄ : (x ^ 2 / (2 - x ^ 2)) ^ 2 ≤ 1 := by
                                                        have h₂₀₅ : x ^ 2 / (2 - x ^ 2) ≤ 1 := by
                                                          rw [div_le_one (by positivity)]
                                                          nlinarith
                                                        have h₂₀₆ : 0 ≤ x ^ 2 / (2 - x ^ 2) := by positivity
                                                        nlinarith
                                                      nlinarith
                                                    rw [div_le_one (by positivity)]
                                                    nlinarith
                                                  have h₂₀₇ : 0 ≤ (x ^ 2 / (2 - x ^ 2)) ^ 2 / (2 - (x ^ 2 / (2 - x ^ 2)) ^ 2) := by positivity
                                                  nlinarith
                                                nlinarith
                                              nlinarith) (by positivity)]
                                            field_simp [h₁₈₈, h₁₉₄]
                                            <;> ring_nf
                                            <;> field_simp [h₁₈₈, h₁₉₄]
                                            <;> nlinarith [Real.sq_sqrt (show 0 ≤ 1 - (x ^ 2 / (2 - x ^ 2)) ^ 2 by
                                              have h₂₀₈ : (x ^ 2 / (2 - x ^ 2)) ^ 2 ≤ 1 := by
                                                have h₂₀₉ : x ^ 2 / (2 - x ^ 2) ≤ 1 := by
                                                  rw [div_le_one (by positivity)]
                                                  nlinarith
                                                have h₂₁₀ : 0 ≤ x ^ 2 / (2 - x ^ 2) := by positivity
                                                nlinarith
                                              nlinarith)]
                                          rw [h₁₉₅]
                                        rw [h₁₈₇]
                                      rw [h₁₈₆]
                                    rw [h₁₈₅]
                                  rw [h₁₈₄]
                                  <;> simp_all [hS]
                                  <;> norm_num
                                  <;> linarith
                                rw [h₁₈₃]
                              rw [h₁₇₇]
                              <;> simp_all [hS]
                              <;> norm_num
                              <;> linarith
                            <;> simp_all [hS]
                            <;> norm_num
                            <;> linarith
                          <;> simp_all [hS]
                          <;> norm_num
                          <;> linarith
                        <;> simp_all [hS]
                        <;> norm_num
                        <;> linarith
                      <;> simp_all [hS]
                      <;> norm_num
                      <;> linarith
                    <;> simp_all [hS]
                    <;> norm_num
                    <;> linarith
                  <;> simp_all [hS]
                  <;> norm_num
                  <;> linarith
                <;> simp_all [hS]
                <;> norm_num
                <;> linarith
              <;> simp_all [hS]
              <;> norm_num
              <;> linarith
            <;> simp_all [hS]
            <;> norm_num
            <;> linarith
          <;> simp_all [hS]
          <;> norm_num
          <;> linarith
        <;> simp_all [hS]
        <;> norm_num
        <;> linarith
      <;> simp_all [hS]
      <;> norm_num
      <;> linarith
    <;> simp_all [hS]
    <;> norm_num
    <;> linarith
  exact h_main