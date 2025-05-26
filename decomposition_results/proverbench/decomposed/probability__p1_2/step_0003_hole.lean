theorem h₁ (h₀ : sorry = rexp (-sorry)) : sorry = rexp (-sorry) :=
  by
  have h₁₀ : poisson_pmf lambda 1 = poissonPMFReal lambda 1 := rfl
  rw [h₁₀]
  simp [poissonPMFReal, Real.exp_neg] <;> field_simp <;> ring_nf <;> simp_all [Real.exp_neg] <;> field_simp <;>
      ring_nf <;>
    simp_all [Real.exp_neg]
  hole