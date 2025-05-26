theorem h₀  : sorry = rexp (-sorry) :=
  by
  have h₀₀ : poisson_pmf lambda 0 = poissonPMFReal lambda 0 := rfl
  rw [h₀₀]
  simp [poissonPMFReal, Real.exp_neg] <;> field_simp <;> ring_nf <;> simp_all [Real.exp_neg] <;> field_simp <;>
      ring_nf <;>
    simp_all [Real.exp_neg]
  hole