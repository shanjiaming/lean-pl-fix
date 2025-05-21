lemma liouville_theorem (g : ℂ → ℂ) (hg : Entire g) (hbounded : ∃ C, ∀ z, abs (g z) ≤ C) :
  ∃ c : ℂ, ∀ z, g z = c := by
  obtain ⟨C, hC⟩ := hbounded
  have h₁ : ∃ (c : ℂ), ∀ (z : ℂ), g z = c := by
    by_cases h : C ≥ 0
    · -- Case 1: C ≥ 0
      -- We need to find a constant c such that g(z) = c for all z.
      -- We will use the boundedness of g and the properties of entire functions to show this.
      use g 0
      intro z
      -- Define the function f(z) = g(z) + (C + 1)
      have h₂ : Entire (fun z => (g z + (C + 1 : ℂ))) := by
        -- Prove that f is entire
        have h₃ : AnalyticOn ℂ (fun z => (g z + (C + 1 : ℂ))) Set.univ := by
          -- Since g is entire and C + 1 is a constant, the sum is entire
          apply AnalyticOn.add
          · -- Prove that g is analytic on the entire complex plane
            exact hg
          · -- Prove that the constant function (C + 1) is analytic on the entire complex plane
            apply analyticOn_const
        exact h₃
      -- Prove that |f(z)| ≥ 1
      have h₄ : ∀ z, 1 ≤ abs (g z + (C + 1 : ℂ)) := by
        intro z
        have h₅ : abs (g z + (C + 1 : ℂ)) ≥ 1 := by
          -- Use the triangle inequality to show that |g(z) + (C + 1)| ≥ 1
          have h₆ : abs (g z + (C + 1 : ℂ)) ≥ abs (C + 1 : ℂ) - abs (g z) := by
            -- Use the reverse triangle inequality
            have h₇ : abs (C + 1 : ℂ) - abs (g z) ≤ abs (g z + (C + 1 : ℂ)) := by
              -- Use the reverse triangle inequality
              calc
                abs (C + 1 : ℂ) - abs (g z) ≤ abs ((C + 1 : ℂ) + g z) := by
                  -- Use the reverse triangle inequality
                  have h₈ : abs ((C + 1 : ℂ) + g z) ≥ abs (C + 1 : ℂ) - abs (g z) := by
                    -- Use the reverse triangle inequality
                    calc
                      abs ((C + 1 : ℂ) + g z) = abs (g z + (C + 1 : ℂ)) := by ring_nf
                      _ ≥ abs (C + 1 : ℂ) - abs (g z) := by
                        -- Use the reverse triangle inequality
                        have h₉ : abs (g z + (C + 1 : ℂ)) ≥ abs (C + 1 : ℂ) - abs (g z) := by
                          -- Use the reverse triangle inequality
                          calc
                            abs (g z + (C + 1 : ℂ)) ≥ abs (C + 1 : ℂ) - abs (g z) := by
                              -- Use the reverse triangle inequality
                              exact?
                            _ = abs (C + 1 : ℂ) - abs (g z) := by rfl
                        exact h₉
                  linarith [h₈]
                _ = abs (g z + (C + 1 : ℂ)) := by ring_nf
            linarith
          have h₁₀ : abs (C + 1 : ℂ) - abs (g z) ≥ 1 := by
            -- Use the boundedness of g
            have h₁₁ : abs (g z) ≤ C := hC z
            have h₁₂ : abs (C + 1 : ℂ) = C + 1 := by
              -- Prove that |C + 1| = C + 1
              simp [Complex.abs_def, Complex.normSq_apply, Complex.ext_iff, Real.sqrt_eq_iff_sq_eq,
                add_nonneg, mul_self_nonneg, h]
              <;> ring_nf <;> field_simp <;> nlinarith
            have h₁₃ : abs (C + 1 : ℂ) - abs (g z) ≥ 1 := by
              rw [h₁₂]
              have h₁₄ : (C + 1 : ℝ) - abs (g z) ≥ 1 := by
                -- Use the boundedness of g
                have h₁₅ : abs (g z) ≤ C := hC z
                have h₁₆ : (C : ℝ) ≥ 0 := by exact_mod_cast h
                have h₁₇ : abs (g z : ℂ) = abs (g z : ℂ) := rfl
                have h₁₈ : (abs (g z) : ℝ) ≤ C := by exact_mod_cast h₁₅
                have h₁₉ : (C + 1 : ℝ) - abs (g z) ≥ 1 := by linarith
                exact h₁₉
              exact_mod_cast h₁₄
            exact h₁₃
          linarith
        have h₂₀ : (1 : ℝ) ≤ abs (g z + (C + 1 : ℂ)) := by
          exact_mod_cast h₅
        simpa using h₂₀
      -- Prove that 1/f is entire and bounded
      have h₅ : Entire (fun z => 1 / (g z + (C + 1 : ℂ))) ∧ ∀ z, abs (1 / (g z + (C + 1 : ℂ))) ≤ 1 := by
        apply bounded_reciprocal_function (fun z => (g z + (C + 1 : ℂ))) h₂ h₄
      -- Extract the boundedness of 1/f
      have h₆ : ∀ z, abs (1 / (g z + (C + 1 : ℂ))) ≤ 1 := h₅.2
      -- Prove that g is constant
      have h₇ : g z = g 0 := by
        -- Use the boundedness of 1/f to prove that g is constant
        have h₈ : abs (1 / (g z + (C + 1 : ℂ))) ≤ 1 := h₆ z
        have h₉ : abs (1 / (g 0 + (C + 1 : ℂ))) ≤ 1 := h₆ 0
        have h₁₀ : g z = g 0 := by
          -- Prove that g is constant using the boundedness of 1/f
          by_contra h₁₁
          -- If g is not constant, then g(z) ≠ g(0) for some z
          have h₁₂ : g z ≠ g 0 := h₁₁
          -- Use the fact that g is entire and bounded below to derive a contradiction
          have h₁₃ : abs (g z + (C + 1 : ℂ)) ≥ 1 := h₄ z
          have h₁₄ : abs (g 0 + (C + 1 : ℂ)) ≥ 1 := h₄ 0
          -- Use the boundedness of 1/f to derive a contradiction
          have h₁₅ : abs (1 / (g z + (C + 1 : ℂ))) ≤ 1 := h₆ z
          have h₁₆ : abs (1 / (g 0 + (C + 1 : ℂ))) ≤ 1 := h₆ 0
          -- Use the fact that g is entire and bounded below to derive a contradiction
          have h₁₇ : abs (g z) ≤ C := hC z
          have h₁₈ : abs (g 0) ≤ C := hC 0
          -- Use the fact that g is entire and bounded below to derive a contradiction
          norm_num [Complex.abs, Complex.normSq, Complex.ext_iff, Real.sqrt_le_iff, add_nonneg, mul_self_nonneg,
            div_le_iff, le_of_lt] at h₈ h₉ h₁₃ h₁₄ h₁₅ h₁₆ h₁₇ h₁₈ ⊢
          <;>
          (try norm_num) <;>
          (try nlinarith [sq_nonneg (g z).re, sq_nonneg (g z).im, sq_nonneg (g 0).re, sq_nonneg (g 0).im,
            Real.sqrt_nonneg ((g z).re * (g z).re + (g z).im * (g z).im),
            Real.sqrt_nonneg ((g 0).re * (g 0).re + (g 0).im * (g 0).im),
            Real.sq_sqrt (show 0 ≤ (g z).re * (g z).re + (g z).im * (g z).im by positivity),
            Real.sq_sqrt (show 0 ≤ (g 0).re * (g 0).re + (g 0).im * (g 0).im by positivity)])
          <;>
          (try {
            cases' le_total 0 ((g z).re + (C + 1 : ℝ)) with h h <;>
            cases' le_total 0 ((g 0).re + (C + 1 : ℝ)) with h' h' <;>
            simp_all [Complex.abs, Complex.normSq, Complex.ext_iff, Real.sqrt_le_iff, add_nonneg, mul_self_nonneg,
              div_le_iff, le_of_lt] <;>
            nlinarith [sq_nonneg (g z).re, sq_nonneg (g z).im, sq_nonneg (g 0).re, sq_nonneg (g 0).im,
              Real.sqrt_nonneg ((g z).re * (g z).re + (g z).im * (g z).im),
              Real.sqrt_nonneg ((g 0).re * (g 0).re + (g 0).im * (g 0).im),
              Real.sq_sqrt (show 0 ≤ (g z).re * (g z).re + (g z).im * (g z).im by positivity),
              Real.sq_sqrt (show 0 ≤ (g 0).re * (g 0).re + (g 0).im * (g 0).im by positivity)]
          })
          <;>
          (try {
            cases' le_total 0 ((g z).re + (C + 1 : ℝ)) with h h <;>
            cases' le_total 0 ((g 0).re + (C + 1 : ℝ)) with h' h' <;>
            simp_all [Complex.abs, Complex.normSq, Complex.ext_iff, Real.sqrt_le_iff, add_nonneg, mul_self_nonneg,
              div_le_iff, le_of_lt] <;>
            nlinarith [sq_nonneg (g z).re, sq_nonneg (g z).im, sq_nonneg (g 0).re, sq_nonneg (g 0).im,
              Real.sqrt_nonneg ((g z).re * (g z).re + (g z).im * (g z).im),
              Real.sqrt_nonneg ((g 0).re * (g 0).re + (g 0).im * (g 0).im),
              Real.sq_sqrt (show 0 ≤ (g z).re * (g z).re + (g z).im * (g z).im by positivity),
              Real.sq_sqrt (show 0 ≤ (g 0).re * (g 0).re + (g 0).im * (g 0).im by positivity)]
          })
        exact h₁₀
      have h₁₁ : g z = g 0 := h₇
      simpa using h₁₁
    · -- Case 2: C < 0
      -- If C < 0, then |g(z)| ≤ C < 0, which is impossible since |g(z)| ≥ 0.
      have h₂ : C ≥ 0 := by
        have h₃ : 0 ≤ abs (g 0) := by exact Complex.abs.nonneg _
        have h₄ : abs (g 0) ≤ C := hC 0
        linarith
      simp_all
  -- We already have the result from h₁, so we can directly use it.
  exact h₁