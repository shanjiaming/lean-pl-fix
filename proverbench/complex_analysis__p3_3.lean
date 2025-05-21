theorem constant_reciprocal_function (f : ℂ → ℂ) (hf : Entire f) (h : ∀ z, 1 ≤ abs (f z)) :
  ∃ c : ℂ, ∀ z, f z = 1 / c := by
  have h₁ : Entire (fun z => 1 / f z) ∧ ∀ z, abs (1 / f z) ≤ 1 := by
    apply bounded_reciprocal_function f hf h
  
  have h₂ : ∃ (C : ℝ), ∀ (z : ℂ), abs ((fun z => 1 / f z) z) ≤ C := by
    refine' ⟨1, _⟩
    intro z
    have h₂ : abs (1 / f z) ≤ 1 := h₁.2 z
    simpa using h₂
  
  have h₃ : ∃ (c : ℂ), ∀ (z : ℂ), (fun z => 1 / f z) z = c := by
    have h₃ : ∃ (C : ℝ), ∀ (z : ℂ), abs ((fun z => 1 / f z) z) ≤ C := h₂
    have h₄ : Entire (fun z => 1 / f z) := h₁.1
    have h₅ : ∃ (c : ℂ), ∀ (z : ℂ), (fun z => 1 / f z) z = c := by
      -- Use Liouville's theorem to show that the function is constant
      have h₆ : ∃ (c : ℂ), ∀ (z : ℂ), (fun z => 1 / f z) z = c := by
        -- Apply Liouville's theorem to the bounded entire function
        have h₇ : ∃ C, ∀ z, abs ((fun z => 1 / f z) z) ≤ C := h₂
        obtain ⟨C, hC⟩ := h₇
        have h₈ : ∃ (c : ℂ), ∀ (z : ℂ), (fun z => 1 / f z) z = c := by
          -- Use the fact that the function is bounded and entire to apply Liouville's theorem
          have h₉ : ∃ (c : ℂ), ∀ (z : ℂ), (fun z => 1 / f z) z = c := by
            -- Use the fact that the function is bounded and entire to apply Liouville's theorem
            have h₁₀ : ∃ (c : ℂ), ∀ (z : ℂ), (fun z => 1 / f z) z = c := by
              -- Use the fact that the function is bounded and entire to apply Liouville's theorem
              exact liouville_theorem (fun z => 1 / f z) h₄ ⟨C, hC⟩
            exact h₁₀
          exact h₉
        exact h₈
      exact h₆
    exact h₅
  
  have h₄ : ∃ (c : ℂ), ∀ (z : ℂ), f z = 1 / c := by
    obtain ⟨c, hc⟩ := h₃
    have h₅ : ∀ (z : ℂ), (1 : ℂ) / f z = c := by simpa using hc
    have h₆ : c ≠ 0 := by
      by_contra h₆
      have h₇ : c = 0 := by simpa using h₆
      have h₈ : ∀ (z : ℂ), (1 : ℂ) / f z = 0 := by simpa [h₇] using h₅
      have h₉ : ∀ (z : ℂ), f z = 0 := by
        intro z
        have h₁₀ : (1 : ℂ) / f z = 0 := h₈ z
        have h₁₁ : f z ≠ 0 := by
          by_contra h₁₁
          have h₁₂ : f z = 0 := by simpa using h₁₁
          have h₁₃ : abs (f z) = 0 := by simp [h₁₂]
          have h₁₄ : 1 ≤ abs (f z) := h z
          linarith
        have h₁₅ : f z = 0 := by
          by_cases h₁₅ : f z = 0
          · exact h₁₅
          · exfalso
            have h₁₆ : (1 : ℂ) / f z ≠ 0 := by
              field_simp [h₁₅]
              <;> simp_all [Complex.ext_iff, Complex.abs, Complex.normSq, Real.sqrt_eq_zero']
              <;> nlinarith [h z, Real.sqrt_nonneg (f z).re, Real.sqrt_nonneg (f z).im]
            simp_all [Complex.ext_iff, Complex.abs, Complex.normSq, Real.sqrt_eq_zero']
            <;> nlinarith [h z, Real.sqrt_nonneg (f z).re, Real.sqrt_nonneg (f z).im]
        exact h₁₅
      have h₁₀ : ∀ (z : ℂ), abs (f z) = 0 := by
        intro z
        have h₁₁ : f z = 0 := h₉ z
        simp [h₁₁]
      have h₁₁ : ∀ (z : ℂ), 1 ≤ abs (f z) := h
      have h₁₂ : 1 ≤ (0 : ℝ) := by
        have h₁₃ : 1 ≤ abs (f 0) := h 0
        have h₁₄ : abs (f 0) = 0 := h₁₀ 0
        linarith
      norm_num at h₁₂ ⊢
      <;> linarith
    use (1 : ℂ) / c
    intro z
    have h₇ : (1 : ℂ) / f z = c := h₅ z
    have h₈ : f z = (1 : ℂ) / c := by
      have h₉ : f z ≠ 0 := by
        by_contra h₉
        have h₁₀ : f z = 0 := by simpa using h₉
        have h₁₁ : abs (f z) = 0 := by simp [h₁₀]
        have h₁₂ : 1 ≤ abs (f z) := h z
        linarith
      have h₁₀ : c ≠ 0 := h₆
      have h₁₁ : (1 : ℂ) / f z = c := h₅ z
      have h₁₂ : f z = (1 : ℂ) / c := by
        have h₁₃ : (1 : ℂ) / f z = c := h₅ z
        have h₁₄ : f z = (1 : ℂ) / c := by
          field_simp [h₉, h₁₀] at h₁₃ ⊢
          <;> ring_nf at h₁₃ ⊢ <;>
            simp_all [Complex.ext_iff, Complex.div_re, Complex.div_im, Complex.normSq]
          <;>
            (try norm_num) <;>
            (try ring_nf at * <;> simp_all [Complex.ext_iff, Complex.div_re, Complex.div_im, Complex.normSq]) <;>
            (try nlinarith) <;>
            (try linarith) <;>
            (try nlinarith [h z, Real.sqrt_nonneg (f z).re, Real.sqrt_nonneg (f z).im])
          <;>
            (try
              {
                simp_all [Complex.ext_iff, Complex.div_re, Complex.div_im, Complex.normSq]
                <;>
                  nlinarith [h z, Real.sqrt_nonneg (f z).re, Real.sqrt_nonneg (f z).im]
              })
        exact h₁₄
      exact h₁₂
    simpa using h₈
  
  obtain ⟨c, hc⟩ := h₄
  exact ⟨c, hc⟩