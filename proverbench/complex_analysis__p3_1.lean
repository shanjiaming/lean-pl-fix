theorem bounded_reciprocal_function (f : ℂ → ℂ) (hf : Entire f) (h : ∀ z, 1 ≤ abs (f z)) :
  Entire (fun z => 1 / f z) ∧ ∀ z, abs (1 / f z) ≤ 1 := by
  have hf_ne_zero : ∀ (z : ℂ), f z ≠ 0 := by
    intro z
    have h₁ : 1 ≤ abs (f z) := h z
    have h₂ : abs (f z) ≠ 0 := by linarith
    exact fun h₃ => h₂ (by simp [h₃, abs.map_zero])
  
  have h₁ : Entire (fun z => 1 / f z) := by
    have h₂ : AnalyticOn ℂ (fun z : ℂ => 1 / f z) Set.univ := by
      -- Prove that 1/f is analytic on the entire complex plane
      have h₃ : ∀ z : ℂ, z ∈ Set.univ → f z ≠ 0 := by
        intro z _
        exact hf_ne_zero z
      -- Use the fact that the reciprocal of a non-vanishing analytic function is analytic
      have h₄ : AnalyticOn ℂ f Set.univ := hf
      have h₅ : AnalyticOn ℂ (fun z : ℂ => 1 / f z) Set.univ := by
        apply AnalyticOn.div
        · exact analyticOn_const
        · exact h₄
        · exact h₃
      exact h₅
    exact h₂
  
  have h₂ : ∀ z, abs (1 / f z) ≤ 1 := by
    intro z
    have h₃ : 1 ≤ abs (f z) := h z
    have h₄ : f z ≠ 0 := hf_ne_zero z
    have h₅ : abs (1 / f z) = 1 / abs (f z) := by
      simp [Complex.abs, Complex.normSq, div_eq_mul_inv, mul_comm, Complex.ext_iff, h₄,
        Real.sqrt_eq_iff_sq_eq, add_nonneg, mul_self_nonneg, mul_self_nonneg,
        mul_self_nonneg, mul_self_nonneg]
      <;> field_simp [h₄, Complex.normSq_eq_abs, Real.sqrt_eq_iff_sq_eq, add_nonneg, mul_self_nonneg,
        mul_self_nonneg, mul_self_nonneg, mul_self_nonneg]
      <;> ring_nf
      <;> field_simp [h₄, Complex.normSq_eq_abs, Real.sqrt_eq_iff_sq_eq, add_nonneg, mul_self_nonneg,
        mul_self_nonneg, mul_self_nonneg, mul_self_nonneg]
      <;> linarith
    rw [h₅]
    have h₆ : 1 / abs (f z) ≤ 1 := by
      have h₇ : 1 ≤ abs (f z) := h z
      have h₈ : 0 < abs (f z) := by linarith [Complex.abs.nonneg (f z)]
      have h₉ : 1 / abs (f z) ≤ 1 := by
        rw [div_le_iff h₈]
        nlinarith
      exact h₉
    exact h₆
  
  exact ⟨h₁, h₂⟩