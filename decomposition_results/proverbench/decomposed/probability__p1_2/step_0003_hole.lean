theorem h₁ (lambda : NNReal) (h₀ : poisson_pmf lambda 0 = rexp (-↑lambda)) : poisson_pmf lambda 1 = rexp (-↑lambda) :=
  by
  have h₁₀ : poisson_pmf lambda 1 = poissonPMFReal lambda 1 := rfl
  --  rw [h₁₀]
  --  --  simp [poissonPMFReal, Real.exp_neg] <;> field_simp <;> ring_nf <;> simp_all [Real.exp_neg] <;> field_simp <;>
      ring_nf <;>
    simp_all [Real.exp_neg]
  hole