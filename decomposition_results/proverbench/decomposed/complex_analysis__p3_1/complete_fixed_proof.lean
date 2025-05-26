theorem bounded_reciprocal_function (f : ℂ → ℂ) (hf : Entire f) (h : ∀ z, 1 ≤ abs (f z)) :
  Entire (fun z => 1 / f z) ∧ ∀ z, abs (1 / f z) ≤ 1:=
  by
  have hf_ne_zero : ∀ (z : ℂ), f z ≠ 0:= by
    --  intro z
    have h₁ : 1 ≤ abs (f z) := h z
    have h₂ : abs (f z) ≠ 0:= by -- linarith
      hole
    --  exact fun h₃ => h₂ (by simp [h₃, abs.map_zero])
    hole
  have h₁ : Entire (fun z => 1 / f z):=
    by
    have h₂ : AnalyticOn ℂ (fun z : ℂ => 1 / f z) Set.univ:=
      by
      have h₃ : ∀ z : ℂ, z ∈ Set.univ → f z ≠ 0:= by
        --  intro z _
        --  exact hf_ne_zero z
        simpa
      have h₄ : AnalyticOn ℂ f Set.univ := hf
      have h₅ : AnalyticOn ℂ (fun z : ℂ => 1 / f z) Set.univ:=
        by
        --  apply AnalyticOn.div
        --  · exact analyticOn_const
        --  · exact h₄
        --  · exact h₃
        hole
      --  exact h₅
      hole
    --  exact h₂
    hole
  have h₂ : ∀ z, abs (1 / f z) ≤ 1:= by
    --  intro z
    have h₃ : 1 ≤ abs (f z) := h z
    have h₄ : f z ≠ 0 := hf_ne_zero z
    have h₅ : abs (1 / f z) = 1 / abs (f z):= by
      --  simp [Complex.abs, Complex.normSq, div_eq_mul_inv, mul_comm, Complex.ext_iff, h₄, Real.sqrt_eq_iff_sq_eq, add_nonneg,
      --            mul_self_nonneg, mul_self_nonneg, mul_self_nonneg, mul_self_nonneg] <;>
              field_simp [h₄, Complex.normSq_eq_abs, Real.sqrt_eq_iff_sq_eq, add_nonneg, mul_self_nonneg, mul_self_nonneg,
                mul_self_nonneg, mul_self_nonneg] <;>
            ring_nf <;>
          field_simp [h₄, Complex.normSq_eq_abs, Real.sqrt_eq_iff_sq_eq, add_nonneg, mul_self_nonneg, mul_self_nonneg,
            mul_self_nonneg, mul_self_nonneg] <;>
        linarith
      hole
    --  rw [h₅]
    have h₆ : 1 / abs (f z) ≤ 1:= by
      have h₇ : 1 ≤ abs (f z) := h z
      have h₈ : 0 < abs (f z):= by -- linarith [Complex.abs.nonneg (f z)]
        hole
      have h₉ : 1 / abs (f z) ≤ 1:= by
        --  rw [div_le_iff h₈]
        nlinarith
        hole
      --  exact h₉
      hole
    exact h₆
    hole
  --  exact ⟨h₁, h₂⟩
  hole